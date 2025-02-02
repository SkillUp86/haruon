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
                        <div class="layout-top-spacing row">
                            <h2 class="mt-3 mb-3">가맹점관리</h2>
 
                       		<!-- 가맹점 리스트 섹션 -->
                            <div class="widget-content searchable-container list card col-xl-8 col-lg-8 col-md-8 col-sm-12 col-12 layout-spacing">
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
                                <table class="zero-config table dt-table-hover" class="table dt-table-hover" style="width:100%">
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
                            
                        	<!-- 가맹점 상세 정보 수정 섹션 -->
                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12 layout-spacing">
	                        	<div class="card">
								    <div class="card-header">
								    	<div class="d-flex justify-content-between align-items-center">
									        <h3 class="card-title mt-4">정보</h3>
									        <a href="${pageContext.request.contextPath}/franchises/insert" class="btn btn-secondary h-100">
												<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#D9D9D9"><path d="M200-200h57l391-391-57-57-391 391v57Zm-80 80v-170l528-527q12-11 26.5-17t30.5-6q16 0 31 6t26 18l55 56q12 11 17.5 26t5.5 30q0 16-5.5 30.5T817-647L290-120H120Zm640-584-56-56 56 56Zm-141 85-28-29 57 57-29-28Z"/></svg>
		                                        <line x1="12" y1="5" x2="12" y2="19"></line> <line x1="5" y1="12" x2="19" y2="12"></line></svg>
		                                        수정
	                                    	</a>
                                    	</div>
								        <div class="container p-4">
								        	<div class="rounded mb-2 fs-6" style="background-color: #eaeaec; width:100%;">
								        		<ul class="p-4">
								        			<li class="fw-bold ms-4">지점명 : 지점이름</li>
								        			<li class="fw-bold ms-4">대표자명 : 김대표</li>
								        			<li class="fw-bold ms-4">직통번호 : 000-000-0000</li>
								        			<li class="fw-bold ms-4">이메일 : ab@nac</li>
								        			<li class="fw-bold ms-4">등록일자 : 2025-1-1</li>
								        		</ul>
									        	
								        	</div>
							        	</div>
							        	<h3 class="card-title">주소</h3>
							        	<div class="card-text p-4">
								        	<div class="fw-bold">주소</div>
								        	<div id="map" style="width:100%;height:250px;"></div>
							        	</div>
							        </div>
							    </div>
							</div>
	                        
	                        <!-- 전체 - 통계 섹션 -->
                            <div class="card col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing mt-5">
                            	<div class="row">
	                            	<!-- 매출액 top 5 -->
	                        	    <div class="container mt-5 w-25 col-3">
								        <h2 class="text-center mb-4 w-100">2025년 1월 매출액 TOP 3</h2>
								        <div class="row">
								            <!-- 1위 -->
								            <div class="col-6">
								            	<h5 class="text-center">상위</h5>
								                <div class="card p-3 shadow-sm">
								                    <div class="rank">🥇 1위</div>
								                    <div class="company">지점명</div>
								                    <div class="revenue">📈 매출: 매출액</div>
								                </div>
								                🥈2등🥉3등
								            </div>
								            <div class="col-6">
								            	<h5 class="text-center">하위</h5>
								                <div class="card p-3 shadow-sm mb-2">
								                    <div class="rank">🥇 1위</div>
								                    <div class="company">지점명</div>
								                    <div class="revenue">📈 매출: 매출액</div>
								                </div>
								            </div>
								        </div>
								        
									    <div class="container">
									     	<h2 class="text-center mb-4 w-100">가맹점 등록건수</h2>
		 								</div>
								    </div>
								    <!-- 전체 매출액 추이 -->
								    <div class="container col-9 mt-5">
								     	<h2 class="text-center mb-4 w-100">전년대비 매출액</h2>
	 									<canvas id="myChart" style="max-width:750px"></canvas>
	 								</div>
	 								


	 								
	                        	</div> 
	                        </div>
                        </div>
	                        
                        </div>
		                <!-- 메인컨텐츠 END -->
		                
                    </div>
                </div>
                <!--  BEGIN FOOTER  -->
                <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
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
			showFranchises();
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
		        
		    }
		});
	

	</script>
	<!-- 전체 매출액 차트 그리는 script -->
	<script>
		const xValues = [1,2,3,4,5,6,7,8,9,10,11,12];
	
		new Chart("myChart", {
		  type: "line",
		  data: {
		    labels: xValues,
		    datasets: [{
		      data: [860,1140,1060,1060,1070,1110,1330,2210,7830,2478,7830,2478],
		      borderColor: "red",
		      fill: false
		    },{
		      data: [1600,1700,1700,1900,2000,2700,4000,5000,6000,7000,7830,2478],
		      borderColor: "green",
		      fill: false
		    }]
		  },
		  options: {
		    legend: {display: false}
		  }
		});
	</script>
</body>
</html>