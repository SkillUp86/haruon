<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
	    <title>HARUON | 근태관리 </title>
	    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico"/>
	    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
	    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
	    <!-- BEGIN GLOBAL MANDATORY STYLES -->
	    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
	    <!-- END GLOBAL MANDATORY STYLES -->
	
	    <!-- BEGIN PAGE LEVEL STYLES -->
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/dt-global_style.css">
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
	                                                <li class="breadcrumb-item"><a href="#">근태관리</a></li>
	                                                <li class="breadcrumb-item active" aria-current="page">부서근태</li>
	                                            </ol>
	                                        </nav>
	                        
	                                    </div>
	                                </div>
	                            </header>
	                        </div>
	                    </div>
	                    <!--  END BREADCRUMBS  -->
	                    
	                    <div class="row layout-top-spacing">
	                    <h2 class="mt-3 mb-3">근태관리(부서)</h2>
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
												<div class="d-flex align-items-center" style="max-height : 45px;">                                        	
													<div id="alertbox"></div>
		                                            <div class="btn-group" role="group">
		                                                <button id="selectAllBtn" type="button" class="btn btn-hover btn-primary">전체 선택</button>    
		                                                <button id="deleteAllBtn" type="button" class="btn btn-hover btn-primary">선택 해제</button>
		                                                <button id="approvalOnCheckedBtn" type="button" class="btn btn-hover btn-primary bs-popover" data-bs-container="body"  data-bs-placement="top">선택 승인</button>
	                                                </div>
	                                           	</div>
	                                        </div>  
	                                        <div class="widget-content widget-content-area br-8">  
	                                            <form class="selectFormForModApproval" method="post" action="${pageContext.request.contextPath}/attendance/modify/approvalYN">
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
                <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
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
		        // 근태상태를 업데이트를 한 상태라면 메세지 띄우기
		        if ("${updateResultCode}") {
		        	if("${updateResultCode}" == "success") {
		        		Swal.fire({
			        		icon: 'success',
			                title: "${modifyResultMsg}",
		        		});
		        	} else {
			        	Swal.fire({
				            icon: "error", 
				            title: "${modifyResultMsg}", // 서버에서 전달된 메시지
			        	});
		        	}
	    		}
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
			   $("#alertbox").empty();
			   let alertHtml = "";
		       if($('input:checkbox:checked').length < 1) {
		    	   alertHtml = `<div class="alert alert-arrow-left alert-icon-left alert-light-primary" role="alert">
								    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
								    행을 하나 이상 선택해주세요.
								</div>`;
				   $("#alertbox").append(alertHtml);
				   $("#selectBtnGroup").append(alertHtml);
				   return;
		       } 
		    	   		
	       		// 선택한 근태행이 1개 이상이라면 /attendance/modifyApprovalYN 로 이동
	    	   $(".selectFormForModApproval").submit();
	       });
	   </script>
  		<!-- 전체선택/전체해제/선택승인 버튼 기능 끝-->
  		
  		<!-- 동적으로 만들어진 모달창 id 추적 및 '근태상태' 변경 되도록 이벤트 리스너 적용 시작 -->
	   <script>	   
	   	   // 모달 버튼 
		   document.addEventListener('click', function(event) {
			    // 클릭된 대상이 특정 ID 패턴과 일치하는지 확인
			    if (event.target && event.target.id.startsWith('updateModal')) {
			        console.log('모달 열기 버튼 클릭', event.target.id);
			        let targetId = event.target.id.replace('updateModal','');
			    }
			});
		   // 폼 제출
		   document.addEventListener('click', function(event) {
			    // 클릭된 대상이 특정 ID 패턴과 일치하는지 확인
			    if (event.target && event.target.id.startsWith('updateModalBtn')) {
			        console.log('수정 버튼 클릭', event.target.id);
			        let targetId = event.target.id.replace('updateModalBtn','');
			        let formId = 'updateModalForm' + targetId;
			        // 원하는 동작 실행
			        $("#" + formId).submit();
			    }
			});
		</script>
		<!-- 동적으로 만들어진 모달창 id 추적 및 '근태상태' 변경 이벤트 리스너 적용 끝 -->
		
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
		           let checkBoxNumber = 0;
		           $(result).each(function(index, item) {
		               const startTime = item.startTime.replace(" ", "/");
		               checkBoxNumber++;
		               html += `"<tr role="row" class="text-center">"`;
		               html += `
		                       <td class="sorting_01">` + item.startTime.substr(0,10) + `</td>
		                       <td>` + item.location + `</td>
		                       <td>` + item.empName + `</td>
		                       <td>` + (item.state === "결근" && item.startTime.substr(11) == "23:59:59"?  "미등록" : (item.state === "연차"? "미등록": item.startTime.substr(11))) + `</td>
		                       <td>` + (item.state === "결근" && item.endTime.substr(11) == "23:59:59"?  "미등록" : (item.state === "연차"? "미등록": item.endTime.substr(11))) + `</td>
		                       <td>` + (item.state == null? "미지정" : item.state) + ``;
		               if (item.approvalYN === 'Y') {
		                   html += `
		                   		   </td>
		                           <td>
		                               승인완료
		                           </td>
		                           `;
		               } else {        
		                   html += `<div class="btn-group  mb-2 me-4" role="group">
									    <button id="selectState" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">수정<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></button>
									    <div class="dropdown-menu" aria-labelledby="selectState">
									        <a href="/attendance/modify/state?modifyTarget=` + item.empNo + " " + item.startTime + `&state=B01" class="modifyStateBtn dropdown-item btn btn-hover btn-outline-primary btn-sm">정상근무</a>
									        <a href="/attendance/modify/state?modifyTarget=` + item.empNo + " " + item.startTime + `&state=B02" class="modifyStateBtn dropdown-item btn btn-hover btn-outline-primary btn-sm">연차</a>
									        <a href="/attendance/modify/state?modifyTarget=` + item.empNo + " " + item.startTime + `&state=B03" class="modifyStateBtn dropdown-item btn btn-hover btn-outline-primary btn-sm">반차</a>
									        <a href="/attendance/modify/state?modifyTarget=` + item.empNo + " " + item.startTime + `&state=B04" class="modifyStateBtn dropdown-item btn btn-hover btn-outline-primary btn-sm">결근</a>
									        <a href="/attendance/modify/state?modifyTarget=` + item.empNo + " " + item.startTime + `&state=B05" class="modifyStateBtn dropdown-item btn btn-hover btn-outline-primary btn-sm">병가</a>
									        <a href="/attendance/modify/state?modifyTarget=` + item.empNo + " " + item.startTime + `&state=B06" class="modifyStateBtn dropdown-item btn btn-hover btn-outline-primary btn-sm">조퇴및지각</a>
									        <a href="/attendance/modify/state?modifyTarget=` + item.empNo + " " + item.startTime + `&state=B07" class="modifyStateBtn dropdown-item btn btn-hover btn-outline-primary btn-sm">공가</a>
									    </div>
									</div>
		                   		</td>
	                            <td class="d-flex justify-content-center">
	                               <div>
	                                   <div class="form-check form-check-primary form-check-inline">
	                                       <input name="modifyTarget[]" id="modifyTarget` + checkBoxNumber + `" class="btn-check" type="checkbox" value="` + item.empNo + " " + item.startTime + ` autocomplete="off"">
	                                       <label class="btn btn-outline-primary" for="modifyTarget` + checkBoxNumber + `">선택</label><br>
	                                   </div>
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
		                       <td><a href=/draft/C04/detail/` + item.draNo + ` class="btn btn-hover btn-outline-primary btn-sm ms-4">상세보기</a>`;

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
		    	   $("#companyLeaveUsageRate").empty();
		    	   var companyUsageRateHtml = `<span class="ms-3">`+ result.toFixed(2) +`</span>`
		       	   $("#companyLeaveUsageRate").append(companyUsageRateHtml);
		    	   $("#companyLeaveUsageRateBar").css("width", result+"%");
		       }).fail(function() {
		    	  console.log("showCompanyLeaveUsageRate ajax fail"); 
		       });
			}
		
			// 부서원 유급휴가 평균 사용률	
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
   
		</script>
		<script>
			// 부서원 연차 요약 및 사용량 리스트
			function showDeptLeaveUsageRateList() {
				destroyDataTable(); 
				$.ajax({
					url: "/department/leaves/information/" + "${depNo}",
					method: 'GET',
				}).done(function(result) {
		    	   destroyDataTable();
					let deptLeaveUsageRateListHtml = "";
					$("#deptLeaveUsageRateList").empty();
					
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
					destroyDataTable();
					let manageDeptLeaveHtml = "";
					$("#manageDeptLeaveList").empty();
					
					$(result).each(function(index, item) {					                    
	                    manageDeptLeaveHtml += `<tr role="row" class="text-center">`;
	                    manageDeptLeaveHtml += `	<td class="sorting_01">` + item.empName + `</td>
							                        <td>` + item.role + `</td>
							                        <td>` + item.yearsOfService + `년(입사일 : ` + item.joinDate + `)</td>
							                        <td>` + item.totalLeave + `일(조정 : ` + item.modifiedLeave + `일)</td>
							                        <td>
								                        <button type="button" class="btn btn-primary mr-2 _effect--ripple waves-effect waves-light" data-bs-toggle="modal" data-bs-target="#updateModal`+item.empNo+`">
								                            연차 수정
								                        </button>
								                        <div class="modal fade" id="updateModal`+item.empNo+`" tabindex="-1" role="dialog" aria-labelledby="updateModal`+item.empNo+`Label" aria-hidden="true">
								                            <div class="modal-dialog" role="document">
								                                <div class="modal-content">
								                                    <div class="modal-header">
								                                        <h5 class="modal-title" id="updateModal`+item.empNo+`Label">연차 조정</h5>
								                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
								                                            <svg> ... </svg>
								                                        </button>
								                                    </div>
								                                    <div class="modal-body">
								                                        <p class="modal-text">
								                                            <form id="updateModalForm`+item.empNo+`" method="post" action="/employee/modify/totalLeave">
								                                                <input type="hidden" name="empNo" value="` + item.empNo + `">
								                                                <div class="input-group mb-3">
								                                                    <span class="input-group-text" id="current">현재 연차 수</span>
								                                                    <input type="text" placeholder="` + item.totalLeave + `" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="current" readonly>
								                                                </div>
								                                                <div class="input-group mb-3">
								                                                    <span class="input-group-text" id="updated">조정 후 연차</span>
								                                                    <input name="totalLeave" type="number" class="form-control" placeholder="" aria-label="Username" aria-describedby="updated">
								                                                </div>
								                                            </form>
								                                        </p>
								                                    </div>
								                                    <div class="modal-footer">
								                                        <button class="btn btn btn-light-dark" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i>취소</button>
								                                        <button id="updateModalBtn` + item.empNo + `" class="btn btn btn-light-dark"><i class="flaticon-cancel-12"></i>연차 조정</button>
								                                    </div>
								                                </div>
								                            </div>
								                        </div>
								                    </td>`;
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
				 		                       <td><a href=/draft/C02/detail/` + item.draNo + ` class="btn btn-hover btn-outline-primary btn-sm ms-4">상세보기</a>`;
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