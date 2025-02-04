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

	<!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="${pageContext.request.contextPath}/src/plugins/src/animate/animate.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->

    <!-- BEGIN THEME GLOBAL STYLES -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.css">
    
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/plugins/css/light/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->

    <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/custom_dt_custom.css">
    <!-- END PAGE LEVEL CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/carousel.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/tabs.css" rel="stylesheet" type="text/css">
    <!--  END CUSTOM STYLE FILE  -->
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <!-- 페이지 제목 입력칸 -->
    <title>HARUON | 회사 정보</title>
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
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
                                </a>
                                <div class="d-flex breadcrumb-content">
                                    <div class="page-header">

                                        <div class="page-title">
                                        </div>
                        
                                        <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#">조직도</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">회사</li>
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
							<div class="card row mb-3">
								<div class="widget-content widget-content-area br-8">
									<h2 class="mt-3 mb-3">&nbsp; 회사 정보</h2>
									<div class="container" style="margin-top: 50px; margin-bottom: 300px; width: 100%;">

										<div class="container col-xl-6">
											<div class="d-flex align-items-center mb-5" style="display: flex; justify-content: center;">
												<img src="${pageContext.request.contextPath}/src/assets/img/logo.svg" style="width: 50px;height: auto;">
												<h4 class="mb-0 ms-3">${c.comName}</h4>
											</div>

											<div class="form-group row mb-3">
												<label class="col-sm-2 col-form-label col-form-label-md">회사명</label>
												<div class="col-sm-9">
													<input type="text" class="form-control form-control-md" id="comName" placeholder="Business Name" value="${c.comName}" readonly>
												</div>
											</div>
											<div class="form-group row mb-3">
												<label class="col-sm-2 col-form-label col-form-label-md">주소</label>
												<div class="col-sm-9">
													<input type="text" class="form-control form-control-md" id="comName" placeholder="Address" value="${c.address}" readonly>
												</div>
											</div>
											<div class="form-group row mb-3">
												<label class="col-sm-2 col-form-label col-form-label-md">대표자</label>
												<div class="col-sm-9">
													<input type="text" class="form-control form-control-md" id="comName" placeholder="Leader Name" value="${c.leader}" readonly>
												</div>
											</div>
											<div class="form-group row mb-3">
												<label class="col-sm-2 col-form-label col-form-label-md">대표번호</label>
												<div class="col-sm-9">
													<input type="text" class="form-control form-control-md" id="comName" placeholder="Phone Number" value="${c.phone}" readonly>
												</div>
											</div>
											<div class="form-group row mb-3">
												<label class="col-sm-2 col-form-label col-form-label-md">이메일</label>
												<div class="col-sm-9">
													<input type="text" class="form-control form-control-md" id="comName" placeholder="Email" value="${c.email}" readonly>
												</div>
											</div>
											
											<!-- 전산과(depNo=4, System)만 회사 정보 수정 가능 -->
											<c:if test="${depNo == 4}">
												<div class="d-flex justify-content-end mb-2" style="margin-top: 30px; padding-right: 35px;">
													<a href="${pageContext.request.contextPath}/company/modify" type="button" class="btn btn-secondary btn-rounded mb-2 me-4">수정</a>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
           <!--  BEGIN FOOTER  -->
           <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
           <!--  END FOOTER  -->
            
        </div>
        <!--  END CONTENT AREA  -->
    </div>
    <!-- END MAIN CONTAINER -->
    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/highlight/highlight.pack.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/assets/js/dashboard/dash_1.js"></script>
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->

    <!-- BEGIN THEME GLOBAL STYLE -->
    <script src="${pageContext.request.contextPath}/src/assets/js/scrollspyNav.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/custom-sweetalert.js"></script>
    <!-- END THEME GLOBAL STYLE --> 
  
</body>
</html>