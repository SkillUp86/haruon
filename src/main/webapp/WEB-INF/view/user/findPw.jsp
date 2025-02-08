 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Haruon | 비밀번호 찾기 </title>
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
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
    
    						<form id="formFindPw" action="${pageContext.request.contextPath}/findPw" method="post">
                            <div class="row">
                                <div class="col-md-12 mb-3">

                                    <h2>비밀번호 찾기</h2>
                                    <p>비밀번호 찾기</p>
                                    
                                </div>
                                <div class="col-md-12">
                                <c:if test="${msg != null}">
										<div class="col-xxl-12 col-md-12 mb-4">
											<div class="alert alert-danger" role="alert">${msg}</div>
										</div>
									</c:if>
                                    <div class="mb-3">
                                        <label class="form-label">사원번호</label>
   										 <input type="text" id="empNo" name="empNo" pattern="[0-9]*" class="form-control" required>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="mb-4">
                                        <label class="form-label">이메일</label>
                                        <input type="email" id="email" name="email" class="form-control" required>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="mb-4">
                                        <button id="btnFindPw" class="btn btn-secondary w-100" type="button">비밀번호 발급</button>
                                    </div>
                                </div>
                            </div>
                           </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
</body>
<script>
	$('#btnFindPw').click(function() {
		if($('#empNo').val() == ''){
			alert('사원번호를 입력하세요');
			return;
		} else if($('#email').val() == ''){
			alert('이메일을 입력하세요');
			return;
		}
		$('#formFindPw').submit();
	})
</script>
</html>