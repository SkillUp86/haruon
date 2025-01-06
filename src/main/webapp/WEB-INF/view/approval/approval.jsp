 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     
	<style type="text/css">
	.label-text {
	    display: flex; /* Flexbox 활성화 */
	    align-items: center; /* 수직 중앙 정렬 */
	    justify-content: center; /* 가로 중앙 정렬 */
	    width: 100px; /* 모든 라벨의 고정된 너비 */
	    text-align: center; /* 텍스트 중앙 정렬 */
	}
	</style>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/forms/bootstrap-form.css" rel="stylesheet" type="text/css">
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
	<!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="../src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/components/carousel.css" rel="stylesheet" type="text/css">
    <link href="../src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/components/tabs.css" rel="stylesheet" type="text/css">
     <link href="../src/assets/css/light/elements/infobox.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/dark/elements/infobox.css" rel="stylesheet" type="text/css" />
    <!--  END CUSTOM STYLE FILE  -->
    
    <!-- 페이지 제목 입력칸 -->
    <title>결재 페이지</title>
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
                                                <li class="breadcrumb-item"><a href="#">문서</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">전자 결재</li>
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
                
                <h1>전자 결재</h1>
                <form action="" enctype="multipart/form-data">
			        <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
			            <div class="widget-content widget-content-area mt-4">
			                <h5 class="mb-4">결재선</h5>
			                <div class="input-group mb-4">
			                    <span class="input-group-text label-text">기안자</span>
			                    <input type="text" class="form-control" id="empNo" name="empNo" readonly="readonly">
			                    <span class="input-group-text label-text">부서</span>
			                    <input type="text" class="form-control" id="depNo" name="depNo" readonly="readonly">
			                </div>
			                
			                <div class="row mb-4">
			                    <div class="col-md-6">
			                        <div class="input-group">
			                            <span class="input-group-text label-text">중간결재자</span>
			                            <input type="text" class="form-control" id="midApp" name="midApp" placeholder="중간결재자 입력" aria-label="중간결재자" aria-describedby="mid-approver" required="required" readonly="readonly">
			                           	<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#midAppModal">
				                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
					                            <circle cx="11" cy="11" r="8"></circle>
					                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
				                            </svg>
			                            </button>
 			                        </div>
			                    </div>
			                    <div class="col-md-6">
			                        <div class="input-group">
			                            <span class="input-group-text label-text">최종결재자</span>
			                            <input type="text" class="form-control" id="finalApp" name="finalApp" placeholder="최종결재자 입력" aria-label="최종결재자" aria-describedby="final-approver" required="required" readonly="readonly">
			                            <button class="btn btn-primary">
				                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
					                            <circle cx="11" cy="11" r="8"></circle>
					                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
				                            </svg>
			                            </button>
						           </div>
			                    </div>
			                </div>
			                
			                <div class="input-group mb-4">
			                    <span class="input-group-text label-text">참조자</span>
			                    <!-- 참조자 번호 : refNo -->
			                    <input type="text" class="form-control" id="refNo" placeholder="참조자 입력" required="required" readonly="readonly">
			                    <button class="btn btn-primary">
		                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
			                            <circle cx="11" cy="11" r="8"></circle>
			                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
		                            </svg>
	                            </button>
   			                </div>
			                <div class="input-group mb-4">
			                    <span class="input-group-text label-text">유형</span>
			                    <select type="text" class="form-control" id="kind" name="kind" required="required">
				                    <c:forEach items="${codeList}" var="c">
				                    	<option id="code" value="${c.commonCode}">${c.descript}</option>
				                    </c:forEach>
			                    </select>
			                </div>
			            </div>
                           <div class="widget-content widget-content-area blog-create-section mt-4">
                           	<!-- 보고서 -->
                           	<div>
                           	
							    <div id="business" class="kind-field" style="display: none;">
							    	<div class="input-group mb-4">
								        <span class="input-group-text label-text">출장지역</span>
								        <input type="text" class="form-control" id="" name="">
										
								        <span class="input-group-text label-text">시작날짜</span>
								        <input type="date" class="form-control" id="" name="">
								
								        <span class="input-group-text label-text">종료날짜</span>
								        <input type="date" class="form-control" id="" name="">
								    </div>
								</div>
								
							    <div id="sales" class=" kind-field" style="display: none;">
							    	<div class="input-group mb-4">
					                    <span class="input-group-text label-text">가맹점</span>
					                    <select type="text" class="form-control" id="" required="required">
						                    <c:forEach items="" var="f">
						                    	<option id="" value="">가맹점</option>
						                    </c:forEach>
					                    </select>
					                     <span class="input-group-text label-text">연-월</span>
					                     <input class="form-control" type="month" id="" name="">
					                     <span class="input-group-text label-text">매출액</span>
					                     <input class="form-control" type="number" id="" name="">
				                	</div>
									
							    </div>
							
							    <div id="vacation" class="kind-field" style="display: none;">
								    <div class="input-group mb-4">
								        <span class="input-group-text label-text">시작날짜</span>
								        <input class="form-control" type="datetime-local" id="" name="">
								
								        <span class="input-group-text label-text">종료날짜</span>
								        <input class="form-control" type="datetime-local" id="" name="">
								
								        <span class="input-group-text label-text">유형</span>
								        <select class="form-control" id="" name="">
								            <option value="annual">연차</option>
								            <option value="halfDay">반차</option>
								        </select>
								        <span class="input-group-text label-text">비상연락처</span>
								        <input type="text" class="form-control" id="" name="emergencyContact">
								    </div>
								    <div class="input-group  mb-4">
			                            <span class="input-group-text label-text">대체업무자</span>
			                            <input type="text" class="form-control" placeholder="대체업무자 입력" aria-label="대체업무자" aria-describedby="final-approver" required="required">
			                            <button class="btn btn-primary">
				                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
					                            <circle cx="11" cy="11" r="8"></circle>
					                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
				                            </svg>
			                            </button>
			                        </div>
							    </div>
							    
							</div>
							<!-- 보고서 끝 -->
			                <div class="input-group mb-4">
			                    <span class="input-group-text label-text">제 목</span>
			                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" aria-label="제목" aria-describedby="basic-addon2">
			                </div>
						    <div class="input-group mb-4">
						        <textarea class="form-control mb-4" rows="10" id="textarea" name="content"></textarea>
							</div>
                            <div class="form-group mb-4">
                                <input class="form-control file-upload-input" type="file" id="formFile" multiple="multiple">
                            </div>
                            <div class="text-end">
                               	<input type="submit" name="time" class="mb-4 btn btn-primary">
                            </div>
                        </div>
			        </div>
				</form>
            </div>
        </div>
    </div>
    <!-- 중간 결재자 모달 -->
    <div class="modal fade " id="midAppModal" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">결재자 선택</h5>
	            </div>
	            <div class="modal-body container">
	                <div class="row">
					    <!-- Left Section: 부서 리스트 -->
					    <div class="col-3 border-end">
					        <h6>부서 목록</h6>
					        <div class="list-group" id="department-list">
					            <c:forEach var="d" items="${deptList}">
					                <a href="#" class="list-group-item dept-item" data-department-id="${d.depNo}">${d.dname}</a>
					            </c:forEach>
					        </div>
					    </div>
					    
					    <!-- Middle Section: 직원 목록 -->
					    <div class="col-4 d-flex">
					        <div class="flex-grow-1">
					            <h6>직원 목록</h6>
					            <div class="list-group" id="employee-list">
					                <!-- 직원 리스트가 동적으로 추가됩니다 -->
					            </div>
					        </div>
					        <!-- Arrow Section -->
					        <div class="d-flex flex-column justify-content-center align-items-center ms-3">
					            <button type="button" class="btn btn-light mb-2" onclick="applyOn();">
					                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right-circle"><circle cx="12" cy="12" r="10"></circle><polyline points="12 16 16 12 12 8"></polyline><line x1="8" y1="12" x2="16" y2="12"></line></svg>
					            </button>
					            <button type="button" class="btn btn-light mb-5" onclick="applyOff();">
					                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left-circle"><circle cx="12" cy="12" r="10"></circle><polyline points="12 8 8 12 12 16"></polyline><line x1="16" y1="12" x2="8" y2="12"></line></svg>
					            </button>
					            <button type="button" class="btn btn-light mb-2" onclick="referOn();">
					                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right-circle"><circle cx="12" cy="12" r="10"></circle><polyline points="12 16 16 12 12 8"></polyline><line x1="8" y1="12" x2="16" y2="12"></line></svg>
					            </button>
					            <button type="button" class="btn btn-light mb-5" onclick="referOff();">
					                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left-circle"><circle cx="12" cy="12" r="10"></circle><polyline points="12 8 8 12 12 16"></polyline><line x1="16" y1="12" x2="8" y2="12"></line></svg>
					            </button>
					            <button type="button" class="btn btn-light mb-2" onclick="referOn();">
					                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right-circle"><circle cx="12" cy="12" r="10"></circle><polyline points="12 16 16 12 12 8"></polyline><line x1="8" y1="12" x2="16" y2="12"></line></svg>
					            </button>
					            <button type="button" class="btn btn-light mb-2" onclick="referOff();">
					                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left-circle"><circle cx="12" cy="12" r="10"></circle><polyline points="12 8 8 12 12 16"></polyline><line x1="16" y1="12" x2="8" y2="12"></line></svg>
					            </button>
					        </div>
					    </div>
					    
					    <!-- Right Section: 중간결재자 / 최종결재자 -->
					    <div class="col-5">
					        <h6 class="modal-body">중간결재자</h6>
					        <div class="list-group" id="employee-list">
				                <!-- 직원 리스트가 동적으로 추가됩니다 -->
				                <input class="form-control" type="text" value="직원" readonly="readonly">
				                <button>delete</button>
				            </div>
					
					        <h6 class="modal-body">최종결재자</h6>
				         	<div class="list-group" id="employee-list">
				                <!-- 직원 리스트가 동적으로 추가됩니다 -->
				                <input class="form-control" type="text" value="직원" readonly="readonly">
				            	<button>delete</button>
				            </div>
					
					        <h6 class="modal-body">참조자</h6>
				         	<div class="list-group" id="employee-list">
				                <!-- 직원 리스트가 동적으로 추가됩니다 -->
				                <input class="form-control" type="text" value="직원" readonly="readonly">
				            	<button>delete</button>
				            </div>
					    </div>
					</div>
	            </div>
	            <div class="modal-footer">
	                <button class="btn btn-light-dark" data-bs-dismiss="modal">
	                    <i class="flaticon-cancel-12"></i> 취소
	                </button>
	                <button type="button" class="btn btn-primary">선택</button>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- 중간 결재자 모달END -->
    
    <!--  BEGIN FOOTER  -->
    <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
    <!--  END FOOTER  -->
    <!-- END MAIN CONTAINER -->
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    

