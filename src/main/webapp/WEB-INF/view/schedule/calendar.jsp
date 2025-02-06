<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link href="../src/plugins/src/apex/apexcharts.css" rel="stylesheet" type="text/css">
    <link href="../src/assets/css/light/dashboard/dash_1.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <!-- BEGIN PAGE LEVEL STYLE -->
    <link href="../src/plugins/src/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/light/fullcalendar/custom-fullcalendar.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <!-- END PAGE LEVEL STYLE -->
    <!-- 페이지 제목 입력칸 -->
    <title> haruon | 일정 </title>
    <!-- 페이지 제목 입력칸 -->
</head>
<body class="layout-boxed">
    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->
    <!--  BEGIN NAVBAR  -->
    <div class="header-container container-xxl">
	        <jsp:include page="/WEB-INF/view/inc/header.jsp" />
    </div>
    <!--  END NAVBAR  -->
      
    <!--  BEGIN MAIN CONTAINER 템플릿 직접 끌어와서 사용  -->
    <div class="main-container" id="container">
        <div class="overlay"></div>
        <div class="search-overlay"></div>
        <!--  BEGIN SIDEBAR  -->
        <div class="sidebar-wrapper sidebar-theme">
            <jsp:include page="/WEB-INF/view/inc/sidebar.jsp" />
        </div>
        <!--  END SIDEBAR  -->
        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">
                <div class="middle-content container-xxl p-0">
                    <!--  BEGIN BREADCRUMBS  -->
                    <div class="secondary-nav">
                        <div class="breadcrumbs-container" data-page-heading="Analytics">
                            <header class="header navbar navbar-expand-sm">
                                <a href="javascript:void(0);" class="btn-toggle sidebarCollapse" data-placement="bottom">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
                                </a>
                                <div class="d-flex breadcrumb-content">
                                    <div class="page-header">
                                        <div class="page-title">
                                        </div>
                        
                                        <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">캘린더</a></li>
                                            </ol>
                                        </nav>
                        
                                    </div>
                                </div>
                                
                            </header>
                        </div>
                    </div>
                    <!--  END BREADCRUMBS  -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 mt-4">
    <div class="widget-content widget-content-area">
    <h2 class="mt-3 mb-3">일정</h2>
        <div id="calendar"></div>
    </div>
</div>

<!-- Modal -->
<!-- addSchedule 모달창 :: 일정 등록 -->
<div class="modal fade" id="addSchedule" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- 모달 제목 -->
            <div class="modal-header">
                <h5 class="modal-title">신규 사내일정 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- 모달 일정 등록폼 -->
            <form id="addScheduleForm" action="${pageContext.request.contextPath}/addSchedule" method="post">
                <div class="modal-body">
                    <div class="row mb-5">
                        <!-- 일정 제목 -->
                        <label for="inputEmail" class="col-sm-4 col-form-label">일정제목</label>
                        <div class="col-sm-8 scheduleModalDiv mb-2">
                            <input type="text" class="form-control" id="title" name="title">
                        </div>

                        <!-- 시작 날짜 -->
                        <label for="inputEmail" class="col-sm-4 col-form-label">시작날짜</label>
                        <div class="col-sm-8 scheduleModalDiv mb-2">
                            <input type="datetime-local" class="form-control" id="startTime" name="startTime">
                        </div>

                        <!-- 종료 날짜 -->
                        <label for="inputEmail" class="col-sm-4 col-form-label">종료날짜</label>
                        <div class="col-sm-8 scheduleModalDiv mb-2">
                            <input type="datetime-local" class="form-control" id="endTime" name="endTime">
                        </div>

                        <!-- 일정 종류 -->
                        <label for="inputEmail" class="col-sm-4 col-form-label">일정</label>
                        <div class="col-sm-8 scheduleModalDiv mb-2">
                            <select class="form-control" id="kind" name="kind">
                                <option value="G01" selected>일정</option>
                            </select>
                        </div>

                        <!-- 일정 내용 -->
                        <label for="inputEmail" class="col-sm-4 col-form-label">일정내용</label>
                        <div class="col-sm-8">
                            <textarea rows="3" maxlength="100" class="col-sm-12" id="addContent" name="content" placeholder="100자 이하 작성" style="height: 150px"></textarea>
                            (<span id="chatHelper">0</span>/100)
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button id="addScheduleBtn" type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>

        </div>
    </div>
