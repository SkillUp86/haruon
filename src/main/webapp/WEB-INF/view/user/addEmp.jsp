 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title> haruon | 사원 등록 </title>
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/authentication/auth-boxed.css" rel="stylesheet" type="text/css" />

    <!-- END GLOBAL MANDATORY STYLES -->
</head>
<body class="form">

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
												<li class="breadcrumb-item"><a href="#">조직도</a></li>
												<li class="breadcrumb-item active" aria-current="page"> 사원등록 </li>
											</ol>
										</nav>
									</div>
								</div>
							</header>
						</div>
					</div>
					<!--  END BREADCRUMBS  -->
				</div>
    <div class="auth-container d-flex">

        <div class="container mx-auto align-self-center">
    
            <div class="row">
    
                <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-8 col-12 d-flex flex-column align-self-center mx-auto">
                    <div class="card mt-3 mb-3">
                        <div class="card-body">
    
                            <div class="row">
                                <div class="col-md-12 mb-3">

                                    <h2>사원 등록</h2>
                                    <p>사원을 등록해주세요</p>
									<c:if test="${msg != null}">
										<div class="col-xxl-12 col-md-12 mb-4">
											<div class="alert alert-primary" role="alert">${msg}</div>
										</div>
									</c:if>
									<c:if test="${failMsg != null}">
										<div class="col-xxl-12 col-md-12 mb-4">
											<div class="alert alert-danger" role="alert">${failMsg}</div>
										</div>
									</c:if>
								<form id="addEmp" method="post" action="${pageContext.request.contextPath}/addEmp">
								    <div class="col-md-12">
								        <div class="mb-3">
								            <label class="form-label">이름</label>
								            <input type="text" class="form-control add-billing-address-input" id="ename" name="ename" required>
								        </div>
								    </div>
								    <div class="col-12">
								        <div class="mb-3">
								            <div class="mb-3">
							                    <label for="address">주소</label>
                                                <input type="text" class="form-control mb-3" id="selectPostcode" name="postCode" value="" placeholder="우편번호" required>
                                                <input type="text" class="form-control mb-3" id="roadAddress" name="address" value="" placeholder="주소" required>
                                                <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" style="display:none;">
                                                <input id="sample4_detailAddress" placeholder="상세주소" style="display:none;">
                                                <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" style="display:none;">
                                                <span id="guide" style="color:#999;display:none"></span>
                                             </div>
                                             <div class="form-group">
                                                 <input type="button" class="btn btn-primary mb-3" onclick="Postcode()" value="주소 찾기"><br>
                                             </div>
								        </div>
								    </div>
								    <div class="col-12">
								        <div class="mb-3">
								            <label class="form-label">부서</label>
								            <select class="form-control" id="depNo" name="depNo">
								            	<c:forEach items="${deptList}" var="d">
								            		<option value="${d.depNo}">${d.dname}</option>
								            	</c:forEach>
								            </select>
								        </div>
								    </div>
								    <div class="col-12">
								        <div class="mb-3">
								            <label class="form-label">이메일</label>
								            <input type="email" name="email" id="email"  class="form-control" required>
								        </div>
								    </div>
								    
								    
								    <div class="col-12">
								        <div class="mb-3">
								            <label class="form-label">생년월일</label>
								            <input type="date" class="form-control" id="birth" name="birth" required>
								        </div>
								    </div>
								    
								    <div class="col-12">
								        <div class="mb-3">
								            <label>
						                        <input type="radio" name="gender" id="gender"  value="M"> 남자
						                    </label>
						                    <label>
						                        <input type="radio"  name="gender" id="gender"  value="F"> 여자
						                    </label>
								        </div>
								    </div>
								    
								    <div class="col-12">
								        <div class="mb-3">
								            <label class="form-label">연락처</label>
								            <input type="text" class="form-control" id="phone" name="phone" required>
								        </div>
								    </div>
								    <div class="col-12">
								        <div class="mb-4">
								            <button id="btnAddEmp" type="button" class="btn btn-secondary w-100">SIGN UP</button>
								            
								        </div>
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
    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

<script>
	$('#btnAddEmp').click(function() {
		if($('#ename').val() == '') {
			alert('이름을 입력하세요');
			return;
		} else if($('#selectPostcode').val() == '' && $('#selectPostcode').val().length >= 6){
			alert('우편번호를 입력하세요 (6자 이하)');
			return;
		} else if($('#roadAddress').val() == ''){
			alert('주소를 입력하세요');
			return;
		} else if($('#depNo').val() == ''){
			alert('부서를 선택하세요');
			return;
		} else if($('#email').val() == ''){
			alert('이메일을 입력하세요');
			return;
		} else if($('#birth').val() == ''){
			alert('생일을 입력하세요');
			return;
		} else if ($('input[name="gender"]:checked').length === 0) {
	      alert('성별을 선택하세요');
	      return;
	    } else if(!/^\d{11}$/.test($('#phone').val())) {
	        alert('전화번호 형식이 올바르지 않습니다. 예: 01012345678');
	        return;
	    }
		$('#addEmp').submit();
	})
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function Postcode() {
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
                document.getElementById('selectPostcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'none';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'none';
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