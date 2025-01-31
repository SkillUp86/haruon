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
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/assets/css/light/apps/ecommerce-create.css">
    <!--  END CUSTOM STYLE FILE  -->
        
    <!-- 페이지 제목 입력칸 -->
    <title>HARUON | 자유게시판 글 수정</title>
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
                                                <li class="breadcrumb-item active" aria-current="page">자유 게시판</li>
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

                        <div class="card col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
							<h2 class="mt-3 mb-3">게시글 수정</h2>
                            <div class="widget-content widget-content-area ecommerce-create-section">

                                <form id="formUpdate" action="${pageContext.request.contextPath}/board/modify" method="post" enctype="multipart/form-data">
	                                <input type="hidden" name="boaNo" value="${b.boaNo}">
	                                <div class="col-xxl-12 col-md-6 mb-4">
	                                     <label for="category">카테고리</label>
	                                     <select class="form-select" id="category" name="catNo">
	                                         <option value="${b.catNo}">${b.catName}</option>
	                                         <c:forEach var="c" items="${categoryList}">
	                                         	<option value="${c.catNo}">${c.catName}</option>
	                                         </c:forEach>
	                                     </select>
	                                 </div>
	                                
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
	                                        		<div>
							                 			<a href="${pageContext.request.contextPath}/upload/board/${bf.fileName}.${bf.ext}" download="${bf.originalName}.${bf.ext}" class="btn btn-dark mt-1 file">
									                       ${bf.originalName}.${bf.ext}
									                    </a>
									                    <a href="javascript:void(0);" class="delete-file-btn" data-boafno="${bf.boafNo}"><!-- 첨부파일 삭제 아이콘 -->
										                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
										                    	<line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
										                </a>
										            </div><br>
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
    <script src="${pageContext.request.contextPath}/src/plugins/src/tagify/tagify.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/apps/ecommerce-create.js"></script>

    <script>
    	// 첨부파일 하나씩 삭제
    	$(document).ready(function() {
		    $(".delete-file-btn").click(function() {
		        let boafNo = $(this).data("boafno");
		        let $fileContainer = $(this).closest("div"); // 삭제 버튼이 포함된 파일 항목의 div를 선택
		
		        $.ajax({
		            url: "/board/deleteBoardFile",
		            type: "POST",
		            data: { boafNo: boafNo },
		            success: function(response) {
		                if (response === "success") {
		                    $fileContainer.remove(); // 화면에서 파일 삭제
		                } else {
		                    alert("파일 삭제에 실패했습니다.");
		                }
		            },
		            error: function() {
		                alert("서버 오류가 발생했습니다.");
		            }
		        });
		    });
		});
    
    	$('#btnUpdate').click(function(){
    		if($('#category').val() == null || $('#category').val() === ''){
    			$('#category').val('${b.catNo}'); // 카테고리 입력하지 않았으면 원래 카테고리 값 입력
    			return;
    		} else if($('#title').val() == ''){
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

</body>
</html>