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

    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/dark/table/datatable/dt-global_style.css">
    <!--  END CUSTOM STYLE FILE  -->

    <style>
        #blog-list img {
            border-radius: 18px;
        }
    </style>    
    <!-- 페이지 제목 입력칸 -->
    <title>공지 게시판</title>
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
                                                <li class="breadcrumb-item"><a href="#">게시판</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">공지</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </header>
                        </div>
                    </div>
                    <!--  END BREADCRUMBS  -->
                </div>
                <!-- 메인컨텐츠 입력칸 -->
                
                <div class="account-settings-container layout-top-spacing">
	                <div class="account-content">
	                    <div class="row mb-3">
	                        <div class="col-md-12" style="background-color: white;">
	                            <h2 style="margin-top: 20px;">공지 게시판</h2>
               					
               					<c:if test="${depNo == 1}"><!-- 인사과만 글쓰기 버튼 노출 (depNo=1) -->
	               					<div style="text-align: right; margin-bottom: 5px;">
		                                <a class="btn btn-secondary" id="insertNotice" href="${pageContext.request.contextPath}/board/insertNotice">
		                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
		                                    <line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg> 글쓰기
		                                </a>
	                                 </div>
                                 </c:if>
                                 
                                <div class="widget-content widget-content-area br-8" style="margin-bottom: 20px;">
                                    <table id="noticeList" class="zero-config table dt-table-hover" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>작성일</th>
                                                <th>조회수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="n" items="${noticeList}">
                                                   <tr>
                                                    <td>${n.boaNo}</td>
                                                    <td>
                                                        <div class="d-flex justify-content-left align-items-center">
                                                            <div class="d-flex flex-column">
                                                                <span class="text-truncate fw-bold">
                                                                    <a href="${pageContext.request.contextPath}/board/${n.boaNo}">${n.title}</a>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>${n.ename}</td>
                                                    <td>${n.createDate}</td>
                                                    <td>${n.viewCnt}</td>
                                                  </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                			</div>
                		</div>
                	</div>
                </div>
                <!-- 메인컨텐츠 END -->
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

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/apex/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/dashboard/dash_1.js"></script>
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.js"></script>
    <script>
    	noticeList = $('#noticeList').DataTable({
            "dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
        "<'table-responsive'tr>" +
        "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
            "oLanguage": {
                "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', 
                    "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
                "sInfo": "Showing page _PAGE_ of _PAGES_",
                "sSearch":  '<div class="dataTables_filter"> <lable>' +
                            '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>'
                                +  '</lable> </div>', 
                "sSearchPlaceholder": "Search...",
                "sLengthMenu": "Results :  _MENU_",
            },
            "stripeClasses": [],
            "lengthMenu": [7, 10, 20, 50],
            "pageLength": 10 
        });
    </script>
    <!-- END PAGE LEVEL SCRIPTS -->  

</body>
</html>