document.addEventListener('DOMContentLoaded', function() {
    // Date variable
    var newDate = new Date();

    // Function to get the current month in 'MM' format
    function getDynamicMonth() {
        let getMonthValue = newDate.getMonth();
        let _getUpdatedMonthValue = getMonthValue + 1;
        if (_getUpdatedMonthValue < 10) {
            return `0${_getUpdatedMonthValue}`;
        } else {
            return `${_getUpdatedMonthValue}`;
        }
    }

    // Modal Elements
    var getModalTitleEl = document.querySelector('#event-title');
    var getModalStartDateEl = document.querySelector('#event-start-date');
    var getModalEndDateEl = document.querySelector('#event-end-date');
    var getModalAddBtnEl = document.querySelector('.btn-add-event');
    var getModalUpdateBtnEl = document.querySelector('.btn-update-event');
    var calendarsEvents = {
        Work: 'primary',
        Personal: 'success',
        Important: 'danger',
        Travel: 'warning',
    };

    // Calendar Elements and options
    var calendarEl = document.querySelector('.calendar');

    // Calendar event data array
    var calendarEventsList = []; // Initially empty, will be populated from the API

    // Fetch calendar events from the API
    async function fetchCalendarEvents() {
        try {
            const response = await fetch('/schedule/calendarList');
            if (!response.ok) {
                throw new Error('API 호출 실패');
            }

            const data = await response.json();

            // Convert the server data into FullCalendar format
            calendarEventsList = data.map(event => ({
                id: event.schNo,
                title: event.title,
                start: event.startTime,
                end: event.endTime,
                extendedProps: {
                    calendar: event.descript
                }
            }));

            console.log('받은 캘린더 이벤트:', calendarEventsList); // Check data

            // Re-render calendar with the updated events
            calendar.addEventSource(calendarEventsList);

        } catch (error) {
            console.error('API 호출 중 오류 발생:', error);
        }
    }

    // Calendar Select function
    var calendarSelect = function(info) {
        var selectedDate = new Date(info.startStr);
        
        // 현재 시간을 기준으로 시간, 분, 초를 설정
        var hours = String(selectedDate.getHours()).padStart(2, '0');
        var minutes = String(selectedDate.getMinutes()).padStart(2, '0');
        var seconds = String(selectedDate.getSeconds()).padStart(2, '0');
        
        // 선택된 날짜와 시간을 'YYYY-MM-DDTHH:mm:ss' 형식으로 변환
        var formattedStartDate = `${selectedDate.getFullYear()}-${String(selectedDate.getMonth() + 1).padStart(2, '0')}-${String(selectedDate.getDate()).padStart(2, '0')}-${hours}:${minutes}:${seconds}`;
        
        // 종료 날짜도 동일하게 설정 (현재와 동일한 시간으로 설정)
        var formattedEndDate = formattedStartDate;

        getModalAddBtnEl.style.display = 'block';
        getModalUpdateBtnEl.style.display = 'none';
        myModal.show();
        
        // Modal의 시작일과 종료일에 선택한 날짜 및 시간 넣기
        getModalStartDateEl.value = formattedStartDate;
        getModalEndDateEl.value = formattedEndDate;
    }

    // Calendar AddEvent function (with time)
    var calendarAddEvent = function() {
        var currentDate = new Date();
        var dd = String(currentDate.getDate()).padStart(2, '0');
        var mm = String(currentDate.getMonth() + 1).padStart(2, '0');
        var yyyy = currentDate.getFullYear();

        // 현재 시간을 기준으로 시간과 분을 추가
        var hours = String(currentDate.getHours()).padStart(2, '0');
        var minutes = String(currentDate.getMinutes()).padStart(2, '0');
        var seconds = String(currentDate.getSeconds()).padStart(2, '0');

        // 'YYYY-MM-DDTHH:mm:ss' 형식으로 변환
        var combineDate = `${yyyy}-${mm}-${dd}-${hours}:${minutes}:${seconds}`;

        getModalAddBtnEl.style.display = 'block';
        getModalUpdateBtnEl.style.display = 'none';
        myModal.show();
        getModalStartDateEl.value = combineDate;
        getModalEndDateEl.value = combineDate;
        getModalUpdateBtnEl.value = combineDate;
        getModalAddBtnEl.value = combineDate;
    }

    // Calendar eventClick function
    var calendarEventClick = function(info) {
        var eventObj = info.event;

        if (eventObj.url) {
            window.open(eventObj.url);
            info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
        } else {
            var getModalEventId = eventObj._def.publicId; 
            var getModalEventLevel = eventObj._def.extendedProps['calendar'];
            var getModalCheckedRadioBtnEl = document.querySelector(`input[value="${getModalEventLevel}"]`);

            getModalTitleEl.value = eventObj.title;
            getModalCheckedRadioBtnEl.checked = true;
            getModalUpdateBtnEl.setAttribute('data-fc-event-public-id', getModalEventId)
            getModalAddBtnEl.style.display = 'none';
            getModalUpdateBtnEl.style.display = 'block';
            myModal.show();
        }
    }

    // Activate Calendar
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
        events: [],  // Initially empty, we will update it after fetching data
        select: calendarSelect,
        customButtons: {
            addEventButton: {
                text: 'Add Event',
                click: calendarAddEvent
            }
        },
        eventClassNames: function ({ event: calendarEvent }) {
            const getColorValue = calendarsEvents[calendarEvent._def.extendedProps.calendar];
            return ['event-fc-color', 'fc-bg-' + getColorValue];
        },
        eventClick: calendarEventClick,
        windowResize: function(arg) {
            if (window.innerWidth <= 1199) {
                calendar.changeView('listWeek');
                calendar.setOption('height', 900);
            } else {
                calendar.changeView('dayGridMonth');
                calendar.setOption('height', 1052);
            }
        }
    });

    // Add Event
    getModalAddBtnEl.addEventListener('click', function() {
        var getModalCheckedRadioBtnEl = document.querySelector('input[name="event-level"]:checked');
        var getTitleValue = getModalTitleEl.value;
        var setModalStartDateValue = getModalStartDateEl.value;
        var setModalEndDateValue = getModalEndDateEl.value;
        var getModalCheckedRadioBtnValue = getModalCheckedRadioBtnEl ? getModalCheckedRadioBtnEl.value : '';

        // Add the event to the calendar with time included
        calendar.addEvent({
            id: uuidv4(),
            title: getTitleValue,
            start: setModalStartDateValue,
            end: setModalEndDateValue,
            allDay: false, // Set to false to allow time-specific events
            extendedProps: { calendar: getModalCheckedRadioBtnValue }
        });
        myModal.hide();
    });

    // Update Event
    getModalUpdateBtnEl.addEventListener('click', function() {
        var getPublicID = this.dataset.fcEventPublicId;
        var getTitleUpdatedValue = getModalTitleEl.value;
        var getEvent = calendar.getEventById(getPublicID);
        var getModalUpdatedCheckedRadioBtnEl = document.querySelector('input[name="event-level"]:checked');
        var getModalUpdatedCheckedRadioBtnValue = getModalUpdatedCheckedRadioBtnEl ? getModalUpdatedCheckedRadioBtnEl.value : '';
        
        getEvent.setProp('title', getTitleUpdatedValue);
        getEvent.setExtendedProp('calendar', getModalUpdatedCheckedRadioBtnValue);
        myModal.hide();
    });

    // Render the calendar
    calendar.render();

    // Show Modal
    var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
    var modalToggle = document.querySelector('.fc-addEventButton-button');

    document.getElementById('exampleModal').addEventListener('hidden.bs.modal', function () {
        getModalTitleEl.value = '';
        getModalStartDateEl.value = '';
        getModalEndDateEl.value = '';
        var getModalIfCheckedRadioBtnEl = document.querySelector('input[name="event-level"]:checked');
        if (getModalIfCheckedRadioBtnEl) { getModalIfCheckedRadioBtnEl.checked = false; }
    });

    // Fetch and populate the events
    fetchCalendarEvents();
});
