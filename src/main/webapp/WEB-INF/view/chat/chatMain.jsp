<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<sec:authentication property="principal" var="principal"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>HARUON | 메신저</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
    
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/apps/contacts.css" rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/src/assets/css/light/elements/custom-pagination.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->    

    <style>
        #content-sub {
		  flex-grow: 8;
		  margin-bottom: 0;
		  -webkit-transition: 0.3s ease all;
		  transition: 0.3s ease all;
		}
    </style>

</head>
<body>
    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="overlay"></div>
    <div class="search-overlay"></div>
	
    <div id="content-sub" class="main-content">
        <div class="layout-px-spacing">
            <div class="layout-spacing layout-top-spacing" id="cancel-row">
                <div class="col-lg-12">
                
                	<!-- 내 프로필 시작 -->
       				<div class="item-content mb-2 ms-0 d-flex justify-content-between border rounded p-3" style="width:500px;background-color: #fff; border-color #e0e6ed;">
       					<div class="d-flex">
	      					<div id="userProfile"></div>
	      					<div class="ms-5">
	             				<p>${principal.ename}</p>
		               			<p>${principal.dname}(${principal.location})</p>
	      					</div>
      					</div>
      					<div>
	    					<div class="btn-group" role="group">
						    	<span id="currentStatusColor" id="btndefault" type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    		<span id="connectionStatus"></span>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>
						    	</span>
							    <div class="dropdown-menu" aria-labelledby="btndefault">
							    	<!-- J01(온라인) J02(오프라인) J03(자리비움) J04(방해금지)  -->
							        <button id="switchConnectionJ01" type="button" class="dropdown-item mb-1"><span class="badge badge-light-success w-100">온라인</span></button>
							        <button id="switchConnectionJ02" type="button" class="dropdown-item mb-1"><span class="badge badge-light-secondary w-100">오프라인</span></button>
							        <button id="switchConnectionJ03" type="button" class="dropdown-item mb-1"><span class="badge badge-light-info w-100">자리비움</span></button>
							        <button id="switchConnectionJ04" type="button" class="dropdown-item mb-1"><span class="badge badge-light-warning w-100">회의중</span></button>
							    </div>
							</div>
      					</div>
 					</div>
 					<!-- 내 프로필 종료 -->
 					
 					<!-- 리스트 시작 -->
 					<div class="simple-tab">
 						<!-- tab 시작 -->
	 					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		 					<li class="nav-item" role="presentation">
					            <button class="nav-link active" id="pills-chat-icon-tab" data-bs-toggle="pill" data-bs-target="#pills-chat-icon" type="button" role="tab" aria-controls="pills-contact-icon" aria-selected="false">
					                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#5c5c5c" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
					                채팅목록
					            </button>
					        </li>
					       <li class="nav-item" role="presentation">
					           <button class="nav-link" id="pills-employees-icon-tab" data-bs-toggle="pill" data-bs-target="#pills-employees-icon" type="button" role="tab" aria-controls="pills-profile-icon" aria-selected="false">
					               <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
					               사원검색
					           </button>
					       </li>
				        </ul>
				        <!-- tab 종료 -->
				        
				        <!-- tab content 시작 -->
				        <div class="tab-content" id="pills-tabContent">
				        	<!-- 채팅방 리스트 시작 -->
	                        <div class="tab-pane fade show active" id="pills-chat-icon" role="tabpanel" aria-labelledby="pills-contact-icon-tab" tabindex="0">
	                           	<div id="chatRoomList" class="scrollbar" style="width:500px; max-height: 550px; overflow-y: auto;">
	                           		<!-- 동적처리 부분 시작 -->
	                           		
	                           		
									<!-- 동적처리 부분 종료 -->
	                           	</div>
	                        </div>
	                        <!-- 채팅방 리스트 종료 -->
				        
	                        <!-- 사원조회 시작 -->
				        	<div class="tab-pane fade" id="pills-employees-icon" role="tabpanel" aria-labelledby="pills-profile-icon-tab" tabindex="0">
			                    <div class="widget-content searchable-container list">
			                        <div class="searchable-items list">
			                            <div class="items items-header-section">
			                                <div class="item-content layout-spacing " style="width:500px">
					                            <div class="filtered-list-search align-self-center">
					                                <form class="form-inline" style="width:460px;">
					                                    <div class="mw-100">
					                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
					                                        <input type="text" class="form-control product-search" id="input-search" placeholder="직원 검색...">
					                                    </div>
					                                </form>
					                            </div>
			                                </div>
				                           	<div id="empList" class="scrollbar" style="max-height: 550px; overflow-y: auto;"></div>
			                            </div>
			                        </div>
		                        </div>
	                        </div>
	                        <!-- 사원조회 종료 -->
	                        
                        </div>
                         <!-- tab content 종료 -->
                    </div>
                    <!-- 리스트 종료 -->
                    
                </div>
            </div>
        </div>
    </div>
    
    <!--  END CONTENT AREA  -->
    
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
    
	<!-- document 초기화시 로드 -->
	<script>
		$(document).ready(function() {
			showEmployeesList();
			showChatRoomList();
			
			// 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
            var strDocumentWidth = $(document).outerWidth();
            var strDocumentHeight = $(document).outerHeight();
            window.resizeTo ( strDocumentWidth, strDocumentHeight );

            var strMenuWidth = strDocumentWidth - $(window).width();
            var strMenuHeight = strDocumentHeight - $(window).height();

            var strWidth = $('#content-sub').outerWidth() + strMenuWidth;
            var strHeight = $('#content-sub').outerHeight() + strMenuHeight + 300;

	    	//resize
	    	window.resizeTo( strWidth, strHeight );
		});

	</script>    

	<!-- 나의 상태변경 script -->
	<script>
		var switchBtn = {
			switchConnectionJ01 : '/chat/connection/update/J01',
			switchConnectionJ02 : '/chat/connection/update/J02',
			switchConnectionJ03 : '/chat/connection/update/J03',
			switchConnectionJ04 : '/chat/connection/update/J04',
		}	
			
		for(let i in switchBtn) {
			$("#" + i).click(function() {
				$.ajax({
					url: switchBtn[i],
					method: 'GET',
				}).done(function() {
					showSwitchStatusResult();	
				}).fail(function() {
					console.log("switchConnectionStatus - 실패");
				});
				
			});
		}
		
		// 상태 변경 시 내 상태 변경 
    	function showSwitchStatusResult() {
    		$.ajax({
 	    	   url: '/chat/employees',
 	    	   method: 'GET',
 	    	}).done(function(result) {
 	    		$("#connectionStatus").empty();
 	    		$("#currentStatusColor").removeClass();
				let conn = '';
 	    		$(result).each(function(index, item) {   
 		    		  if(item.empNo === ${principal.empNo}) {
 		    			  conn = item.connectionStatus; 
 		    			  return false;
 		    		  }
				 });
 	    		
 	    		let connStatus = {
 	    			"J01" : '온라인',
 	    			"J02" : '오프라인',
 	    			"J03" : '자리비움',
 	    			"J04" : '회의중',
 	 	    	}
 	    		
 	    		let currentStatusColor = {
 	    			"J01" : 'badge ms-2 badge-light-success',
 	    			"J02" : 'badge ms-2 badge-light-secondary',
 	    			"J03" : 'badge ms-2 badge-light-info',
 	    			"J04" : 'badge ms-2 badge-light-warning',
 	    		}
 	    		
 	    		let currentStatusColorClass ='';
 	    		
 	    		for(var i in currentStatusColor) {
 	    			if(conn === i) {
 	    				currentStatusColorClass = currentStatusColor[i];
 	    				break;
 	    			}
 	    		}
 	    		
 	    		for(var i in connStatus) {
 	    			if(conn === i) {
 	    				conn = connStatus[i];
 	    				break;
 	    			}
 	    		}
 	    		
 	    		$("#currentStatusColor").addClass(currentStatusColorClass);
 	    		$("#connectionStatus").append(conn);
 	    	}).fail(function() {
 	    		console.log("showSwitchStatusResult 호출 실패");
 	    	})
    	}
	</script>
    
    <!-- 사원검색 -> 채팅시작 버튼 클릭 & 채팅방 나가기 -->
    <script>
    	// 채팅방 탐색 버튼 클릭 => 새창에서 매칭되는 폼 제출
	   document.addEventListener('click', function(event) {
		    // 클릭된 대상이 ID 패턴(enterChatRoomBtn+숫자)과 일치하는지 확인
		    if (event.target && event.target.id.startsWith('enterChatRoomBtn')) {
		        console.log('enterChatRoomBtn 버튼 클릭' + event.target.id);

		     let targetId = event.target.id.replace('enterChatRoomBtn','');
             let targetForm = "#checkChatRoom" + targetId;

             window.open('', 'popup', 'width=410, height=500');
             console.log("#checkChatRoom" + targetId + " 번 폼 제출");
             targetForm.target = 'popup'
             $(targetForm).submit();
		    }
		});
    	
    	// 채팅방 나가기 버튼
    	
    	document.addEventListener('click', function(event) {
    		if (event.target && event.target.id.startsWith('getOutOfRoomBtn')) {
    			console.log('getOutOfRoomBtn 버튼 클릭' + event.target.id);
    			let targetId = event.target.id.replace('getOutOfRoomBtn','');
    			
    			$.ajax({
					url: '/chat/room/' + targetId + '/particiant/delete',
					method: 'POST',
				}).done(function() {
					showChatRoomList();	
				}).fail(function() {
					console.log("switchConnectionStatus - 실패");
				});
    		}
    	});
       	
    </script>

    <!-- ajax 호출 : 사원검색 리스트 - showEmployeesList -->
    <script>
    	// 로그인한 사원을 포함한 전직원의 리스트 출력
    	function showEmployeesList() {
	   		$.ajax({
	    	   url: '/chat/employees',
	    	   method: 'GET',
	    	}).done(function(result) {
				let empListHTML = "";
				let variableVal = '';
	    	   $(result).each(function(index, item) {   
	     		  let conn = item.connectionStatus; 
	    		  let profile = item.fileName + "." + item.ext;
	    		  profile = (profile.trim() === "null.null")? "noProfile.png" : profile;
	    		  variableVal++;

	    		  // 내프로필
	    		  if(item.empNo === ${principal.empNo}) {
	    			  let userProfileHtml = `<img src="${pageContext.request.contextPath}/upload/profile/` + profile + `" style="width:96px; height:96px;" alt="avatar" >`
	    			  $('#userProfile').append(userProfileHtml);
	    			  
		   	    		let currentStatusColor = {
		   	 	    			"J01" : 'badge ms-2 badge-light-success',
		   	 	    			"J02" : 'badge ms-2 badge-light-secondary',
		   	 	    			"J03" : 'badge ms-2 badge-light-info',
		   	 	    			"J04" : 'badge ms-2 badge-light-warning',
		   	 	    	}
		   	    		
		 	    		let connStatus = {
		   	 	    			"J01" : '온라인',
		   	 	    			"J02" : '오프라인',
		   	 	    			"J03" : '자리비움',
		   	 	    			"J04" : '회의중',
	   	 	 	    	}
		   	    		
		   	    		let currentStatusColorClass ='';
		 	    		
		 	    		for(var i in currentStatusColor) {
		 	    			if(conn === i) {
		 	    				currentStatusColorClass = currentStatusColor[i];
		 	    				break;
		 	    			}
		 	    		}
		 	    		
		 	    		for(var i in connStatus) {
		 	    			if(conn === i) {
		 	    				conn = connStatus[i];
		 	    				break;
		 	    			}
		 	    		}
		 	    		
		 	    		$("#currentStatusColor").addClass(currentStatusColorClass);
		 	    		$("#connectionStatus").append(conn);
	    			  
	    			  return true;
	    		  }
	    		  
	    		  // 나를 제외한 다른 사람의 프로필
	    	      empListHTML += `<div class="items">
				    	    	    <div class="item-content">
				    	    	        <div class="user-profile align-items-center">
				    	    	 `;
				    	    	 
	              empListHTML += `<img src="${pageContext.request.contextPath}/upload/profile/` + profile + `" style="width:72px; height:72px;" alt="avatar" >`
				    	    	            
	         	  empListHTML += `<div class="user-meta-info ms-2">
		                			<p class="user-name">` + item.ename;
	   	    	 				 ;  	    	          
				    	    	                
				  empListHTML +=  (conn === "J01")? `<span class="badge badge-light-success ms-2">온라인</span>` 
	   		    	            : (conn === "J02")? `<span class="badge badge-light-secondary ms-2">오프라인</span>` 
	   		    	            : (conn === "J03")? `<span class="badge badge-light-info ms-2">자리비움</span>` 
	   		    	            : (conn === "J04")? `<span class="badge badge-light-warning ms-2">회의중</span>`
	   		    	            : ` `
	   	    	               	+ `</p>`;
				  empListHTML += ` 			<p class="user-dept">` + item.dname + '(' + item.location + ')' + `</p>
		            					</div>  
				 					</div>
				    	    	        <div class="action-btn">
					    	    	        <button id="enterChatRoomBtn` + variableVal + `" type="button" class="btn btn-outline-primary btn-hover">채팅</button>
	
					    	    	        <form id="checkChatRoom` + variableVal + `" method="post" action="${pageContext.request.contextPath}/chat/room/findOrCreate" target="popup">
					    	    	            <input name="empNo1" value="` + ${principal.empNo} + `" type="hidden">
					    	    	            <input name="empNo2" value="` + item.empNo + `" type="hidden">
					    	    	        </form>
				    	    	        </div>
				    	    	    </div>
				    	    	</div>
	          					`;
	    	   });
	
	    	   $("#empList").append(empListHTML);
	    	}).fail(function() {
	    	   console.log("ajax 호출 실패");
	    	});
    	}
		
    </script>
    
	<!-- 로그인한 사원이 참가하고있는 채팅방 리스트 출력 --> 
    <script>
		function showChatRoomList() {
	   		$.ajax({
	     	   url: '/chat/rooms/${principal.empNo}',
	     	   method: 'GET',
	     	}).done(function(result) {
	     		$("#chatRoomList").empty();
	 			let roomListHTML = "";
	 			let variableNumber = 0;
	     	   $(result).each(function(index, item) {   
	      		  let conn = item.connectionStatus; 
	     		  let profile = item.fileName + "." + item.ext;
	     		  profile = (profile.trim() === "null.null")? "noProfile.png" : profile;
	     		  variableNumber++;
	     		  
	     		  let now = new Date();
	     		  now.setHours(0,0,0,0);
	     		  let sendTime = item.sendTime;
	     		  let sendDate = new Date(sendTime.substr(0,4), sendTime.substr(5,2) - 1, sendTime.substr(8,2));
	     		  // 오늘 날짜라면 시간만 나오게 하고, 올해대화가 아니라면 년월일로표시
	     		  sendTime = (now.toDateString() === sendDate.toDateString())? 
	     				  			((sendTime.substr(11,2) <= 12) ? 'AM' + sendTime.substr(11,5) : 'PM' + sendTime.substr(11,5))
	     				  				: (sendDate.getFullYear() === now.getFullYear()? sendTime.substr(5,2)+'월'+sendTime.substr(8,2)+'일' : sendTime.substr(0,10));
	     		  
	     		  
	 			    	    	                
	     		  roomListHTML +=
	     			  ` <div class="item-content mb-2 ms-0 d-flex justify-content-between align-items-center rounded p-3 bg-white card">
		             		<div class="user-meta-info ms-2">
			         			<div class="d-flex">
			             			<img src="${pageContext.request.contextPath}/upload/profile/` + profile + `" style="width:96px; height:96px;" alt="avatar" >
			             			<div class="ms-2" style="width:250px;">
			                 			<span>` + item.ename;
			                 				
	              roomListHTML +=  (conn === "J01")? `<span class="badge badge-light-success ms-2">온라인</span>`
		    	            	 : (conn === "J02")? `<span class="badge badge-light-secondary ms-2">오프라인</span>` 
		   		    	         : (conn === "J03")? `<span class="badge badge-light-info ms-2">자리비움</span>`
		   		    	         : (conn === "J04")? `<span class="badge badge-light-warning ms-2">회의중</span>`
		   		    	         : ` `;
		   		    	         
	           	  roomListHTML +=		`</span>
           								<p style="font-color: #515365">(` + item.dname + `)</p>
	           							<div class="d-flex justify-content-between">
			         						<p>` + item.message + `</p>
			         						<p>` + sendTime + `</p>
			         					</div>	
			         				</div>
						  	        <div class="action-btn ms-3 mt-2">
						  	            <a onclick="window.open('${pageContext.request.contextPath}/chat/room?id=` + item.roomId + `', '_blank', 'width=410, height=500', 'left=410')" 
						  	             type="button" class="btn btn-outline-primary btn-hover mb-1">채팅</a>
						  	             <br>
						  	             <button id="getOutOfRoomBtn` + item.roomId + `" type="button" class="btn btn-outline-danger btn-hover">나가기</a>
						  	        </div>
								</div>  
				  	        </div>
						</div> `;
	     		
	     	   });
	     	  
	  			
	  			
	     	   $("#chatRoomList").append(roomListHTML);
	     	}).fail(function() {
	     	   console.log("chatList - ajax 호출 실패");
	     	});
		}
    
    </script>
    
    
    
</body>
</html>