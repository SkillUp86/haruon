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
    <title>Haruon | 마이페이지</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>

    <!-- Global Styles -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Custom Styles -->
    
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
    <style>
	.form-control[readonly] {
		background-color: #fff !important;
		color: #000 !important;
	}
    
	.author-img {
    width: 200px; /* 원하는 너비 */
    height: 200px; /* 원하는 높이 */
    background-size: cover; 
    background-position: center; /* 이미지 중앙 정렬 */
    border-radius: 50%; /* 원형으로 만들기 */
     display: block;
    margin: 0 auto;
	}
	.profile-image-area {
    text-align: center;
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
                                                <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">정보</li>
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
                    <div class="tab-pane fade show active" id="animated-underline-home" role="tabpanel" aria-labelledby="animated-underline-home-tab">
                        <div class="row">
                            <div id="" class="widget-content widget-content-area br-8">
                                <div class="col-xl-12 col-lg-12 col-md-12 layout-spacing">
                                    <div class="info">
                                        <h4>정보</h4>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-11 mx-auto">
                                            <div class="row">
												<div class="col-xl-2 col-lg-12 col-md-4">
												    <div class="profile-image mt-4 pe-md-4">
												       <div class="profile-image-area mb-2">
								                            <img class="author-img mb-2" src="${pageContext.request.contextPath}/uploadProfile/${e.fileName}.${e.ext}" id="author-img">
								                            <button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal" data-bs-target="#profileModal">
                                                                이미지 변경
                                                            </button>
									                    </div>
												    </div>
												</div>
												
                                                <div class="col-xl-10 col-lg-12 col-md-8 mt-md-0 mt-4">
                                                    <div class="form">
                                                        <div class="row">
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
                                                                    <input class="form-control mb-3" value="${e.location}" id="depNo" name="depNo" readonly>
                                                                    
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
                                                                    <input type="text" class="form-control mb-3" value="${e.postCode}" id="postCode" name="postCode" value="" placeholder="우편번호" >
                                                                    <input type="text" class="form-control mb-3" value="${e.address}" id="address" name="address" value="" placeholder="주소" >
                                                                </div>
                                                                <div class="form-group">
														            <input type="button" class="btn btn-warning mb-3" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
													            </div>
                                                            </div>
														            
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="location">직급</label>
                                                                    <input class="form-control mb-3" value="${e.location}" id="location" name="location" readonly>
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
                                                                    <input type="email" class="form-control mb-3" value="${e.email}" id="email" name="email" readonly >
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

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="password">비밀번호 변경</label>
                                                                    <input type="password" class="form-control mb-3" id="password" name="password">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="password">서명 추가</label>
                        											<input type="file" name="empfNo" id="empfNo" class="goodsFile form-control">
                                                                </div>
                                                            </div>

                                                            <div class="col-md-12 mt-1">
                                                                <div class="form-group text-end">
                                                                    <button class="btn btn-secondary">변경</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
<!-- Modal -->

<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="profileImageModalLabel">프로필 이미지 변경</h5>
            </div>
            <form id="FormUploadProfile" action="${pageContext.request.contextPath}/upload/profile" method="post" enctype="multipart/form-data">
                <div class="modal-body container">
                    <div class="modal-body">
                        <input class="form-control file-upload-input" type="file" id="file" name="file">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button id="btnUploadProfile" type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 모달END -->
    

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
	$('#btnUploadProfile').click(function(){
        $('#FormUploadProfile').submit();
    })

	
</script>
</script>
</body>
</html>
