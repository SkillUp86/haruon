<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>DataTables Basic | CORK - Multipurpose Bootstrap Dashboard Template </title>
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="../src/plugins/src/table/datatable/datatables.css">
    
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/dark/table/datatable/dt-global_style.css">
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
                                        <div class="d-flex justify-content-between">
                                        	<input class="setYearAndMonth btn btn-primary" readonly/>
                                            <div class="btn-group" role="group">
                                                <button id="selectAllBtn" type="button" class="btn btn-hover btn-primary">전체 선택</button>    
                                                <button id="deleteAllBtn" type="button" class="btn btn-hover btn-primary">선택 해제</button>
                                                <button id="approvalOnCheckedBtn" type="button" class="btn btn-hover btn-primary">선택 승인</button>     
                                            </div>
                                        </div>  
                                        <div class="widget-content widget-content-area br-8">  
                                            <form id="selectFormForModApproval" method="post" action="${pageContext.request.contextPath}/attendance/modifyApprovalYN">
	                                            <table class="zero-config table dt-table-hover" class="table dt-table-hover" style="width:100%">
	                                                <thead>
	                                                    <tr role="row" class="text-center">
	                                                        <th>날짜</th>
	                                                        <th>직급</th>
	                                                        <th>이름</th>
	                                                        <th>출근</th>
	                                                        <th>퇴근</th>
	                                                        <th>상태</th>
	                                                        <th>승인하기</th>
	                                                    </tr>
	                                                </thead>
	                                                <tbody id="deptAttendancies">
	                                                </tbody>
	                                            </table>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- 근태관리 end -->

                               <!-- 연차 관리 start -->
								<div class="tab-pane fade" id="vacation-tab-pane" role="tabpanel" aria-labelledby="vacation-tab" tabindex="0">
								    <div class="tab-content" id="myTabContent">
								        <div class="tab-pane fade show active" id="vacation-tab-paㅇne" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
								            <div id="toggleAccordion" class="no-icons accordion">
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
								                                                <th>이름</th>
								                                                <th>직급</th>
								                                                <th>시작일자</th>
								                                                <th>종료일자</th>
								                                                <th>결재상태</th>
								                                                <th>상세보기</th>
								                                            </tr>
								                                        </thead>
								                                        <tbody id="deptLeavesReq">
								                                        </tbody>
								                                    </table>
								                                </div>
								                            </div>
								                        </div>
								                    </div>
								                </div>
								                <!-- 부서 연차 기록 끝 -->
								                <!-- 연차 사용률 시작 -->
								                <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
								                    <div class="widget-content widget-content-area br-8">   
								                        <div class="card">
								                            <div class="card-header" id="annualUsageRateHeader">
								                                <section class="mb-0 mt-0">
								                                    <div role="menu" class="collapsed" data-bs-toggle="collapse" data-bs-target="#annualUsageRate" aria-expanded="false" aria-controls="annualUsageRate">
								                                        연차 유급휴가 사용률
								                                    </div>
								                                </section>
								                            </div>
								
								                            <div id="annualUsageRate" class="collapse" aria-labelledby="annualUsageRateHeader" data-bs-parent="#toggleAccordion">
								                                <div class="card-body">
								                                    <div class="progress br-30 progress-xl">
								                                        <div id ="companyLeaveUsageRateBar" class="progress-bar bg-info" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
								                                            <div class="progress-title">
								                                                <span>회사 평균</span>
								                                                <span id="companyLeaveUsageRate"></span>
								                                            </div>
								                                        </div>
								                                    </div>
								                                    <div class="progress br-30 progress-xl">
								                                        <div id="deptLeaveUsageRateBar" class="progress-bar bg-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
								                                            <div class="progress-title">
								                                                <span>부서 평균</span>
								                                                <span id="deptLeaveUsageRate"></span> 
								                                            </div>
								                                        </div>
								                                    </div>
								                                    <hr>
								                                    <table class="zero-config table dt-table-hover" style="width:100%">
								                                        <thead>
								                                            <tr class="text-center">
								                                                <th>이름</th>
								                                                <th>직급</th>
								                                                <th>총 일수</th>
								                                                <th>사용한 일수</th>
								                                                <th>사용률</th>
								                                            </tr>
								                                        </thead>
								                                        <tbody id="deptLeaveUsageRateList">
								                                        </tbody>
								                                    </table>
								                                </div>
								                            </div>
								                        </div>
								                    </div>
								                </div>
								                <!-- 연가 사용률 끝 -->
								
								                <!-- 연차 관리 시작 -->
								                <div class="col-xl-12 col-lg-12 col-sm-12 layout-spacing">
								                    <div class="widget-content widget-content-area br-8">   
								                        <div class="card">
								                            <div class="card-header" id="manageAnnualHeader">
								                                <section class="mb-0 mt-0">
								                                    <div role="menu" class="collapsed" data-bs-toggle="collapse" data-bs-target="#manageAnnual" aria-expanded="false" aria-controls="manageAnnual">
								                                        부서원 연차 관리
								                                    </div>
								                                </section>
								                            </div>
								
								                            <div id="manageAnnual" class="collapse" aria-labelledby="manageAnnualHeader" data-bs-parent="#toggleAccordion">
								                                <div class="card-body">
								                                    <table class="zero-config table dt-table-hover" style="width:100%">
								                                        <thead>
								                                            <tr class="text-center">
								                                                <th>이름</th>
								                                                <th>직급</th>
								                                                <th>연차(현재연도 - 입사년도)</th>
								                                                <th>총 연차 유급휴가 일수</th>
								                                                <th>연차관리</th>
								                                            </tr>
								                                        </thead>
								                                        <tbody id="manageDeptLeaveList">
								                                        </tbody>
								                                    </table>
								                                </div>
								                                
								                            </div>
								                        </div>
								                    </div>
								                </div>
								                <!-- 연가 사용률 집계 끝 -->
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
                                                        <th>이름</th>
                                                        <th>직급</th>
                                                        <th>시작</th>
                                                        <th>종료</th>
                                                        <th>장소</th>
                                                        <th>결재상태</th>
                                                        <th>출장신청서</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="deptBusinessTripReqList"></tbody>
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
	
	<!-- 탭클릭시 이전달/다음달 버튼 세팅 시작 -->
	<script>
		let date = new Date();
	    const now = new Date();
	   
		var attendanceBtnHtml = `
								<button id="setPreviousMonthForAttendance" type="button" class="btn btn-hover">
						           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
						           <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
							       </svg>
							       이전달
						        </button>
						        <button id="setNextMonthBtnForAttendance" type="button" class="btn btn-hover">
							       다음달
							       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
							           <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8"/>
							       </svg>
						        </button> `;
						        
        var leaveBtnHtml = `<button id="setPreviousMonthForLeave" type="button" class="btn btn-hover">
						        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
						        <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
						    </svg>
						    이전달
						    </button>
						    <button id="setNextMonthBtnForLeave" type="button" class="btn btn-hover">
						    다음달
						    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
						        <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8"/>
						    </svg>
						    </button>`;
						    
        var businessTripBtnHtml = `<button id="setPreviousMonthForBusinessTrip" type="button" class="btn btn-hover">
								       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
								       <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
								   </svg>
								   이전달
								   </button>
								   <button id="setNextMonthBtnForBusinessTrip" type="button" class="btn btn-hover">
								   다음달
								   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
								       <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8"/>
								   </svg>
								   </button>`;
      
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
	        showCompanyLeaveUsageRate();
        });
	
	// <출장 Tab 클릭시> 이전달/다음달이 출장 리스트에 맞게 세팅 및 리스트 불러오기
		$("#businessTrip-tab").click(function() {
			$("#btnSetMonthAndYear").empty();
            $("#btnSetMonthAndYear").append(businessTripBtnHtml);
            date = new Date();
            $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
			showBusinessTripReqList();
		});
	// <연가 - 연차 유급휴가 사용률 Tab 클릭시>
		$("#annualUsageRateHeader").click(function() {
			showDeptLeaveUsageRateList ();
		});
	// <연가 - 부서원 연차 관리 Tab 클릭시>=========
		$("#manageAnnualHeader").click(function() {
			showManageDeptLeaveList();
		});
	
   	// <출장 Tab 클릭시> 이전달/다음달이 출장 리스트에 맞게 세팅 및 리스트 불러오기
        $("#businessTrip-tab").click(function() {  
     	   $("#btnSetMonthAndYear").empty();
           $("#btnSetMonthAndYear").append(businessTripBtnHtml);

            date = new Date();	// setYearAndMonth 초기화
            $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
            showBusinessTripReqList();
        });
        
     // <근태버튼 동작> 연-월 세팅 및 기능에 맞는 yearAndMonth설정 및 리스트 출력 - 근태
		$(document).on("click", "#setPreviousMonthForAttendance", function() {
		    console.log("이전달 클릭");
		    date = new Date(date.setMonth(date.getMonth() - 1));
		    $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
		    showAttendanceList();
		    if($("#setNextMonthBtnForAttendance").attr("disabled") === "disabled") {
		        $("#setNextMonthBtnForAttendance").removeAttr("disabled");
		    }
		});
		
		$(document).on("click", "#setNextMonthBtnForAttendance", function() {
		  console.log("다음달 클릭");
		  date = new Date(date.setMonth(date.getMonth() + 1));
		  if(now >= date.setSeconds(0)) {
		      $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
		      showAttendanceList();
		  } else {
		      date = new Date(date.setMonth(date.getMonth() - 1));
		      alert("더 이상 조회할 수 있는 달이 없습니다.");
		      $("#setNextMonthBtnForAttendance").attr("disabled", "disabled");
		  }
		});
		      
     // <연차버튼 동작> 연-월 세팅 및 기능에 맞는 yearAndMonth설정 및 리스트 출력 - 연차
     	$(document).on("click", "#setPreviousMonthForLeave", function() {
            console.log("이전달 클릭");
            date = new Date(date.setMonth(date.getMonth() - 1));
            $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
            showLeaveReqList();
        });
     	$(document).on("click", "#setNextMonthBtnForLeave", function() {
            console.log("다음달 클릭");
            date = new Date(date.setMonth(date.getMonth() + 1));
            $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
            showLeaveReqList();
        });
     	
     // <출장버튼 동작> 연-월 세팅 및 기능에 맞는 yearAndMonth설정 및 리스트 출력 - 출장
     	$(document).on("click", "#setPreviousMonthForBusinessTrip", function() {
            console.log("이전달 클릭");
            date = new Date(date.setMonth(date.getMonth() - 1));
            $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
            showBusinessTripReqList();
        });
     
     	$(document).on("click", "#setNextMonthBtnForBusinessTrip", function() {
            console.log("다음달 클릭");
            date = new Date(date.setMonth(date.getMonth() + 1));
            $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
            showBusinessTripReqList();
        });
	</script>
	<!-- 탭클릭시 이전달/다음달 버튼 세팅 종료 -->
	
	<!-- 전체선택/전체해제/선택승인 버튼 기능 시작 -->
	<script>
	   $("#deleteAllBtn").hide();
	   $("#selectAllBtn").click(function() {
	       $('input:checkbox').prop('checked', true);
	       
	       $("#selectAllBtn").hide();	// 클릭시 전체선택 버튼 숨기고, 전체해제 버튼 보이게 하기
	       $("#deleteAllBtn").show(); 
	   });
	
	
	   $("#deleteAllBtn").click(function() {  
	       $('input:checkbox').prop('checked', false);
	       
	       $("#deleteAllBtn").hide(); // 클릭시 전체해제 버튼 숨기고, 전체선택 버튼 보이게 하기
	       $("#selectAllBtn").show();
	   });
	   
	   $(document).on("click", "#approvalOnCheckedBtn", function() {
	       // 선택한 근태행이 없으면 alert창 띄우기 
	       if($('input:checkbox:checked').length < 1) {
	           alert("승인할 행을 선택해주세요.");
	           return;
	       }
	       
	       // 선택한 근태행이 1개 이상이라면 /department/attendance/modifyApprovalYN 로 이동
	       	$("#selectFormForModApproval").submit();
   	   		const formData = $("#selectFormForModApproval").serialize();
   	    	alert("Form Data:", formData); // 데이터를 확인합니다.
	   });
	</script>
	<!-- 전체선택/전체해제/선택승인 버튼 기능 끝-->
	
	<!-- ajax 호출 성공시 zero-config 초기화/삭제 하는 함수 시작 -->
	<script>
		function initDataTable() {
	           // 페이징, 검색, rowPerPage 관리 항목 객체 생성
	           $('.zero-config').DataTable({
	               "dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
	                      "<'table-responsive'tr>" +
	                      "<'dt--bottom-section d-sm-flex justify-content-sm-center text-center'<'dt--pagination'p>>",
	               "oLanguage": {
	                   "oPaginate": { 
	                       "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', 
	                       "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' 
	                   },
	                   "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
	                   "sSearchPlaceholder": "Search...",
	                   "sLengthMenu": "Results :  _MENU_",
	               },
	               "stripeClasses": [],
	               "lengthMenu": [7, 10, 20, 50],
	               "pageLength": 10
	           });
		}
		
		function destroyDataTable() {
			$('.zero-config').DataTable().destroy(); 
		}
	</script>
	<!-- ajax 호출 성공시 zero-config 초기화 하는 함수 끝 -->
	
    <!-- 부서원 근태관련 ajax 호출 시작 -->
    <script>
	   function showAttendanceList() {
	       $.ajax({
	           url: "/department/attendance/"+"${depNo}/"+$(".setYearAndMonth").val(),
	           method: 'GET',
	       }).done(function(result) {
	           // 기존 DataTable 인스턴스, <tbody> 데이터 삭제
	           destroyDataTable(); 
	           $("#deptAttendancies").empty();
	           let html = "";
	          
	           $(result).each(function(index, item) {
	               const startTime = item.startTime.replace(" ", "/");
	               
	               html += `"<tr role="row" class="text-center">"`;
	               html += `
	                       <td class="sorting_01">` + item.startTime.substr(0,10) + `</td>
	                       <td>` + item.location + `</td>
	                       <td>` + item.empName + `</td>
	                       <td>` + (item.state === "결근" && item.startTime.substr(11) == "23:59:59"?  "미등록" : (item.state === "연차"? "미등록": item.startTime.substr(11))) + `</td>
	                       <td>` + (item.state === "결근" && item.endTime.substr(11) == "23:59:59"?  "미등록" : (item.state === "연차"? "미등록": item.endTime.substr(11))) + `</td>
	                       <td>
	                           ` + (item.state == null? "미지정" : item.state) + `<a id="modifyStateBtn" href="attendance/modifyState?target=` + item.empNo + "/" + startTime + `" class="btn btn-hover btn-outline-primary btn-sm ms-4">EDIT</a>
	                       </td>`;
	               if (item.approvalYN === 'Y') {
	                   html += `
	                           <td>
	                               승인완료
	                           </td>
	                           `;
	               } else {        
	                   html += `
	                            <td class="d-flex align-items-center justify-content-center">
	                               <div>
	                                   <div class="form-check form-check-primary form-check-inline me-2">
	                                   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                                       <input name="modifyTarget[]" class="checkbox" type="checkbox" value="` + item.empNo + " " + item.startTime + `">
	                                       <label class="form-check-label" for="modifyTarget"></label>
	                                   </div>
	                                   <a id="modifyApprovalYN" type="button" href="attendance/modifyApprovalYN?target=` + item.empNo + "/" + startTime + `" class="btn btn-hover btn-outline-primary btn-sm me-4">승인하기</a>
	                               </div>
	                           </td>`;
	               }
	               html += "</tr>";
	
	           });
	               $("#deptAttendancies").append(html);
	            
	           initDataTable();
	       }).fail(function() {
	           console.log("showAttendanceList error");
	       });
	   }
	</script>
	<!-- 부서원 근태관련 ajax 호출 끝 -->

	<!-- 부서원 휴가관련 ajax 호출 시작 -->
	<script>
	   // 부서원 휴가 신청서 리스트 
	   function showLeaveReqList() {
	       $.ajax({
	           url: "/department/leaves/"+"${depNo}/"+$(".setYearAndMonth").val(),
	           method: 'GET',
	       }).done(function(result) {
	           // 기존 DataTable 인스턴스, <tbody> 데이터 삭제
	           destroyDataTable(); 
	           $("#deptLeavesReq").empty();
	           let html = "";
	          
	           $(result).each(function(index, item) {
	               const startTime = item.startTime.replace(" ", "/");
	               
	               html += `"<tr role="row" class="text-center">"`;
	               html += `
	                       <td>` + item.empName + `</td>
	                       <td>` + item.role + `</td>
	                       <td class="sorting_01">` + item.startTime + `</td>
	                       <td>` + item.endTime + `</td>
	                       <td>` + item.approvalState + `</td>
	                       <td><a href=/draft/detail/vacation/` + item.draNo + ` class="btn btn-hover btn-outline-primary btn-sm ms-4">상세보기</a>`;
	               html += "</tr>";
	
	           });
	           $("#deptLeavesReq").append(html);
	           initDataTable();
	       }).fail(function() {
	           console.log("showLeaveReqList ajax error");
	       });
	   	}
	   
	// 회사 유급휴가 사용률
	   function showCompanyLeaveUsageRate() {
		   $.ajax({
	           url: "/company/leave/UsageRate",
	           method: 'GET',
	       }).done(function(result) {
	    	   var companyUsageRateHtml = `<span class="ms-3">`+ result.toFixed(2) +`</span>`
	       	   $("#companyLeaveUsageRate").append(companyUsageRateHtml);
	    	   $("#companyLeaveUsageRateBar").css("width", result+"%");
	       }).fail(function() {
	    	  console.log("showCompanyLeaveUsageRate ajax fail"); 
	       });
		}
	
	// 부서원 유급휴가 사용률	
	   function showDeptLeaveUsageRate() {
		   $.ajax({
	           url: "/department/leave/UsageRate/" + "${depNo}",
	           method: 'GET',
	       }).done(function(result) {
	    	   var deptUsageRateHtml = `<span class="ms-3">`+ result.toFixed(2) +`</span>`
	       	   $("#deptLeaveUsageRate").append(deptUsageRateHtml);
	    	   $("#deptLeaveUsageRateBar").css("width", result+"%");
	       }).fail(function() {
	    	  console.log("showDeptLeaveUsageRate ajax fail"); 
	       });
		}
	// 부서원 연차 요약 및 사용량 리스트
		function showDeptLeaveUsageRateList() {
			destroyDataTable(); 
			$.ajax({
				url: "/department/leaves/information/" + "${depNo}",
				method: 'GET',
			}).done(function(result) {
				let deptLeaveUsageRateListHtml = "";
				
				$(result).each(function(index, item) {					
					deptLeaveUsageRateListHtml += `<tr role="row" class="text-center">`;
					deptLeaveUsageRateListHtml += `	  <td class="sorting_01">` + item.empName + `</td>
								                      <td>` + item.role + `</td>
								                      <td>` + item.totalLeave + `</td>
								                      <td>` + item.usedLeave + `</td>
								                      <td class="d-flex justify-content-center align-items-center">
	                                                   <span class="text-dark me-2">` + item.leaveUsageRate.toFixed(2) + `%</span>
									                      <div class="progress br-30 progress-xl text-center" style="min-height: 30px; min-width: 200px">
					                                           <div class="progress-bar bg-info" role="progressbar" style="min-height: 30px; width:` + item.leaveUsageRate + `%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
					                                               <div class="progress-title">
					                                                   <span></span>
					                                               </div>
					                                           </div>
					                                      </div>
								                      </td>`;
                    deptLeaveUsageRateListHtml += `</tr>`;
				});
				
				$("#deptLeaveUsageRateList").append(deptLeaveUsageRateListHtml);
				initDataTable();
			}).fail(function() {
				console.log("showDeptLeaveUsageRateList ajax fail");
			});
		}
	
		function showManageDeptLeaveList() {
			destroyDataTable(); 
			$.ajax({
				url: "/department/leaves/information/" + "${depNo}",
				method: 'GET',
			}).done(function(result) {
				let manageDeptLeaveHtml = "";
				
				$(result).each(function(index, item) {					                    
                    manageDeptLeaveHtml += `<tr role="row" class="text-center">`;
                    manageDeptLeaveHtml += `	<td class="sorting_01">` + item.empName + `</td>
						                        <td>` + item.role + `</td>
						                        <td>` + item.yearsOfService + `년(입사일 : ` + item.joinDate + `)</td>
						                        <td>` + item.totalLeave + `일(조정 : ` + item.modifiedLeave + `일)</td>
					                        	<td><a href=""` + item.empNo + ` class="btn btn-hover btn-outline-primary btn-sm ms-4">연차 조정</a>`;
                    manageDeptLeaveHtml += `</tr>`;
				});
				
				$("#manageDeptLeaveList").append(manageDeptLeaveHtml);
				initDataTable();
			}).fail(function() {
				console.log("showDeptLeaveUsageRateList ajax fail");
			});
		}
	   
	</script>
	<!-- 부서원 휴가관련 ajax 호출 끝 -->
	
	<!-- 부서원 출장관련 ajax 호출 시작 -->
	<script>
		function showBusinessTripReqList() {
			$.ajax({
				url: "/department/businessTrips/"+"${depNo}/"+$(".setYearAndMonth").val(),
				method: 'GET',
			}).done(function(result) {
				destroyDataTable();
				$("#deptBusinessTripReqList").empty();
	            let BusinessTriphtml = "";
	            
	            $(result).each(function(index, item) {
	         	   BusinessTriphtml += `"<tr role="row" class="text-center">"`;
	         	   BusinessTriphtml += `   <td>` + item.empName + `</td>
	         	   						   <td>` + item.role + `</td>
	         	   						   <td  class="sorting_01">` + item.startTime + `</td>
			 		                       <td>` + item.endTime + `</td>
			 		                       <td>` + item.place + `</td>
			 		                       <td>` + item.approvalState + `</td>
			 		                       <td><a href=/draft/detail/businessTrip/` + item.draNo + ` class="btn btn-hover btn-outline-primary btn-sm ms-4">상세보기</a>`;
	               BusinessTriphtml += "</tr>";
	            
	            });
	            
	            $("#deptBusinessTripReqList").append(BusinessTriphtml);
				
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