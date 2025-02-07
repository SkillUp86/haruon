<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/dt-global_style.css">
    <!--  END CUSTOM STYLE FILE  -->
    
    <!-- 페이지 제목 입력칸 -->
    <title>HARUON | 자유게시판</title>
    <!-- 페이지 제목 입력칸 -->

    <style>
        #blog-list img {
            border-radius: 18px;
        }
    </style>
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
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
									<line x1="3" y1="12" x2="21" y2="12"></line> <line x1="3" y1="6" x2="21" y2="6"></line> <line x1="3" y1="18" x2="21" y2="18"></line></svg>
								</a>
								<div class="d-flex breadcrumb-content">
									<div class="page-header">
										<div class="page-title"></div>
										<nav class="breadcrumb-style-one" aria-label="breadcrumb">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="#">게시판</a></li>
												<li class="breadcrumb-item active" aria-current="page">자유 게시판</li>
											</ol>
										</nav>
									</div>
								</div>
							</header>
						</div>
					</div>
					<!--  END BREADCRUMBS  -->
					
					<!-- 메인 컨텐츠 -->
					<div class="account-settings-container layout-top-spacing">
						<div class="account-content">
							<div class="card row mb-3">
								<div class="col-md-12" style="background-color: white;">
									<h2 class="mt-3 mb-3">자유 게시판</h2>

									<div class="simple-pill" style="margin-bottom: 20px;">
										<!-- 탭 title -->
										<ul class="nav nav-pills d-flex justify-content-between" id="pills-tab" role="tablist">
											<div class="d-flex">
												<li class="nav-item" role="presentation">
													<button class="nav-link active" id="tab-전체"
														data-bs-toggle="tab" data-bs-target="#전체-tab-pane"
														type="button" role="tab" aria-controls="#전체-tab-pane" aria-selected="true">전체</button>
												</li>
												<c:forEach var="ct" items="${categoryList}">
													<c:if test="${ct.catNo != 100}">
														<li class="nav-item" role="presentation">
															<button class="nav-link" id="tab-${ct.catNo}"
																data-bs-toggle="tab" data-bs-target="#${ct.catNo}-tab-pane" type="button" role="tab" aria-controls="#${ct.catNo}-tab-pane" aria-selected="false">${ct.catName}</button>
														</li>
													</c:if>	
												</c:forEach>
											</div>
											<span style="text-align: right; margin-bottom: 5px;"> 
												<a class="btn btn-secondary" id="insertBoard" href="${pageContext.request.contextPath}/board/insert">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
														stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
	                                       			<line x1="12" y1="5" x2="12" y2="19"></line> <line x1="5" y1="12" x2="19" y2="12"></line></svg> 글쓰기
											</a>
											</span>
										</ul>
										<!-- END 탭 title -->

										<div class="tab-content" id="tabContent">
											<!-- 탭1 - 전체 -->
											<div class="tab-pane fade show active" id="전체-tab-pane" role="tabpanel" aria-labelledby="tab-전제" tabindex="0">
												<div class="widget-content widget-content-area br-8">
													<table id="board-list" class="table dt-table-hover zero-config" style="width: 100%">
														<thead>
															<tr>
																<th style="text-align: center;">번호</th>
																<th>제목</th>
																<th>작성자</th>
																<th>작성일</th>
																<th style="text-align: center;">조회수</th>
																<th style="text-align: center;">추천</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="b" items="${boardList}">
																<tr>
																	<td style="text-align: center;">${b.boaNo}</td>
																	<td>
																		<div class="d-flex justify-content-left align-items-center">
																			<div class="d-flex flex-column">
																				<span class="text-truncate fw-bold">
																					[${b.catName}] <a href="${pageContext.request.contextPath}/board/${b.boaNo}">${b.title}</a>
																					<c:if test="${b.countComment > 0}">
																				        (${b.countComment})
																				    </c:if>
																				</span>
																			</div>
																		</div>
																	</td>
																	<td>${b.ename}</td>
																	<td>${b.createDate}</td>
																	<td style="text-align: center;">${b.viewCnt}</td>
																	<td style="text-align: center;">${b.countLike}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
											<!-- END 탭1 - 전체 -->
											
											<!-- 탭2 ~ -->
											<c:forEach var="ct" items="${categoryList}">
												<c:if test="${ct.catNo != 1 || ct.catNo == 100}">
													<!-- 공지(catNo=1), 기타 제외 -->
													<div class="tab-pane fade show" id="${ct.catNo}-tab-pane" role="tabpanel" aria-labelledby="tab-${ct.catNo}" tabindex="0">

														<div class="widget-content widget-content-area br-8">
															<table id="${ct.catNo}-board-list" class="table dt-table-hover zero-config" style="width: 100%">
																<thead>
																	<tr>
																		<th style="text-align: center;">번호</th>
																		<th>제목</th>
																		<th>작성자</th>
																		<th>작성일</th>
																		<th style="text-align: center;">조회수</th>
																		<th style="text-align: center;">추천</th>
																	</tr>
																</thead>
																<tbody>
																	<!-- ajax -->
																</tbody>
															</table>
														</div>
													</div>
												</c:if>
											</c:forEach>
											<!-- END 탭 -->

										</div>
									</div><!-- END #simple-tab -->
								</div>
							</div>
						</div>
					</div><!-- END 메인 컨텐츠 -->
				</div>
			</div>
			
			<!--  BEGIN FOOTER  -->
            <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
            <!--  END FOOTER  -->
            
        </div>
        <!--  END CONTENT AREA  -->
    </div>
    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/global/vendors.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.js"></script>

    <!-- zero-config 적용/삭제 하는 함수 -->
    <script>
    	function initDataTable() {
			$('.zero-config').DataTable({
				"dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
		        	   "<'table-responsive'tr>" +
		        	   "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
	            "oLanguage": {
	                "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', 
	                				"sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
	                "sInfo": "Showing page _PAGE_ of _PAGES_",
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
    <!-- END PAGE LEVEL SCRIPTS --> 
    
    <script>
	    $(document).ready(function() {
	        // 기본적으로 전체 탭의 데이터를 로드
	        tabData('전체');
	        initDataTable();
	
	        // 탭 클릭 이벤트
	        $('#pills-tab button[data-bs-toggle="tab"]').click(function() {
	            let buttonId = $(this).attr('id'); // 현재 클릭된 버튼의 ID
	            let tabDataType;
	
	            // tabDataType을 설정
	            if (buttonId === 'tab-전체') {
	                tabDataType = '전체';
	            } else {
	                tabDataType = buttonId.replace('tab-', ''); // tabDataType을 버튼 ID에서 'tab-'을 제거한 값 = catNo
	            }
	
	            tabData(tabDataType); // 해당 탭의 데이터를 로드
	        });
	
	        function tabData(tabData) {
	            let url; 
	            if (tabData === '전체') {
	                url = '/board/list';
	            } else {
	                let catNo = tabData.replace('tab', '').trim();
	                console.log(catNo);
	                url = `/board/byCategory/`+catNo; // 카테고리별 게시글을 가져오는 URL
	                console.log(url);
	            }
	            
	            $.ajax({
	                method: 'GET',
	                url: url,
	                success: function (data) {
	                	// console.log("data: ", data);
	                	
	                    if (Array.isArray(data)) {  // data가 배열이어야함
	                        destroyDataTable(); // 이전 DataTable 인스턴스 삭제
	                        let tableId = tabData === '전체' ? 'board-list' : tabData + '-board-list'; // 테이블 ID 선택 = catNo-board-list
	                        console.log(tableId);

	                        tableId = $('#' + tableId).length == 0 ? tableId + '_wrapper' : tableId;
	                        let table = $('#' + tableId).DataTable({ // 새로운 DataTable 인스턴스 생성
	                            paging: true,
	                            destroy: true, // 기존 데이터를 파괴하고 새로 초기화
	                            "dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
	                                    "<'table-responsive'tr>" +
	                                    "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
	                            "oLanguage": {
	                                "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', 
	                                                "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
	                                "sInfo": "Showing page _PAGE_ of _PAGES_",
	                                "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
	                                "sSearchPlaceholder": "Search...",
	                                "sLengthMenu": "Results :  _MENU_",
	                                },
	                            "stripeClasses": [],
	                            "lengthMenu": [7, 10, 20, 50],
	                            "pageLength": 10 
	                        });
	                        
	                        table.clear();
	                        
	                        // 데이터 추가
	                        data.forEach(item => {
	                            console.log(item);
	                            let rowDate = [
	                                item.boaNo,
	                                `[\${item.catName}] <a href="/board/\${item.boaNo}">\${item.title}</a> \${item.countComment > 0 ? `(\${item.countComment})` : ''}`, // 댓글수 1개 이상만
	                                item.ename,
	                                new Date(item.createDate).toLocaleString(), // 날짜 형식 변환
	                                item.viewCnt,
	                                item.countLike
	                            ];
	                            table.row.add(rowDate);
	                        });
	                        // console.log(data.length);
	                        table.draw(); // 테이블 업데이트
	                    } else {
	                        console.error('Returned data is not an array:', data);
	                    }
	                },
	                error: function (xhr, status, error) {
	                    console.error(`Error: ${status}, ${error}`);
	                }
	            });
	        }
	    });
	</script> 
</body>
</html>