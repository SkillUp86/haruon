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
    <link href="${pageContext.request.contextPath}/src/assets/css/light/elements/custom-pagination.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/assets/css/light/apps/blog-post.css">
    <!--  END CUSTOM STYLE FILE  -->
        
    <!-- 페이지 제목 입력칸 -->
    <title>HARUON | 게시글 상세</title>
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
                                                <c:if test="${b.catNo != 1}">
                                                	<li class="breadcrumb-item active" aria-current="page">자유 게시판</li>
                                                </c:if>
                                                <c:if test="${b.catNo == 1}">
                                                	<li class="breadcrumb-item active" aria-current="page">공지 게시판</li>
                                                </c:if>
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
			                         <h2 class="mb-0"><span style="font-size: smaller;">[${b.catName}]</span> ${b.title}</h2>
			                     </div>
			                 </div><br>
			                 
			                 <div class="post-meta-info d-flex justify-content-between">
								<h6>작성자: ${b.ename}</h6>
								<p style="text-align: right;">
									조회수: <span id="viewCount">${b.viewCnt}</span> | 작성시간: ${b.createDate}
									<c:if test="${not empty b.updateDate}">
								        | 수정시간: ${b.updateDate}
								    </c:if>
								</p>
                             </div>
			                 <hr class="my-1">
			                 
			                 <c:if test="${not empty boardFiles}">
				                 <div>
				                 	<p style="text-align: right;">
				                 		첨부파일: &nbsp;
				                 		<c:forEach var="bf" items="${boardFiles}">
				                 			<a href="${pageContext.request.contextPath}/upload/board/${bf.fileName}.${bf.ext}" download="${bf.originalName}.${bf.ext}" class="btn btn-dark mt-1 file">
						                       ${bf.originalName}.${bf.ext}
						                    </a><br>
				                 		</c:forEach>
				                 	</p>
				                 </div>
				             </c:if>
			                 
			                 <div class="post-content">
			                 	<div style="white-space: pre-wrap;">
                             		<p class="mb-5">${b.content}</p>
                             	</div>
                             	
                             	<!-- 추천 버튼 -->
                             	<div style="display: flex; justify-content: center; align-items: center; margin-top: 10vh;">
                             		<button id="btnLike-${b.boaNo}" type="button" class="btn btn-secondary me-4 mb-2" onclick="switchLike(${b.boaNo})">
                                        <svg id="heartIcon-${b.boaNo}" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="${isLiked ? 'white' : 'none'}" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart">
                                        <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                                        <span id="countLike" class="btn-text-inner">${countLike}</span>
                                    </button>
                             	</div>
                             	
                             	<!-- 세션의 empNo와 작성자의 empNo가 같을 때는 수정+삭제 버튼, 전산과 직원일 때는 삭제 버튼 표시 -->
								<div>
									<p style="text-align: right;">
										<!-- 자유 게시판 글일 때 -->
										<c:if test="${b.catNo != 1}">
											<!-- 수정 버튼 (작성자 본인만) -->
											<c:if test="${empNo == b.empNo}">
												<a href="${pageContext.request.contextPath}/board/modify?boaNo=${b.boaNo}">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3 flaticon-notes">
													<path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
												</a>
												&nbsp;
											</c:if>
											<!-- 삭제 버튼 -->
											<c:if test="${empNo == b.empNo}"> <!-- 본인 -->
												<a href="${pageContext.request.contextPath}/board/delete?boaNo=${b.boaNo}">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 delete-note">
													<polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
													<line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
												</a>
											</c:if>
											<c:if test="${depNo == 4}"> <!-- 전산과 -->
												<a href="${pageContext.request.contextPath}/board/delete?boaNo=${b.boaNo}">
													관리자<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 delete-note">
													<polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
													<line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
												</a>
											</c:if>
										</c:if>
										
										<!-- 공지 글일 때 -->
										<c:if test="${b.catNo == 1}">
											<c:if test="${empNo == b.empNo}">
												<!-- 수정 버튼 -->
												<a href="${pageContext.request.contextPath}/board/modifyNotice?boaNo=${b.boaNo}">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3 flaticon-notes">
													<path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
												</a>
												&nbsp;
												<!-- 삭제 버튼 -->
												<a href="${pageContext.request.contextPath}/board/deleteNotice?boaNo=${b.boaNo}">
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 delete-note">
													<polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
													<line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
												</a>
											</c:if>
										</c:if>
									</p>
								</div>

	                             
	                             
                             </div>
                             
                             <!-- 댓글 리스트 -->
                             <hr class="my-1">
                             <h5 class="mt-3 mb-3">댓글 <span class="comment-count">(${countCommnet})</span></h5>
                             <div class="post-comments">
                             	<c:forEach var="c" items="${commentList}">
	                                 <div class="media mb-3 pb-2 primary-comment">
	                                     <div class="media-body">
	                                         <h5 class="media-heading mb-1">${c.ename}</h5>
	                                         <div class="meta-info mb-0">${c.createDate}</div>
	                                         <div style="white-space: pre-wrap; margin: -30px 0px;">
			                             		<p class="media-text">${c.content}</p>
			                             	</div>
	
	                                         <!-- 삭제 버튼 -->
	                                         <!-- 세션의 empNo와 댓글 작성자의 empNo가 같을 때만 삭제 버튼 표시 -->
											 <c:if test="${empNo == c.empNo}">
		                                         <a href="${pageContext.request.contextPath}/board/deleteComment?boaNo=${c.boaNo}&comNo=${c.comNo}" class="btn btn-dark btn-icon btn-reply btn-rounded remove" id="btnDeleteComment">
		                                         	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash">
		                                            <polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
		                                            <line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
		                                         </a>
		                                     </c:if>
	                                     </div>
	                                 </div>
	                             </c:forEach>
                             </div><!-- END 댓글 리스트 -->
                             
                             <!-- 댓글 입력 -->
                             <div class="post-form mt-5">
                                 <div class="section add-comment">
                                 	<form id="formComment" action="${pageContext.request.contextPath}/board/comment?boaNo=${b.boaNo}" method="post">
	                                     <div class="info">
	                                         <div class="row mt-4">
	                                         	<div class="col-md-6">
	                                                 <div class="mb-3">
	                                                     <label class="form-label">작성자</label>
	                                                     <input type="hidden" id="empNo" name="empNo" value="${empNo}">
	                                                     <input type="text" class="form-control" id="ename" name="ename" value="${ename}" style="width: 150px; background-color: #e7e7e7;" readonly>
	                                                 </div>
	                                             </div>
	                                             <div class="col-md-12">
		                                             <div class="mb-3">
		                                                 <label class="form-label">댓글 내용</label>
		                                                 <textarea class="form-control" cols="20" rows="4" name="content" id="contents"></textarea>
		                                             </div>
	                                             </div>
	                                         </div>
	                                         <div class="text-end">
	                                             <button id="btnComment" class="btn btn-success" type="button">입력</button>
	                                         </div>
	                                     </div>
	                                 </form>   
                                 </div>
                             </div><!-- END 댓글 입력 -->
                             
                             <div class="icon-container">
                             	<c:if test="${b.catNo != 1}">
                                	<a href="${pageContext.request.contextPath}/board" class="btn btn-secondary me-4 mb-2">목록으로</a>
                                </c:if>
                             	<c:if test="${b.catNo == 1}">
                                	<a href="${pageContext.request.contextPath}/board/notice" class="btn btn-secondary me-4 mb-2">목록으로</a>
                                </c:if>
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
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/highlight/highlight.pack.js"></script>
    <!-- END GLOBAL MANDATORY STYLES -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
		// 조회수 업데이트
		$(document).ready(function() {
			var boaNo = ${b.boaNo};
	        $.ajax({
	            type: "POST",
	            url: "/board/updateView/" + boaNo,
	            success: function(response) {
	                $("#viewCount").text(response.viewCount); // 페이지에 반영
	            },
	            error: function() {
	                alert("조회수 업데이트 중 오류가 발생했습니다.");
	            }
	        });
	    });
		
		// 추천 버튼 클릭
	    function switchLike(boaNo) {
	        var heartIcon = $("#heartIcon-" + boaNo);
	        $.ajax({
	            type: "POST",
	            url: "/board/like/" + boaNo,
	            success: function(response) {
	                    var countLike = response.countLike; // 서버에서 반환한 추천 수
	                    $("#countLike").text(countLike); // 추천 수 갱신

	                    if (response.status === "liked") {
	                        heartIcon.css("fill", "white"); // 추천 추가 시 색 채우기
	                    } else if (response.status === "unliked") {
	                        heartIcon.css("fill", "none"); // 추천 취소 시 색 제거
	                    }
	            },
	            error: function() {
	                alert("추천 처리 중 오류가 발생했습니다.");
	            }
	        });
	    }
		
		// 댓글 입력
		$('#btnComment').click(function(){
    		if($('#contents').val() == ''){
    			alert('댓글 내용을 입력하세요');
    			return;
    		} else {
    			$('#formComment').submit();
    		}
    	})
	</script>
	
</body>
</html>