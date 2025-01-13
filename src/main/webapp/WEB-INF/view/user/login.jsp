<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>SignIn Boxed | CORK - Multipurpose Bootstrap Dashboard Template </title>
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

<!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
<link href="../src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
<link href="../src/assets/css/dark/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/authentication/auth-boxed.css" rel="stylesheet" type="text/css" />
    
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/dark/authentication/auth-boxed.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    
</head>
<body class="form">

    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->

    <div class="auth-container d-flex">

        <div class="container mx-auto align-self-center">
    
            <div class="row">
    
                <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-8 col-12 d-flex flex-column align-self-center mx-auto">
                    <div class="card mt-3 mb-3">
                        <div class="card-body">
    
                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    
                                    <h2>Sign In</h2>
                                    <p>Enter your email and password to login</p>
                                    
                                </div>
                                <div class="col-md-12">
								    <form id="empLogin" action="${pageContext.request.contextPath}/loginSuccess" method="post" novalidate>
								        <div class="form-row">
								            <!-- 사원 번호 -->
								            <div class="col-md-12 mb-4">
								                <label for="empNo" class="form-label">이메일</label>
								                <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" required>
								                <div class="valid-feedback">입력완료</div>
								                <div class="invalid-feedback">이메일을 입력해주세요</div>
								            </div>
								            
								            <!-- 비밀번호 -->
								            <div class="col-md-12 mb-4">
								                <label for="empPw" class="form-label">비밀번호</label>
								                <input type="password" class="form-control" id="empPw" name="empPw" placeholder="비밀번호를 입력하세요" required>
								                <div class="valid-feedback">입력완료</div>
								                <div class="invalid-feedback">비밀번호를 입력해주세요</div>
								            </div>
								        </div>
								
								        <!-- 제출 버튼 -->
								        <button class="btn btn-primary submit-fn mt-2 w-100" type="submit">SIGN IN</button>
								    </form>
								    <br>
			                                <a href="findPw"> 비밀번호 찾기 </a>
			                       </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>

    </div>
    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <script src="../src/plugins/src/highlight/highlight.pack.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    
    <!--  BEGIN CUSTOM SCRIPTS FILE  -->
    <script src="../src/assets/js/scrollspyNav.js"></script>
    <script src="../src/assets/js/forms/bootstrap_validation/bs_validation_script.js"></script>
    <!--  END CUSTOM SCRIPTS FILE  -->
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // 사용자 정의 Bootstrap 검증 스타일을 적용하려는 모든 양식을 가져옵니다.
        var forms = document.getElementsByClassName('simple-example');

        // 모든 양식을 순회하며 유효성 검사를 추가합니다.
        Array.prototype.forEach.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                // 양식이 유효하지 않은 경우
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();

                    // 모든 invalid-feedback을 표시
                    var invalidFeedbacks = form.querySelectorAll('.invalid-feedback');
                    invalidFeedbacks.forEach(function (feedback) {
                        feedback.style.display = 'block';
                    });

                } else {
                    // 유효한 경우, valid-feedback 표시
                    var validFeedbacks = form.querySelectorAll('.valid-feedback');
                    validFeedbacks.forEach(function (feedback) {
                        feedback.style.display = 'block';
                    });

                    // 양식에 'was-validated' 클래스 추가
                    form.classList.add('was-validated');
                }
            }, false);
        });
    });
</script>
</body>
</html>