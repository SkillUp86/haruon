<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>HRUONN | README </title>
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../src/assets/css/light/apps/notes.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
    <style>
	    #content-sub {
		  width: 50%;
		  flex-grow: 8;
		  margin-bottom: 0;
		  -webkit-transition: 0.3s ease all;
		  transition: 0.3s ease all;
		}
    </style>
    
</head>
<body>
	<!-- 체크 / dot 색깔 지정 -->
	<c:set var="noteEnd">
	    <div class="note-action">
	        <p>CHECKED : 
	            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle fav-note">
	                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
	                <polyline points="22 4 12 14.01 9 11.01"></polyline>
	            </svg>
	        </p>
	    </div>
	</c:set>

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">
        <!--  BEGIN CONTENT AREA  -->
        <div id="content-sub" class="main-content">
	         <div class="app-notes layout-top-spacing">
	             <div class="app-hamburger-container">
	                 <div class="hamburger"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu chat-menu d-xl-none"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg></div>
	             </div>
	             <br><br>
	             <hr>
	             <div class="app-note-container">
	                 <div class="tab-title">
	                     <ul class="nav nav-pills d-block" id="pills-tab3" role="tablist">
	                         <li class="nav-item">
	                             <a class="nav-link list-actions active" id="all-notes"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
	                             </svg>전체</a>
	                         </li>
	                         <li class="nav-item">
	                         	
	                             <a class="nav-link list-actions g-dot-info" id="test">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-check"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline></svg>
		                             <span>테스트 계정</span>
	                             </a>
	                         </li>
	                     </ul>
	
	                     <hr/>
	
	                     <p class="group-section"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-tag"><path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"></path><line x1="7" y1="7" x2="7" y2="7"></line></svg> Tags</p>
	
	                     <ul class="nav nav-pills d-block group-list" id="pills-tab" role="tablist">
	                         <li class="nav-item">
	                             <a class="nav-link list-actions g-dot-primary" id="common">공통</a>
	                         </li>
	                         <li class="nav-item">
	                             <a class="nav-link list-actions g-dot-warning" id="division">부서관리권한</a>
	                         </li>
	                         <li class="nav-item">
	                             <a class="nav-link list-actions g-dot-success" id="franchise">가맹점관리권한</a>
	                         </li>
	                         <li class="nav-item">
	                             <a class="nav-link list-actions g-dot-danger" id="personnel">인사 권한</a>
	                         </li>
	                         <li class="nav-item">
	                             <a class="nav-link list-actions g-dot-secondary" id="system">시스템 권한</a>
	                         </li>
	                     </ul>
	
	                 </div>
	
	                 <div id="ct" class="note-container note-grid">
	                     <!-- 출퇴근 등록 -->
	                     <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>출퇴근 등록</h5>
	                             <ul>
	                             	 <li>위치 : 메인페이지</li>
	                                 <li>출/퇴근 등록 <br> - 『출근하기』버튼 클릭<br>- 『퇴근하기』버튼은 『출근하기』 클릭시 활성화 </li>
	                                 <li>익일 근태기록이 Scheduled에 의해 업데이트되며, 이는 <근태관리>페이지에서 조회<br>(출장 및 연차 일정으로 인해 등록한 출·퇴근시간이 변경될 수 있음) </li>
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                     
	                     <!-- 개인정보 관리 -->
	                     <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>개인정보 관리</h5>
	                             <ul>
	                              	 <li>위치 : 마이페이지>내정보</li>
	                                 <li>프로필 관리 <br> -『이미지 변경』 버튼으로 프로필 사진을 등록<br>-기존 사진이 있을 시 삭제</li>
	                                 <li>전자서명 관리 <br> - 서명란, 『확인』버튼으로 전자서명을 등록<br>-기존 사진이 있을 시 삭제</li>
	                                 <li>개인정보 관리 <br> - '주소, 내선번호, 비밀번호'을 입력 후 『변경』버튼으로 본인의 개인정보를 수정</li>
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                     
	                     <!-- 근태조회 -->
	                     <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>개인 근태 조회</h5>
	                             <ul>
	                             	 <li>위치 : 근태관리>나의근태</li>
	                              	 <li>『근태·연가·출장』탭을 클릭하여, 월별 데이터를 조회</li>
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                     
	                     <!-- 메일 -->
	                     <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>메일 주고받기</h5>
	                             <ul>
	                             	 <li>위치 : 메일함>받은메일함·보낸메일함·임시보관함·휴지통</li> 
	                              	 <li>받은·보낸 메일함 <br> 행을 클릭하여 상세내역 조회</li>
	                              	 <li>메일보내기 <br>-『메일보내기』 버튼을 클릭하여, '사원·제목·내용·첨부파일' 입력
	                              	 			 <br>-『발송』버튼 클릭으로 메일 발송
	                              	 			 <br>-『저장』버튼으로 작성중이던 메일 임시보관
	                              	 <li>임시보관함 <br>- 행을 클릭하여, 작성중인 메일을 이어서 작성 후 발송 가능
	                              	 <li>휴지통 <br>- 행을 클릭하여, 상세내역 조회
	                              	 		  <br>- <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M3 6h18a1 1 0 0 1 1 1v1H2V7a1 1 0 0 1 1-1z"></path><path d="M6 9h12v12a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2V9z"></path><path d="M9 4v1h6V4z"></path></svg>
					                              	버튼으로 영구삭제 또는 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2a10 10 0 0 1 0 20A10 10 0 0 1 2 12h4l-5 5 5-5H2"></path></svg> 
					                              	버튼으로 복원
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                     
	                     <!-- 일정 관리 -->
	                      <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>일정 관리</h5>
	                             <ul>
	                             	 <li>위치 : 일정> </li>
	                              	 <li>일정등록 <br>- 『신규일정추가』 버튼을 클릭하여, 개인일정 등록 </li>
	                              	 <li>일정수정 <br>- 일정 행을 클릭하여, 개인일정을 수정 </li>
	                              	 <li>일정조회 <br>- 연차신청서, 출장신청서 결재 완료 시 실시간으로 반영
	                              	 		    <br>- 회의실 일정에 참가 시, 실시간으로 일정에 반영  
	                              	 </li>
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                     
	                     <!-- 기안하기, 결재하기 -->
	                      <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>문서 기안하기</h5>
	                             <ul>
	                             	 <li>위치 : 문서>결재신청 </li>
	                             	 <ol>
		                              	 <li>결재라인 <br>- 『결재자 선택』 버튼을 클릭하여, 결재라인 선택 </li>
		                              	 <li>결재유형 <br>- 유형을 선택하면 하단 유형에 맞는 문서폼이 출력 </li>
		                              	 <li>폼에 맞추어 입력 후 『제출』버튼을 클릭 </li>
		                              	 <li>기안한 문서는 "결재자의 내문서함(결재함)",<br> "기안자의 내문서함(기안함)",<br> "참조자의 참조문서함"에서 확인 가능</li>
		                              	 <li>기안한 문서의 수정·삭제는 기안자만 '결재대기' 상태에서만 가능</li>
	                              	 </ol>
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                      <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>문서 결재하기</h5>
	                             <ul>
	                             	 <li>위치 : 문서>내문서함<br>〔결재함〕탭에서 '결재대기' 문서 선택 </li>
	                             	 <ol>
		                              	 <li>승인 <br>- 『승인』 버튼을 클릭하여, 결재 
		                              	 	     <br>- 전자서명 등록이 되어있어야 승인 가능 </li>
		                              	 <li>반려 <br>- 『반려』 버튼을 클릭하여, 반려
		                              	  		 <br>- 반려사유 입력 후 『결정』을 클릭</li>
		                              	 <li>결재한 문서는 "결재자의 내문서함(결재함)" 또는 "기안자의 내문서함(기안함)"에서 확인 가능</li>
	                              	 </ol>
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                     <!-- 조직도 -->
	                      <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>조직도</h5>
	                             <ul>
	                             	 <li>위치 : 조직도>조직도, 사원조회
	                              	 <li>조직도<br>- 『부서명』 클릭 시, 부서원 리스트 조회 가능 
	                              	 	     <br>- 『부서장 이름』 클릭 시, 해당 부서장의 정보 조회 가능 </li>
	                              	 <li>직원목록 <br>- 재직중인 모든 직원의 부서, 직급, 연락처 이름 순 조회
	                              	 </li>
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                     
	                     <!-- 자유게시판 -->
	                      <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>사내 게시판</h5>
	                             <ul>
	                             	 <li>위치 : 게시판>자유 게시판
	                              	 <li>게시글 리스트<br>- 카테고리 별로 게시글 리스트</li>
	                              	 <li>게시글 글쓰기<br>- 『<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
	                                       			<line x1="12" y1="5" x2="12" y2="19"></line> <line x1="5" y1="12" x2="19" y2="12"></line></svg>
	                                       			글쓰기』 클릭시 게시글 작성 가능</li>
	                              	 <li>게시글 상세보기 <br>- 조회수 : 상세보기 페이지 들어올시, 해당 게시글의 조회수 증가
	                              	 				 <br>- 좋아요 : 사원 한명당 하나만 증가시킬 수 있으며, 이미 증가시킨상태에서 클릭시 수 감소
	                              	 				 <br>- 댓글 : 해당 게시글에 댓글 입력 가능하며, 본인이 입력한 댓글은 
			                              	 				 『 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash">
				                                            <polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
				                                            <line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>』 버튼으로 삭제
				                                    <br>- 게시글 수정 : 본인이 작성한 게시글일 경우  
					                                    	『<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3 flaticon-notes">
		                                                	<path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>』
	                                                		버튼으로 게시글 수정페이지 이동
                                               		<br>- 게시글 삭제 : 본인이 작성한 게시글일 경우  
			                                                『<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 delete-note">
				                                        	<polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
				                                        	<line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>』
				                                        	버튼으로 게시글 삭제 및 해당 게시글과 매칭되는 댓글·첨부파일·좋아요수·조회수 삭제
	                              	 </li>
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                     
	                      <!-- 회의실 예약 -->
	                      <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>회의실 예약</h5>
	                             <ul>
	                             	 <li>위치 : 회의실예약 > 회의실 리스트</li>
	                              	 <li>예약하기 
		                              	 <ol>
		                              	 	<li>원하는 회의실의 『예약하기』를 클릭</li>
		                              	 	<li>예약일자·시간·정보·참여자(『참여자 선택』으로 선택)을 입력 한 뒤, 『예약하기』 버튼을 클릭
		                              	 	</li>
		                              	 </ol>
                              	 		- 예약된 회의일정은 각 참여자의 일정(calendar) <br>
                              	 			  또는 신청자의 '회의실예약 > 내 예약리스트 ' 에서 조회
                              	 		<br>- 예약한 회의는 취소 '예약자의 회의실예약 > 내 예약리스트' 『삭제하기』 버튼을 클릭 
	                              	 </li>
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                     
	                      <!-- 메신저 -->
	                      <div class="note-item all-notes common">
	                         <div class="note-inner-content">
	                             <h5>메신저</h5>
	                             <ul>
	                             	 <li>위치 : 상단 헤더 부분의 MESSANGER</li>
	                              	 <li>대화하기
		                              	 <ol>
		                              	 	<li><사원검색> 탭에서 사원을 검색</li> 
		                              	 	<li>『채팅』 버튼으로 채팅방 생성</li>
		                              	 </ol>
                              	 		- 채팅방에 하나 이상 메세지가 있다면 본인과 상대방의 <채팅목록>에서 조회 가능
	                              	 </li>
	                              	 <li>참여중인 채팅방 
		                              	 <ol>
		                              	 	<li><채팅목록>참여하고있는 채팅방 선택</li> 
		                              	 	<li>『채팅』 버튼으로 채팅방 참여
		                              	 		<br> 『나가기』 버튼으로 채팅방 나가기
	                              	 		</li>
		                              	 </ol>
	                              	 </li>
	                              	 - 한번에 여러 채팅방 대화가 가능하지만, 1:1 대화만 가능
	                             </ul>
	                             ${noteEnd}
	                         </div>
	                     </div>
	                     <!-- 테스트계정 -->
	                     <div class="note-item all-notes test">
	                         <div class="note-inner-content">
	                             <h5>테스트 계정</h5>
	                             
	                             <ul>
	                             	<li>비밀번호는 모두 1234입니다.</li>
	                                 <li>
	                                 	가맹점권한
	                                 	<div class="input-group input-group-sm mt-2">
										    <span class="input-group-text">아 이 디</span>
										    <input id="idFranchise" type="text" class="form-control" value="franchise@haruon.com" readonly>
										    <button id="copyIdFranchise" class="btn">copy</button>
										</div>
									</li></br>
	                                 <li>
	                                 	인사권한
	                                 	<div class="input-group input-group-sm mt-2">
										    <span class="input-group-text">아 이 디</span>
										    <input id="idPersonnel" type="text" class="form-control" value="personnel@haruon.com" readonly>
										    <button id="copyIdPersonnel" class="btn">copy</button>
										</div>
                                 	 </li></br>
	                                 <li>
	                                 	시스템
	                                 	<div class="input-group input-group-sm mt-2">
										    <span class="input-group-text">아 이 디</span>
										    <input id="idSystem" type="text" class="form-control" value="system@haruon.com" readonly>
										    <button id="copyIdSystem" class="btn">copy</button>
										</div>
                                 	 </li></br>
	                                 <li>
	                                 	부서관리
	                                 	<div class="input-group input-group-sm mt-2">
										    <span class="input-group-text">아 이 디</span>
										    <input id="idDivision" type="text" class="form-control" value="division@haruon.com" readonly>
										    <button id="copyIdDivision" class="btn">copy</button>
										</div>
                                 	 </li></br>
	                                 <li>
	                                 	일반직원
	                                 	<div class="input-group input-group-sm mt-2">
										    <span class="input-group-text" >아 이 디</span>
										    <input id="idCommon" type="text" class="form-control" value="common@haruon.com" readonly>
										    <button id="copyIdCommon" class="btn">copy</button>
										</div>
                                 	 </li>
                               	 </ul>
	                         </div>
	                     </div>
	                     
	                 </div>
	
	             </div>
	         </div>
        <!--  END CONTENT AREA  -->
        </div>
        
    </div>
    <!-- END MAIN CONTAINER -->
    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/plugins/src/global/vendors.min.js"></script>
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../src/assets/js/apps/notes.js"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script>
	   document.addEventListener('click', function(event) {
		   
	      if (event.target && event.target.id.startsWith('copyId')) {
		      let targetId = event.target.id.replace('copyId','id');
		      const code = $('#'+targetId).val();
		      
		      window.navigator.clipboard.writeText(code).then ( () => {
		   		  alert('아이디가 복사되었습니다');
		   	  });
		   }
		});
    </script>
</body>
</html>