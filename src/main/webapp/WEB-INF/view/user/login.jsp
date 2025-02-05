<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Haruon | 로그인 </title>
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
<link href="../src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/authentication/auth-boxed.css" rel="stylesheet" type="text/css" />
    
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
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
                      
                      <h2>로그인</h2>
                      <p>이메일과 비밀번호를 입력해주세요</p>
                      
                  </div>
                  <c:if test="${msg != null}">
                    <div class="col-xxl-12 col-md-12 mb-4">
                        <div class="alert alert-danger" role="alert">${msg}</div>
                        <c:remove var="msg" scope="session"/>
                    </div>
                  </c:if>
                  <div class="col-md-12">
                    <form id="empLogin" action="${pageContext.request.contextPath}/loginSuccess" method="post" novalidate>
                        <div class="form-row">
                            <!-- 사원 번호 -->
                            <div class="col-md-12 mb-4">
                                <label for="email" class="form-label">이메일</label>
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
                        <button class="btn btn-primary submit-fn mt-2 w-100" type="submit">로그인</button>
                    </form>
                    <br>
                    <div class="d-flex justify-content-between">
                      <a href="findPw"> 비밀번호 찾기 </a>
                      
                      <a onclick="window.open('${pageContext.request.contextPath}/readMe', '_blank', 'width=500px, height=1000px;')" type="button" class="btn">
                        <span class="me-1 fw-bold fst-italic">
                          README
                        </span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" viewBox="0 -960 960 960"  fill="#4361ee"><path d="M480-80q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-114 59.5-210.5T301-838q1 19 4 38.5t10 45.5q-72 44-113.5 116.5T160-480q0 134 93 227t227 93q134 0 227-93t93-227q0-85-41.5-158T644-755q7-26 10-45.5t5-37.5q102 51 161.5 147T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-160q-100 0-170-70t-70-170q0-58 25.5-109t72.5-85q5 15 11 34.5t16 48.5q-22 23-33.5 51T320-480q0 66 47 113t113 47q66 0 113-47t47-113q0-32-11.5-60T595-591q8-24 14.5-44.5T621-674q47 34 73 85t26 109q0 100-70 170t-170 70Zm-40-380q-37-112-48.5-157.5T380-860q0-42 29-71t71-29q42 0 71 29t29 71q0 37-11.5 82.5T520-620h-80Zm40 220q-33 0-56.5-23.5T400-480q0-33 23.5-56.5T480-560q33 0 56.5 23.5T560-480q0 33-23.5 56.5T480-400Z"/></svg>
                      </a>
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