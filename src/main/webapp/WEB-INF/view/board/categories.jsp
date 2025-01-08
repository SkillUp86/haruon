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

	<!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="../src/plugins/src/animate/animate.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->

    <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="../src/plugins/src/table/datatable/datatables.css">

    <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/table/datatable/custom_dt_custom.css">

    <link rel="stylesheet" type="text/css" href="../src/plugins/css/dark/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/dark/table/datatable/custom_dt_custom.css">
    <!-- END PAGE LEVEL CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="../src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/components/carousel.css" rel="stylesheet" type="text/css">
    <link href="../src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/components/tabs.css" rel="stylesheet" type="text/css">
    
    <link href="../src/assets/css/dark/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/dark/components/carousel.css" rel="stylesheet" type="text/css">
    <link href="../src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/dark/components/tabs.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="../src/plugins/src/filepond/filepond.min.css">
    <link rel="stylesheet" href="../src/plugins/src/filepond/FilePondPluginImagePreview.min.css">    
    <link href="../src/plugins/css/light/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/dark/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />
    <!--  END CUSTOM STYLE FILE  -->
       
    <!-- 페이지 제목 입력칸 -->
    <title>카테고리 관리</title>
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
                                                <li class="breadcrumb-item active" aria-current="page">카테고리 관리</li>
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
                              <h2>카테고리 관리</h2>
                              	<div class="tab-pane fade show active" id="전체-tab-pane" role="tabpanel" aria-labelledby="tab1">
                                  	<div class="widget-content widget-content-area br-8">
		            					<div class="container" style="margin-top: 50px; margin-bottom: 300px; width: 100%;">
							                <table id="style-3" class="table style-3 dt-table-hover">
							                    <thead>
							                        <tr>
							                            <th>번호</th>
							                            <th>이름</th>
							                            <th></th>
							                            <th></th>
							                        </tr>
							                    </thead>
							                    <tbody>
							                    	<c:forEach var="c" items="${categoryList}">
								                        <tr>
								                            <td>${c.catNo}</td>
								                            <td>${c.catName}</td>
								                            <td>
								                            	<a href="${pageContext.request.contextPath}/board/category/update" class="btn btn-secondary btn-rounded mb-2 me-4" data-bs-toggle="modal" data-bs-target="#inputFormModal"
								                            		data-catno="${c.catNo}" data-catname="${c.catName}" onclick="setModalData(this)">수정</a>
								                            </td>
								                            <td>
								                            	<a href="${pageContext.request.contextPath}/board/category/delete" class="btn btn-dark btn-rounded mb-2 me-4">삭제</a>
								                            </td>
								                        </tr>
								                        <!-- Modal -->
											             <div class="modal fade inputForm-modal" id="inputFormModal" tabindex="-1" role="dialog" aria-labelledby="inputFormModalLabel" aria-hidden="true">
											                <div class="modal-dialog modal-dialog-centered" role="document">
											                  <div class="modal-content">
											
											                    <div class="modal-header" id="inputFormModalLabel">
											                        <h5 class="modal-title">카테고리 수정</h5>
											                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"><svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button>
											                    </div>
											                    
											                    <form id="formUpdate" action="${pageContext.request.contextPath}/category/update" method="post">
											                    	<div class="modal-body">
													                    <div class="mb-3">
													                        <label for="catNo" class="form-label">번호</label>
													                        <input type="text" class="form-control" id="catNo" name="catNo" value="${c.catNo}" readonly>
													                    </div>
													                    <div class="mb-3">
													                        <label for="catName" class="form-label">이름</label>
													                        <input type="text" class="form-control" id="catName" name="catName" value="${c.catName}">
													                    </div>
												                    </div>
												                    <div class="modal-footer">
												                        <button type="button" class="btn btn-light-danger mt-2 mb-2 btn-no-effect" data-bs-dismiss="modal">취소</button>
												                        <button id="btnUpdate" type="button" class="btn btn-primary mt-2 mb-2 btn-no-effect" data-bs-dismiss="modal">수정</button>
												                    </div>
												                 </form>
												                 
											                  </div>
											               	</div>
											            	</div>
								                     </c:forEach>
							                    </tbody>
							                </table>
						                </div>
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
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <script src="../src/assets/js/template.js""></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="../src/plugins/src/apex/apexcharts.min.js"></script>
    <script src="../src/assets/js/dashboard/dash_1.js"></script>
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    
    <script>
    // 모달창마다 데이터 받기
	function setModalData(button) {
	    const catNo = button.getAttribute('data-catno');
	    const catName = button.getAttribute('data-catname');
	
	    document.getElementById('catNo').value = catNo;
	    document.getElementById('catName').value = catName;
	}
	</script>
    
    <script>
	 // 수정 버튼 클릭 시 폼 제출
    $('#inputFormModal').on('click', '#btnUpdate', function() {
        if ($('#catName').val() === '') {
            alert('수정할 이름을 입력하세요');
            return;
        } else {
            $('#formUpdate').submit();
        }
    });
	});
    </script>

</body>
</html>