<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     
	<style type="text/css">
	.label-text {
	    display: flex; /* Flexbox 활성화 */
	    align-items: center; /* 수직 중앙 정렬 */
	    justify-content: center; /* 가로 중앙 정렬 */
	    width: 100px; /* 모든 라벨의 고정된 너비 */
	    text-align: center; /* 텍스트 중앙 정렬 */
	}
	</style>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
     <link rel="stylesheet" href="../src/plugins/src/filepond/filepond.min.css">
    <link rel="stylesheet" href="../src/plugins/src/filepond/FilePondPluginImagePreview.min.css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/src/tagify/tagify.css">

    <link rel="stylesheet" type="text/css" href="../src/assets/css/light/forms/switches.css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/editors/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/tagify/custom-tagify.css">
    <link href="../src/plugins/css/light/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="../src/assets/css/dark/forms/switches.css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/dark/editors/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/dark/tagify/custom-tagify.css">
    <link href="../src/plugins/css/dark/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" href="../src/assets/css/light/apps/blog-create.css">
    <link rel="stylesheet" href="../src/assets/css/dark/apps/blog-create.css">
    <!--  END CUSTOM STYLE FILE  -->
    
    <!-- 페이지 제목 입력칸 -->
    <title>결재 페이지</title>
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
                <div class="middle-content container-xxl p-3">
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
                                                <li class="breadcrumb-item"><a href="#">문서</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">전자 결재</li>
                                                <!-- 여기도 페이지 마다 이름 바꿔줘야 합니다!!!!!!!!!!!!!!!!! -->
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
                
                <h1>전자 결재</h1>
                <div class="row mb-4 layout-spacing layout-top-spacing">

                        <div class="layout-spacing layout-top-spacing">
						        <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
						            <div class="widget-content widget-content-area blog-create-section mt-4">
						                <h5 class="mb-4">결재선</h5>
						                <div class="input-group mb-4">
						                    <span class="input-group-text label-text" id="basic-addon2">기안자</span>
						                    <input type="text" class="form-control" id="basic-addon2" required="required">
						                    <span class="input-group-text label-text" id="basic-addon2">기안일자</span>
						                    <input type="date" class="form-control" id="basic-addon2" required="required">
						                </div>
						                
						                <div class="row mb-4">
						                    <div class="col-md-6">
						                        <div class="input-group">
						                            <span class="input-group-text label-text" id="mid-approver">중간결재자</span>
						                            <input type="text" class="form-control" placeholder="중간결재자 입력" aria-label="중간결재자" aria-describedby="mid-approver" required="required">
						                            <button class="btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></button>
						                        </div>
						                    </div>
						                    <div class="col-md-6">
						                        <div class="input-group">
						                            <span class="input-group-text label-text" id="final-approver">최종결재자</span>
						                            <input type="text" class="form-control" placeholder="최종결재자 입력" aria-label="최종결재자" aria-describedby="final-approver" required="required">
						                            <button class="btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></button>
						                        </div>
						                    </div>
						                </div>
						                
						                <div class="input-group mb-4">
						                    <span class="input-group-text label-text" id="reference">참조자</span>
						                    <input type="text" class="form-control" id="reference" placeholder="참조자 입력" required="required">
						                    <button class="btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></button>
						                </div>
						                <div class="input-group mb-4">
						                    <span class="input-group-text label-text" id="type">유형</span>
						                    <select type="text" class="form-control" id="reference" placeholder="참조자 입력" required="required">
					                    		<option id="">기본기안서</option>
					                    		<option id="">휴가신청서</option>
					                    		<option id="">출장신청서</option>
					                    		<option id="">매출보고서</option>
						                    </select>
						                </div>
						                
						            </div>
		                            <div class="widget-content widget-content-area blog-create-section mt-4">
										<!-- 제목 -->
						                <div class="input-group mb-4">
						                    <span class="input-group-text label-text" id="basic-addon2">제 목</span>
						                    <input type="text" class="form-control" placeholder="제목을 입력하세요" aria-label="제목" aria-describedby="basic-addon2" required="required">
						                </div>
		                                
		                                <div class="row mb-4">
		                                    <div class="row mb-4">
			                                    <div class="col-sm-12">
			                                        <div id="blog-description"></div>
			                                    </div>
			                                </div>
		
		                                </div>
		
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

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <script src="../src/assets/js/template.js""></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="../src/plugins/src/apex/apexcharts.min.js"></script>
    <script src="../src/assets/js/dashboard/dash_1.js"></script>
     <script src="../src/plugins/src/editors/quill/quill.js"></script>
    <script src="../src/plugins/src/filepond/filepond.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginFileValidateType.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginImageExifOrientation.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginImagePreview.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginImageCrop.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginImageResize.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginImageTransform.min.js"></script>
    <script src="../src/plugins/src/filepond/filepondPluginFileValidateSize.min.js"></script>

    <script src="../src/plugins/src/tagify/tagify.min.js"></script>

    <script src="../src/assets/js/apps/blog-create.js"></script>
    
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
	
</body>
</html>