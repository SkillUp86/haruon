document.addEventListener('DOMContentLoaded', function() {
    // Date variable
    var newDate = new Date();

    // Function to get the current month in 'MM' format
    function getDynamicMonth() {
        let getMonthValue = newDate.getMonth();
        let _getUpdatedMonthValue = getMonthValue + 1;
        return _getUpdatedMonthValue < 10 ? `0${_getUpdatedMonthValue}` : `${_getUpdatedMonthValue}`;
    }

    // Modal Elements
    var modalTitleEl = document.querySelector('#event-title');
    var modalStartDateEl = document.querySelector('#event-start-date');
    var modalEndDateEl = document.querySelector('#event-end-date');
    var modalAddBtnEl = document.querySelector('.btn-add-event');
    var modalUpdateBtnEl = document.querySelector('.btn-update-event');
    var modalContentEl = document.querySelector('#event-content');
    var modalDeleteBtnEl = document.querySelector('#deleteEventBtn');  // 삭제 버튼

    // Calendar Elements and options
    var calendarEl = document.querySelector('.calendar');
    var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));

    // Event color categories
    var calendarEventColors = {
        Work: 'primary',
        Personal: 'success',
        Important: 'danger',
        Travel: 'warning',
    };

    // Fetch calendar events from the API
    async function fetchCalendarEvents() {
        try {
            const response = await fetch('/schedule/calendarList');
            if (!response.ok) {
                throw new Error('API 호출 실패');
            }

            const data = await response.json();

            const calendarEventsList = data.map(event => ({
                id: event.schNo,
                title: event.title,
                start: event.startTime,
                end: event.endTime,
                extendedProps: {
                    calendar: event.descript
                }
            }));

            console.log('받은 캘린더 이벤트:', calendarEventsList);
            calendar.addEventSource(calendarEventsList);
        } catch (error) {
            console.error('API 호출 중 오류 발생:', error);
        }
    }

    // Calendar select function
    function calendarSelect(info) {
        var selectedDate = new Date(info.startStr);
        var formattedDate = selectedDate.toISOString().slice(0, 16);

        modalAddBtnEl.style.display = 'block';
        modalUpdateBtnEl.style.display = 'none';
        myModal.show();

        modalStartDateEl.value = formattedDate;
        modalEndDateEl.value = formattedDate;
    }

    // Calendar add event function
    function calendarAddEvent() {
        var currentDate = new Date();
        var formattedDate = currentDate.toISOString().slice(0, 16);

        modalAddBtnEl.style.display = 'block';
        modalUpdateBtnEl.style.display = 'none';
        myModal.show();
        modalStartDateEl.value = formattedDate;
        modalEndDateEl.value = formattedDate;
    }

    // Calendar event click function
    function calendarEventClick(info) {
        var eventObj = info.event;

        if (modalTitleEl) {
            modalTitleEl.value = eventObj.title;
        }
        if (modalStartDateEl) {
            modalStartDateEl.value = eventObj.start.toISOString().slice(0, 16);
        }
        if (modalEndDateEl) {
            modalEndDateEl.value = eventObj.end ? eventObj.end.toISOString().slice(0, 16) : eventObj.start.toISOString().slice(0, 16);
        }
        if (modalContentEl) {
            modalContentEl.value = eventObj.extendedProps.description || '';
        }

        var checkedRadioBtnEl = document.querySelector(`input[value="${eventObj.extendedProps.calendar}"]`);
        if (checkedRadioBtnEl) {
            checkedRadioBtnEl.checked = true;
        }

        modalUpdateBtnEl.setAttribute('data-fc-event-public-id', eventObj.id);
        modalDeleteBtnEl.setAttribute('data-fc-event-public-id', eventObj.id); // 삭제 버튼에 ID 추가

        modalAddBtnEl.style.display = 'none';
        modalUpdateBtnEl.style.display = 'block';
        modalDeleteBtnEl.style.display = 'block'; // 삭제 버튼 보이기
        myModal.show();
    }

    // Add event handler
    modalAddBtnEl.addEventListener('click', function() {
        var checkedRadioBtnEl = document.querySelector('input[name="event-level"]:checked');
        var titleValue = modalTitleEl.value;
        var startDateValue = modalStartDateEl.value;
        var endDateValue = modalEndDateEl.value;
        var calendarType = checkedRadioBtnEl ? checkedRadioBtnEl.value : '';

        calendar.addEvent({
            id: uuidv4(),
            title: titleValue,
            start: startDateValue,
            end: endDateValue,
            allDay: false,
            extendedProps: { calendar: calendarType }
        });
        myModal.hide();
    });

    // Update event handler
    modalUpdateBtnEl.addEventListener('click', function() {
        var eventId = this.dataset.fcEventPublicId;
        var event = calendar.getEventById(eventId);

        if (event) {
            event.setProp('title', modalTitleEl.value);
            event.setExtendedProp('calendar', document.querySelector('input[name="event-level"]:checked')?.value || '');
            event.setExtendedProp('description', modalContentEl.value);
        }

        myModal.hide();
    });

    // Delete event handler (GET 방식)
    modalDeleteBtnEl.addEventListener('click', function(e) {
        e.preventDefault(); // 기본 동작 방지

        var eventId = this.getAttribute('data-fc-event-public-id');  // 삭제할 이벤트 ID

        if (eventId) {
            // GET 방식으로 삭제 요청 보내기
            $.ajax({
                url: "/deleteSchedule", // 서버 URL (서버에서 이벤트 삭제를 처리하는 URL)
                type: "GET", // GET 방식으로 요청
                data: { schNo: eventId }, // 이벤트 ID를 쿼리 스트링으로 전달
                success: function(response) {
                    // 삭제 성공 시 캘린더에서 이벤트 제거
                    calendar.getEventById(eventId).remove();  // FullCalendar의 이벤트 삭제
                    alert("일정이 삭제되었습니다.");

                    // 모달 닫기
                    myModal.hide();
                },
                error: function(xhr, status, error) {
                    console.error("Ajax Error:", error);
                    alert("일정 삭제에 실패했습니다.");
                }
            });
        } else {
            alert("삭제할 일정이 선택되지 않았습니다.");
        }
    });

    // Modal cleanup on hide
    document.getElementById('exampleModal').addEventListener('hidden.bs.modal', function () {
        if (modalTitleEl) {
            modalTitleEl.value = '';
        }
        if (modalStartDateEl) {
            modalStartDateEl.value = '';
        }
        if (modalEndDateEl) {
            modalEndDateEl.value = '';
        }

        var checkedRadioBtnEl = document.querySelector('input[name="event-level"]:checked');
        if (checkedRadioBtnEl) {
            checkedRadioBtnEl.checked = false;
        }

        modalDeleteBtnEl.style.display = 'none'; // 모달 닫을 때 삭제 버튼 숨기기
    });

    // Initialize calendar
    var calendar = new FullCalendar.Calendar(calendarEl, {
        selectable: true,
        height: window.innerWidth <= 1199 ? 900 : 1052,
        initialView: window.innerWidth <= 1199 ? 'listWeek' : 'dayGridMonth',
        initialDate: `${newDate.getFullYear()}-${getDynamicMonth()}-07`,
        headerToolbar: {
            left: 'prev next addEventButton',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        events: [],
        select: calendarSelect,
        customButtons: {
            addEventButton: {
                text: 'Add Event',
                click: calendarAddEvent
            }
        },
        eventClassNames: function ({ event: calendarEvent }) {
            return ['event-fc-color', `fc-bg-${calendarEventColors[calendarEvent._def.extendedProps.calendar]}`];
        },
        eventClick: calendarEventClick,
        windowResize: function() {
            if (window.innerWidth <= 1199) {
                calendar.changeView('listWeek');
                calendar.setOption('height', 900);
            } else {
                calendar.changeView('dayGridMonth');
                calendar.setOption('height', 1052);
            }
        }
    });

    fetchCalendarEvents();
    calendar.render();
});
