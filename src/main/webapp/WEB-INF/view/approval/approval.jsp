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
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
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
    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/forms/bootstrap-form.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
	<!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/carousel.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/tabs.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/src/assets/css/light/elements/infobox.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/src/assets/css/light/elements/color_library.css" rel="stylesheet" type="text/css" />
    <!--  END CUSTOM STYLE FILE  -->
    
    <!-- 페이지 제목 입력칸 -->
    <title>Haruon | 결재 페이지</title>
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
                                                <li class="breadcrumb-item"><a href="#">문서</a></li>
                                                <li class="breadcrumb-item active" aria-current="page"> 결재신청 </li>
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

				<h2 class="mt-3 mb-3">전자결재</h2>
	                <form id="formInsertApproval" method="post" action="${pageContext.request.contextPath}/approval" enctype="multipart/form-data">
						<div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
							<div class="widget-content widget-content-area mt-4">
								<div class="input-group mb-4">
									<h5 class="mb-4">결재라인</h5>
								</div>
								<c:if test="${msg != null}">
										<div class="input-group mb-4">
											<div class="alert alert-warning" role="alert">${msg}</div>
										</div>
									</c:if>	
								<div class="input-group mb-4">

									<span class="input-group-text label-text">기안자</span>
									<input type="hidden" class="form-control" id="empNo" name="empNo" value="${empNo}" readonly>
									<input type="text" class="form-control" id="empName" name="empName" value="${empName}" readonly>
									<span class="input-group-text label-text">부서</span>
									<input type="text" class="form-control" id="depName" name="depName" value="${dname}" readonly>
								</div>

								<div class="input-group mb-4">
									<div class="input-group">
										<span class="input-group-text label-text">중간결재자</span>
										<input type="hidden" class="form-control" id="midAppNo" name="midAppNo" value="" required readonly>
										<input type="text" class="form-control" id="midAppName" name="midAppName" value="" placeholder="중간결재자 입력" aria-label="중간결재자" required="required" readonly="readonly">
										<span class="input-group-text label-text">최종결재자</span>
										<input type="hidden" class="form-control" id="finalAppNo" name="finalAppNo"  value="" required readonly>
										<input type="text" class="form-control" id="finalAppName" name="finalAppName" value="" placeholder="최종결재자 입력" aria-label="최종결재자" required="required" readonly="readonly">
										<span class="input-group-text label-text">참조자</span>
										<input type="hidden" class="form-control" id="refNo" name="refNo" value="" required readonly="readonly">
										<input type="text" class="form-control" id="refName" name="refName" value="" placeholder="참조자 입력" required readonly>
									</div>
								</div>


								<div class="input-group mb-4">
									<div class="input-group">
										<span class="input-group-text label-text">유형</span>
										<select type="text" class="form-select" id="kind" name="kind" required>
											<c:forEach items="${codeList}" var="c">
												<c:if test="${c.commonCode == 'C03'}">
											        <c:if test="${user.depNo == 2}">
											            <option value="${c.commonCode}">${c.descript}</option>
											        </c:if>
											    </c:if>
											    
											    <c:if test="${c.commonCode != 'C03'}">
											        <option value="${c.commonCode}">${c.descript}</option>
											    </c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="text-end">
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#approvalModal">
										결재자 선택
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
											<circle cx="11" cy="11" r="8"></circle>
											<line x1="21" y1="21" x2="16.65" y2="16.65"></line>
										</svg>
									</button>
								</div>
							</div>
							<div class="widget-content widget-content-area blog-create-section mt-4">
								<!-- 보고서 -->
								<div>
									<div id="business" class="kind-field" style="display: none;">
										<div class="input-group mb-4">
											<span class="input-group-text label-text">출장지역</span>
											<input type="text" class="form-control" id="place" name="place">

											<span class="input-group-text label-text">시작날짜</span>
											<input type="datetime-local" class="form-control" id="placeStartDate" name="placeStartDate">

											<span class="input-group-text label-text">종료날짜</span>
											<input type="datetime-local" class="form-control" id="placeEndDate" name="placeEndDate">
										</div>
									</div>

									<div id="sales" class=" kind-field" style="display: none;">
										<div class="input-group mb-4">
											<span class="input-group-text label-text">가맹점</span>
											<select type="text" class="form-select" id="fraNo" name="fraNo">
												<option value="">:::가맹점 선택:::</option>
												<c:forEach items="${franchiseList}" var="f">
													<option value="${f.fraNo}">${f.fname}</option>
												</c:forEach>
											</select>
											<span class="input-group-text label-text">연-월</span>
											<input class="form-control" type="month" id="ym" name="ym">
											<span class="input-group-text label-text">매출액</span>
											<input class="form-control" type="number" id="revenue" name="revenue">
										</div>

									</div>

									<div id="vacation" class="kind-field" style="display: none;">
										<div class="input-group  mb-4">
											<span class="input-group-text label-text">대체업무자</span>
											<input class="form-control" id="subEmpNumber" name="subEmpNumber" type="hidden" readonly>
											<input class="form-control type="text" id="subEmpName" name="subEmpName" placeholder="대체업무자" aria-label="대체업무자" required readonly>
											<span class="input-group-text label-text">직급</span>
											<input class="form-control" type="text"  id="subDept" name="subDept" required readonly>
											<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#subWorkerModal">
												대체업무자 선택
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
													<circle cx="11" cy="11" r="8"></circle>
													<line x1="21" y1="21" x2="16.65" y2="16.65"></line>
												</svg>
											</button>
										</div>
										<div class="input-group mb-4">
											<span class="input-group-text label-text">시작날짜</span>
											<input class="form-control" type="datetime-local" id="vacStartDate" name="vacStartDate">

											<span class="input-group-text label-text">종료날짜</span>
											<input class="form-control" type="datetime-local" id="vacFinishDate" name="vacFinishDate">

											<span class="input-group-text label-text">유형</span>
											<select class="form-select" id="vacationType" name="vacationType">
												<option value="">:::선택:::</option>
												<c:forEach items="${vacationList}" var="v">
													<option value="${v.commonCode}">${v.descript}</option>
												</c:forEach>
											</select>
											<span class="input-group-text label-text">비상연락처</span>
											<input class="form-control" type="text" pattern="(010)\d{3,4}\d{4}" name="urgentPhone" id="urgentPhone" placeholder="01012345678">
										</div>

									</div>

								</div>
								<!-- 보고서 끝 -->
								<div class="input-group mb-4">
									<span class="input-group-text label-text">제 목</span>
									<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" aria-label="제목" >
								</div>
								<div class="input-group">
									<textarea class="form-control mb-4" rows="10" id="textContent" name="textContent"></textarea>
								</div>
								
								<div class="form-group mb-4">
									<input class="form-control file-upload-input" type="file" id="formFile" name="formFile" multiple="multiple">
								</div>
								<div class="text-end">
									<button class="btn btn-primary" type="button" id="btnInsertApproval">제출</button>
								</div>
							</div>
						</div>
					</form>
			</div>
    <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
		</div>
	</div>
    <!-- 결재자 모달 -->
    <div class="modal fade " id="approvalModal" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">결재자 선택</h5>
	            </div>
	            <div class="modal-body container">
	                <div class="row">
					    <div class="col-3 border-end">
					        <h6>부서 목록</h6>
					        <div class="list-group">
					            <c:forEach var="d" items="${deptList}">
					                <button class="btn mb-1 dept" type="button" value="${d.depNo}">${d.dname}</button>
					            </c:forEach>
					        </div>
					    </div>

					    <div class="col-4 d-flex border-end">
					        <div class="flex-grow-1">
					            <h6>직원 목록</h6>
					            <div class="list-group approverList">

					            </div>
					        </div>

					    </div>

					    <div class="col-5">
					        <h6 class="modal-body">중간결재자</h6>
					        <div class="list-group">
				                <div class="input-group">
				                	<!-- 중간결재자 -->
									<button type="button" class="btn btn-primary" onclick="applyOn('midApp')">
									    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle">
									        <circle cx="12" cy="12" r="10"></circle>
									        <line x1="12" y1="8" x2="12" y2="16"></line>
									        <line x1="8" y1="12" x2="16" y2="12"></line>
									    </svg>
									</button>
					                <input class="form-control" id="midAppEmpNo" name="midAppEmpNo" type="hidden" value="" placeholder="중간결재자" readonly="readonly">
					                <input class="form-control" id="midAppEname" name="midAppEname" type="text" value="" placeholder="중간결재자" readonly="readonly">
					                <button type="button" class="btn btn-Warning-Light" onclick="clearInput('midApp')">
					                	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus-circle">
					                		<circle cx="12" cy="12" r="10"></circle>
					                		<line x1="8" y1="12" x2="16" y2="12"></line>
				                		</svg>
			                		</button>
				                </div>
				            </div>

					        <h6 class="modal-body">최종결재자</h6>
				         	<div class="list-group">
				                <div class="input-group">
				                	<button type="button" class="btn btn-primary" onclick="applyOn('finApp')">
									    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle">
									        <circle cx="12" cy="12" r="10"></circle>
									        <line x1="12" y1="8" x2="12" y2="16"></line>
									        <line x1="8" y1="12" x2="16" y2="12"></line>
									    </svg>
									</button>
					                <input class="form-control" id="finalAppEmpNo"  name="finalAppEmpNo" type="hidden" value="" placeholder="최종결재자" readonly>
					                <input class="form-control" id="finalAppEname" name="finalAppEname" type="text" value="" placeholder="최종결재자" readonly required>
					            	<button type="button" class="btn btn-Warning-Light" onclick="clearInput('finalApp')">
					            		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus-circle">
						            		<circle cx="12" cy="12" r="10"></circle>
						            		<line x1="8" y1="12" x2="16" y2="12"></line>
					            		</svg>
				            		</button>
				            	</div>
				            </div>

					        <h6 class="modal-body">참조자</h6>
				         	<div class="list-group">
				                <div class="input-group">
				                	<button type="button" class="btn btn-primary" onclick="applyOn('refApp')">
									    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle">
									        <circle cx="12" cy="12" r="10"></circle>
									        <line x1="12" y1="8" x2="12" y2="16"></line>
									        <line x1="8" y1="12" x2="16" y2="12"></line>
									    </svg>
									</button>
					                <input class="form-control" id="refAppEmpNo" name="refAppEmpNo" type="hidden" value="" placeholder="참조자"  readonly="readonly">
					                <input class="form-control" id="refAppEname" name="refAppEname" type="text" value="" placeholder="참조자"  readonly="readonly">
					            	<button type="button" class="btn btn-Warning-Light" onclick="clearInput('refApp')">
					            		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus-circle">
						            		<circle cx="12" cy="12" r="10"></circle>
						            		<line x1="8" y1="12" x2="16" y2="12"></line>
					            		</svg>
				            		</button>
				            	</div>
				            </div>
					    </div>
					</div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-light-dark" data-bs-dismiss="modal">
	                    <i class="flaticon-cancel-12"></i> 취소
	                </button>
	                <button type="button" class="btn btn-primary" id="btnInsertApprover" ">선택</button>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- 결재자 모달END -->
    <!-- 대체 업무자 모달 START-->
	<div class="modal fade common-employee-modal" id="subWorkerModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">직원 선택</h5>
            </div>
            <div class="modal-body container">
                <div class="row">
					<div class="col-3 border-end">
						<h6>부서 목록</h6>
						<div class="list-group">
							<c:forEach var="d" items="${deptList}">
								<button class="btn mb-1 dept" type="button" value="${d.depNo}">${d.dname}</button>
							</c:forEach>
						</div>
					</div>

					<div class="col-4 d-flex border-end">
						<div class="flex-grow-1">
							<h6>직원 목록</h6>
							<div class="list-group subWorkerList">

							</div>
						</div>

					</div>

					<div class="col-5">
						<h6 class="modal-body">대체업무자</h6>
						<div class="list-group">
							<div class="input-group">
								<!-- 대체업무자 -->
								<button type="button" class="btn btn-primary" onclick="applyOn('subEmp')">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle">
										<circle cx="12" cy="12" r="10"></circle>
										<line x1="12" y1="8" x2="12" y2="16"></line>
										<line x1="8" y1="12" x2="16" y2="12"></line>
									</svg>
								</button>
								<input class="form-control" id="subEmpNo" name="subEmpNo" type="hidden" value="" placeholder="대체업무자" readonly="readonly">
								<input class="form-control" id="subEname" name="subEname" type="text" value="" placeholder="대체업무자" readonly="readonly">
								<button type="button" class="btn btn-Warning-Light" onclick="clearInput('subEmp')">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus-circle">
										<circle cx="12" cy="12" r="10"></circle>
										<line x1="8" y1="12" x2="16" y2="12"></line>
									</svg>
								</button>
							</div>
						</div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light-dark" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="BtnInsertSubEmp" data-bs-dismiss="modal">선택</button>
            </div>
        </div>
    </div>
