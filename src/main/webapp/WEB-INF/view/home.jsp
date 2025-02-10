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
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link href="../src/assets/css/light/dashboard/dash_1.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
    <link href="../src/plugins/src/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
	<script src="../src/plugins/src/fullcalendar/fullcalendar.min.js"></script>
    <link href="../src/plugins/css/light/fullcalendar/custom-fullcalendar.css" rel="stylesheet" type="text/css" />
    <!-- 페이지 제목 입력칸 -->
    <title>HARUON | 메인 페이지</title>
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

                <div class="middle-content container-xxl p-0 mb-5">

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
                                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home">MainPage</a></li>
                                            </ol>
                                        </nav>
                        
                                    </div>
                                </div>
                            </header>
                        </div>
                    </div>
                    <!--  END BREADCRUMBS  -->
                    
                    <div class="row layout-top-spacing">
                        <!-- 출 퇴근 버튼 -->
                        <div id="todayAttendanceForm" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="layout-spacing">
                                <div class="widget-heading widget-six text-start">
                                    <div class="input-group">
                                        <span class="input-group-text">
											<label id="attendanceBtnSpace"/>
                                        </span>
                                        <input id="workStartTime" type="text" class="form-control text-end text-secondary-emphasis" placeholder="오늘의 출근 기록이 없습니다." readonly>
                                        <input id="workLeaveTime" type="text" class="form-control text-end text-secondary-emphasis" placeholder="오늘의 퇴근 기록이 없습니다." readonly>
                                    </div>
                                </div>
                            </div>
                            <div id="registerAttendanceResult"></div>
                        </div>


                        <!-- 캘린더 컨텐츠 시작  -->
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="layout-spacing">
                                <div class="widget widget-six">
                                	<div style="position: relative; margin-bottom: 20px;">
						                <p style="position: absolute; top: -10px; right: 15px;">
						                    <a href="${pageContext.request.contextPath}/calendar"><strong>더보기</strong></a>
						                </p>
						            </div>
									<p class="text-end">	
									<div id="calendar"></div>
                                </div>
                            </div>
                        </div>
                        <!-- 캘린더 컨텐츠 끝 -->

                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="widget-heading">
                                <div class="widget widget-table-two" style="padding: 20px;">
                                    <div class="widget-heading" style="margin-left:10px">
                                        <h5 style="display: inline-block;">문서 결재</h5>
                                        <p style="display: inline-block; float: right; margin-right: 15px;">
                                            <a href="${pageContext.request.contextPath}/draft/list"><strong>더보기</strong></a>
                                        </p>
                                    </div>
                                    <div class="widget-content">
                                        <div class="table-responsive">
                                            <table id="draft-list" class="table dt-table-hover">
                                                <thead>
                                                <tr>
                                                    <th>결재대기</th>
                                                    <th>결재중</th>
                                                    <th>결재완료</th>
                                                    <th>반려</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>${d.a01}건</td>
                                                        <td>${d.a02}건</td>
                                                        <td>${d.a03}건</td>
                                                        <td>${d.a04}건</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                             <!-- 결재함 컨텐츠 끝-->
                             
                            <!-- 메일함 시작-->
                            <br>
                            <div class="layout-spacing">
                                <div class="widget widget-six h-100">
                                    <div class="widget-heading">
                                        <h5 style="display: inline-block;">안 읽은 메일함</h5>
                                        <p style="display: inline-block; float: right; margin-right: 15px;">
                                        	<a href="${pageContext.request.contextPath}/readersMsg"><strong>더보기</strong></a>
                                            <br>
                                        </p>
                                    </div>
                                    
                                    <div id="msgUnreadList"></div>							        
                                </div>
                            </div>
                             <!-- 메일함 끝-->
                        </div>


                    </div>
                        <!-- 공지 게시판 컨텐츠 시작-->
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 layout-spacing">
                            <br>
                            <div class="widget-heading">
                                <div class="widget widget-table-two" style="padding: 20px;">
                                    <div class="widget-heading" style="margin-left:10px">
                                        <h5 style="display: inline-block;">공지게시판</h5>
                                        <p style="display: inline-block; float: right; margin-right: 15px;">
                                            <a href="${pageContext.request.contextPath}/board/notice"><strong>더보기</strong></a>
                                        </p>
                                    </div>

                                    <div class="widget-content">
                                        <div class="table-responsive">
                                            <table id="board-list" class="table dt-table-hover">
                                                <thead>
                                                <tr>
                                                    <th>번호</th>
                                                    <th>제목</th>
                                                    <th>작성자</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="n" items="${noticeList}" varStatus="status">
                                                    <tr>
                                                        <td>${n.boaNo}</td>
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/board/${n.boaNo}">${n.title} &nbsp;
                                                                <!-- 최근 2개 항목에만 'new' 배지 추가 -->
                                                                <c:if test="${status.index < 2}">
                                                                    <span class="badge badge-light-info mb-2 me-4">new</span>
                                                                </c:if>
                                                            </a>
                                                        </td>
                                                        <td>${n.ename}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 공지 게시판 컨텐츠 끝-->

                        <!-- 자유 게시판 컨텐츠 시작-->
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 layout-spacing">
                            <br>
                            <div class="widget-heading">
                                <div class="widget widget-table-two" style="padding: 20px;">
                                    <div class="widget-heading" style="margin-left:10px">
                                        <h5 style="display: inline-block;">자유게시판</h5>
                                        <p style="display: inline-block; float: right; margin-right: 15px;">
                                            <a href="${pageContext.request.contextPath}/board"><strong>더보기</strong></a>
                                        </p>
                                    </div>

                                    <div class="widget-content">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>번호</th>
                                                    <th>제목</th>
                                                    <th>작성자</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="b" items="${boardList}" varStatus="status">
                                                    <tr>
                                                        <td>${b.boaNo}</td>
                                                        <td>
                                                        	<a href="${pageContext.request.contextPath}/board/${b.boaNo}">[${b.catName}] ${b.title} &nbsp;
                                                        		<c:if test="${status.index < 2}">
                                                        			<span class="badge badge-light-info mb-2 me-4">new</span>
                                                        		</c:if>
                                                        	</a>
                                                        </td>
                                                        <td>${b.ename}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 자유 게시판 컨텐츠 끝-->
                    </div>
                </div>
            <!--  BEGIN FOOTER  -->
            <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
            <!--  END FOOTER  -->
        </div>
        <!--  END CONTENT AREA  -->
	</div>
    </div>
    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <script src="../src/assets/js/template.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="../src/assets/js/dashboard/dash_1.js"></script>
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    
    <!--  BEGIN CUSTOM SCRIPTS FILE  -->
    <script src="../src/plugins/src/fullcalendar/custom-fullcalendar.js"></script>
    <script src="../src/plugins/src/uuid/uuid4.min.js"></script>
    
    
    <!--  END CUSTOM SCRIPTS FILE  -->
    <script>
    	// 페이지가 준비되면 호출
    	$(document).ready(function() {
    		showTodayAttendance();
    		showMsgUnreadList()
    	});
    </script>
    
    <!-- 출 퇴근 버튼 HTML구성 및 출퇴근시간 표시 Ajax 호출 / 출퇴근 등록 결과 / 등록버튼 동적 바인딩 -->
    <script>    
		function showTodayAttendance() {
	    	$.ajax({
				url: "/attendance/employee/"+"${empNo}",
				method: 'GET',
			}).done(function(result) {
				// Html 초기화
				$("#attendanceBtnSpace").empty();
				
				$(result).each(function(index, item) {
				   $('#workStartTime').val(item.startTime).addClass('text-secondary-emphasis');
				   if(item.endTime !== '-1') {
				       $('#workLeaveTime').val(item.endTime).addClass('text-secondary-emphasis');
				   }
				});
						 
				if($('#workStartTime').val() == '') {
				     $("#attendanceBtnSpace").html(`  <button id="registerAttendanceBtn" class="btn btn-outline-primary btn-lg" style="width:100%" type="button">
					                                      <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-toggle-right"><rect x="1" y="5" width="22" height="14" rx="7" ry="7"></rect><circle cx="16" cy="12" r="3"></circle></svg>
					                                      <span class="btn-text-inner">출근하기</span>
				                                      </button>`); 
				 }
				 
				 if(($('#workStartTime').val() != '') && ($('#workLeaveTime').val() == '') ) {
				      $("#attendanceBtnSpace").html(`   <button id="registerAttendanceBtn" class="btn btn-outline-primary btn-lg" style="width:100%" type="button">
				                                            <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-toggle-left"><rect x="1" y="5" width="22" height="14" rx="7" ry="7"></rect><circle cx="8" cy="12" r="3"></circle></svg>
				                                            <span class="btn-text-inner">퇴근하기</span>
				                                        </button>`);
				 }
				 
				 if($('#workLeaveTime').val() != '') {
				      $("#attendanceBtnSpace").html(`  <button class="btn btn-outline-primary btn-lg disabled" style="width:100%" >
				                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-smile"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>
				                                           <span class="btn-text-inner">일과종료</span>
				                                       </button>`);
				 }
			}).fail(function() {
				 console.log("showTodayAttendance ajax 호출 실패");
				 //location.replace("login");
			});
		}
		
		function showRegisterAttendanceResult() {
			$.ajax({
				url: "/employee/registerAttendance/result",
				method: "GET",
			}).done(function(result){
				// 출퇴근 버튼 클릭 결과
				$("#registerAttendanceResult").empty();
				let resultHTML = ""
				resultHTML += ` <div class="alert alert-light-primary alert-dismissible fade show border-0" role="alert">
									<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
								    <strong>` + result + `</strong>
								</div>`
				$("#registerAttendanceResult").append(resultHTML);
				
				// 출퇴근 기록 반영
				showTodayAttendance();
			}).fail(function() {
				console.log("showRegisterAttendanceResult ajax 호출 실패");
			});
		}
		
    	// 출퇴근 등록 버튼 클릭시 출퇴근 결과 호출
    	$(document).on("click", "#registerAttendanceBtn", function() {
    		showRegisterAttendanceResult();
    	});
    	
    	//calendar
    	document.addEventListener('DOMContentLoaded', function() {
    let calendarEl = document.getElementById('calendar');

    let calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            center: '',
         
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
            case 'G05': return '#9aff47'; // 반차
            default: return '#ffffff';
        }
    }
    	
    
});
    </script>
    
    <script>
	    function showMsgUnreadList() {
	        $.ajax({
	            url: "/user/${empNo}/messagies/unread",
	            method: 'GET',
	        }).done(function(result) {
	            let msgUnreadListHTML = '';
	
	            if (!result || result.length === 0) {
	                console.log("읽지 않은 메시지가 없습니다.");
	                msgUnreadListHTML += `<div class="card mt-2">읽지 않은 메세지가 없습니다</div>`
                	$("#msgUnreadList").append(msgUnreadListHTML);
	                return;
	            }
	
	            for (let i = 0; i < 4 && i < result.length; i++) {
	                if (!result[i]) { 
	                    continue;
	                }
	
	                let profile = result[i].senderProfileName 
	                    ? result[i].senderProfileName + '.' + result[i].senderProfileExt 
	                    : 'noProfile.png';
	
	                msgUnreadListHTML += `<div class="card mt-2">
	                                        <div class="d-flex justify-content-between align-items-center">
	                                            <div>
	                                                <span class="avatar avatar-lg">
	                                                    <img src="${pageContext.request.contextPath}/upload/profile/` + profile + `" class="rounded">
	                                                </span>  
	                                                <span class="ps-5">` + result[i].senderName + `</span>
	                                                <span class="ps-5">` + result[i].title.substr(0, 10) + `</span>
	                                            </div>
	                                            <span class="pe-5">` + result[i].sendDate + `</span>
	                                        </div>
	                                    </div>`;
	            }
	
	            $("#msgUnreadList").append(msgUnreadListHTML);
	        }).fail(function() {
	            console.log("showMsgUnreadList ajax 호출 실패");
	        });
	    }

    </script>

</body>
</html>