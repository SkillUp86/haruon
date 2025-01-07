 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>SignUp Cover | CORK - Multipurpose Bootstrap Dashboard Template </title>
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/authentication/auth-boxed.css" rel="stylesheet" type="text/css" />
    
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/dark/authentication/auth-boxed.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

                                    <h2>직원 등록</h2>
                                    <p>직원을 등록해주세요</p>
                                    
								<form id="addEmp" method="post" action="${pageContext.request.contextPath}/addEmp">
								    <div class="col-md-12">
								        <div class="mb-3">
								            <label class="form-label">이름</label>
								            <input type="text" class="form-control add-billing-address-input" id="ename" name="ename" >
								        </div>
								    </div>
								    <div class="col-12">
								        <div class="mb-3">
								            <label class="form-label">주소</label>
								            <div class="mb-3">
								                <input type="text" id="postCode" name="postCode" placeholder="우편번호" >
								                <input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
								                <input type="text" id="address" name="address" readonly>
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
								            <input type="email" name="email" id="email"  class="form-control" >
								        </div>
								    </div>
								    
								    
								    <div class="col-12">
								        <div class="mb-3">
								            <label class="form-label">생년월일</label>
								            <input type="date" class="form-control" id="birth" name="birth">
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
								            <input type="text" class="form-control" id="phone" name="phone">
								        </div>
								    </div>
								    <div class="col-12">
								        <div class="mb-4">
								            <button id="btnAddEmp" class="btn btn-secondary w-100">SIGN UP</button>
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
    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
<script>
// 회원가입 유효성 검사
$('#btnAddEmp').click(function () {
    if ($('#empName').val().trim() === '') {
        alert('이름을 입력하세요');
    } else if ($('#email').val().trim() === '') {
        alert('이메일을 입력하세요');
    } else if ($('#phone').val().trim() === '') {
        alert('연락처를 입력하세요');
    } else if ($('#deptNo').val().trim() === '') {
        alert('부서를 입력하세요');
    } else if ($('#address').val().trim() === '' || $('#address').val().trim() === '') {
        alert('주소를 입력하세요');
    } else {
        $('#addEmp').submit();
    }
});
</script>
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