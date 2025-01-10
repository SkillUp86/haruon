<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
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
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/apps/contacts.css" rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/apps/contacts.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->    
    
    <!-- 페이지 제목 입력칸 -->
    <title>교육 조회</title>
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
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
                                        <line x1="3" y1="12" x2="21" y2="12"></line>
                                        <line x1="3" y1="6" x2="21" y2="6"></line>
                                        <line x1="3" y1="18" x2="21" y2="18"></line>
                                    </svg>
                                </a>
                                <div class="d-flex breadcrumb-content">
                                    <div class="page-header">
                                        <div class="page-title">
                                        </div>
                                        <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                            	<!-- 여기도 페이지 마다 이름 바꿔줘야 합니다 -->
                                                <li class="breadcrumb-item"><a href="#">Franchises</a></li>
                                                <!-- 여기도 페이지 마다 이름 바꿔줘야 합니다!!!!!!!!!!!!!!!!! -->
                                                <li class="breadcrumb-item active" aria-current="page">Course List</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </header>
                        </div>
                    </div>
                    <!--  END BREADCRUMBS  -->
                
                <!-- 메인컨텐츠 입력칸 -->
                <div class="row layout-spacing layout-top-spacing" id="cancel-row">
                    <div class="col-lg-12">
                        <div class="widget-content searchable-container list">

                            <div class="row">
                                <div class="col-xl-4 col-lg-5 col-md-5 col-sm-7 filtered-list-search layout-spacing align-self-center">
                                	<a href="${pageContext.request.contextPath}/franchises/courses/insert" class="btn">+ 등록</a>
                                </div>
                            </div>

                            <table class="table text-center" id="board-list">
							    <thead>
							        <tr style="writing-mode: horizontal-tb; white-space: nowrap;">
							            <th>번호</th>
							            <th>교육일정</th>
							            <th>장소</th>
							            <th>제목</th>
							            <th>설명</th>
							            <th>수용인원</th>
							        </tr>
								</thead>
							    <tbody>
							        <c:forEach items="${courseList}" var="cl">
							            <tr>
							                <td>${cl.eduNo}</td>
							                <td>${cl.eduDate}</td>
							                <td>${cl.place}</td>
							                <td>
							                	<a href="${pageContext.request.contextPath}/franchises/courses?eduNo=${cl.eduNo}">
							                		${cl.title}
							                	</a>	
							                </td>
							                <td>${cl.content}</td>
							                <td>${cl.capacity}</td>
							            </tr>
							        </c:forEach>
							    </tbody>
							</table>
                        </div>
                    </div>
                
	                <!-- 페이징 -->
	                <nav>
	                    <ul class="pagination">
	                        <c:forEach begin="1" end="${lastPage}" var="page">
	                            <li class="page-item ${page == currentPage ? 'active' : ''}">
	                                <a class="page-link" href="franchises?page=${page}">${page}</a>
	                            </li>
	                        </c:forEach>
	                    </ul>
	                </nav>
                                
                </div>
                <!-- 메인컨텐츠 END -->
				</div>
			</div>
		</div>
	</div>
            
		        <!--  BEGIN FOOTER  -->
		        <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
		        <!--  END FOOTER  -->
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
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/jquery-ui/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/apps/contact.js"></script>
	
	<script src="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.js"></script>
    <script>
      $('#board-list').DataTable({
         "dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
           "<'table-responsive'tr>" +
           "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
               "oLanguage": {
                   "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
                   "sInfo": "Showing page _PAGE_ of _PAGES_",
                   "sSearchPlaceholder": "Search",
                   "sLengthMenu": "Row : _MENU_",
               },
               "stripeClasses": [],
               "lengthMenu": [5, 10, 20, 50],
               "pageLength": 10 
      });
      
    </script>

	<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>