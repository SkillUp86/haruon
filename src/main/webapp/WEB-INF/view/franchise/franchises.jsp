<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
	    <title>HARUON | 가맹점 조회</title>
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
   	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=350f4b4439796ffe88536ec9c39e0d4d&libraries=services"></script>
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
        
        <!--  BEGIN MAIN CONTAINER 템플릿 직접 끌어와서 사용  -->
        <div class="main-container" id="container">

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
                                                    <li class="breadcrumb-item"><a href="#">가맹점</span></a></li>
                                                    <li class="breadcrumb-item"><a href="#">가맹점관리</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">가맹점리스트</li>
                                                </ol>
                                            </nav>
                                        </div>
                                    </div>
                                </header>
                            </div>
                        </div>
                        <!--  END BREADCRUMBS  -->
                
                        <!-- 메인컨텐츠 입력칸 -->
                        <!-- 가맹점 정보 시작 -->
                        <div class="layout-top-spacing">
                            <h2 class="mt-3 mb-3">가맹점관리</h2>
                        <!-- 전체 가맹점 통계 시작 -->
	                        <div id="toggleAccordion" class="no-icons accordion">
	                                <div class="card layout-spacing">
	                                    <div class="widget-content widget-content-area br-8">   
	                                        <div class="card">
	                                            <div class="card-header" id="franchiseOverviewHeader">
	                                                <section class="mb-0 mt-0">
	                                                    <div role="menu" class="collapsed d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#franchiseOverview" aria-expanded="true" aria-controls="franchiseOverview">
	                                                        <h3>
	                                                        	<span>가맹점 전체 통계</span>
	                                                        	<button class="btn btn-outline-info ms-2">
																	<span>열기</span>
																	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mouse-pointer"><path d="M3 3l7.07 16.97 2.51-7.39 7.39-2.51L3 3z"></path><path d="M13 13l6 6"></path></svg>
																	
																</button>
	                                                        </h3>
	                                                    </div>
	                                                </section>
	                                            </div>
	                                            <div id="franchiseOverview" class="collapse" aria-labelledby="franchiseOverviewHeader" data-bs-parent="#toggleAccordion">
	                                                <div class="card-body">
	                                                    <div class="row d-flex justify-content-between">
	                                                        <!-- 가맹점 운영 여부 -->
	                                                        <div class="col-3">
	                                                            <h2 class="text-center mb-4 w-100">가맹점 등록건수</h2>
	                                                            <div class="card p-3 shadow-sm fs-6">
	                                                                <div>전체 등록건수 : 100건</div>
	                                                                <div>올해 등록건수 : 50건</div>
	                                                                <div>이번달 등록건수 : 10건</div>
	                                                            </div>
	                                                            <h2 class="text-center mt-4 mb-4 w-100">가맹점 운영여부</h2>
	                                                            <div class="card p-3 shadow-sm">
	                                                                <canvas id="openYNChart" class="w-100"></canvas>
	                                                            </div>
	                                                        </div>
	                                                        <!-- 매출액 TOP 3 -->
	                                                        <div class="col-4">
	                                                            <h2 class="text-center w-100">
	                                                                <span id="setYearAndMonth"></span>
	                                                                매출액 TOP 3
	                                                            </h2>
	                                                            <div class="text-end m-3">
	                                                                <button id="setPreviousMonthBtn" type="button" class="btn btn-hover">
	                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
	                                                                <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
	                                                                </svg>
	                                                                이전달
	                                                                </button>
	                                                                <button id="setNextMonthBtn" type="button" class="btn btn-hover">
	                                                                다음달
	                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
	                                                                    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8"/>
	                                                                </svg>
	                                                                </button>
	                                                            </div>
	                                                            <div class="card h-75">
	                                                                <div class="row fs-6">
	                                                                    <!-- 상위 매출 -->
	                                                                    <div class="col-6">
	                                                                        <h5 class="text-center mt-4">상위</h5>
	                                                                        <div class="card m-3 p-3 shadow-sm" style="background-color: #eaeaec;">
	                                                                            <div>🥇 1위</div>
	                                                                            <div>지점명 : </div>
	                                                                            <div>매출: 매출액</div>
	                                                                        </div>
	                                                                        🥈2등🥉3등
	                                                                    </div>
	                                                                    <!-- 하위 매출 -->
	                                                                    <div class="col-6">
	                                                                        <h5 class="text-center mt-4">하위</h5>
	                                                                        <div class="card m-3 p-3 shadow-sm" style="background-color: #eaeaec;">
	                                                                            <div>🥇 1위</div>
	                                                                            <div>지점명 : </div>
	                                                                            <div>매출: 매출액</div>
	                                                                        </div>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                        
	                                                        <!-- 전체 매출액 추이 -->
	                                                        <div class="col-5 text-center">
	                                                            <h2 class="mb-4 w-100">전년대비 매출액</h2>
	                                                            <div class="card p-3 shadow-sms">
	                                                                <canvas id="totalRevenueChart" class="items-center" style="max-width: 1000px"></canvas>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                       		<!-- 가맹점 리스트 섹션 -->
	                       		<div class="card layout-spacing mt-2">
	                                <div class="card-header">
	                                    <h3>가맹점 정보</h3>
	                                </div>
	                     			<div class="p-2 card-title row">
			                            <div id="franchisesList" class="widget-content searchable-container list col-xl-12 col-lg-12 col-md-12 col-sm-12 
