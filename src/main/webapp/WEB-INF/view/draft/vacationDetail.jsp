<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
            <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico" />
            <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
            <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/approval/draft.css">

            <!-- BEGIN GLOBAL MANDATORY STYLES -->
            <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
            <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
            <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
            <!-- END GLOBAL MANDATORY STYLES -->

            <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
            <link href="${pageContext.request.contextPath}/src/plugins/src/apex/apexcharts.css" rel="stylesheet" type="text/css">
            <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
            <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/assets/css/light/forms/switches.css">
            <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->


            <!-- 페이지 제목 입력칸 -->
            <title>Haruon | 내 문서</title>
            <!-- 페이지 제목 입력칸 -->
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
                                        <a href="javascript:void(0);" class="btn-toggle sidebarCollapse"
                                            data-placement="bottom">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                class="feather feather-menu">
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
                                                        <li class="breadcrumb-item"><a href="#">내문서함</a></li>
                                                        <li class="breadcrumb-item active" aria-current="page">${d.draftType} 결재</li>
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
                        <div class="row mb-4 layout-spacing layout-top-spacing">
                            <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <div class="widget-content widget-content-area">
                                    <div class="row mb-4">
                                        <div class="col-sm-12">
                                            <div class="container">
                                                <div class="bold-box">
                                                    <h1>
                                                        <div class="mt-4 mb-4">
                                                            ${d.draftType} 문서
                                                        </div>
                                                    </h1>
                                                    <!-- 사인 위치 -->
                                                    <jsp:include page="/WEB-INF/view/draft/commonApprovalHeader.jsp"/>
                                                    <div class="input-group mb-2 mt-4">
                                                        <div class="input-group">
                                                            <span class="input-group-text label-text">문서번호</span>
                                                            <input class="form-control" value="${d.draNo}" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-text label-text">기안부서</span>
                                                            <input class="form-control" value="${d.deptName}" readonly>
                                                            <span class="input-group-text label-text">직위</span>
                                                            <input class="form-control" value="${d.location}" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                            <span class="input-group-text label-text">기안자</span>
                                                            <input class="form-control" value="${d.drafterName}" readonly>
                                                            <span class="input-group-text label-text">기안일자</span>
                                                            <input class="form-control" value="${d.createDate}" readonly>
                                                        </div>
                                                        <div class="input-group">
                                                        	<div class="input-group">
																<span class="input-group-text label-text">대체업무자</span>
																<input class="form-control" value="${d.subEmpNo}" id="subEmpNumber" name="subEmpNumber" type="hidden" readonly>
																<input class="form-control" value="${d.subEmpName}" type="text" id="subEmpName" name="subEmpName" placeholder="대체업무자" aria-label="대체업무자" required readonly>
																<span class="input-group-text label-text">부서</span>
																<input class="form-control" value="${d.subEmpDept}" type="text"  id="subDept" name="subDept" placeholder="대체업무자 부서 입력" aria-label="대체업무자 부서"  required readonly>
															</div>
														</div>
														<div class="input-group">
															<span class="input-group-text label-text">유형</span>
															<input class="form-control" value="${d.vacType}" type="text" readonly>
															<span class="input-group-text label-text">비상연락처</span>
															<input class="form-control" value="${d.emergPhone}" type="text" pattern="(010)-\d{3,4}-\d{4}" name="urgentPhone" id="urgentPhone" placeholder="010-0000-0000" readonly>
														</div>
														<div class="input-group mb-2">
															<span class="input-group-text label-text">시작날짜</span>
															<input class="form-control" value="${d.vacStartDate}"id="vacStartDate" name="vacStartDate" readonly>
													
															<span class="input-group-text label-text">종료날짜</span>
															<input class="form-control" value="${d.vacFinishDate}"id="vacFinishDate" name="vacFinishDate" readonly>
														</div>
														
                                                    </div>
                                                    <div class="input-group mb-2">
                                                        <div class="input-group">
                                                            <span class="input-group-text label-text">제목</span>
                                                            <input class="form-control" value="${d.title}" readonly>
                                                        </div>
                                                        <div class="input-group mb-3">
														    <span class="input-group-text label-text">첨부파일</span>
														        <c:if test="${draftFiles.isEmpty()}">
														            <input class="form-control" value="첨부파일 없음" readonly>
														        </c:if>
															    <c:if test="${!draftFiles.isEmpty()}">
														            <div class="d-flex flex-wrap">
														                <c:forEach var="f" items="${draftFiles}">
														                &nbsp;
														                    <a href="${pageContext.request.contextPath}/upload/draft/${f.fileName}.${f.ext}" 
														                       download="${f.originName}.${f.ext}" class="btn btn-dark mt-1 file">
														                       ${f.originName}.${f.ext}
														                    </a>
														                </c:forEach>
														            </div>
														        </c:if>
														</div>
                                                        <div class="input-group">
                                                            <textarea class="form-control" rows="10" id="textContent" name="textContent" readonly>${d.content}</textarea>
                                                        </div>
                                                    </div>
                                                    <c:if test="${d.referEmpNo != null}">
	                                                    <div class="input-group mb-2">
	                                                        <div class="input-group">
	                                                            <p class="black-text"><strong>참조자:${d.referName}</strong></p>
	                                                        </div>
	                                                    </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <jsp:include page="/WEB-INF/view/draft/commonApproval.jsp"/>
                        </div>
                    </div>
                        <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
                    </div>
                </div>

            </div>
            <script>
			    function formatting() {
			        let startDate = "${d.vacStartDate}";
			        let finishDate = "${d.vacFinishDate}";
			
			        // 날짜와 시간을 분리
			        let [startDatePart, startTimePart] = startDate.split(" ");
			        let [finishDatePart, finishTimePart] = finishDate.split(" ");
			
			        // 날짜와 시간 배열 변환
			        let [startYear, startMonth, startDay] = startDatePart.split("-");
			        let [startHour, startMinute, startSecond] = startTimePart.split(":");
			
			        let [finishYear, finishMonth, finishDay] = finishDatePart.split("-");
			        let [finishHour, finishMinute, finishSecond] = finishTimePart.split(":");
			
			        // 변환
			        let formattedStartDate = `\${startYear}년 \${startMonth}월 \${startDay}일 \${startHour}시 \${startMinute}분`;
			        let formattedFinishDate = `\${finishYear}년 \${finishMonth}월 \${finishDay}일 \${finishHour}시 \${finishMinute}분`;
			
			        document.getElementById("vacStartDate").value = formattedStartDate;
			        document.getElementById("vacFinishDate").value = formattedFinishDate;
			    }
			    // 페이지 로드 시 자동 실행
			    window.onload = formatting;
			</script>
            <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
            <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
            <script src="${pageContext.request.contextPath}/src/assets/js/template.js""></script>
    		<script src=" ${pageContext.request.contextPath}/src/plugins/src/apex/apexcharts.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
            <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>

        </body>
        </html>