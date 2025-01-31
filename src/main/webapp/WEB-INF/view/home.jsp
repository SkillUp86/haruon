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
    <link href="../src/plugins/src/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/light/fullcalendar/custom-fullcalendar.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
    <!-- 페이지 제목 입력칸 -->
    <title>메인 페이지</title>
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
                                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home">MainPage</a></li>
                                            </ol>
                                        </nav>
                        
                                    </div>
                                </div>
                                <ul class="navbar-nav flex-row ms-auto breadcrumb-action-dropdown">
                                    <li class="nav-item more-dropdown">
                                        <div class="dropdown  custom-dropdown-icon">
                                            <a class="dropdown-toggle btn" href="#" role="button" id="customDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span>Settings</span>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down custom-dropdown-arrow"><polyline points="6 9 12 15 18 9"></polyline></svg>
                                            </a>
                        
                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="customDropdown">

                                                <a class="dropdown-item" data-value="Settings" data-icon="<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;24&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;2&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; class=&quot;feather feather-settings&quot;><circle cx=&quot;12&quot; cy=&quot;12&quot; r=&quot;3&quot;></circle><path d=&quot;M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z&quot;></path></svg>" href="javascript:void(0);">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg> Settings
                                                </a>

                                                <a class="dropdown-item" data-value="Mail" data-icon="<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;24&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;2&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; class=&quot;feather feather-mail&quot;><path d=&quot;M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z&quot;></path><polyline points=&quot;22,6 12,13 2,6&quot;></polyline></svg>" href="javascript:void(0);">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> Mail
                                                </a>

                                                <a class="dropdown-item" data-value="Print" data-icon="<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;24&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;2&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; class=&quot;feather feather-printer&quot;><polyline points=&quot;6 9 6 2 18 2 18 9&quot;></polyline><path d=&quot;M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2&quot;></path><rect x=&quot;6&quot; y=&quot;14&quot; width=&quot;12&quot; height=&quot;8&quot;></rect></svg>" href="javascript:void(0);">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-printer"><polyline points="6 9 6 2 18 2 18 9"></polyline><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path><rect x="6" y="14" width="12" height="8"></rect></svg> Print
                                                </a>

                                                <a class="dropdown-item" data-value="Download" data-icon="<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;24&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;2&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; class=&quot;feather feather-download&quot;><path d=&quot;M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4&quot;></path><polyline points=&quot;7 10 12 15 17 10&quot;></polyline><line x1=&quot;12&quot; y1=&quot;15&quot; x2=&quot;12&quot; y2=&quot;3&quot;></line></svg>" href="javascript:void(0);">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-download"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg> Download
                                                </a>

                                                <a class="dropdown-item" data-value="Share" data-icon="<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;24&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;2&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; class=&quot;feather feather-share-2&quot;><circle cx=&quot;18&quot; cy=&quot;5&quot; r=&quot;3&quot;></circle><circle cx=&quot;6&quot; cy=&quot;12&quot; r=&quot;3&quot;></circle><circle cx=&quot;18&quot; cy=&quot;19&quot; r=&quot;3&quot;></circle><line x1=&quot;8.59&quot; y1=&quot;13.51&quot; x2=&quot;15.42&quot; y2=&quot;17.49&quot;></line><line x1=&quot;15.41&quot; y1=&quot;6.51&quot; x2=&quot;8.59&quot; y2=&quot;10.49&quot;></line></svg>" href="javascript:void(0);">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-share-2"><circle cx="18" cy="5" r="3"></circle><circle cx="6" cy="12" r="3"></circle><circle cx="18" cy="19" r="3"></circle><line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line></svg> Share
                                                </a>
                                                
                                            </div>
                        
                                        </div>
                                    </li>
                                </ul>
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
                        <div class="col-xl-7 col-lg-8 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="layout-spacing">
                                <div class="widget widget-six">
                                    <div class="widget-heading">
                                        <div class="widget-content widget-content-area">
                                            <div id="calendar"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 캘린더 컨텐츠 끝 -->

                            <!-- 결재함 컨텐츠 시작-->
                            <div class="col-xl-5 col-lg-4 col-md-12 col-sm-12 col-12 layout-spacing">
                                <br>
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
                                                        <th class="text-center">문서번호</th>
                                                        <th class="text-center">날짜</th>
                                                        <th>문서양식</th>
                                                        <th class="text-center">제목</th>
                                                        <th class="text-center">결재상태</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${draftList}" var="d">
                                                        <tr>
                                                            <td class="text-center">${d.draNo}</td>
                                                            <td class="text-center">${d.createDate}</td>
                                                            <td>${d.draftType}</td>
                                                            <td class="text-center">${d.title}</td>
                                                            <td class="text-center">${d.approvalState}</td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <!-- 결재함 컨텐츠 끝-->
                            <!-- 쪽지함 시작-->

                        <div class="col-xl-5 col-lg-4 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="layout-spacing">
                                <div class="widget widget-six">
                                    <div class="widget-heading">
                                        <h5 style="display: inline-block;">쪽지함</h5>
                                        (담당자 : 우림)<br>
                                        <p style="display: inline-block; float: right; margin-right: 15px;">
                                        	<a href="${pageContext.request.contextPath}/"><strong>더보기</strong></a>
                                        </p>
                                    </div>
                                    
                                    <div class="widget-content">
                                        <div class="table-responsive">
                                            <table id="board-list" class="table dt-table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>번호</th>
                                                        <th>제목</th>
                                                        <th>발신자</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <!-- 쪽지함 끝-->
                        </div>

                        <!-- 공지 게시판 컨텐츠 시작-->
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 layout-spacing">
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
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 layout-spacing">
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
                                                	<c:forEach var="b" items="${boardList}">
	                                                    <tr>
	                                                        <td>${b.boaNo}</td>
	                                                        <td><a href="${pageContext.request.contextPath}/board/${b.boaNo}">[${b.catName}] ${b.title}</a></td>
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
            </div>
            <!--  BEGIN FOOTER  -->
            <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
            <!--  END FOOTER  -->
        </div>
        <!--  END CONTENT AREA  -->

    </div>
    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <script src="../src/plugins/src/fullcalendar/fullcalendar.min.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="../src/plugins/src/fullcalendar/custom-fullcalendar.js"></script>
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    
    <script>
    	// 페이지가 준비되면 호출
    	$(document).ready(function() {
    		showTodayAttendance();
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
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let calendarEl = document.getElementById('calendar');

            let calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {

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
                                url: `/calendarDetail/\${schedule.schNo}`,
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
</body>
</html>