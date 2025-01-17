document.addEventListener('DOMContentLoaded', function () {
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
    var modalDeleteBtnEl = document.querySelector('#deleteEventBtn'); // 삭제 버튼

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

    // 시간대 보정 함수
    function adjustToDBTimezone(dateTime) {
        let date = new Date(dateTime);
        // DB와 시간대가 일치하도록 보정
        date.setHours(date.getHours() - 3); // +3시간 되어 나오는 문제 해결
        return date.toISOString().slice(0, 16);
    }

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
                start: adjustToDBTimezone(event.startTime),
                end: adjustToDBTimezone(event.endTime),
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
            modalStartDateEl.value = adjustToDBTimezone(eventObj.start);
        }
        if (modalEndDateEl) {
            modalEndDateEl.value = eventObj.end
                ? adjustToDBTimezone(eventObj.end)
                : adjustToDBTimezone(eventObj.start);
        }
        if (modalContentEl) {
            modalContentEl.value = eventObj.extendedProps.content || '';
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
    modalAddBtnEl.addEventListener('click', function () {
        var checkedRadioBtnEl = document.querySelector('input[name="event-level"]:checked');
        var titleValue = modalTitleEl.value;
        var startDateValue = new Date(modalStartDateEl.value);
        var endDateValue = new Date(modalEndDateEl.value);
		var contentValue = modalContentEl.value; // content 값 가져오기

        // 캘린더에 추가 시 시간대 보정 없이 그대로 DB 시간과 동일하게 추가
        calendar.addEvent({
            id: uuidv4(),
            title: titleValue,
            start: startDateValue.toISOString(),
            end: endDateValue.toISOString(),
			content: contentValue,
            allDay: false,
            extendedProps: { calendar: checkedRadioBtnEl ? checkedRadioBtnEl.value : '' }
        });

        myModal.hide();
    });

    // Update event handler
    modalUpdateBtnEl.addEventListener('click', function () {
		var getPublicID = this.dataset.fcEventPublicId;
		var getTitleUpdatedValue = getModalTitleEl.value;
        var eventId = this.dataset.fcEventPublicId;
        var event = calendar.getEventById(eventId);
		var getContentValue = contentValue.value; // content 값 가져오기


        if (event) {
            event.setProp('title', modalTitleEl.value);
            event.setExtendedProp('calendar', document.querySelector('input[name="event-level"]:checked')?.value || '');
            event.setExtendedProp('description', modalContentEl.value);
        }

        myModal.hide();
    });

    // Delete event handler
    modalDeleteBtnEl.addEventListener('click', function (e) {
        e.preventDefault();

        var eventId = this.getAttribute('data-fc-event-public-id');

        if (eventId) {
            $.ajax({
                url: "/deleteSchedule",
                type: "GET",
                data: { schNo: eventId },
                success: function (response) {
                    calendar.getEventById(eventId).remove();
                    alert("일정이 삭제되었습니다.");
                    myModal.hide();
                },
                error: function (xhr, status, error) {
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
		if(modalContentEl){
			modalContentEl.value = '';
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
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek',
        },
        events: [],
        select: calendarSelect,
        customButtons: {
            addEventButton: {
                text: 'Add Event',
                click: calendarAddEvent,
            },
        },
        eventClassNames: function ({ event: calendarEvent }) {
            return ['event-fc-color', `fc-bg-${calendarEventColors[calendarEvent._def.extendedProps.calendar]}`];
        },
        eventClick: calendarEventClick,
    });

    fetchCalendarEvents();
    calendar.render();
});