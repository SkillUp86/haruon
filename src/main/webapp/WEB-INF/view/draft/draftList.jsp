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
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" type="text/css" href="../src/plugins/src/table/datatable/datatables.css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/table/datatable/dt-global_style.css">
    <!--  END CUSTOM STYLE FILE  -->
        
    <!-- 페이지 제목 입력칸 -->
    <title>Haruon | 내 문서함</title>
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
                                                <li class="breadcrumb-item"><a href="#">내문서함</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">기안함</li>
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
                
                <div class="row layout-top-spacing">
                    <h3>내 문서함</h3>
                    <div class="col-xl-12 col-lg-12 col-sm-12 mt-2  layout-spacing">
                        <div class="simple-tab">

                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="draft-tab" data-bs-toggle="tab" data-bs-target="#draft-tab-pane" type="button" role="tab" aria-controls="draft-tab-pane" aria-selected="true">기안함</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="approval-tab" data-bs-toggle="tab" data-bs-target="#approval-tab-pane" type="button" role="tab" aria-controls="approval-tab-pane" aria-selected="false">결재함</button>
                                </li>
                            </ul>
                            <div class="widget-content widget-content-area br-8">
                                <table id="zero-config" class="table dt-table-hover" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>문서번호</th>
                                            <th class=" dt-no-sorting">문서양식</th>
                                            <th class=" dt-no-sorting">제목</th>
                                            <th class=" dt-no-sorting">기안날짜</th>
                                            <th class=" dt-no-sorting">결재상태</th>
                                            <th class="text-center dt-no-sorting" >이동</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                </table>
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
        $('#zero-config').DataTable({
            "dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
        "<'table-responsive'tr>" +
        "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
            "oLanguage": {
                "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
                "sInfo": "문서함",
                "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
                "sSearchPlaceholder": "Search...",
               "sLengthMenu": "Results :  _MENU_",
            },
            "stripeClasses": [],
            "lengthMenu": [7, 10, 20],
            "pageLength": 10 
        });
    </script>
    <script>
        function tabData(empNo, tabData) {
            let url = (tabData === 'draft') ? `/drafts/`+empNo : `/approvals/`+empNo;

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    let tbody = $('#zero-config tbody');
                    tbody.empty();

                    data.forEach(item => {
                        let row = $('<tr></tr>');
                        row.append($('<td></td>').text(item.draNo));
                        row.append($('<td></td>').text(item.draftType));
                        row.append($('<td></td>').text(item.title));
                        row.append($('<td></td>').text(item.createDate));
                        row.append($('<td></td>').text(item.approvalState));

                        let actionCell = $('<td class="text-center"></td>');
                        let button = $('<button class="btn btn-primary">이동</button>')
                            .click(() => window.location.href = `/draft/`+item.draNo);
                        actionCell.append(button);

                        row.append(actionCell);
                        tbody.append(row);
                    });

                })
                .catch(error => console.error(error));
            
        }

        $('#approval-tab').click(function(){
            let empNo = ${sessionScope.loginEmpNo}
            tabData(empNo, 'approval')
        });

        $('#draft-tab').click(function () {
            let empNo = ${sessionScope.loginEmpNo}
            tabData(empNo,'draft')
        });

        let empNo = ${sessionScope.loginEmpNo};
        window.onload = () =>
    {
        tabData(empNo,'draft');
    }
    </script>
    <!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>