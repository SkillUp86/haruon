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

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/tagify/tagify.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/assets/css/light/forms/switches.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/editors/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/tagify/custom-tagify.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/font-icons/fontawesome/css/regular.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/font-icons/fontawesome/css/fontawesome.css">
    
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/font-icons.css" rel="stylesheet" type="text/css">
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/assets/css/light/apps/ecommerce-create.css">
    <!--  END CUSTOM STYLE FILE  -->
       
    <script src="${pageContext.request.contextPath}/src/plugins/src/font-icons/feather/feather.min.js"></script>
    
    <!-- 페이지 제목 입력칸 -->
    <title> haruon | 회의실 수정 </title>
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
                                <div class="page-title"></div>
                                <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">회의실</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">수정</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </header>
                </div>
            </div>
            <!--  END BREADCRUMBS  -->
        </div>

        <!-- 수정 폼 -->
<div class="row mb-4 layout-spacing layout-top-spacing">
    <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
        <div class="widget-content widget-content-area blog-create-section">
            <div class="row mb-4">
                <h2 class="mt-3 mb-3">회의실 수정</h2>
                <br>
                <form id="formUpdate" action="${pageContext.request.contextPath}/updateMeetingroom" method="post" enctype="multipart/form-data">
   						 <!-- meeNo 값을 hidden input으로 전송 -->
    					<input type="hidden" name="meeNo" value="${meetingRoom.meeNo}">

    					<!-- 회의실 사진 수정 -->
					    <div class="row">
						    <div class="col-md-8">
						        <label for="meetingroomFile">회의실 사진</label>
						        <div class="multiple-file-upload">
						            <c:if test="${not empty meetingRoom.fileName}">
						                <!-- 기존 파일이 있을 경우 -->
						                <img class="mb-2" 
						                     src="${pageContext.request.contextPath}/upload/meetingroom/${meetingRoom.fileName}.${meetingRoom.fileExt}" 
						                     id="meetingroom-img" style="max-width: 200px;">
						            </c:if>
						            <c:if test="${empty meetingRoom.fileName}">
						                <!-- 기존 파일이 없을 경우 -->
						                <img class="mb-2" 
						                     src="${pageContext.request.contextPath}/upload/meetingroom/default_image.png" 
						                     id="meetingroom-img" style="max-width: 200px;">
						            </c:if>
						            <input class="form-control file-upload-input" type="file" id="meetingroomFile" name="meetingroomFile">
						        </div>
						    </div>
						</div>
					    <br>
					    <!-- 회의실 이름 -->
					    <div class="row mb-4">
					        <div class="col-sm-12">
					            <label>회의실 이름</label>
					            <input type="text" class="form-control" id="mname" name="mname" value="${meetingRoom.mname}" required>
					        </div>
					    </div>
					    
					   	<div class="row mb-4">
						    <div class="col-sm-12">
						        <label for="availYn">회의실 예약 가능여부</label>
						        <select class="form-control" id="availYn" name="availYn" required>
						            <option value="Y" ${meetingRoom.availYn == 'Y' ? 'selected' : ''}>Y</option>
						            <option value="N" ${meetingRoom.availYn == 'N' ? 'selected' : ''}>N</option>
						        </select>
						    </div>
						</div>

					    
                            
					
					    <!-- 수용 가능 인원 -->
					    <div class="row mb-4">
					        <div class="col-sm-12">
					            <label>수용가능 인원</label>
					            <input type="text" class="form-control" id="capacity" name="capacity" value="${meetingRoom.capacity}" required>
					        </div>
					    </div>
					
					    <!-- 회의실 정보 -->
					    <div class="form-group row invoice-note">
					        <label>회의실 정보</label>
					        <div class="col-sm-12">
					            <textarea class="form-control" id="info" name="info" style="height: 300px;" required>${meetingRoom.info}</textarea>
					        </div>
					    </div>
					    <br>
					
					    <div class="col-sm-12 text-center" style="margin-top: 20px;">
					        <button id="updateButton" type="submit" class="btn btn-success mb-4">회의실 수정</button>
					    </div>
					</form>

                <div class="icon-container">
                    <a href="javascript:history.back()" class="btn btn-secondary me-4 mb-2">목록으로</a>
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
    // 폼 제출 전에 유효성 검사하는 함수
    function validateForm() {
        // 회의실 이름 검사
        const mname = document.getElementById("mname").value.trim();
        if (!mname) {
            alert("회의실 이름을 입력해주세요.");
            return false; // 제출을 막음
        }
        // 수용 가능 인원 검사
        const capacity = document.getElementById("capacity").value.trim();
        if (!capacity) {
            alert("수용 가능한 인원을 입력해주세요.");
            return false; // 제출을 막음
        }

        // 회의실 정보 검사
        const info = document.getElementById("info").value.trim();
        if (!info) {
            alert("회의실 정보를 입력해주세요.");
            return false; // 제출을 막음
        }

        // 모든 검사가 통과하면 폼 제출
        return true;
    }
    // 폼 제출 이벤트에 validateForm 적용
    document.getElementById("formUpdate").onsubmit = validateForm;
</script>

</body>
</html>