">
			                                <div class="pt-4 ps-4 d-flex justify-content-between align-item-center">
			                                	<h3>가맹점리스트</h3>
			                                    <!-- 가맹점 등록버튼 & 엑셀 다운로드 버튼 -->
			                                    <div class="h-100">
				                                    <a href="${pageContext.request.contextPath}/franchises/insert" class="btn btn-secondary" style="margin-right: 15px;">
				                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
				                                        stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
				                                        <line x1="12" y1="5" x2="12" y2="19"></line> <line x1="5" y1="12" x2="19" y2="12"></line></svg> 등록
				                                    </a>
				                                    <button class="dt-button buttons-excel buttons-html5 btn" tabindex="0" aria-controls="html5-extension">
				                                        <span>Excel</span>
				                                    </button>
			                                    </div>
			                                </div>
			                                <!-- 가맹점 리스트 테이블 -->
			                                <table class="zero-config table dt-table-hover" class="table dt-table-hover">
			                                    <thead>
			                                        <tr class="text-center">
			                                            <th>가맹점명</th>
			                                            <th>영업유무</th>
			                                            <th>
			                                                <span id="revenueTier" data-container="body" data-placement="top" data-html="true">
			                                                    매출등급
			                                                </span>
			                                            </th>
			                                            <th> 상세보기 </th>
			                                        </tr>
			                                    </thead>
			                                    <tbody id="fanchisesList">
			                                    </tbody>
			                                </table>
			                            </div>
	                            	
			                        	<!-- 가맹점 상세 정보 섹션 -->
			                            <div id="choosenFranchiseInfo" class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12 layout-spacing">
			                            
										    <div class="simple-pill p-4">
										
										        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
										            <li class="nav-item" role="presentation">
										                <button class="nav-link active" id="pills-information-icon-tab" data-bs-toggle="pill" data-bs-target="#pills-information-icon" type="button" role="tab" aria-controls="pills-information-icon" aria-selected="true">
										                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map"><polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6"></polygon><line x1="8" y1="2" x2="8" y2="18"></line><line x1="16" y1="6" x2="16" y2="22"></line></svg>
										                    가맹점 정보
										                </button>
										            </li>
										            <li class="nav-item" role="presentation">
										                <button class="nav-link" id="pills-staticstic-icon-tab" data-bs-toggle="pill" data-bs-target="#pills-staticstic-icon" type="button" role="tab" aria-controls="pills-staticstic-icon" aria-selected="false">
										                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trello"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><rect x="7" y="7" width="3" height="9"></rect><rect x="14" y="7" width="3" height="5"></rect></svg>
										                    매출통계
										                </button>
										            </li>
										       </ul>
										
										        <div class="tab-content" id="pills-tabContent">
										            <div class="tab-pane fade show active" id="pills-information-icon" role="tabpanel" aria-labelledby="pills-information-icon-tab" tabindex="0">
										                <div class="d-flex justify-content-between align-items-center">
										                    <h3>정보</h3>
										                    <a href="${pageContext.request.contextPath}/franchises/insert" class="btn btn-secondary h-100">
										                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#D9D9D9"><path d="M200-200h57l391-391-57-57-391 391v57Zm-80 80v-170l528-527q12-11 26.5-17t30.5-6q16 0 31 6t26 18l55 56q12 11 17.5 26t5.5 30q0 16-5.5 30.5T817-647L290-120H120Zm640-584-56-56 56 56Zm-141 85-28-29 57 57-29-28Z"/></svg>
										                        <line x1="12" y1="5" x2="12" y2="19"></line> <line x1="5" y1="12" x2="19" y2="12"></line></svg>
										                        수정
										                    </a>
										                </div>
										                <div class="container p-4 rounded-4 fs-5" style="background-color: #eaeaec; width:100%;">
														    <ul>
														        <li class="fw-bold ms-4">지점명 : 지점이름</li>
														        <li class="fw-bold ms-4">대표자명 : 김대표</li>
														        <li class="fw-bold ms-4">직통번호 : 000-000-0000</li>
														        <li class="fw-bold ms-4">이메일 : ab@nac</li>
														        <li class="fw-bold ms-4">등록일자 : 2025-1-1</li>
														        <li class="fw-bold ms-4">
														            <span>주소 : 서울 금천구 가산디지털2로 95 서울 금천구 가산동 550-7  (가산동)</span>
														                <div id="map" style="width:100%;height:250px;"></div>
														        </li>
														    </ul>
										                </div>
										                
										
										            </div>
										            <div class="tab-pane fade" id="pills-staticstic-icon" role="tabpanel" aria-labelledby="pills-staticstic-icon-tab" tabindex="0">
										                <h3 class="mt-4">매출</h3>
										                <div class="container p-4 rounded-4 fs-5 w-100" style="background-color: #eaeaec;">
										                        <canvas id="chosenFranchiseChart" class="items-center w-100"></canvas>
										                </div>
										            </div>
										        </div>
										    </div>
										</div>
								</div>
                            </div>
                        </div>
		                <!-- 가맹점 정보 끝 -->
		                <!-- 메인컨텐츠 END -->
                    </div>
                </div>
                <!--  BEGIN FOOTER  -->
                <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/inc/footer.jsp" />
                <!--  END FOOTER  -->
            </div>
        </div>
            
		        
        	<!--  END CONTENT AREA  -->

    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/global/vendors.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/custom.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>    
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.js"></script>

   	<!-- END PAGE LEVEL SCRIPTS -->
	<!-- franchiseSupportSupport 에서 공통 script 내용 가져오기 -->
	<jsp:include page="/WEB-INF/view/franchise/franchiseSupport.jsp"/>
	
	<!-- 페이지 입장할때 불러오는 script - 카카오 Map API 초기 설정 -->
	<script>
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		
		$(document).ready(function() {
			// 가맹점 리스트 불러오기
			showFranchises();
			
			// 가맹점 상세보기 구역 숨기기
			$("#choosenFranchiseInfo").attr("hidden", true);
			
			// 카카오맵 API 초기화 좌표(haruon 주소 위치) 설정
		    mapOption = {
		        center: new kakao.maps.LatLng(37.4783, 126.8831), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

			// 지도를 생성한다 
			var map = new kakao.maps.Map(mapContainer, mapOption); 
		
			// 지도에 마커를 생성하고 표시한다
			var marker = new kakao.maps.Marker({
			    position: new kakao.maps.LatLng(37.4783, 126.8831), // 마커의 좌표
			    map: map // 마커를 표시할 지도 객체
			});
		
			// 마커 위에 표시할 인포윈도우를 생성한다
			var infowindow = new kakao.maps.InfoWindow({
			    content : '<div style="width:150px;text-align:center;padding:6px 0;">HARUON</div>' // 인포윈도우에 표시할 내용
			});
		
			// 인포윈도우를 지도에 표시한다
			infowindow.open(map, marker);
		});
	</script>
	<!-- 매출액 TOP3 이전달/다음달 버튼 동작 -->
	<script>
		let date = new Date();
		const now = new Date();
		
		// 선택한 연/월 표시
		$("#setYearAndMonth").append(date.getFullYear() + "년 " + (date.getMonth() + 1).toString().padStart(2, '0') + "월 ");
	
		$("#setPreviousMonthBtn").click(function() {
		    console.log("이전달 클릭");
		    $("#setYearAndMonth").empty();
		    date = new Date(date.setMonth(date.getMonth() - 1));
		    $("#setYearAndMonth").append(date.getFullYear() + "년 " + (date.getMonth() + 1).toString().padStart(2, '0') + "월 ");
		    if($("#setNextMonthBtn").attr("disabled") === "disabled") {
		        $("#setNextMonthBtn").removeAttr("disabled");
		    }
		});
		
		$("#setNextMonthBtn").click(function() {
		  console.log("다음달 클릭");
		  $("#setYearAndMonth").empty();
		  date = new Date(date.setMonth(date.getMonth() + 1));
		  
		  if(!(now >= date.setMinutes(00,00,0))) {	// 1달 여유있음에도 다음달을 클릭하는 순간 date+1이 now보다 미래가 되지 않도록 분/초단위 설정 
		      date = new Date(date.setMonth(date.getMonth() - 1));
		      alert("더 이상 조회할 수 있는 달이 없습니다.");
		      $("#setNextMonthBtn").attr("disabled", "disabled");
		  }
		      $("#setYearAndMonth").append(date.getFullYear() + "년 " + (date.getMonth() + 1).toString().padStart(2, '0') + "월 ");
		});
	
	</script>
	
	<!-- 매출수준 설명 툴팁 동적바인딩 처리 -->
	<script>
		$(document).on('mouseenter', '#revenueTier', function () {
		    $(this).tooltip({
		        template: `<div class="tooltip tooltip-primary" role="tooltip">
		                        <div class="arrow"></div>
		                        <div class="tooltip-inner"></div>
		                   </div>`,
		        title: `평균 매출액 대비 매출 수준<br>
		                <strong>A등급</strong>: 5% ↑<br>
		                <strong>B등급</strong>: ±5%<br>
		                <strong>C등급</strong>: 5% ↓`,
		        html: true, // HTML 사용 가능하게 설정
		        trigger: 'hover'
		    }).tooltip('show');
		});
	</script>
	
	<!-- 가맹점 간략한 리스트 출력 -->
	<script>
		function showFranchises() {
			   $.ajax({
		           url: '/franchises/brief',
		           method: 'GET',
		       }).done(function(result) {
		    	   let fanchisesListHTML = "";

		    	   $(result).each(function(index, item) {		
					   let openYN = (item.openYn === "Y")? "<span class='badge badge-light-primary mb-2 me-4'>운영중</span>"
							   							   : "<span class='badge badge-light-dark mb-2 me-4'>휴·폐업</span>";
							   							   
		    		   fanchisesListHTML += `<tr role="row" class="text-center">
								                <td class="sorting_01">` + item.fname + `</td>
								                <td>` + openYN + `</td>
								                <td>` + item.openYn + `</td>
								                <td>
								                	<button id="fraNo` + item.fraNo + `" type="button" class="btn btn-outline-info btn-icon">
								                		<svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="#434343"><path d="M192-192v-96l72-72v168h-72Zm126 0v-222l66-66 6 6v282h-72Zm126 0v-228l72 72v156h-72Zm126 0v-186l72-72v258h-72Zm126 0v-312l72-72v384h-72ZM192-378v-102l192-192 144 144 240-240v102L528-426 384-570 192-378Z"/></svg>
							                			<span>click</span>
								                	</button>
                                           		</td>
								            </tr>`;
								            
		    	   });
		    	   $('#fanchisesList').append(fanchisesListHTML);
		    	   initDataTable();
		       }).fail(function() {
		    	  console.log("showFranchises ajax fail"); 
		       });
		}
	</script>
	
	<!-- 가맹점 상세보기 클릭시 실행되는 script -->
	<script>
	   document.addEventListener('click', function(event) {
		    // 클릭된 대상이 특정 ID 패턴과 일치하는지 확인
		    if (event.target && event.target.id.startsWith('fraNo')) {
		        let targetId = event.target.id.replace('updateModal','');	// 출력하고자 하는 가맹점 번호 추출
		        
		        // 가맹점 리스트 구역 줄이기
		        $("#franchisesList").attr("class","widget-content searchable-container list col-xl-8 col-lg-8 col-md-8 col-sm-12");
		        
		     	// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(' 서울 금천구 가산디지털2로 95 서울 금천구 가산동 550-7  (가산동)', function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">HARUON</div>'
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				}); 
				// 가맹점 상세보기 구역 숨기기
				$("#choosenFranchiseInfo").attr("hidden", false);
		        
		    }
		});
	

	</script>
	
	<!-- 전체 매출액 차트 그리는 script -->
	<script>
		const revenueChartxValues = [1,2,3,4,5,6,7,8,9,10,11,12];
	
		var totalChartTitle = ["올해", "작년"]
		const totalRevenueInThisYear = [860,1140,1060,1060,1070,1110,1330,2210,7830,2478,7830,2478];
		const totalRevenueInLastYear = [1330,2210,7830,2478,7830,2478,860,1140,1060,1060,1070,1110];

		new Chart("totalRevenueChart", {
		      type: "line",
		      data: {
		        labels: revenueChartxValues, // X축 라벨
		        datasets: [
		          {
		            label: totalChartTitle[0], // 데이터셋 제목
		            data: totalRevenueInThisYear, // Y축 데이터
		            borderColor: "red",
		            fill: false
		          },
		          {
		            label: totalChartTitle[1], // 데이터셋 제목 (두 번째 데이터)
		            data: totalRevenueInLastYear, 
		            borderColor: "green",
		            fill: false
		          }
		        ]
		      },
		      options: {
		        legend: { display: true }
		      }
		});
	</script>
	
	<!-- 전체 운영여부 파이 차트 그리는 script -->
	<script>
		var openYNChartxValues = ["운영중", "휴·폐업"];
		var openYNChartyValues = [55, 10];
		var barColors = [
		  "#2b5797",
		  "#b91d47",
		];
		
		new Chart("openYNChart", {
		  type: "pie",
		  data: {
		    labels: openYNChartxValues,
		    datasets: [{
		      backgroundColor: barColors,
		      data: openYNChartyValues
		    }]
		  },
		});
	</script>
	
	<!-- 전체 운영여부 파이 차트 그리는 script -->
	<script>
		const chosenFranchiseChartxValues = [1,2,3,4,5,6,7,8,9,10,11,12];
		var ChartTitle = ["전체", "해당가맹점"]
		const chosenFranchiseRevenue = [1330,2210,7830,2478,7830,2478,860,1140,1060,1060,1070,1110];
	
		new Chart("chosenFranchiseChart", {
		      type: "line",
		      data: {
		        labels: revenueChartxValues, // X축 라벨
		        datasets: [
		          {
		            label: ChartTitle[0], // 데이터셋 제목
		            data: totalRevenueInThisYear, // Y축 데이터
		            borderColor: "red",
		            fill: false
		          },
		          {
		            label: ChartTitle[1], // 데이터셋 제목 (두 번째 데이터)
		            data: chosenFranchiseRevenue, // Y축 데이터 (동일한 데이터 사용 중, 필요시 수정)
		            borderColor: "green",
		            fill: false
		          }
		        ]
		      },
		      options: {
		        legend: { display: true }
		      }
		});
	</script>
</body>
</html>