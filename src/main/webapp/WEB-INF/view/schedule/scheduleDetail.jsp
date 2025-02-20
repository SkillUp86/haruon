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
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link href="../src/plugins/src/apex/apexcharts.css" rel="stylesheet" type="text/css">
    <link href="../src/assets/css/light/dashboard/dash_1.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/dark/dashboard/dash_1.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <!-- BEGIN PAGE LEVEL STYLE -->
    <link href="../src/plugins/src/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/light/fullcalendar/custom-fullcalendar.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <!-- END PAGE LEVEL STYLE -->
    <!-- 페이지 제목 입력칸 -->
    <title> haruon | 일정 상세 </title>
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
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
                                </a>
                                <div class="d-flex breadcrumb-content">
                                    <div class="page-header">
                                        <div class="page-title">
                                        </div>
                        
                                        <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">캘린더</a></li>
                                            </ol>
                                        </nav>
                        
                                    </div>
                                </div>
                                
                            </header>
                        </div>
                    </div>
	<!-- section 시작 -->
    <section class="section">
		<div class="row justify-content-center mt-4"><div class="col-lg-6">

			<div class="card"><div class="card-body">
				<h2 class="mt-3 mb-3">일정 상세</h2>				
				
				<!-- 상세보기 -->
				<form id="modScheduleForm" action="${pageContext.request.contextPath}/updateSchedule" method="post">
				    <input type="hidden" value="${s.schNo}" name="schNo">
				
				    <div class="row mb-3">
				        <label class="col-sm-2 col-form-label">시작날짜</label>
				        <div class="col-sm-10">
				            <input type="datetime-local" class="form-control" id="startTime" name="startTime" value="${s.startTime}" required>
				        </div>
				    </div>
	                
					<div class="row mb-3">
						<label for="inputEmail3" class="col-sm-2 col-form-label">종료날짜</label>
						<div class="col-sm-10">
							<input type="datetime-local" class="form-control" id="endTime" name="endTime" value="${s.endTime}">
						</div>
					</div>
					
					<div class="row mb-3">
						<label for="inputPassword3" class="col-sm-2 col-form-label">일정제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name="title" value="${s.title}">
						</div>
					</div>
					
					<div class="row mb-3">
					    <label class="col-sm-2 col-form-label">일정종류</label>
					    <div class="col-sm-10">
					        <input class="form-control" value="${
					            (s.kind == 'G01') ? '일정' :
					            (s.kind == 'G02') ? '연차' :
					            (s.kind == 'G03') ? '출장' :
					            (s.kind == 'G04') ? '회의' :
					            (s.kind == 'G05') ? '반차' : ''
					        }" readonly>
					        <input type="hidden" name="kind" value="${s.kind}">
					    </div>
					</div>
	               
	                <div class="row mb-3">
	                	<label for="inputPassword3" class="col-sm-2 col-form-l	abel">일정내용</label>
	                	<div class="col-sm-10">
	                		<textarea rows="3" maxlength="100" class="col-sm-12" 
	                					id="modContent" name="content" style="height: 150px">${s.content}</textarea>	
							(<span id="chatHelper">0</span>/100)
	                	</div>
	                </div>
	                
	                <div class="row mb-3">
					    <label class="col-sm-2 col-form-label">작성자</label>
					    <div class="col-sm-10">
					        <input type="text" class="form-control" value="${s.ename}" style="background: #d9dce1;" readonly>
					    </div>
					</div>
	                
	                <div class="text-center">
	                	<!-- 수정 버튼 -->
	                	 <c:if test="${user.empNo == s.empNo}">
	                	<button type="submit" class="btn btn-primary" id="modScheduleBtn">수정</button>
	                	
	                	
	                	<!-- 삭제 버튼 -->
	                	<a class="btn btn-primary" id="DelScheduleBtn" href="/deleteSchedule/${s.schNo}">
   							 삭제
						</a>
						 </c:if>
	                	<!-- 전페이지로 이동 버튼 -->
	                	<button type="button" onclick="history.back()" class="btn btn-secondary">닫기</button>
	                </div>
				</form>
			</div>
		</div>
	</div>
</div>    
    	               
    	               
    
    </section><!-- section 종료 -->
<jsp:include page="/WEB-INF/view/inc/footer.jsp" />
					<!--  BEGIN FOOTER  -->
            <!--  END FOOTER  -->
       		<!-- 캘린더API  -->
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <script src="../src/assets/js/template.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="../src/plugins/src/apex/apexcharts.min.js"></script>
    <script src="../src/assets/js/dashboard/dash_1.js"></script>
    <script src="../src/plugins/src/fullcalendar/fullcalendar.min.js"></script>
    <script src="../src/plugins/src/uuid/uuid4.min.js"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    
    <!--  BEGIN CUSTOM SCRIPTS FILE  -->
    <script src="../src/plugins/src/fullcalendar/custom-fullcalendar.js"></script>
    <!--  END CUSTOM SCRIPTS FILE  -->
  <script>
//폼 제출 이벤트 핸들러
  document.getElementById('modScheduleForm').addEventListener('submit', function(e) {
      const startTime = document.getElementById('startTime').value;
      const endTime = document.getElementById('endTime').value;
      const title = document.getElementById('title').value;

      // 1. 공백 검사
      if (!startTime || !endTime || !title) {
          e.preventDefault();
          alert('필수 항목(*)을 모두 입력해주세요.');
          return;
      }

      // 2. 날짜 유효성 검사
      const startDate = new Date(startTime);
      const endDate = new Date(endTime);
      
      if (endDate <= startDate) {
          e.preventDefault();
          alert('종료 시간은 시작 시간보다 이후여야 합니다.');
          document.getElementById('endTime').value = '';
          return;
      }

      // 3. 현재 시간보다 이전인지 확인
      const now = new Date();
      if (startDate < now) {
          e.preventDefault();
          alert('과거 시간으로는 수정할 수 없습니다.');
          document.getElementById('startTime').value = '';
          return;
      }
  });

  // 실시간 날짜 검증
  document.getElementById('startTime').addEventListener('change', function() {
      const endTimeField = document.getElementById('endTime');
      const startDate = new Date(this.value);
      
      // 시작시간 변경 시 종료시간 최소값 설정
      endTimeField.min = this.value;
      
      // 종료시간이 시작시간보다 이전인 경우 초기화
      if (new Date(endTimeField.value) < startDate) {
          endTimeField.value = '';
      }
  });

  // 내용 길이 카운터
  document.getElementById('modContent').addEventListener('input', function() {
      const counter = document.getElementById('chatHelper');
      counter.textContent = this.value.length;
  });

  </script>
</body>
</html>