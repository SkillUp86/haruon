<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
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
    <title>자유게시판</title>
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
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
                                </a>
                                <div class="d-flex breadcrumb-content">
                                    <div class="page-header">

                                        <div class="page-title">
                                        </div>
                        
                                        <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#">게시판</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">자유</li>
                                            </ol>
                                        </nav>
                        
                                    </div>
                                </div>
                            </header>
                        </div>
                    </div>
                    <!--  END BREADCRUMBS  -->
                        
                    <div class="account-settings-container layout-top-spacing">
                        <div class="account-content">
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <h2>자유 게시판</h2>
                                    
                                    <div class="simple-tab">
										<!-- 탭 title -->
	                                    <ul class="nav nav-tabs d-flex justify-content-between" id="pills-tab" role="tablist">
	                                    	<div class="d-flex">
	                                    		<li class="nav-item" role="presentation">
	                                            	<button class="nav-link active" id="전체-tab" data-bs-toggle="tab" data-bs-target="#전체-tab-pane" type="button" role="tab" aria-controls="#전체-tab-pane" aria-selected="true">전체</button>
	                                            </li>
		                                    	<c:forEach var="ct" items="${categoryList}">
		                                            <li class="nav-item" role="presentation">
		                                            	<button class="nav-link" id="tab${ct.catNo}" data-bs-toggle="tab" data-bs-target="#${ct.catName}-tab-pane" type="button" role="tab" aria-controls="#${ct.catName}-tab-pane" aria-selected="false">${ct.catName}</button>
		                                            </li>
		                                        </c:forEach>
		                                	</div>
		                                	<span style="text-align: right;">
		                                        <a class="btn btn-secondary" id="insertBoard" href="${pageContext.request.contextPath}/board/insert">
	                                       			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
	                                       			<line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg> 글쓰기
	                                       		</a>
	                                       	</span>
	                                    </ul>
	                                    <!-- END 탭 title -->
                                
			                            <div class="tab-content" id="tabContent">
			                                <!-- 탭1 - 전체 -->
			                                <div class="tab-pane fade show active" id="전체-tab-pane" role="tabpanel" aria-labelledby="전체-tab" tabindex="0">
		                                    	<div class="widget-content widget-content-area br-8">
		                                    	
			                                        <table id="board-list" class="table dt-table-hover" style="width:100%">
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
			                                
			                                <!-- 탭2 - 인기글 --> <!-- 추천수 10개 이상 -->
			                                
			                                <!-- 탭3 ~ -->
			                                <c:forEach var="ct" items="${categoryList}">
            									<c:if test="${ct.catNo != 1}"> <!-- 공지(catNo=1) 제외 -->
	            									<div class="tab-pane fade" id="${ct.catName}-tab-pane" role="tabpanel" aria-labelledby="tab${ct.catNo}" tabindex="0">
	                
						                                <div class="widget-content widget-content-area br-8">    
												            <table id="${ct.catName}-board-list" class="table dt-table-hover" style="width:100%">
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
                           			</div> <!-- END #simple-tab -->
                            	</div>
                        	</div>
                   	 	</div>
                </div>

            </div>
			</div>
            <!--  BEGIN FOOTER  -->
            <div class="footer-wrapper">
                <div class="footer-section f-section-1">
                    <p class="">Copyright © <span class="dynamic-year">2022</span> <a target="_blank" href="https://designreset.com/cork-admin/">DesignReset</a>, All rights reserved.</p>
                </div>
                <div class="footer-section f-section-2">
                    <p class="">Coded with <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></p>
                </div>
            </div>
            <!--  END FOOTER  -->
            
        </div>
        <!--  END CONTENT AREA  -->
    </div>
    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <script src="../src/plugins/src/global/vendors.min.js"></script>
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <script src="../src/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../src/plugins/src/table/datatable/datatables.js"></script>
    <script>
		$('#board-list').DataTable({
			"dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
	        "<'table-responsive'tr>" +
	        "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
	            "oLanguage": {
	                "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
	                "sInfo": "Showing page _PAGE_ of _PAGES_",
	                "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
	                "sSearchPlaceholder": "Search...",
	               "sLengthMenu": "Results :  _MENU_",
	            },
	            "stripeClasses": [],
	            "lengthMenu": [7, 10, 20, 50],
	            "pageLength": 10 
	        });
    </script>
    <!-- END PAGE LEVEL SCRIPTS --> 
    
    <script>
	    $(document).ready(function() {
	        // 기본적으로 전체 탭의 데이터를 로드
	        tabData('전체');
	
	        // 탭 클릭 이벤트
	        $('#pills-tab button[data-bs-toggle="tab"]').click(function() {
	            let buttonId = $(this).attr('id'); // 현재 클릭된 버튼의 ID
	            let tabDataType;
	
	            // tabDataType을 설정
	            if (buttonId === '전체-tab') {
	                tabDataType = '전체';
	            } else {
	                tabDataType = buttonId.replace('tab', ''); // tabDataType을 버튼 ID에서 'tab'을 제거한 값으로 설정
	            }
	
	            // 해당 탭의 데이터를 로드
	            tabData(tabDataType);
	        });
	
	        function tabData(tabData) {
	            let url; 
	            if (tabData === '전체') {
	                url = '/board';
	            } else {
	                let catNo = tabData.replace('tab', '').trim();
	                console.log(catNo);
	                url = `/board/byCategory/`+catNo; // 카테고리별 게시글을 가져오는 URL
	                console.log(url);
	            }
	
	            fetch(url)
	                .then(response => response.json())
	                .then(data => {
	                    let tbody;
	                    if (tabData === '전체') {
	                        tbody = $('#board-list tbody'); // 전체 탭의 tbody
	                    } else {
	                        tbody = $(`#${tabData}-board-list tbody`); // 카테고리 탭의 tbody
	                    }
	
	                    tbody.empty(); // 기존 데이터 초기화
	
	                    data.forEach(item => {
	                    	console.log(item)
	                        let row = $('<tr></tr>');
	                        row.append($('<td></td>').text(item.boaNo));
	                        row.append($('<td></td>').html(`[${item.catName}] <a href="/board/${item.boaNo}">${item.title}</a>`));
	                        row.append($('<td></td>').text(item.ename));
	                        row.append($('<td></td>').text(item.createDate));
	                        row.append($('<td></td>').text(item.viewCnt));
	                        row.append($('<td></td>').text(item.countLike));
	
	                        tbody.append(row); // 새로운 행 추가
	                    });
	                })
	                .catch(error => console.error('Error loading data:', error));
	        }
	    });
	</script> 
</body>
</html>