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
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
    .bold-box {
        border: 3px solid #000; /* 진한 테두리 */
        background-color: #f9f9f9; /* 박스 배경색 */
        padding: 20px; /* 내용 여백 */
        margin: 10px 0; /* 위아래 여백 */
        border-radius: 5px; /* 모서리를 둥글게 (필요 시) */
        text-align: center; /* 텍스트 가운데 정렬 */
    }
	</style>

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link href="../src/plugins/src/apex/apexcharts.css" rel="stylesheet" type="text/css">
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
   <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
   <link rel="stylesheet" href="../src/plugins/src/filepond/filepond.min.css">
   <link rel="stylesheet" href="../src/plugins/src/filepond/FilePondPluginImagePreview.min.css">
   <link rel="stylesheet" type="text/css" href="../src/plugins/src/tagify/tagify.css">

   <link rel="stylesheet" type="text/css" href="../src/assets/css/light/forms/switches.css">
   <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/editors/quill/quill.snow.css">
   <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/tagify/custom-tagify.css">
   <link href="../src/plugins/css/light/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />

   <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
   
   <!--  BEGIN CUSTOM STYLE FILE  -->
   <link rel="stylesheet" href="../src/assets/css/light/apps/blog-create.css">
   <link rel="stylesheet" href="../src/assets/css/dark/apps/blog-create.css">
   <!--  END CUSTOM STYLE FILE  -->

    <!-- 페이지 제목 입력칸 -->
    <title>Haruon | 내 문서</title>
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
                                            	<!-- 여기도 페이지 마다 이름 바꿔줘야 합니다 -->
                                                <li class="breadcrumb-item"><a href="#">내문서함</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">결재</li>
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
                <div class="row mb-4 layout-spacing layout-top-spacing">
				    <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
						<div class="widget-content widget-content-area blog-create-section">
						    <div class="row mb-4">
						        <div class="col-sm-12">
						            <label>문서</label>
						            <div class="container">
								        <!-- 추가된 박스 -->
								        <div class="bold-box">
								        	<div class="input-group">
												<span class="input-group-text label-text">${d.draftType}문서 신청서</span>
												<span class="input-group-text label-text">문서 신청서</span>
	                                		</div>
	                                	</div>
									</div>
	                            </div>
	                        </div>
                        </div>
					</div>
                        <div class="col-xxl-3 col-xl-12 col-lg-12 col-md-12 col-sm-12 mt-xxl-0 mt-4">
                            <div class="widget-content widget-content-area blog-create-section">
                                <div class="row">
                                    <div class="col-xxl-12 mb-4">
                                        <div class="switch form-switch-custom switch-inline form-switch-primary">
                                            <input class="switch-input" type="checkbox" role="switch" id="showPublicly" checked>
                                            <label class="switch-label" for="showPublicly">Publish</label>
                                        </div>
                                    </div>
                                    <div class="col-xxl-12 mb-4">
                                        <div class="switch form-switch-custom switch-inline form-switch-primary">
                                            <input class="switch-input" type="checkbox" role="switch" id="enableComment" checked>
                                            <label class="switch-label" for="enableComment">Enable Comments</label>
                                        </div>
                                    </div>
                                    <div class="col-xxl-12 col-md-12 mb-4">
                                        <label for="tags">Tags</label>
                                        <input id="tags" class="blog-tags" value="">
                                    </div>

                                    <div class="col-xxl-12 col-md-12 mb-4">
                                        <label for="category">Category</label>
                                        <input id="category" name="category" placeholder="Choose...">
                                    </div>

                                    <div class="col-xxl-12 col-md-12 mb-4">

                                        <label for="product-images">Featured Image</label>
                                        <div class="multiple-file-upload">
                                            <input type="file" 
                                                class="filepond file-upload-multiple"
                                                name="filepond"
                                                id="product-images" 
                                                multiple 
                                                data-allow-reorder="true"
                                                data-max-file-size="3MB"
                                                data-max-files="5">
                                        </div>

                                    </div>

                                    <div class="col-xxl-12 col-sm-4 col-12 mx-auto">
                                        <button class="btn btn-success w-100">Create Post</button>
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
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../src/plugins/src/editors/quill/quill.js"></script>
    <script src="../src/plugins/src/filepond/filepond.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginFileValidateType.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginImageExifOrientation.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginImagePreview.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginImageCrop.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginImageResize.min.js"></script>
    <script src="../src/plugins/src/filepond/FilePondPluginImageTransform.min.js"></script>
    <script src="../src/plugins/src/filepond/filepondPluginFileValidateSize.min.js"></script>

    <script src="../src/assets/js/apps/blog-create.js"></script>
	
</body>
</html>