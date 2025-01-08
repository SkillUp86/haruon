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
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="../src/assets/css/light/elements/custom-pagination.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../src/assets/css/light/apps/blog-post.css">

    <link href="../src/assets/css/dark/elements/custom-pagination.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../src/assets/css/dark/apps/blog-post.css">
    <!--  END CUSTOM STYLE FILE  -->
        
    <!-- 페이지 제목 입력칸 -->
    <title>게시판 상세</title>
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
                                                <li class="breadcrumb-item active" aria-current="page">자유</li>
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
	                <div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 mb-4">
	                	<div class="single-post-content">
			                <div class="post-header">
			                     <div class="post-title">
			                         <h1 class="mb-0"><span style="font-size: smaller;">[${b.catName}]</span> ${b.title}</h1>
			                     </div>
			                 </div><br>
			                 
			                 <div class="post-meta-info d-flex justify-content-between">
								<h5>작성자: ${b.ename}</h5>
								<p style="text-align: right;">조회수: ${b.viewCnt} | 작성시간: ${b.createDate}
									<c:if test="${not empty b.updateDate}">
								        | 수정시간: ${b.updateDate}
								    </c:if>
								</p>
                             </div>
			                 <hr class="my-1">
			                 
			                 <c:if test="${not empty boardFiles}">
				                 <div>
				                 	<p style="text-align: right;">
				                 		첨부파일 <br>
				                 		<c:forEach var="bf" items="${boardFiles}">
				                 			${bf.filename}.${ext} <br>
				                 		</c:forEach>
				                 	</p>
				                 </div>
				             </c:if>
			                 
			                 <div class="post-content">
                             	<p class="mb-5">${b.content}</p>
                             	
                             	<!-- 추천 버튼 -->
                             	<div style="display: flex; justify-content: center; align-items: center; margin-top: 10vh;">
                             		<button class="btn btn-secondary me-4 mb-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                                        <span class="btn-text-inner">${countLike}</span>
                                    </button>
                             	</div>
                             	
                             	<div>
                             		<p style="text-align: right;">
                             			<c:if test="${b.catNo != 1}">
                             				<a href="${pageContext.request.contextPath}/board/update?boaNo=${b.boaNo}">수정</a> &nbsp;
                             			</c:if>
                             			<c:if test="${b.catNo == 1}">
                             				<a href="${pageContext.request.contextPath}/board/updateNotice?boaNo=${b.boaNo}">수정</a> &nbsp;
                             			</c:if>
                             			<a href="${pageContext.request.contextPath}/board/delete">삭제</a> &nbsp;
                             		</p>
                             	</div>
                             </div>
                             
                             <!-- 댓글 -->
                             <hr class="my-1">
                             <h5 class="mb-5">댓글 <span class="comment-count">(${countCommnet})</span></h5>
                             <div class="post-comments">
                             	<c:forEach var="c" items="${commentList}">
	                                 <div class="media mb-5 pb-5 primary-comment">
	                                     <div class="media-body">
	                                         <h5 class="media-heading mb-1">${c.ename}</h5>
	                                         <div class="meta-info mb-0">${c.createDate}</div>
	                                         <p class="media-text mt-2 mb-0">${c.content}</p>
	
	                                         <!-- 수정 버튼 -->
	                                         <button class="btn btn-success btn-icon btn-reply btn-rounded">
	                                             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
	                                         </button>
	                                     </div>
	                                 </div>
	                             </c:forEach>

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
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <script src="../src/plugins/src/highlight/highlight.pack.js"></script>
    <!-- END GLOBAL MANDATORY STYLES -->

</body>
</html>