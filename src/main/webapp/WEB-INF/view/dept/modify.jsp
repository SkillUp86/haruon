<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>HARUON | 직원 정보 수정</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Global Styles -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Custom Styles -->
    <script src="${pageContext.request.contextPath}/src/assets/js/signature_pad.min.js"></script> ><!--사인-->
    <link href="${pageContext.request.contextPath}/src/plugins/src/notification/snackbar/snackbar.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/tabs.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/assets/css/light/elements/alert.css">
    <link href="${pageContext.request.contextPath}/src/plugins/css/light/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/plugins/css/light/notification/snackbar/custom-snackbar.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/assets/css/light/forms/switches.css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/list-group.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/users/account-setting.css" rel="stylesheet" type="text/css" />
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link href="../src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css" />
    
    <script src="${pageContext.request.contextPath}/src/plugins/src/font-icons/feather/feather.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/font-icons/fontawesome/css/regular.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/font-icons/fontawesome/css/fontawesome.css">
    
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/font-icons.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css" />
    
    <style>
	.form-control[readonly] {
		background-color: #e7e7e7 !important;
		color: #000 !important;
	}
    
	.author-img {
    width: 200px;
    height: 200px;
    background-size: cover; 
    background-position: center;
    border-radius: 50%;
     display: block;
    margin: 0 auto;
	}
	.profile-image-area {
    text-align: center;
	}
    .custom-margin {
    position: relative;
    top: -18px;
}
	</style>
</head>