</div>

			<jsp:include page="/WEB-INF/view/inc/footer.jsp" />		<!--  BEGIN FOOTER  -->
            <!--  END FOOTER  -->
       		<!-- 캘린더API  -->
       		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    let calendarEl = document.getElementById('calendar');

    let calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth addEventButton',
        },
        customButtons: {
            addEventButton: {
                text: "신규일정추가",
                click: function() {
                    $("#addSchedule").modal("show");
                }
            }
        },
        locale: 'ko',
        selectable: true,
        dayMaxEvents: true,
        events: function(response, successCallback, failureCallback) { // 콜백 함수 사용
            $.ajax({
                url: "/schedule/calendarList",
                method: "GET"
            })
            .done((response) => {
                console.log(response);
                let events = response.map(schedule => ({
                    title: schedule.title,
                    start: schedule.startTime,
                    end: schedule.endTime,
                    backgroundColor: getScheduleColor(schedule.kind),
                    borderColor: getScheduleColor(schedule.kind),
                    url: `/calendarDetail/\${schedule.schNo}?kind=\${schedule.kind}`,
                    allDay: false
                }));
                successCallback(events);
            })
            .fail(() => {
                failureCallback();
            });
        }
    });

    calendar.render();

    function getScheduleColor(kind) {
        switch (kind) {
            case 'G01': return '#81bbb2'; // 일정
            case 'G02': return '#af92e2'; // 연차
            case 'G03': return '#ffbb57'; // 출장
            case 'G04': return '#82f029'; // 회의
            case 'G05': return '#FF1493'; // 반차
            default: return '#ffffff';
        }
    }
    	
    
});



$(document).ready(function () {
    // 일정 내용 글자수 카운트
    $("#addContent").on("input", function () {
        let contentLength = $(this).val().length;
        $("#chatHelper").text(contentLength);
        if (contentLength > 100) {
            alert("100자 이하로 입력해주세요.");
            $(this).val($(this).val().substring(0, 100));
            $("#chatHelper").text(100);
        }
    });

    // 일정 추가 버튼 클릭 시 유효성 검사
    $("#addScheduleForm").on("submit", function (e) {
        let title = $("#title").val().trim();
        let startTime = $("#startTime").val();
        let endTime = $("#endTime").val();
        let content = $("#addContent").val().trim();

        if (title === "") {
            alert("일정 제목을 입력하세요.");
            $("#title").focus();
            e.preventDefault();
            return;
        }

        if (startTime === "") {
            alert("시작 날짜를 입력하세요.");
            $("#startTime").focus();
            e.preventDefault();
            return;
        }

        if (endTime === "") {
            alert("종료 날짜를 입력하세요.");
            $("#endTime").focus();
            e.preventDefault();
            return;
        }

        if (new Date(startTime) > new Date(endTime)) {
            alert("종료 날짜는 시작 날짜보다 이후여야 합니다.");
            $("#endTime").focus();
            e.preventDefault();
            return;
        }
        

        if (content === "") {
            alert("일정 내용을 입력하세요.");
            $("#addContent").focus();
            e.preventDefault();
            return;
            
            
        }
    });
});
</script>
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <script src="../src/assets/js/template.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="../src/plugins/src/apex/apexcharts.min.js"></script>
    <script src="../src/assets/js/dashboard/dash_1.js"></script>
    <script src="../src/plugins/src/fullcalendar/fullcalendar.min.js"></script>
    <script src="../src/plugins/src/uuid/uuid4.min.js"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    
    <!--  BEGIN CUSTOM SCRIPTS FILE  -->
    <script src="../src/plugins/src/fullcalendar/custom-fullcalendar.js"></script>
    <!--  END CUSTOM SCRIPTS FILE  -->
  
</body>
</html>