</div>
</div>

    <!-- END MAIN CONTAINER -->
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    
	<c:if test="${not empty param.successMsg}">
	    <script>
	        alert("${param.successMsg}");  // 메시지 표시
	        window.location.href = "/draft/list"; // 홈으로 이동
	    </script>
	</c:if>

</body>
    <script>
	   $(function () {
		    $('#kind').on('change', function () {
		        let selectedType = $(this).val(); 
	
		        // 모든 유형별 필드 숨기기
		        $('.kind-field').hide().find('input, select').each(function () {
				    if ($(this).is('select')) {
				        $(this).prop('selectedIndex', 0);
				    } else {
				        $(this).val(''); 
				    }
				});
	
		        // 선택된 commonCode에 따라 필드 표시
		        if (selectedType === 'C02') { // 출장 보고서
		            $('#business').show();
		        } else if (selectedType === 'C03') { // 매출 보고서
		            $('#sales').show();
		        } else if (selectedType === 'C04') { // 휴가 보고서
		            $('#vacation').show();
		        }
		    });
		    
		    $('#kind').trigger('change');
		});

		// 중복체크
		let emp = [];

		let midAppSelected = null;
		let finAppSelected = null;
		let refAppSelected = null;
	   	let subEmpSelected = null;
		// 대체업무자, 결재자 if문 분기
		let existEmployee = true;
		$('#subWorkerModal').on('show.bs.modal', function() {
			existEmployee = false;  
		});
		// 모달 닫힐 때
		$('#subWorkerModal').on('hide.bs.modal', function() {
			existEmployee = true; 
		});

		$('.dept').click(function() {
			let deptNo = $(this).val();
			$.ajax({
				url: 'approval/depts/' + deptNo + '/employees',
				method: "GET"
			}).done(function(response) {
				emp = response;
				if (existEmployee) {
					employeeList(emp, '.approverList', 'approverRadio'); // 결재자 모달
				} else {
					employeeList(emp, '.subWorkerList', 'subWorkerRadio'); // 대체업무자 모달
				}  // 직원 목록 표시
			}).fail(function() {
				alert('실패');
			})
		});

		function employeeList(emp, targetList, radioName) {
			let empList = $(targetList);
			empList.empty();


			if (emp && emp.length > 0) {
				emp.forEach(function(item) {
					//console.log(item)

					let selectEmpList = $(`
								<li class="form-check">
									<input type="radio" class="form-check-input" name="\${radioName}" id="\${item.empNo}" value="\${item.empNo}">
									<label class="form-check-label" for="\${item.empNo}">(\${item.descript}) \${item.ename}</label>
								</li>
								`);

					empList.append(selectEmpList);
				});
			}
		}

		// 결재 라인 추가
		function applyOn(type) {
			let radioName = existEmployee ? "approverRadio" : "subWorkerRadio";  // 선택된 사원 찾기
			let selectedEmp = $(`input[name="\${radioName}"]:checked`);
			if (selectedEmp.length === 0) {
				alert('사원을 선택해주세요.');
				return;
			}

			let empNo = selectedEmp.val();  // 사원 번호
			let empInfo = selectedEmp.next().text();
			let dept = empInfo.substring(empInfo.indexOf('(')+1,empInfo.indexOf(')'))
			//console.log(dept)
			let empName = empInfo.substring(empInfo.indexOf(')') + 2);  // 사원 이름만 가져오기

			//  중복 체크크
			if(existEmployee){

				if (type === 'midApp') {
					if (midAppSelected) {
						alert('중간 결재자는 이미 선택되었습니다.');
						return;
					}
					if (empNo === finAppSelected || empNo === refAppSelected) {
						alert('중간 결재자는 이미 최종 결재자나 참조자로 선택된 사원입니다.');
						return;
					}
					midAppSelected = empNo;
					// 사원번호 히든 필드에 입력
					$('#midAppEmpNo').val(empNo); 
					// 이름 필드에 입력
					$('#midAppEname').val(empName); 
				} else if (type === 'finApp') {
					if (finAppSelected) {
						alert('최종 결재자는 이미 선택되었습니다.');
						return;
					}
					if (empNo === midAppSelected || empNo === refAppSelected) {
						alert('최종 결재자는 이미 중간 결재자나 참조자로 선택된 사원입니다.');
						return;
					}
					finAppSelected = empNo;
					$('#finalAppEmpNo').val(empNo);
					$('#finalAppEname').val(empName);
				} else if (type === 'refApp') {
					if (refAppSelected) {
						alert('참조자는 이미 선택되었습니다.');
						return;
					}
					if (empNo === midAppSelected || empNo === finAppSelected) {
						alert('참조자는 이미 중간 결재자나 최종 결재자로 선택된 사원입니다.');
						return;
					}
					refAppSelected = empNo;
					$('#refAppEmpNo').val(empNo);
					$('#refAppEname').val(empName);
				}
			}

			if (type === 'subEmp') {
				$('#subEmpNo').val(empNo);
				$('#subDept').val(dept);
				$('#subEname').val(empName);
			}

			selectedEmp.prop('checked', false);

		}

		// 삭제버튼
		function clearInput(type) {
			if (type === 'midApp') {
				midAppSelected = null;
				$('#midAppEmpNo').val('');
				$('#midAppEname').val('');
			} else if (type === 'finalApp') {
				finAppSelected = null;
				$('#finalAppEmpNo').val('');
				$('#finalAppEname').val('');
			} else if (type === 'refApp') {
				refAppSelected = null;
				$('#refAppEmpNo').val('');
				$('#refAppEname').val('');
			} else if (type === 'subEmp'){
				$('#subEmpNo').val('');
				$('#subEname').val('');
				$('#subDept').val('');
			}
		}
		
		// 결재 라인 입력값 추가
		$('#btnInsertApprover').click(function() {
			if(!$('#finalAppEname').val()){
				alert('최종 결재자를 입력해주세요.');
				return;
			} 
			$('#midAppNo').val($('#midAppEmpNo').val())
			$('#midAppName').val($('#midAppEname').val())
			//console.log($('#finalAppEmpNo').val());
			//console.log($('#finalAppEname').val());
			$('#finalAppNo').val($('#finalAppEmpNo').val())
			$('#finalAppName').val($('#finalAppEname').val())

			$('#refNo').val($('#refAppEmpNo').val())
			$('#refName').val($('#refAppEname').val())
			let modal = bootstrap.Modal.getInstance($('#approvalModal')[0]); 
			modal.hide(); 
			setTimeout(function() {
		        $('.modal-backdrop').remove();
		        $('body').removeClass('modal-open').css({ 'overflow': '', 'padding-right': '' });
		    }, 100);

		});

		// 대체 업무자 입력값 추가
		$('#BtnInsertSubEmp').click(function(){
			
			$('#subEmpNumber').val($('#subEmpNo').val())
			$('#subEmpName').val($('#subEname').val())
			$('#subEmpName').val($('#subEname').val())
			let modal = bootstrap.Modal.getInstance($('#subWorkerModal')[0]); 
			modal.hide(); 
		}) 

		

		function check () {
			if($('#empNo').val() === ''){
				alert('로그인 후 이용 가능합니다')
				return false;
			} else if($('#finalAppNo').val() === ''){
				alert('최종결재자를 선택하세요')
				return false;
			} else if($('#title').val() === ''){
				alert('제목을 입력하세요')
				return false;
			} else if($('#textContent').val() === '') {
				alert('내용을 입력하세요')
				return false;
			}
			return true;
		}

		// form 제출
		$('#btnInsertApproval').click(function () {
			if($('#kind').val() === 'C01'){
				if(check ()) {
					$('#formInsertApproval').submit();
				}
			} else if($('#kind').val() === 'C02') {
				if(check()) {
					
					if($('#place').val() === ''){
						alert('출장 지역을 입력하세요')
						return;
					} else if($('#placeStartDate').val() === '') {
						alert('출장 시작날짜를 입력하세요')
						return;
					} else if($('#placeEndDate').val() === '') {
						alert('출장 종료날짜를 입력하세요')
						return;
					} else if(new Date($('#placeStartDate').val()) > new Date($('#placeEndDate').val())){
						alert('출장 시작날짜가 종료날짜보다 늦을 수 없습니다.');
				        return;
					}
					$('#formInsertApproval').submit();
				}
			} else if($('#kind').val() === 'C03') {
				if(check()) {
					if($('#fraNo').val() === ''){
						alert('가맹점을 선택하세요')
						return;
					} else if($('#ym').val() === '') {
						alert('연월을 입력하세요')
						return;
					} else if($('#revenue').val() === '') {
						alert('매출액을 입력하세요')
						return;
					}
					$('#formInsertApproval').submit();
				}
			} else if($('#kind').val() === 'C04') {
				if(check()) {
					if($('#subEmpNumber').val() === ''){
						alert('대체 업무자를 입력하세요')
						return;
					} else if($('#vacStartDate').val() === '') {
						alert('휴가 시작날짜를 입력하세요')
						return;
					} else if($('#vacFinishDate').val() === '') {
						alert('휴가가 종료날짜를 입력하세요')
						return;
					}  else if($('#vactionType').val() === '') {
						alert('휴가 종류를 선택하세요')
						return;
					} else if(!/^010\d{4}\d{4}$/.test($('#urgentPhone').val())) {
				        alert('전화번호 형식이 올바르지 않습니다. 예: 01000000000');
				        return;
					} else if (new Date($('#vacStartDate').val().trim()) > new Date($('#vacFinishDate').val())) {
			            alert('휴가 시작날짜가 종료날짜보다 늦을 수 없습니다.');
			            return;
			        }
					$('#formInsertApproval').submit();
				}
			}
		});
			
	   </script>
</html>