<body class="layout-boxed">
    <!-- BEGIN LOADER -->
    <div id="load_screen">
        <div class="loader">
            <div class="loader-content">
                <div class="spinner-grow align-self-center"></div>
            </div>
        </div>
    </div>
    <!-- END LOADER -->

    <!-- BEGIN NAVBAR -->
    <div class="header-container container-xxl">
        <jsp:include page="/WEB-INF/view/inc/header.jsp" />
    </div>
    <!-- END NAVBAR -->

	<div class="main-container" id="container">
		<div class="overlay"></div>
		<div class="search-overlay"></div>

		<!-- BEGIN SIDEBAR -->
		<div class="sidebar-wrapper sidebar-theme">
			<jsp:include page="/WEB-INF/view/inc/sidebar.jsp" />
		</div>
		<!-- END SIDEBAR -->

		<!-- BEGIN CONTENT AREA -->
		<div id="content" class="main-content">
			<div class="layout-px-spacing">
				<div class="middle-content container-xxl p-3">
					<!-- BEGIN BREADCRUMBS -->
					<div class="secondary-nav">
						<div class="breadcrumbs-container" data-page-heading="Analytics">
							<header class="header navbar navbar-expand-sm">
								<a href="javascript:void(0);" class="btn-toggle sidebarCollapse" data-placement="bottom"> 
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
                                        <line x1="3" y1="12" x2="21" y2="12"></line> <line x1="3" y1="6" x2="21" y2="6"></line> <line x1="3" y1="18" x2="21" y2="18"></line>
                                    </svg>
								</a>
								<div class="d-flex breadcrumb-content">
									<div class="page-header">
										<div class="page-title"></div>
										<nav class="breadcrumb-style-one" aria-label="breadcrumb">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="#">조직도</a></li>
												<li class="breadcrumb-item active" aria-current="page">사원 조회</li>
											</ol>
										</nav>
									</div>
								</div>
							</header>
						</div>
					</div>
					<!-- END BREADCRUMBS -->
				</div>

				<div class="tab-content" id="animateLineContent-4">
					<div class="tab-pane fade show active" id="animated-underline-home"
						role="tabpanel" aria-labelledby="animated-underline-home-tab">
						<div class="card row">
							<div class="widget-content widget-content-area br-8">
								<div class="col-xl-12 col-lg-12 col-md-12 layout-spacing">
									<div class="info">
										<h4><strong>${e.ename}</strong>님 정보 수정</h4>
									</div><br>
									
									<form id="formUpdateEmp" action="${pageContext.request.contextPath}/employees/modify" method="post">
										<div class="row">
											<div class="col-lg-11 mx-auto">
												<div class="row">
													<div class="col-xl-2 col-lg-12 col-md-4">
														<div class="profile-image mt-4 pe-md-4">
															<c:if test="${e.fileName != null}">
																<div class="profile-image-area mb-2">
																	<img class="author-img mb-2" src="${pageContext.request.contextPath}/upload/profile/${e.fileName}.${e.ext}" id="author-img">
																</div>
															</c:if>
															<c:if test="${e.fileName == null}">
																<div class="profile-image-area mb-2">
																	<img class="author-img mb-2" src="${pageContext.request.contextPath}/upload/profile/profile.svg" id="author-img">
																</div>
															</c:if>
														</div>
													</div>
													
													<div class="col-xl-10 col-lg-12 col-md-8 mt-md-0 mt-4">
														<div class="form">
															<div class="row">
																<input type="hidden" id="empNo" name="empNo" value="${e.empNo}">
																<div class="col-md-6">
																	<div class="form-group">
																		<label for="fullName">이름</label> 
																		<input type="text" class="form-control mb-3" value="${e.ename}" id="ename" name="ename" readonly>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label for="empNo">입사날짜</label> 
																		<input type="text" class="form-control mb-3" value="${e.joinDate}" id="joinDate" name="joinDate" readonly>
																	</div>
																</div>

																<div class="col-md-6">
																	<div class="form-group">
																		<label for="country">부서</label> 
																		<select class="form-select mb-3" id="depNo" name="depNo">
																			<option value="" selected>${e.dname}</option>
																			<c:forEach var="d" items="${deptList}">
																				<option value="${d.depNo}">${d.dname}</option>
																			</c:forEach>
																		</select>

																	</div>
																</div>

																<div class="col-md-6">
																	<div class="form-group">
																		<label for="gender">성별</label> 
																		<input class="form-control mb-3" value="${e.gender}" id="gender" name="gender" readonly>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label for="address">주소</label> 
																		<input type="text" class="form-control mb-3" value="${e.postCode}" id="selectPostcode" name="postCode" value="" placeholder="우편번호" readonly> 
																		<input type="text" class="form-control mb-3" value="${e.address}" id="roadAddress" name="address" value="" placeholder="주소" readonly>   
																		<input id="sample4_detailAddress" placeholder="상세주소" style="display: none;">  
																		<span id="guide" style="color: #999; display: none"></span>
																	</div>
																</div>

																<div class="col-md-6">
																	<div class="form-group">
																		<label for="location">직급</label> 
																		<select class="form-select mb-3" value="${e.location}" id="location" name="location" required>
																			<option value="${e.location}" selected>${e.location}</option>
																			<option value="I03" ${e.location == '부서장' ? 'selected' : ''}>부서장</option>
																			<option value="I02" ${e.location == '팀장' ? 'selected' : ''}>팀장</option>
																			<option value="I01" ${e.location == '사원' ? 'selected' : ''}>사원</option>
																		</select>
																	</div>
																</div>

																<div class="col-md-6">
																	<div class="form-group">
																		<label for="phone">연락처</label> 
																		<input type="text" class="form-control mb-3" value="${e.phone}" id="phone" name="phone" readonly>
																	</div>
																</div>

																<div class="col-md-6">
																	<div class="form-group">
																		<label for="email">이메일</label> 
																		<input type="email" class="form-control mb-3" value="${e.email}" id="email" name="email" readonly>
																	</div>
																</div>

																<div class="col-md-6">
																	<div class="form-group">
																		<label for="extNum">내선번호</label> 
																		<input type="text" class="form-control mb-3" value="${e.extNum}" id="extNum" name="extNum">
																	</div>
																</div>

																<div class="col-md-6">
																	<div class="form-group">
																		<label for="birthdate">생일</label> 
																		<input type="date" class="form-control mb-3" value="${e.birth}" id="birth" name="birth" readonly>
																	</div>
																</div>
																
																<!-- 비밀번호 변경 부분 삭제 -->
																
																<div class="col-md-6">
																	<div class="form-group">
																		<label for="sign">서명</label>
																		<c:if test="${e.signfileName == null }">
														                    <div class="input-group mb-4">
														                        
														                    </div>
													                    </c:if>
																		<c:if test="${e.signfileName != null }">
																			 <div class="input-group mb-4">
														                        <img src="${pageContext.request.contextPath}/upload/sign/${e.signfileName}.${e.signExt}">
														                    </div>
													                    </c:if>
												                    </div>
																</div>
																
																<div class="col-md-6">
																	<div class="form-group">
																		<button type="button" class="btn btn-dark btn-rounded mb-2 me-4" data-bs-toggle="modal" data-bs-target="#exitFormModal" 
												                            		data-empNo="${e.empNo}" onclick="setModalData(this)">퇴사</button> <!-- 모달창 -->
																		<c:if test="${not empty e.exitDate}">
																			<label>퇴사일자: ${e.exitDate}</label> 
																		</c:if>
												                    </div>
												            	</div>
																
															</div>
														</div>
														
														<div class="col-md-12 mt-2 ">
															<div class="form-group text-end">
																<button id="btnUpdateEmp" type="button" class="btn btn-success">수정</button>
															</div>
														</div>
													</div>
													
													<div class="col-md-12 mt-2 ">
														<div class="form-group">
															<a href="javascript:history.back()" type="button" class="btn btn-secondary">목록으로</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
									
									<!-- Modal - 퇴사 -->
									<div class="modal fade inputForm-modal" id="exitFormModal" tabindex="-1" role="dialog" aria-labelledby="exitFormModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
											<div class="modal-content">
												<div class="modal-header" id="inputFormModalLabel">
													<h5 class="modal-title">퇴사 일자 등록</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
														<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
															<line x1="18" y1="6" x2="6" y2="18"></line> <line x1="6" y1="6" x2="18" y2="18"></line></svg>
													</button>
												</div>
												
												<form id="formExit" action="${pageContext.request.contextPath}/employees/exit" method="post">
													<div class="modal-body">
														<div class="mb-3">
															<label class="form-label">이름</label> 
															<input type="hidden" class="form-control" id="exitEmpNo" name="empNo" value="${e.empNo}">
															<input type="text" class="form-control" id="exitEname" name="ename" value="${e.ename}" readonly>
														</div>
														<div class="mb-3">
															<label class="form-label">퇴사 일자</label> 
															<input type="date" class="form-control" id="exitDate" name="exitDate" required>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-light-danger mt-2 mb-2 btn-no-effect" data-bs-dismiss="modal">취소</button>
														<button id="btnExit" type="button" class="btn btn-primary mt-2 mb-2 btn-no-effect">퇴사일자 등록</button>
													</div>
												</form>

											</div>
										</div>
									</div> <!-- END Modal -->
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/view/inc/footer.jsp" />
	
   	<!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
	<script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
	<script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
	<!-- END GLOBAL MANDATORY SCRIPTS -->
	
	    <!--  BEGIN CUSTOM SCRIPTS FILE  -->
	<script src="${pageContext.request.contextPath}/src/plugins/src/notification/snackbar/snackbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.min.js"></script>
	<!--  END CUSTOM SCRIPTS FILE  -->	

	<script>
		$('#btnUpdateEmp').click(function() {
			if($('#depNo').val() == null || $('#depNo').val() === ''){
    			$('#depNo').val('${e.depNo}'); // 부서 입력하지 않았으면 원래 부서번호 값 입력
    			return;
    		} else {
				$('#formUpdateEmp').submit();
			}
		})
		
 	// 퇴사 버튼 -> 퇴사일자 등록
   	$(document).on('click', '#btnExit', function() {
        if ($('#exitDate').val() === '') {
            alert('퇴사일자를 입력하세요');
            return;
        } else {
        	console.log('퇴사일자 등록 폼 제출');
            $('#formExit').submit();
        }
    });
	</script>
</body>
</html>