</body>
	<script>
    // 중간 결재자 직원 불러오기
    $('#btnSearchMidApp').click(function() {
        const midApp = $("#selectMidApp").val().trim();  
        
        if (!midApp) {
            alert("중간 결재자 이름을 입력하세요.");
            return;
        }

        // 직원 정보 가져오기
        $.ajax({
            url: "/approval/search",  
            method: "GET"
           	data: {
                   ename: midApp  
               }
        }).done(function(response) {
            console.log(response);

            let midAppName = $("#midAppName"); 
            midAppName.empty();  // 기존 선택지 지우기

            if (response.data && response.data.length > 0) {
            	$.each(response.data, function(index, emp) {
                    midAppName.append('<option value="' + emp.empNo + '">' + emp.ename + '</option>');
                });            
           	} else {
                midAppName.append('<option value="">직원 없음</option>');  // 직원이 없으면 "직원 없음" 메시지 추가
            }
        }).fail(function() {
            alert('실패');  // 실패 처리
        });
    });
    </script>
    <script>
   $(function () {
	    // 보고서 유형 선택 시 이벤트 핸들러
	    $('#kind').on('change', function () {
	        var selectedType = $(this).val(); // 선택된 commonCode 값

	        // 모든 유형별 필드 숨기기
	        $('.kind-field').hide().find('input, select').each(function () {
			    if ($(this).is('select')) {
			        $(this).prop('selectedIndex', 0); // select 요소 초기화
			    } else {
			        $(this).val(''); // input 초기화
			    }
			});

	        // 선택된 commonCode에 따라 필드 표시
	        if (selectedType === 'C02') { // 출장 보고서
	            $('#business').show();
	        } else if (selectedType === 'C03') { // 매출 보고서
	            $('#sales').show();
	        } else if (selectedType === 'C04') { // 휴가 보고서
	            $('#vacation').show();
	        }
	    });
	    
	    $('#kind').trigger('change');
	});
   </script>
</html>