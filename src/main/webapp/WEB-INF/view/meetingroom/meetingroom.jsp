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
    <title>회의실</title>
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
                                                <li class="breadcrumb-item"><a href="#">회의실</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">예약</li>
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
	                        <div class="col-md-12">
	                            <h2>회의실 예약</h2>
               
               					<div style="text-align: right;">
	                                <a class="btn btn-secondary" id="meetingroomList" href="${pageContext.request.contextPath}/addMeetingroom">
	                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
	                                    <line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg> 회의실 추가
	                                </a>
                                 </div>
                                 
                                <div class="widget-content widget-content-area br-8">
                                    <table id=noticeList class="zero-config table dt-table-hover" style="width:100%">
                                        <thead>
                                            <tr>
                                            	<th>회의실 이미지</th>
                                                <th>회의실이름</th>
                                                <th>회의실번호</th>
                                                <th>수용인원</th>
                                                <th>예약상태</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <c:forEach var="m" items="${meetingroomList}">
										    <tr data-availYn="${m.availYn}">
										        <td>
										            <img src="${pageContext.request.contextPath}/upload/meetingroom/${m.fileName}.${m.fileExt}" style="width: 100px; height: auto;" />
										        </td>
										        <td>
										            <div class="d-flex justify-content-left align-items-center">
										                <div class="d-flex flex-column">
										                    <span class="text-truncate fw-bold">
										                        <a href="${pageContext.request.contextPath}/modifyMeetingroom/${m.meeNo}">${m.mname}</a>
										                    </span>
										                </div>
										            </div>
										        </td>
										        <td>${m.meeNo}</td>
										        <td>${m.capacity}</td>
										        <td>${m.availYn}</td>
										        <td>
										            <div class="btn-group" role="group" aria-label="Action Buttons">
										                <!-- 예약 버튼 -->
										                <form action="${pageContext.request.contextPath}/addReservation/${m.meeNo}" method="get" style="display: inline;">
										                    <button class="btn btn-primary btn-sm reserve-btn" type="button" data-availYn="${m.availYn}">예약하기</button>
										                </form>
										                <!-- 삭제 버튼 -->
										               <form action="${pageContext.request.contextPath}/deleteMeetingroom/${m.meeNo}" method="get" style="display: inline;">
    														<button class="btn btn-danger btn-sm" type="button" onclick="confirmDelete(this)">삭제하기</button>
													   </form>
										            </div>
										        </td>
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
            "lengthMenu": [1, 3, 5, 10],
            "pageLength": 10 
        });
    
        // 모든 예약 버튼에 대해 클릭 이벤트 추가
        document.querySelectorAll('.reserve-btn').forEach(button => {
            button.addEventListener('click', function () {
                const availYn = this.getAttribute('data-availYn'); // 버튼의 예약 가능 상태 가져오기
                if (availYn === 'N') {
                    alert('이 회의실은 예약할 수 없습니다.');
                } else {
                    // 예약 가능 상태인 경우 폼 제출
                    this.closest('form').submit();
                }
            });
        });
        
        // 삭제 버튼 클릭 시 확인 다이얼로그
        function confirmDelete(button) {
            // 삭제 확인 메시지
            const confirmDelete = confirm("정말로 이 회의실을 삭제하시겠습니까?");
            
            if (confirmDelete) {
                // 사용자가 "확인"을 클릭했을 경우 폼을 제출
                button.closest('form').submit();
            }
        }
    </script>
    <!-- END PAGE LEVEL SCRIPTS -->  
</body>
</html>