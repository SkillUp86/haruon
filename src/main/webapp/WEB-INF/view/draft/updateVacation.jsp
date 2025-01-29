<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
            <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico" />
            <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css"
                rel="stylesheet" type="text/css" />
            <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/approval/draft.css">

            <!-- BEGIN GLOBAL MANDATORY STYLES -->
            <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet"
                type="text/css" />
            <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css"
                rel="stylesheet" type="text/css" />
            <!-- END GLOBAL MANDATORY STYLES -->

            <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
            <link href="${pageContext.request.contextPath}/src/plugins/src/apex/apexcharts.css" rel="stylesheet"
                type="text/css">
            <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
            <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/assets/css/light/forms/switches.css">
          	<link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
		    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/carousel.css" rel="stylesheet" type="text/css">
		    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css" />
		    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/tabs.css" rel="stylesheet" type="text/css">
			<link href="${pageContext.request.contextPath}/src/assets/css/light/elements/infobox.css" rel="stylesheet" type="text/css" />
			<link href="${pageContext.request.contextPath}/src/assets/css/light/elements/color_library.css" rel="stylesheet" type="text/css" />
            <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->


            <!-- 페이지 제목 입력칸 -->
            <title>Haruon | 내 문서</title>
            <!-- 페이지 제목 입력칸 -->
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
                                        <a href="javascript:void(0);" class="btn-toggle sidebarCollapse"
                                            data-placement="bottom">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                class="feather feather-menu">
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
                                                        <li class="breadcrumb-item"><a href="#">내문서함</a></li>
                                                        <li class="breadcrumb-item active" aria-current="page">
                                                            ${d.draftType} 문서</li>
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
                                <div class="widget-content widget-content-area">
                                    <div class="row mb-4">
                                        <div class="col-sm-12">
                                            <div class="container">
                                                <div class="bold-box">
                                                    <h1>
                                                        <div class="mt-4 mb-4">
                                                            ${d.draftType} 결재
                                                        </div>
                                                    </h1>
                                                    <br><br><br><br><br><br><br><br><br>

                                                    <form id="formUpdateVacation" action="${pageContext.request.contextPath}/draft/update/vacationDraft" method="post" enctype="multipart/form-data">
                                                        <div class="input-group mb-2 mt-4">
                                                            <div class="input-group">
                                                                <span class="input-group-text label-text">문서번호</span>
                                                                <input class="form-control" type="hidden" name="type" value="${d.type}" readonly>
                                                                <input class="form-control" name="draNo" value="${d.draNo}" readonly>
                                                            </div>
                                                            <div class="input-group">
                                                                <span class="input-group-text label-text">기안부서</span>
                                                                <input class="form-control" value="${d.deptName}"
                                                                    readonly>
                                                                <span class="input-group-text label-text">직위</span>
                                                                <input class="form-control" value="${d.location}"
                                                                    readonly>
                                                            </div>

                                                            <div class="input-group">
                                                                <span class="input-group-text label-text">기안자</span>
                                                                <input class="form-control" value="${d.drafterName}"
                                                                    readonly>
                                                                <span class="input-group-text label-text">기안일자</span>
                                                                <input class="form-control" value="${d.createDate}"
                                                                    readonly>
                                                            </div>
                                                            <div class="input-group">
                                                        	<div class="input-group">
																<span class="input-group-text label-text">대체업무자</span>
																<input class="form-control" value="${d.subEmpNo}" id="subEmpNumber" name="subEmpNumber" type="hidden" readonly>
																<input class="form-control" value="${d.subEmpName}" type="text" id="subEmpName" placeholder="대체업무자" aria-label="대체업무자" required readonly>
																<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#subWorkerModal">
																	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
																		<circle cx="11" cy="11" r="8"></circle>
																		<line x1="21" y1="21" x2="16.65" y2="16.65"></line>
																	</svg>
																</button>
															</div>
															<div class="input-group">
																<span class="input-group-text label-text">부서</span>
																<input class="form-control" value="${d.subEmpDept}" type="text"  id="subDept" name="subDept" placeholder="대체업무자 부서 입력" aria-label="대체업무자 부서"  required readonly>
															
															</div>
														</div>
														<div class="input-group">
															<span class="input-group-text label-text">유형</span>
															<select class="form-select" id="kind" name="kind">
																<option value="${d.kind}">${d.vacType}</option>
																<c:forEach items="${vactionList}" var="v">
																	<option value="${v.commonCode}">${v.descript}</option>
																</c:forEach>
															</select>
															<span class="input-group-text label-text">비상연락처</span>
															<input class="form-control" value="${d.emergPhone}" type="text" pattern="(010)-\d{3,4}-\d{4}" name="urgentPhone" id="urgentPhone" placeholder="010-0000-0000" required>
														</div>
														<div class="input-group mb-2">
															<span class="input-group-text label-text">시작날짜</span>
															<input class="form-control" value="${d.vacStartDate}" type="datetime-local" id="startDate" name="startDate" required>
													
															<span class="input-group-text label-text">종료날짜</span>
															<input class="form-control" value="${d.vacFinishDate}" type="datetime-local" id="finishDate" name="finishDate" required>
														</div>
														</div>
                                                        <div class="input-group mb-2">
                                                            <div class="input-group">
                                                                <span class="input-group-text label-text">제목</span>
                                                                <input class="form-control" type="text" id="title" name="title" value="${d.title}" required>
                                                            </div>
                                                            <div class="input-group mb-3">
                                                                <span class="input-group-text label-text">첨부파일</span>
                                                                <c:if test="${draftFiles.isEmpty()}">
                                                                    <input class="form-control" value="첨부파일 없음"
                                                                        readonly>
                                                                </c:if>
                                                                <c:if test="${!draftFiles.isEmpty()}">
                                                                    <div class="d-flex flex-wrap">
                                                                        <c:forEach var="f" items="${draftFiles}">
                                                                            &nbsp;
                                                                           <a href="${pageContext.request.contextPath}/upload/draft/${f.fileName}.${f.ext}" class="btn btn-dark mt-1 file">
																		        ${f.originName}.${f.ext}
																		    </a>
				                                                            <button
																				type="button" class="btn btn-danger mt-1 file delete-btn" 
																		        data-url="${pageContext.request.contextPath}/${d.type}/delete/${f.drafNo}/file/${d.draNo}">
																		        삭제
																		    </button>
                                                                        </c:forEach>
                                                                    </div>
                                                                </c:if>
                                                            </div>
                                                            <div class="input-group">
                                                                <textarea class="form-control" rows="10" id="textContent" name="textContent" required>${d.content}</textarea>
                                                            </div>
                                                        </div>
                                                        <c:if test="${d.referEmpNo != null}">
                                                            <div class="input-group mb-2">
                                                                <div class="input-group">
                                                                    <p class="black-text">
                                                                        <strong>참조자:${d.referName}</strong>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </c:if>

                                                        <div class="form-group mb-4">
				                                            <input class="form-control file-upload-input" type="file" id="formFile" name="formFile" multiple="multiple">
				                                        </div>
                                                        <c:if test="${msg != null}">
                                                            <div class="col-xxl-12 col-md-12 mb-4">
                                                                <div class="alert alert-warning" role="alert">
                                                                        ${msg}
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                         <div class="col-xxl-12 col-md-12 mb-4">
				                                            <button id="btnUpdateVacation" type="button" class="btn btn-primary w-100">등록</button>
				                                        </div>
                                                    </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
                    </div>
                </div>
            </div>
            <!-- 대체 업무자 모달 START-->
	<div class="modal fade" id="subWorkerModal" tabindex="-1" role="dialog" aria-hidden="true">
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
							<div class="list-group" id="employeeSubList">
							
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
								<input class="form-control" id="subEmpNo" name="subEmpNo" type="hidden" value="" placeholder="중간결재자" readonly="readonly">
								<input class="form-control" id="subEname" name="subEname" type="text" value="" placeholder="중간결재자" readonly="readonly">
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
            
            <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
            <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/apex/apexcharts.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
            <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
            <script>
            $(document).ready(function () {
                // 삭제 버튼 클릭 이벤트 핸들러
                $(".delete-btn").click(function () {
                    const $button = $(this);
                    const deleteUrl = $button.data("url");

                    // AJAX 요청 보내기
                    $.ajax({
                        url: deleteUrl,
                        type: "delete",
                        success: function () {
                            alert("삭제되었습니다.");
                            // 해당 파일 링크와 삭제 버튼을 제거
                            $button.prev("a").remove(); 
                            $button.remove(); 
                        },
                        error: function (xhr, status, error) {
                            console.error("Error:", error);
                            alert("삭제 실패");
                        }
                    });
                });
	    	    $('.dept').click(function() {
	    		   //debugger;
	    		   let deptNo = $(this).val();
	    		   $.ajax({
	    			   url: '/depts/'+deptNo+'/employees'
	    			 , method: "GET"
	    			}).done(function(response) {
	    				//console.log(response);
	    				employeeList(response);
	    			}).fail(function() {
	    				alert('실패');
	    			})
	    		})
            });
	    		// 중복체크
	    		let emp = [];
	
	    		// 대체업무자
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
	    				url: '/depts/' + deptNo + '/employees',
	    				method: "GET"
	    			}).done(function(response) {
	    				//console.log('응답 데이터:', response);
	    				emp = response;
	    				employeeList(emp);  // 직원 목록 표시
	    			}).fail(function() {
	    				alert('실패');
	    			})
	    		});
	
	    		function employeeList(emp) {
	    			let empSubList = $('#employeeSubList');
	    			empSubList.empty();
	
	    			if (emp && emp.length > 0) {
	    				emp.forEach(function(item) {
	    					//console.log(item)
	
	    					let selectEmpList = $(`
	    								<li class="form-check">
	    									<input type="radio" class="form-check-input" name="employeeRadio" id="\${item.empNo}" value="\${item.empNo}">
	    									<label class="form-check-label" for="\${item.empNo}">(\${item.descript}) \${item.ename}</label>
	    								</li>
	    								`);
	    					
	    					empSubList.append(selectEmpList);
	    				});
	    			} 
	    		}
	
	    		// 결재 라인 추가
	    		function applyOn(type) {
	    			let selectedEmp = $('input[name="employeeRadio"]:checked');  // 선택된 사원 찾기
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
	
	    			if (type === 'subEmp') {
	    					$('#subEmpNo').val(empNo);
	    					$('#subDept').val(dept);
	    					$('#subEname').val(empName);
	    				}
	    			
	    			selectedEmp.prop('checked', false);
	
	    		}
	
	    		// 삭제버튼
	    		function clearInput(type) {
	    			if (type === 'subEmp'){
	    				$('#subEmpNo').val('');
	    				$('#subEname').val('');
	    				$('#subDept').val('');
	    			}
	    		}
	
	    		// 대체 업무자 입력값 추가
	    		$('#BtnInsertSubEmp').click(function(){
	    			
	    			$('#subEmpNumber').val($('#subEmpNo').val())
	    			$('#subEmpName').val($('#subEname').val())
	    			$('#subEmpName').val($('#subEname').val())
	    			let modal = bootstrap.Modal.getInstance($('#subWorkerModal')[0]); 
	    			modal.hide(); 
	    		}) 
	    		
	    		$('#btnUpdateVacation').click(function(){
	    			
	    			if($('#subEmpNumber').val() == '') {
	    				alert('대체업무자 입력은 필수입니다.')
	    				return;
	    			} else if($('#kind').val() == '') {
	    				alert('유형을 선택해주세요.')
	    				return;
	    			} else if($('#urgentPhone').val() == '') {
	    				alert('비상연락처를 입력해주세요.')
	    				return;
	    			} else if($('#startDate').val() == '') {
	    				alert('시작날짜를 선택해주세요.')
	    				return;
	    			} else if($('#finishDate').val() == '') {
	    				alert('종료날짜를 선택해주세요.')
	    				return;
	    			} else if($('#title').val() == '') {
	    				alert('제목을 입력해주세요.')
	    				return;
	    			} else if(!$('#textContent').val()) {
	    				alert('내용을 입력해주세요.')
	    				return;
	    			} 
	    			
	    			$('#formUpdateVacation').submit();
	    		})
           
    		</script>
        </body>
        </html>