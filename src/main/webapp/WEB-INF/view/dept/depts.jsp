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

	<!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="${pageContext.request.contextPath}/src/plugins/src/animate/animate.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->

    <!-- BEGIN THEME GLOBAL STYLES -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.css">
    
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/plugins/css/light/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/src/assets/css/dark/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/plugins/css/dark/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->

    <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/custom_dt_custom.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/dark/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/dark/table/datatable/custom_dt_custom.css">
    <!-- END PAGE LEVEL CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/carousel.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/tabs.css" rel="stylesheet" type="text/css">
    
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/components/carousel.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/components/tabs.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/filepond/filepond.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImagePreview.min.css">    
    <link href="${pageContext.request.contextPath}/src/plugins/css/light/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/plugins/css/dark/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />
    <!--  END CUSTOM STYLE FILE  -->
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
       
    <!-- 페이지 제목 입력칸 -->
    <title>부서 관리</title>
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
                                                <li class="breadcrumb-item"><a href="#">회사/부서 정보 관리</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">부서</li>
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
                
                 <div class="account-settings-container layout-top-spacing">
                      <div class="account-content">
                          <div class="row mb-3">
                              <div class="col-md-12">
                              <h2>부서 관리</h2>
                              	<div class="tab-pane fade show active" id="전체-tab-pane" role="tabpanel" aria-labelledby="tab1">
                                  	<div class="widget-content widget-content-area br-8">
		            					<div class="container" style="margin-top: 50px; margin-bottom: 300px; width: 100%;">
		            					
		            						 <div style="text-align: right; margin-bottom: 10px;">
		                                        <a class="btn btn-secondary" id="insertBoard" href="${pageContext.request.contextPath}/depts/insert" data-bs-toggle="modal" data-bs-target="#inputFormModal" onclick="setModalData(this)">
	                                       			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
	                                       			<line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg> 등록</a>
	                                       	</div>
	                                       	
	                                       	<!-- Modal - insert-->
												<div class="modal fade inputForm-modal" id="inputFormModal" tabindex="-1" role="dialog" aria-labelledby="inputFormModalLabel" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered" role="document">
														<div class="modal-content">
															<div class="modal-header" id="inputFormModalLabel">
																<h5 class="modal-title">부서 등록</h5>
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
																	<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
																		<line x1="18" y1="6" x2="6" y2="18"></line> <line x1="6" y1="6" x2="18" y2="18"></line></svg>
																</button>
															</div>
															
															<form id="formInsert" action="${pageContext.request.contextPath}/depts/insert" method="post">
																<div class="modal-body">
																	<div class="mb-3">
																		<label for="dname" class="form-label">이름</label> 
																		<input type="text" class="form-control" id="insertDname" name="dname" required>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-light-danger mt-2 mb-2 btn-no-effect" data-bs-dismiss="modal">취소</button>
																	<button id="btnInsert" type="button" class="btn btn-primary mt-2 mb-2 btn-no-effect">등록</button>
																</div>
															</form>
		
														</div>
													</div>
												</div> <!-- END Modal -->
											
							                <table id="style-3" class="table style-3 dt-table-hover">
							                    <thead>
							                        <tr>
							                            <th style="width: 10%;">번호</th>
							                            <th>부서명</th>
							                            <th></th>
							                            <th></th>
							                        </tr>
							                    </thead>
							                    <tbody>
							                    	<c:forEach var="d" items="${deptList}">
								                        <tr>
								                            <td>${d.depNo}</td>
								                            <td>${d.dname}</td>
								                            <td>
								                            	<button type="button" class="btn btn-secondary btn-rounded mb-2 me-4" data-bs-toggle="modal" data-bs-target="#updateFormModal" 
								                            		data-depNo="${d.depNo}" data-dname="${d.dname}" onclick="setModalData(this)">수정</button>
								                            	<!-- Modal - update -->
																	<div class="modal fade updateForm-modal" id="updateFormModal" tabindex="-1" role="dialog" aria-labelledby="updateFormModalLabel" aria-hidden="true">
																		<div class="modal-dialog modal-dialog-centered" role="document">
																			<div class="modal-content">
																				<div class="modal-header" id="updateFormModalLabel">
																					<h5 class="modal-title">부서 수정</h5>
																					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true">
																						<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
																							stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
																							<line x1="18" y1="6" x2="6" y2="18"></line> <line x1="6" y1="6" x2="18" y2="18"></line></svg>
																					</button>
																				</div>
																				
																				<form id="formUpdate" action="${pageContext.request.contextPath}/depts/update" method="post">
																					<div class="modal-body">
																						<div class="mb-3">
																							<label for="depNo" class="form-label">번호</label> 
																							<input type="text" class="form-control" id="depNo" name="depNo" value="${d.depNo}" readonly>
																						</div>
																						<div class="mb-3">
																							<label for="dname" class="form-label">이름</label> 
																							<input type="text" class="form-control" id="dname" name="dname" value="${d.dname}" required>
																						</div>
																					</div>
																					<div class="modal-footer">
																						<button type="button" class="btn btn-light-danger mt-2 mb-2 btn-no-effect" data-bs-dismiss="modal">취소</button>
																						<button id="btnUpdate" type="button" class="btn btn-primary mt-2 mb-2 btn-no-effect">수정</button>
																					</div>
																				</form>
			
																			</div>
																		</div>
																	</div> <!-- END Modal - update -->
								                            </td>
								                            <td>
								                            	<div class="widget-content warning">
								                            		<button type="button" class="btn btn-rounded mb-2 me-4 warning
								                            			<c:choose>
																	        <c:when test="${d.activeYn == 'Y'}">
																	            btn-dark
																	        </c:when>
																	        <c:when test="${d.activeYn == 'N'}">
																	            btn-light-dark
																	        </c:when>
																	    </c:choose>" 
																	    data-depNo="${d.depNo}" data-activeYn="${d.activeYn}" onclick="setModalData(this)">
									                            			<c:choose>
																			    <c:when test="${d.activeYn == 'Y'}">
																			        활성화
																			    </c:when>
																			    <c:when test="${d.activeYn == 'N'}">
																			        비활성화
																			    </c:when>
																			</c:choose>
								                            		</button>
								                            	</div>
								                            </td>
								                        </tr>
													</c:forEach>
							                    </tbody>
							                </table>
							                
						                </div> <!-- End Container -->
						                
					             	</div>
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

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/highlight/highlight.pack.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/assets/js/dashboard/dash_1.js"></script>
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->

    <!-- BEGIN THEME GLOBAL STYLE -->
    <script src="${pageContext.request.contextPath}/src/assets/js/scrollspyNav.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/custom-sweetalert.js"></script>
    <!-- END THEME GLOBAL STYLE --> 
    
    <script>
    // 모달창마다 데이터 받기
	function setModalData(button) {
	    const depNo = button.getAttribute('data-depNo');
	    const dname = button.getAttribute('data-dname');
	
	    document.getElementById('depNo').value = depNo;
	    document.getElementById('dname').value = dname;
	}
	</script>
    
    <script>
 	// 등록 버튼 클릭 시 폼 제출
   	$(document).on('click', '#btnInsert', function() {
        if ($('#insertDname').val() === '') {
            alert('이름을 입력하세요');
            return;
        } else {
        	console.log('등록 폼 제출');
            $('#formInsert').submit();
        }
    });
 
	 // 수정 버튼 클릭 시 폼 제출
    $(document).on('click', '#btnUpdate', function() {
        if ($('#dname').val() === '') {
            alert('수정할 이름을 입력하세요');
            return;
        } else {
        	console.log('수정 폼 제출');
            $('#formUpdate').submit();
        }
    });
	 
	 // 활성화/비활성화 버튼
	 document.addEventListener('DOMContentLoaded', function() {
		 document.querySelectorAll('.warning').forEach(button => {
	        button.addEventListener('click', function(event) {
	            event.preventDefault(); // 기본 링크 동작 방지
	            const depNo = this.getAttribute('data-depNo'); // 데이터 속성에서 depNo 추출
	            console.log('depNo:', depNo);
	            const activeYn = button.getAttribute('data-activeYn') === 'Y' ? 'N' : 'Y'; 
	            
	         	// 버튼 색깔 변경
	            if (activeYn === 'Y') {
	                this.classList.remove('btn-light-dark');
	                this.classList.add('btn-dark');
	            } else {
	                this.classList.remove('btn-dark');
	                this.classList.add('btn-light-dark');
	            }
	            
	            this.setAttribute('data-depNo', depNo);
	            this.setAttribute('data-activeYn', activeYn); // data-activeYn 값 업데이트
	            console.log("update activeYn: "+activeYn);
	            console.log("전송 값:", { depNo: parseInt(depNo, 10), activeYn: activeYn });
	            
			    Swal.fire({ // sweet alert
			        title: '부서를 활성화/비활성화 하시겠습니까?',
			        icon: 'question',
			        showCancelButton: true,
			        confirmButtonColor: '#3085d6',
			        cancelButtonColor: '#d33',
			        confirmButtonText: 'Yes'
			    }).then((result) => {
			        if (result.isConfirmed) {
			        	$.ajax({
		                    url: `\${window.location.origin}/depts/activeYN`,
		                    type: 'POST',
		                    data: { depNo:  parseInt(depNo, 10), activeYn: activeYn},
		                    success: function(response) {
		                    	Swal.fire('완료되었습니다','success')
		                    	location.reload(); // 페이지 새로 고침
		                    },
	                        error: function(xhr, status, error) {
	                            console.error("Error: ", error);
	                            console.log("Response Text: ", xhr.responseText);
	                            Swal.fire('오류 발생', '업데이트에 실패했습니다.', 'error');
	                        }
			        	});
			        }
			    });
			});
		});
	});
    </script>

</body>
</html>