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

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/apps/contacts.css" rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/apps/contacts.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->    
    
    <!-- 페이지 제목 입력칸 -->
    <title>HARUON | 문의 상세</title>
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
                                            	<!-- 여기도 페이지 마다 이름 바꿔줘야 합니다 -->
                                                <li class="breadcrumb-item"><a href="#">가맹점</a></li>
                                                <!-- 여기도 페이지 마다 이름 바꿔줘야 합니다!!!!!!!!!!!!!!!!! -->
                                                <li class="breadcrumb-item active" aria-current="page">가맹점 문의</li>
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
                <div class="row layout-spacing layout-top-spacing" id="cancel-row">
                    <div class="col-lg-12">
                        <div class="widget-content searchable-container list">
                            <div class="row">

		                        <div id="flLoginForm" class="col-lg-12 layout-spacing">
		                            <div class="statbox widget box box-shadow">
		                                <div class="widget-header">
	                                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
	                                            <h2 class="mt-3 mb-3">&nbsp; 문의 상세</h2>
	                                        </div>                                                                        
		                                </div>
		                                <div class="widget-content widget-content-area">
			                                <div class="row">
				                                <div class="col-md-6">
				                                    <label class="form-label"> 문의 번호 </label>
				                                    <label class="form-control">${q.fraAskNo}</label>
				                                </div>
				                                <div class="col-md-6">
				                                    <label class="form-label"> 가맹점 </label>
				                                    <label class="form-control">${q.fname}</label>
				                                </div>
			                                </div>
			                                <div class="row">
				                                <div class="col-md-12">
				                                    <label class="form-label"> 제목 </label>
				                                    <label class="form-control">${q.title}</label>
				                                </div>
			                                </div>
			                                <div class="row">
				                                <div class="col-md-12">
				                                    <label class="form-label"> 등록일 </label>
				                                    <label class="form-control">${q.createDate}</label>
				                                </div>
			                                </div>
			                                <div class="row">
				                                <div class="col-md-12">
				                                    <label class="form-label"> 내용 </label>
				                                    <label class="form-control">${q.content}</label>
				                                </div>
			                                </div>
			                                <div class="row mb-3">
				                                <div class="col-md-12">
				                                    <label class="form-label"> 첨부파일 </label>
				                                    <c:if test="${empty qfl}">
				                                    	<label class="form-control">첨부된 파일이 없습니다</label>
				                                    </c:if>
				                                    <c:forEach items="${qfl}" var="qfl">
					                                    <a href="${pageContext.request.contextPath}/uploadCourse/${qfl.fileName}.${qfl.ext}" download="${qfl.originName}.${qfl.ext}"> 
					                                    	<label class="form-control">${qfl.originName}.${qfl.ext}</label>
					                                    </a>
				                                    </c:forEach>
				                                </div>
			                                </div>
			                                
			                                <h3 class="ms-1 mt-3 mb-4">답변</h3>
			                                
			                                <c:if test="${a.content == null}"><!-- 답변 등록 안했다면 -->
			                                	<form id="addForm" method="post" action="${pageContext.request.contextPath}/franchises/questions/${q.fraAskNo}">
					                                <div class="row">
						                                <div class="col-md-11">
						                                	<input type="hidden" name="fraAskNo" value="${q.fraAskNo}">
						                                	<input type="hidden" name="empNo" value="${empNo}">
						                                    <textarea class="form-control" id="contents" name="content" placeholder="답변" rows="5" cols="40"></textarea>
						                                </div>
						                                <div class="col-md-1 d-flex align-items-center">
						                                	<button type="button" id="addBtn" class="btn btn-gray btn-lg">등록</button>
						                                </div>
					                                </div>
			                                	</form>
			                                </c:if>
			                                <c:if test="${a.content != null}"><!-- 답변 등록했다면 -->
				                                <div class="row">
					                                <div class="col-md-6">
					                                    <label class="form-label"> 담당자 </label>
					                                    <label class="form-control">${a.ename}</label>
					                                </div>
					                                <div class="col-md-6">
					                                    <label class="form-label"> 등록일 </label>
					                                    <label class="form-control">${a.createDate}</label>
					                                </div>
				                                </div>
				                                <div class="row">
					                                <div class="col-md-12">
					                                    <label class="form-label"> 내용 </label>
					                                    <textarea class="form-control" rows="5" cols="40" readonly>${a.content}</textarea>
					                                </div>
				                                </div>
			                                </c:if>
		                                </div>
		                            </div>
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
    <script src="${pageContext.request.contextPath}/src/assets/js/apps/contact.js"></script>
	<script src="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.js"></script>
	<script>
		// !!!!!!!!!!!! 답변 등록 질문으로 변경 !!!!!!!!!!
	    $('#addBtn').click(function(event) {
	        // 삭제 확인 메시지
	        var isConfirmed = confirm('답변을 등록 하시겠습니까?');
	        
	        // 사용자가 '확인'을 클릭했을 경우
	        if (isConfirmed) {
	            // 기본 동작(페이지 이동)
	        	$('#addForm').submit();
	        } else {
	            // 취소 시 아무 일도 하지 않음
	            event.preventDefault();
	        }
	    });
	</script>
	


	<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>