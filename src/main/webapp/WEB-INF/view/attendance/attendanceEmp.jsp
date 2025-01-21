<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
	    <title>DataTables Basic | CORK - Multipurpose Bootstrap Dashboard Template </title>
	    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico"/>
	    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
	    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
	    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
	    <!-- BEGIN GLOBAL MANDATORY STYLES -->
	    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
	    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
	    <!-- END GLOBAL MANDATORY STYLES -->
	
	    <!-- BEGIN PAGE LEVEL STYLES -->
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.css">
	    
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/dt-global_style.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/dark/table/datatable/dt-global_style.css">
	    <!-- END PAGE LEVEL STYLES -->
	
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
	
	    <!--  BEGIN MAIN CONTAINER  -->
	    <div class="main-container " id="container">
	
	        <div class="overlay"></div>
	        <div class="cs-overlay"></div>
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
	                                                <li class="breadcrumb-item"><a href="#">Datatables</a></li>
	                                                <li class="breadcrumb-item active" aria-current="page">Basic</li>
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
	                        <!-- tabs start -->
	                        <div class="simple-tab">
	                            <!-- 탭 title -->
	                            <ul class="nav nav-tabs d-flex justify-content-between" id="myTab" role="tablist">
	                                <div class="d-flex">
	                                    <li class="nav-item" role="presentation">
	                                        <button class="nav-link active" id="attendance-tab" data-bs-toggle="tab" data-bs-target="#attendance-tab-pane" type="button" role="tab" aria-controls="attendance-tab-pane" aria-selected="true">근태</button>
	                                    </li>
	                                    <li class="nav-item" role="presentation">
	                                        <button class="nav-link" id="vacation-tab" data-bs-toggle="tab" data-bs-target="#vacation-tab-pane" type="button" role="tab" aria-controls="vacation-tab-pane" aria-selected="false">연가</button>
	                                    </li>
	                                    <li class="nav-item" role="presentation">
	                                        <button class="nav-link" id="businessTrip-tab" data-bs-toggle="tab" data-bs-target="#businessTrip-tab-pane" type="button" role="tab" aria-controls="businessTrip-tab-pane" aria-selected="false">출장</button>
	                                    </li>
	                                </div>
	                                <!-- 월 네비게이션션-->
	                                <div>
	                                    <div class="btn-group" role="group" aria-label="Basic example">
											<div id="btnSetMonthAndYear">
												<!-- 탭 클릭시 이전달/다음달 버튼 id 변경 -->
											</div>
	                                    </div>
	                                </div>
	                            </ul>
	                            
	                            <br>
	                            <div class="tab-content" id="myTabContent">
	                                <!-- 근태관리 start -->
	                                <div class="tab-pane fade show active" id="attendance-tab-pane" role="tabpanel" aria-labelledby="attendance-tab" tabindex="0">
	                                    <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
	                                        <div class="text-start">
	                                        	<input class="setYearAndMonth btn btn-primary" readonly/>
	                                        </div>  
	                                        <div class="widget-content widget-content-area br-8">     
	                                            <table class="zero-config table dt-table-hover" class="table dt-table-hover" style="width:100%">
	                                                <thead>
	                                                    <tr role="row" class="text-center">
	                                                        <th>날짜</th>
	                                                        <th>출근</th>
	                                                        <th>퇴근</th>
	                                                        <th>상태</th>
	                                                        <th>승인상태</th>
	                                                    </tr>
	                                                </thead>
	                                                <tbody id="empAttendancies">
	                                                </tbody>
	                                            </table>
	                                        </div>
	                                    </div>
	                                </div>
	                                <!-- 근태관리 end -->
	
	                               <!-- 연차 관리 start -->
									<div class="tab-pane fade" id="vacation-tab-pane" role="tabpanel" aria-labelledby="vacation-tab" tabindex="0">
									    <div class="tab-content" id="myTabContent">
									        <div class="tab-pane fade show active" id="vacation-tab-paㅇne" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
									            <div id="toggleAccordion" class="no-icons accordion">
									                
									                <!-- 연차 사용률 시작 -->
									                <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
									                    <div class="widget-content widget-content-area br-8">   
									                        <div class="card">
									                            <div class="card-header" id="annualUsageRateHeader">
									                                <section class="mb-0 mt-0">
									                                    <div role="menu" class="collapsed" data-bs-toggle="collapse" data-bs-target="#annualUsageRate" aria-expanded="false" aria-controls="annualUsageRate">
									                                        나의 연차 요약
									                                    </div>
									                                </section>
									                            </div>
									
									                            <div id="annualUsageRate" class="collapse" aria-labelledby="annualUsageRateHeader" data-bs-parent="#toggleAccordion">
									                                <div class="card-body">
									                                	<div id="empLeaveInfo" class="w-25 text-start" style="min-width: 25%"></div>
                                 										<hr>
									                                    <div class="progress br-30 progress-xl">
									                                        <div id ="deptLeaveUsageRateBar" class="progress-bar bg-info" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
									                                            <div class="progress-title">
									                                                <span>부서 평균</span>
									                                                <span id="deptLeaveUsageRate"></span>
									                                            </div>
									                                        </div>
									                                    </div>
									                                    <div class="progress br-30 progress-xl">
									                                        <div id="empLeaveUsageRateBar" class="progress-bar bg-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
									                                            <div class="progress-title">
									                                                <span>나의 사용률</span>
									                                                <span id="empLeaveUsageRate"></span> 
									                                            </div>
									                                        </div>
									                                    </div>
									                                </div>
									                            </div>
									                        </div>
									                    </div>
									                </div>
									                <!-- 연가 사용률 끝 -->
									
									                <!-- 부서 연차 기록 시작 -->
									                <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
									                    <input class="setYearAndMonth btn btn-primary" readonly/>
									                    <div class="widget-content widget-content-area br-8">   
									                        <div class="card">
									                            <div class="card-header" id="vacationDraftHeader">
									                                <section class="mb-0 mt-0">
									                                    <div role="menu" class="collapsed" data-bs-toggle="collapse" data-bs-target="#vacationDraft" aria-expanded="true" aria-controls="vacationDraft">
									                                        부서원 휴가신청 리스트
									                                    </div>
									                                </section>
									                            </div>
									                            <div id="vacationDraft" class="collapse show" aria-labelledby="vacationDraftHeader" data-bs-parent="#toggleAccordion">
									                                <div class="card-body">
									                                    <table class="zero-config table dt-table-hover" style="width:100%">
									                                        <thead>
									                                            <tr class="text-center">
									                                                <th>시작일자</th>
									                                                <th>종료일자</th>
									                                                <th>대체업무자</th>
									                                                <th>결재상태</th>
									                                                <th>상세보기</th>
									                                            </tr>
									                                        </thead>
									                                        <tbody id="empLeavesReq">
									                                        </tbody>
									                                    </table>
									                                </div>
									                            </div>
									                        </div>
									                    </div>
									                </div>
									                <!-- 부서 연차 기록 끝 -->
									            </div>
									        </div>
									    </div>
									</div>
								
									<!-- 연가관리 end -->
	
	                                <!--출장관리 start -->
	                                <div class="tab-pane fade" id="businessTrip-tab-pane" role="tabpanel" aria-labelledby="businessTrip-tab" tabindex="0">
	                                    <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
	                                    	<input class="setYearAndMonth btn btn-primary" readonly/>
	                                        <div class="widget-content widget-content-area br-8">                                            
	                                            <table class="zero-config table dt-table-hover" style="width:100%">
	                                                <thead>
	                                                    <tr class="text-center">
	                                                        <th>시작</th>
	                                                        <th>종료</th>
	                                                        <th>장소</th>
	                                                        <th>승인여부</th>
	                                                        <th>상세보기</th>
	                                                    </tr>
	                                                </thead>
	                                                <tbody id="empBusinessTripReqList"></tbody>
	                                            </table>
	                                        </div>
	                                    </div>
	                                </div>
	                                <!-- 출장관리 end -->
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <!--  BEGIN FOOTER  -->
	            <div class="footer-wrapper mt-0">
	                <div class="footer-section f-section-1">
	                    <p class="">Copyright © <span class="dynamic-year">2022</span> <a target="_blank" href="https://designreset.com/cork-admin/">DesignReset</a>, All rights reserved.</p>
	                </div>
	                <div class="footer-section f-section-2">
	                    <p class="">Coded with <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></p>
	                </div>
	            </div>
	            <!--  END CONTENT AREA  -->
	        </div>
	        <!--  END CONTENT AREA  -->
	    </div>
	    <!-- END MAIN CONTAINER -->
	    
	    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
	    <script src="../src/plugins/src/global/vendors.min.js"></script>
	    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
	    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
	    <script src="../src/plugins/src/waves/waves.min.js"></script>
	    <script src="../layouts/vertical-light-menu/app.js"></script>
	    <script src="../src/assets/js/custom.js"></script>
	    <!-- END GLOBAL MANDATORY SCRIPTS -->
	
	    <!-- BEGIN PAGE LEVEL SCRIPTS -->
	    <script src="../src/plugins/src/table/datatable/datatables.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		
		<!-- attendanceSupport 에서 공통 script 내용 가져오기 -->
		<jsp:include page="/WEB-INF/view/attendance/attendanceSupport.jsp"/>
		
		<!-- HTML 첫 로드시 실행되는 코드 -->
		<script>
		    $(document).ready(function() {
		    	// 이전달, 다음달 버튼 '근태'탭 버전으로 설정
		    	$("#btnSetMonthAndYear").append(attendanceBtnHtml);
		    	// 현재 조회하는 연-월을 보여주기 
		        $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
		        // 이번달 근태 리스트
		        showAttendanceList();
		    });
		</script>
	
		<!-- 탭클릭시 이벤트 설정 -->
		<script>
	    	// <근태 Tab 클릭시> 또는 문서 HTMl 로딩이 끝날시, 이전달/다음달이 근태 리스트에 맞게 세팅 및 리스트 불러오기
	        $("#attendance-tab").click(function() {
	        	$("#btnSetMonthAndYear").empty();
	        	$("#btnSetMonthAndYear").append(attendanceBtnHtml);
	        	date = new Date();	// setYearAndMonth 초기화
	            $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
	            showAttendanceList();
	        });
	   	     
			// <연가 Tab 클릭시> 이전달/다음달이 연가 리스트에 맞게 세팅 및 리스트 불러오기
	        $("#vacation-tab").click(function() {  
	     	   $("#btnSetMonthAndYear").empty();
	           $("#btnSetMonthAndYear").append(leaveBtnHtml);
	
	            date = new Date();
	            $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
	            showLeaveReqList();
		        showDeptLeaveUsageRate();
		        // 연차 사용률
		        showEmpLeaveUsageRate();
	        });
		
			// <출장 Tab 클릭시> 이전달/다음달이 출장 리스트에 맞게 세팅 및 리스트 불러오기
			$("#businessTrip-tab").click(function() {
				$("#btnSetMonthAndYear").empty();
	            $("#btnSetMonthAndYear").append(businessTripBtnHtml);
	            date = new Date();
	            $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
				showBusinessTripReqList();
			});

		</script>
		<!-- 탭클릭시 이전달/다음달 버튼 세팅 종료 -->
		
	    <!-- 개인 근태관련 ajax 호출 시작 -->
	    <script>
		   function showAttendanceList() {
		       $.ajax({
		           url: "/employee/attendance/"+"${empNo}/"+$(".setYearAndMonth").val(),
		           method: 'GET',
		       }).done(function(result) {
		           // 기존 DataTable 인스턴스, <tbody> 데이터 삭제
		           destroyDataTable(); 
		           $("#empAttendancies").empty();
		           let html = "";
		           let checkBoxNumber = 0;
		           $(result).each(function(index, item) {
		               const startTime = item.startTime.replace(" ", "/");
		               checkBoxNumber++;
		               html += `"<tr role="row" class="text-center">"`;
		               html += `
		                       <td class="sorting_01">` + item.startTime.substr(0,10) + `</td>
		                       <td>` + (item.state === "결근" && item.startTime.substr(11) == "23:59:59"?  "미등록" : (item.state === "연차"? "미등록": item.startTime.substr(11))) + `</td>
		                       <td>` + (item.state === "결근" && item.endTime.substr(11) == "23:59:59"?  "미등록" : (item.state === "연차"? "미등록": item.endTime.substr(11))) + `</td>
		                       <td>` + (item.state == null? "미지정" : item.state) + `</td> 
		                       <td>` + (item.approvalYN == 'Y'? 
		                       `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>` 
		                       : `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>` ) + `</td>`;
		               html += "</tr>";
		           });
		           
	               $("#empAttendancies").append(html);
		            
		           initDataTable();
		       }).fail(function() {
		           console.log("showAttendanceList error");
		       });
		   }
		</script>
		<!-- 개인 근태관련 ajax 호출 끝 -->
	
		<!-- 개인 휴가관련 ajax 호출 시작 -->
		<script>
		   function showLeaveReqList() {
		       $.ajax({
		           url: "/employee/leaves/"+"${empNo}/"+$(".setYearAndMonth").val(),
		           method: 'GET',
		       }).done(function(result) {
		           // 기존 DataTable 인스턴스, <tbody> 데이터 삭제
		           destroyDataTable(); 
		           $("#empLeavesReq").empty();
		           let html = "";
		          
		           $(result).each(function(index, item) {
		               const startTime = item.startTime.replace(" ", "/");
		               
		               html += `"<tr role="row" class="text-center">"`;
		               html += `<td class="sorting_01">` + item.startTime + `</td>
		                       <td>` + item.endTime + `</td>
		                       <td>` + item.substituteEmp + `</td>
		                       <td>` + item.approvalState + `</td>
		                       <td><a href=/draft/C04/detail/` + item.draNo + ` class="btn btn-hover btn-outline-primary btn-sm ms-4">상세보기</a>`;
		               html += "</tr>";
		
		           });
		           $("#empLeavesReq").append(html);
		           initDataTable();
		       }).fail(function() {
		           console.log("showLeaveReqList ajax error");
		       });
		   	}
		
			// 부서 유급휴가 평균 사용률	
		   function showDeptLeaveUsageRate() {
			   $.ajax({
		           url: "/department/leave/UsageRate/" + "${depNo}",
		           method: 'GET',
		       }).done(function(result) {
		    	   $("#deptLeaveUsageRate").empty();
		    	   
		    	   var deptUsageRateHtml = `<span class="ms-3">`+ result.toFixed(2) +`</span>`
		       	   $("#deptLeaveUsageRate").append(deptUsageRateHtml);
		    	   $("#deptLeaveUsageRateBar").css("width", result+"%");
		       }).fail(function() {
		    	  console.log("showDeptLeaveUsageRate ajax fail"); 
		       });
			}
			
			// 개인 유급휴가 사용 요약 및 연차 유급휴가 사용률
		   function showEmpLeaveUsageRate() {
			   $.ajax({
		           url: "/employee/leave/sum/" + "${empNo}",
		           method: 'GET',
		       }).done(function(result) {
		    	   $("#empLeaveInfo").empty();		
		    	   $("#empLeaveUsageRate").empty();
		    	   var empLeaveSumHtml = "";
		    	   var empLeaveUsageRateHtml = "";

		    	   empLeaveInfoHtml = `<div class="input-group mb-3">
						    		      <span class="input-group-text" id="basic-addon1">기본 연차</span>
						    		      <div class="form-control text-end">` + result[0].totalLeave + `</div>
						    		   </div>
						    		   <div class="input-group mb-3">
						    		      <span class="input-group-text" id="basic-addon1">조정 연차</span>
						    		      <div class="form-control text-end">` + result[0].modifiedLeave + `</div>
						    		   </div>
						    		   <div class="input-group mb-3">
						    		      <span class="input-group-text" id="basic-addon1">조정 + 기본</span>
						    		      <div class="form-control text-end">` + (parseInt(result[0].totalLeave) + parseInt(result[0].modifiedLeave)) + `</div>
						    		   </div>
						    		   <div class="input-group mb-3">
						    		      <span class="input-group-text" id="basic-addon1">사용 연차</span>
						    		      <div class="form-control text-end">` + result[0].usedLeave + `</div>
						    		   </div>
									   `;

		    	   $("#empLeaveInfo").append(empLeaveInfoHtml);		

		    	   empLeaveUsageRateHtml = `<span class="ms-3">`+ result[0].leaveUsageRate.toFixed(2) +`</span>`;
		    	   $("#empLeaveUsageRate").append(empLeaveUsageRateHtml);
		    	   $("#empLeaveUsageRateBar").css("width", result[0].leaveUsageRate +"%");
		    	   
		       }).fail(function() {
		    	  console.log("showEmpLeaveUsageRate ajax fail"); 
		       });
			}
		</script>
		<!-- 개인 휴가관련 ajax 호출 끝 -->
		
		<!-- 개인 출장관련 ajax 호출 시작 -->
		<script>
			function showBusinessTripReqList() {
				$.ajax({
					url: "/employee/businessTrips/"+"${empNo}/"+$(".setYearAndMonth").val(),
					method: 'GET',
				}).done(function(result) {
					destroyDataTable();
					$("#empBusinessTripReqList").empty();
		            let BusinessTriphtml = "";
		            
		            $(result).each(function(index, item) {
		         	   BusinessTriphtml += `"<tr role="row" class="text-center">"`;
		         	   BusinessTriphtml += `   <td  class="sorting_01">` + item.startTime + `</td>
				 		                       <td>` + item.endTime + `</td>
				 		                       <td>` + item.place + `</td>
				 		                       <td>` + item.approvalState + `</td>
				 		                       <td><a href=/draft/C02/detail/` + item.draNo + ` class="btn btn-hover btn-outline-primary btn-sm ms-4">상세보기</a>`;
		               BusinessTriphtml += "</tr>";
		            
		            });
		            
		            $("#empBusinessTripReqList").append(BusinessTriphtml);
					
					initDataTable();
				}).fail(function() {
					console.log("showBusinessTripReqList ajax fail");
				});
			} 
		</script>
		<!-- 부서원 출장관련 ajax 호출 끝 -->
	<!-- END PAGE LEVEL SCRIPTS -->
	</body>
</html>