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

    <!-- BEGIN PAGE LEVEL STYLES -->
    <!-- END PAGE LEVEL STYLES -->    
    
    <!-- 페이지 제목 입력칸 -->
    <title>HARUON | 교육 상세내역</title>
    <!-- 페이지 제목 입력칸 -->
</head>
<body class="layout-boxed">
    <!-- BEGIN LOADER -->
    <div id="load_screen"> 
	    <div class="loader"> 
		    <div class="loader-content">
		        <div class="spinner-grow align-self-center">
		        </div>
		    </div>
	    </div>
    </div>
    <!--  END LOADER -->

    <!--  BEGIN NAVBAR  -->
    <div class="header-container container-xxl">
	        <jsp:include page="/WEB-INF/view/inc/header.jsp" />
    </div>
    <!--  END NAVBAR  -->
      
    <!--  BEGIN MAIN CONTAINER 템플릿 직접 끌어와서 사용  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="cs-overlay"></div>
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
                                                <li class="breadcrumb-item"><a href="#">가맹점</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">교육 상세내역</li>
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
                <div class="layout-top-spacing">
                    <h2 class="mt-3 mb-3">교육 상세정보</h2>
                        <div class="row">
                           <div class="card col-3 p-5 me-2">
	                            <div>
	                             	<input type="hidden" name="empNo" value="${c.empNo}">
	                                <label class="form-label"> 담당자 </label>
	                                <label class="form-control">${c.ename}</label>
	                            </div>
	                            <div>
	                                <label class="form-label"> 일정 </label>
	                                <label class="form-control">${c.eduDate}</label>
	                            </div>
	                            <div>
	                                <label class="form-label"> 장소 </label>
	                                <label class="form-control">${c.place}</label>
	                            </div>
	                            <div>
	                                <label class="form-label"> 정원 </label>
	                                <label class="form-control">${c.capacity}</label>
	                            </div>
	                            <div class="icon-container" style="margin-top: 180px;">
	                           		<a href="${pageContext.request.contextPath}/franchises/courses" class="btn btn-secondary me-4 mb-2">목록으로</a>
	                           </div>
                           </div>
                           <div class="card col-8 p-5">
	                            <div>
	                                <label class="form-label"> 제목 </label>
	                                <label class="form-control">${c.title}</label>
	                                <label class="form-control" style="min-height: 300px;">${c.content}</label>
	                            </div>
	                            <div>
	                                <label class="form-label"> 첨부파일 </label>
	                                <c:if test="${empty cfl}">
	                                	<label class="form-control">첨부된 파일이 없습니다</label>
	                                </c:if>
	                                <c:forEach items="${cfl}" var="cfl">
	                                 <a href="${pageContext.request.contextPath}/upload/course/${cfl.fileName}.${cfl.ext}" download="${cfl.originName}.${cfl.ext}"> 
	                                 	<label class="form-control">${cfl.originName}.${cfl.ext}</label>
	                                 </a>
	                                </c:forEach>
	                            </div>
	                            <div class="text-end mt-5 mb-2">
		                             <a href="${pageContext.request.contextPath}/franchises/courses/modify?eduNo=${c.eduNo}" class="btn btn-gray"  style="display:inline-block;"> 수정 </a>
		                             <a href="${pageContext.request.contextPath}/franchises/courses/delete?eduNo=${c.eduNo}" class="btn btn-gray" id="btnDelete"  style="display:inline-block;"> 삭제 </a>
	                            </div>
                            </div>
          				</div>
                  	</div>
               	</div>
                <!-- 메인컨텐츠 END -->
			</div>
		</div>
            
        <!--  BEGIN FOOTER  -->
        <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
        <!--  END FOOTER  -->
        
  		<!--  END CONTENT AREA  -->
	
	</div>
    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/global/vendors.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/jquery-ui/jquery-ui.min.js"></script>
	
	<script>
	    $('#btnDelete').click(function(event) {
	        // 삭제 확인 메시지
	        var isConfirmed = confirm('해당 교육을 삭제하시겠습니까?');
	        
	        // 사용자가 '확인'을 클릭했을 경우
	        if (isConfirmed) {
	            // 기본 동작(페이지 이동)을 취소
	            // 'href' 속성을 가져와서 실제 삭제 요청을 처리
	            window.location.href = $(this).attr('href');
	        } else {
	            // 취소 시 아무 일도 하지 않음
	            event.preventDefault();
	        }
	    });
	</script>

	<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>