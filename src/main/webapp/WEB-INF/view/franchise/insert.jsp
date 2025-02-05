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

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/apps/contacts.css" rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/apps/contacts.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->    
    
    <!-- 페이지 제목 입력칸 -->
    <title>HARUON | 가맹점 등록</title>
    <!-- 페이지 제목 입력칸 -->
</head>
<body class="layout-boxed">
    <!-- BEGIN LOADER -->
    <div id="load_screen"> 
	    <div class="loader"> 
		    <div class="loader-content">
		        <div class="spinner-grow align-self-center">
		        </div>
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
        <div class="cs-overlay"></div>
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
                                                <li class="breadcrumb-item"><a href="#">가맹점</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">가맹점 등록</li>
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
                <div class="layout-top-spacing" id="cancel-row">
                    <h2 class="mt-3 mb-3">가맹점 등록</h2>
                    <div class="card row ms-3 w-50 p-3">
                        <form id="addForm" method="post" action="${pageContext.request.contextPath}/franchises/insert" class="row g-3">
                        	<div class="col-6">
	                            <label for="fname" class="form-label">가맹점명</label>
	                            <input type="text" class="form-control" id="fname" name="fname" placeholder="가맹점명">
                            </div>
                            <div class="col-6">
                            	<label for="id" class="form-label">사업자 번호</label>
                            	<input type="text" class="form-control" id="id" name="id" placeholder="사업자번호(-없이 입력해주세요)">
                            </div>
                            
                            <div class="col-6">
                            	<div class="d-flex justify-content-between">
	                           		<label for="address" class="form-label">주소</label>
                                	<input style="display:inline-block" type="button" onclick="Postcode()" value="주소 찾기" class="btn btn-gray">
                               	</div>
                            	<input type="text" class="form-control mt-2" id="selectPostcode" name="postCode" placeholder="우편번호" readonly>
	                            <input type="text" class="form-control mt-2" id="roadAddress" name="address" placeholder="주소" readonly>
	                            <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" style="display:none;">
                                                                        <input id="sample4_detailAddress" placeholder="상세주소" style="display:none;">
                                                                        <input type="hidden" id="sample4_extraAddress" placeholder="참고항목" style="display:none;">
                                                                        <span id="guide" style="color:#999;display:none"></span>
                            </div>
                            <div class="col-6"></div>
                            
                            <div class="col-6">
                            	<label for="phone" class="form-label">연락처</label>
                            	<input type="text" class="form-control" id="phone" name="phone" placeholder="연락처(-없이 입력해주세요)">
                            </div>
                            <div class="col-6">
                            	<label for="email" class="form-label">이메일</label>
                            	<input type="email" class="form-control" id="email" name="email" placeholder="이메일">
                            </div>
                            <div class="col-6">
                            	<label for="leader" class="form-label">대표자 이름</label>
                            	<input type="text" class="form-control" id="leader" name="leader" placeholder="이름">
                            </div>
                        </form>
                        <div class="text-end mt-5 mb-2">
                            <button type="button" id="addBtn" class="btn btn-success" style="display:inline-block;">등록</button>
                        </div>
                    </div>
               	</div>
                <!-- 메인컨텐츠 END -->
			</div>
            
	        <!--  BEGIN FOOTER  -->
	        <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/inc/footer.jsp" />
	        <!--  END FOOTER  -->
		</div>
        
  		<!--  END CONTENT AREA  -->
	
	</div>
    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/global/vendors.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/jquery-ui/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/apps/contact.js"></script>
	
	<script>
		$('#addBtn').click(function() {
			if($('#fname').val() == '') {
				alert('가맹점명을 입력하세요');
			} else if($('#roadAddress').val() == '') {
				alert('주소를 입력하세요');
			} else if(!/^\d{10}$/.test($('#id').val())) {
				alert('사업자번호 10자리 숫자를 입력하세요');
			} else if($('#leader').val() == '') {
				alert('가맹점주 이름을 입력하세요');
			} else if(!/^\d{11}$/.test($('#phone').val())) {
				alert('휴대폰번호 11자리를 입력하세요');
			} else if($('#email').val() == '') {
				alert('이메일을 입력하세요');
			} else {
				$('#addForm').submit();
			}
		});
	</script>
	
	<!-- 주소 -->
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
	<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>