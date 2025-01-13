<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Account Settings | CORK - Multipurpose Bootstrap Dashboard Template</title>
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>

    <!-- Global Styles -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />

    <!-- Custom Styles -->
    <link rel="stylesheet" href="../src/plugins/src/filepond/filepond.min.css">
    <link rel="stylesheet" href="../src/plugins/src/filepond/FilePondPluginImagePreview.min.css">
    <link href="../src/plugins/src/notification/snackbar/snackbar.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../src/plugins/src/sweetalerts2/sweetalerts2.css">
    <link href="../src/assets/css/light/components/tabs.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../src/assets/css/light/elements/alert.css">
    <link href="../src/plugins/css/light/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/light/notification/snackbar/custom-snackbar.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../src/assets/css/light/forms/switches.css">
    <link href="../src/assets/css/light/components/list-group.css" rel="stylesheet" type="text/css">
    <link href="../src/assets/css/light/users/account-setting.css" rel="stylesheet" type="text/css" />

    <!-- Dark Mode Custom Styles -->
    <link href="../src/plugins/css/dark/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/dark/components/tabs.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../src/assets/css/dark/elements/alert.css">
    <link href="../src/plugins/css/dark/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/dark/notification/snackbar/custom-snackbar.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../src/assets/css/dark/forms/switches.css">
    <link href="../src/assets/css/dark/components/list-group.css" rel="stylesheet" type="text/css">
    <link href="../src/assets/css/dark/users/account-setting.css" rel="stylesheet" type="text/css" />
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
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
                                                <li class="breadcrumb-item"><a href="#">문서</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">결재신청</li>
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
                            <form id="" method="post" action="" class="section general-info">
                                <div class="col-xl-12 col-lg-12 col-md-12 layout-spacing">
                                    <div class="info">
                                        <h1>정보 수정</h1>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-11 mx-auto">
                                            <div class="row">
                                              
												
												<div class="col-xl-2 col-lg-12 col-md-4">
												    <div class="profile-image mt-4 pe-md-4">
												        <!-- 두 번째 파일 업로드 및 삭제 버튼 -->
												        <div class="img-uploader-content">
												            <input type="file" class="filepond" name="filepond" accept="image/png, image/jpeg, image/gif"/>
												        </div>
												    </div>
												</div>
												
												
                                                <div class="col-xl-10 col-lg-12 col-md-8 mt-md-0 mt-4">
                                                    <div class="form">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="fullName">이름</label>
                                                                    <input type="text" class="form-control mb-3" id="ename" name="ename">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="empNo">사원번호</label>
                                                                    <input type="text" class="form-control mb-3" id="empNo" name="empNo">
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="country">부서</label>
                                                                    <select class="form-select mb-3" id="depNo" name="depNo">
                                                                    <c:forEach items="${deptList}" var="d">
								            							<option value="${d.depNo}">${d.dname}</option>
								            						</c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="gender">성별</label>
                                                                    <select class="form-select mb-3" id="gender" name="gender">
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="address">주소</label>
                                                                    <input type="text" class="form-control mb-3" id="address">
                                                                    <input type="text" id="postCode" name="postCode" placeholder="우편번호" >
														            <input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
                                                                </div>
                                                            </div>
														            
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="location">직급</label>
                                                                    <select class="form-select mb-3" id="location" readonly>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="phone">연락처</label>
                                                                    <input type="text" class="form-control mb-3" id="phone" name="phone">
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="email">이메일</label>
                                                                    <input type="email" class="form-control mb-3" id="email" name="email">
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="extNum">내선번호</label>
                                                                    <input type="text" class="form-control mb-3" id="extNum" name="extNum">
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="birthdate">생일</label>
                                                                    <input type="date" class="form-control mb-3" id="birth" name="birth">
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
                            </form>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT AREA -->

        <!-- BEGIN FOOTER -->
        <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
        <!-- END FOOTER -->
    </div>

    

   <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
<script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
<script src="../src/plugins/src/waves/waves.min.js"></script>
<script src="../layouts/vertical-light-menu/app.js"></script>
<!-- END GLOBAL MANDATORY SCRIPTS -->

    <!--  BEGIN CUSTOM SCRIPTS FILE  -->
<script src="../src/plugins/src/filepond/filepond.min.js"></script>
<script src="../src/plugins/src/filepond/FilePondPluginFileValidateType.min.js"></script>
<script src="../src/plugins/src/filepond/FilePondPluginImageExifOrientation.min.js"></script>
<script src="../src/plugins/src/filepond/FilePondPluginImagePreview.min.js"></script>
<script src="../src/plugins/src/filepond/FilePondPluginImageCrop.min.js"></script>
<script src="../src/plugins/src/filepond/FilePondPluginImageResize.min.js"></script>
<script src="../src/plugins/src/filepond/FilePondPluginImageTransform.min.js"></script>
<script src="../src/plugins/src/filepond/filepondPluginFileValidateSize.min.js"></script>
<script src="../src/plugins/src/notification/snackbar/snackbar.min.js"></script>
<script src="../src/plugins/src/sweetalerts2/sweetalerts2.min.js"></script>
<script src="../src/assets/js/users/account-settings.js"></script>
<!--  END CUSTOM SCRIPTS FILE  -->	

<script>
function sample4_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var roadAddr = data.roadAddress; // 도로명 주소 변수
                  var extraRoadAddr = ''; // 참고 항목 변수

                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraRoadAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraRoadAddr !== ''){
                      extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  let resultAddress = '';
                  /*
                  document.getElementById('sample4_postcode').value = data.zonecode;
                  document.getElementById("sample4_roadAddress").value = roadAddr;
                  document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                  */
                  resultAddress = ' '+ roadAddr + ' ' + data.jibunAddress
                  // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                  if(roadAddr !== ''){
                      //document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                     resultAddress += ' ' + extraRoadAddr;
                  } else {
                      //document.getElementById("sample4_extraAddress").value = '';
                  }
                  document.getElementById('postCode').value = data.zonecode;
                  document.getElementById('address').value = resultAddress;
                  var guideTextBox = document.getElementById("guide");
                  // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                  if(data.autoRoadAddress) {
                      var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                      guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                      guideTextBox.style.display = 'block';

                  } else if(data.autoJibunAddress) {
                      var expJibunAddr = data.autoJibunAddress;
                      guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                      guideTextBox.style.display = 'block';
                  } else {
                      guideTextBox.innerHTML = '';
                      guideTextBox.style.display = 'none';
                  }
              }
          }).open();
      }
   </script>
</body>
</html>
