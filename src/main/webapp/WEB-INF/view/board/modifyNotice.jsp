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

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/filepond/filepond.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImagePreview.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/tagify/tagify.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/assets/css/light/forms/switches.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/editors/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/tagify/custom-tagify.css">
    <link href="${pageContext.request.contextPath}/src/plugins/css/light/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/assets/css/dark/forms/switches.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/dark/editors/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/dark/tagify/custom-tagify.css">
    <link href="${pageContext.request.contextPath}/src/plugins/css/dark/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/assets/css/light/apps/ecommerce-create.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/assets/css/dark/apps/ecommerce-create.css">
    <!--  END CUSTOM STYLE FILE  -->
        
    <!-- 페이지 제목 입력칸 -->
    <title>공지 수정</title>
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
                
                <div class="row mb-4 layout-spacing layout-top-spacing">

                        <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">

                            <div class="widget-content widget-content-area ecommerce-create-section">

                                <form id="formUpdate" action="${pageContext.request.contextPath}/board/modifyNotice" method="post" enctype="multipart/form-data">
	                                <input type="hidden" name="boaNo" value="${b.boaNo}">
	                               
	                                <div class="row mb-4">
	                                    <div class="col-sm-12">
	                                    	<label>제목</label>
	                                        <input type="text" class="form-control" id="title" name="title" placeholder="제목" value="${b.title}">
	                                    </div>
	                                </div>
									
	                                <div class="form-group row invoice-note">
                                        <label>내용</label>
                                        <div class="col-sm-12">
                                            <textarea class="form-control" id="contents" name="content" placeholder="내용 작성" style="height: 300px;">${b.content}</textarea>
                                        </div>
                                    </div><br>
	
	                                <div class="row">
	                                    <div class="col-md-8">
	                                        <label>첨부파일</label>
	                                        <div class="multiple-file-upload">
	                                            <c:forEach var="bf" items="${boardFiles}">
						                 			<a href="${pageContext.request.contextPath}/upload/board/${bf.fileName}.${bf.ext}" download="${bf.originalName}.${bf.ext}" class="btn btn-dark mt-1 file">
								                       ${bf.originalName}.${bf.ext}
								                    </a><br>
						                 		</c:forEach>
						                 		<br>
	                                            <input class="form-control file-upload-input" type="file" id="boardFile" name="boardFile" multiple="multiple">
	                                        </div>
	                                    </div>
	                                </div>
	                                
	                                <div class="col-sm-12 text-center" style="margin-top: 20px;">
	                                    <button id="btnUpdate" type="button" class="btn btn-success mb-4">수정하기</button>
	                                </div>
                                </form>
                                
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
    
    <script src="${pageContext.request.contextPath}/src/plugins/src/highlight/highlight.pack.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/editors/quill/quill.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/filepond.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginFileValidateType.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImageExifOrientation.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImagePreview.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImageCrop.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImageResize.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImageTransform.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/filepondPluginFileValidateSize.min.js"></script>

    <script src="${pageContext.request.contextPath}/src/plugins/src/tagify/tagify.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/apps/ecommerce-create.js"></script>

    <script>
	    // boardFiles를 JSON으로 변환
	    var boardFiles = [
	        <c:forEach var="file" items="${boardFiles}">
	            {
	                "boafNo": "${file.boafNo}",
	                "originalName": "${file.originalName}",
	                "fileName": "${file.fileName}",
	                "ext": "${file.ext}",
	                "kind": "${file.kind}",
	                "size": "${file.size}"
	            }
	        </c:forEach>
	    ];
	
	    // 파일 경로 배열 생성
	    var filePaths = boardFiles.map(function(file) {
	        return '${pageContext.request.contextPath}/upload/' + file.fileName; // 웹 애플리케이션의 컨텍스트 경로와 upload 폴더를 결합
	    });
	
	    // ecommerce.addFiles 호출
	    ecommerce.addFiles(...filePaths); // 스프레드 연산자를 사용하여 배열 전개
    
    	$('#btnUpdate').click(function(){
    		if($('#title').val() == ''){
    			alert('제목을 입력하세요');
    			return;
    		} else if($('#contents').val() == ''){
    	        alert('내용을 입력하세요');
    	        return;
    	    } else {
    			$('#formUpdate').submit();
    		}
    	})
    </script>

    <!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>