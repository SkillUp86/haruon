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
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${pageContext.request.contextPath}/src/assets/css/light/apps/chat.css" rel="stylesheet" type="text/css" />
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
    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content"> <div class="spinner-grow align-self-center">
    </div></div></div></div>
    <!--  END LOADER -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">
        <div class="overlay"></div>
        <div class="cs-overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN CONTENT AREA  -->
        <div id="content-sub" class="main-content">
            <div class="chat-section layout-top-spacing">
                <div>
                    <div class="chat-system">
            
                        <!-- 채팅 내역 시작 -->
                        <div class="chat-box">
                            <div class="chat-box-inner">
                            	<!-- 상단 - 채팅 헤더 -->
                                <div class="chat-meta-user  d-flex justify-content-between ">
                                    <div class="current-chat-user-name">
                                        <span id="particiant">
                                        </span>
                                    </div>
                                    <div class="align-content-center me-3">
					        			<a class="btn btn-warning" onclick="window.close()">창닫기</a>
					        		</div>	
                                </div>
                                <!-- 중단 - 채팅 내역 -->
                                <div class="chat-conversation-box">
                                    <div id="chat-conversation-box-scroll" class="chat-conversation-box-scroll">
                                        <div id="conversation" class="chat active-chat person">
                                        </div>
                                    </div>
                                </div>
                                <!-- 하단 - 채팅 입력 input -->
                                <div class="chat-footer">
                                    <div class="chat-input">
                                        <form class="chat-form" action="javascript:void(0);">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                                            <input id="mail-write-box-form" name="message" type="text" class="mail-write-box form-control" placeholder="Message"/>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 채팅 내역 끝 -->
                        
                    </div>
                </div>
            </div>

        	
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
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/assets/js/apps/chat.js"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    
    <!-- ajax 호출 채팅 상대방 정보 / 이전 대화내역 -->
	<script>
		$(document).ready(function() {
			showParticiant();
			
		})
	</script>
	
	<!-- 스크롤을 최하단으로 내리는 함수 -->
	<script>
		function moveScrollBottom() {
			var chatBox = $(".chat-conversation-box");		
			chatBox.scrollTop(chatBox.prop("scrollHeight"));
		}
	</script>
	
    <script>
    	// 채팅 상대방 정보
    	function showParticiant() {
    		$.ajax({
    			url: `/chat/room/${roomId}/particiant`,
    			method: 'GET',
    		}).done(function(result) {
    			let checkUndefined = (result.ename === undefined);
    			
    			
    			
    			
    		  	let particiantHTML = ''
    		  	
  		    	if(checkUndefined) {
  	    		  	particiantHTML += ` <img src="${pageContext.request.contextPath}/upload/profile/noProfile.png">
						                <span>알수없음</span>
						               `;
						               
					$("#mail-write-box-form").prop('readonly', true);
					$("#mail-write-box-form").attr('placeholder', '상대방이 채팅방을 나갔습니다;')
  		    	}
  		    	
  		    	if(!checkUndefined) {
  		    		let profile = result.fileName + "." + result.ext;
  	    		  	profile = (profile.trim() === "null.null")? "noProfile.png" : profile;
  		    		
  		    		let conn = result.connectionStatus;
  	    			conn = (conn === "J01")? `<span class="badge badge-light-success ms-2">온라인</span>`
  	   	            	   : (conn === "J02")? `<span class="badge badge-light-secondary ms-2">오프라인</span>` 
  	  		    	       : (conn === "J03")? `<span class="badge badge-light-info ms-2">자리비움</span>`
  	  		    	       : (conn === "J04")? `<span class="badge badge-light-warning ms-2">회의중</span>`
  	  		    	   							: '';
  	  		    	       
  	    		  	particiantHTML += ` <img src="${pageContext.request.contextPath}/upload/profile/` + profile + `">
						                <span>` + result.ename + conn + `</span>
						               `;
  		    	}
    			
    		  	
    		  	
    		  	$("#particiant").append(particiantHTML);
    		}).fail(function() {
    			console.log('showParticiant ajax 호출 실패');
    		});
    	}
		// 이전 대화내용
    	function showConversation() {
    		$.ajax({
    			url: '/chat/room/${roomId}/conversation',
    			method: 'GET',
    			async: false,
    		}).done(function(result) {
    			// HTML 요소 초기화
    			let conversationHTML = '';
    			
    			let sender = '';
    			let alertNewDay = '';
    			let time = '';
    			let content = '';
    			
    			// 날짜별로 가장 첫번째로 올라온 메세지 위에 conversation-start 붙이기
    			let sendTimes = [];		// 모든 sendTime 배열[date:time]
    			let startTimesArr = {}; // 날짜 그룹으로 가장 이른시간 저장 [{date : time}]
    			let conversationStartTimes = [];	// 비교가능한 형태로 뭉치기 [date+time]

    			$(result).each(function(index, item) {
    				let [date, time] = item.sendTime.split(" ");
    				sendTimes.push({date, time});
    				 
    			});
    		
    			
				// 해당 날짜가 없거나, 해당 날짜의 키값보다 현 비교하는 time이 이르다면
				sendTimes.forEach( (item) => {
					let date = item.date.trim();
					//console.log(item.date);
				    // 해당 날짜가 이미 있으면
				    if (startTimesArr[date]) {
				    	//console.log("시간이 더 이른지 검사");
				        // 만약 현재 시간(time)이 더 이르다면
				        if (item.time < startTimesArr[date]) {
				            startTimesArr[date] = item.time;  // 시간 교체
				        }
				    } else {
				    	//console.log("해당날짜 없음");
				        // 해당 날짜가 없으면
				        startTimesArr[date] = item.time;  // 시간 추가
				    }
				});
				
    			// 더 이른시간끼리 합쳐진 키 : 값을 하나의 값으로 변환
    			for(let i in startTimesArr) {
    				let conversationStartTime = i + " " + startTimesArr[i];
    				conversationStartTimes.push(conversationStartTime);
    			}
    			//console.log(conversationStartTimes);
    			
  			
    			let oneChatHTML = '';
    			$(result).each(function(index, item) {
    				let earliestStart = false;
    				// 해당 날짜 중 가장 이른 시간 채팅이라면 conversation-start
					for(let i in conversationStartTimes) {
	    				if(conversationStartTimes[i] === item.sendTime) {
	    					earliestStart = true;
	    				}
	    			}
    				alertNewDay = (earliestStart)? `<div class="conversation-start">
								                    	<span>` + item.sendTime.substr(0,10) + `</span>
									                </div>` : '';
																               
             		
    				// 발화자가 나라면 우측에 아니라면 좌측에 말풍선 띄우기
    				if((item.senderNo.trim() === `${principal.empNo}`.trim())) {
    					sender = `<div class="bubble me">`;
    					time = `<div class="text-end">` + item.sendTime.substr(11,5) + `</div>`;
    				} else {
    					sender = `<div class="bubble you">`;
    					time = `<div>` + item.sendTime.substr(11,5) + `</div>`;
    				}
    				
    				//console.log(item.senderNo, ${principal.empNo});
    				
    				content = `<span>` + item.message + `</span></div>`;
    				
    				oneChatHTML += alertNewDay + sender + content + time;
    			});
    			
    			$("#conversation").append(oneChatHTML);
    			
    			moveScrollBottom();

    		}).fail(function() {
    			console.log('showParticiant ajax 호출 실패');
    		});
    	}
    </script>
    
    <script>
	    const socket = new WebSocket('ws://' + window.location.host + ':80/ws/chat/room?id=${roomId}');
	    
	    // 소켓 연결 디버깅	
	    socket.onopen = () => {
	        console.log("연결됨");
			
	        startCurrentConversationHTML = `<div class="conversation-start">
						                		<span>대화시작</span>
						                	</div>`;
						                	
	        showConversation();
	        $("#conversation").append(startCurrentConversationHTML);
	    };
	
	    socket.onerror = (error) => {
	        console.error("에러", error);
	    };
		
	    
	    socket.onclose = () => {
	        console.log("연결 해제");
	    };
	    
	    socket.onmessage = (msg) => {
	    	if(msg.data === 'error') {
	    		alert("유효하지 않은 채팅방입니다, 채팅을 시작하려면 ChatMain에서 진행해주세요.");
	    		return false;
	    	}
	    	
	        console.log("메시지 수신:", msg.data); // 메시지 내용 확인
	        let messageBox = msg.data.split('~');
	        
			// 서버로 부터 받은 메시지 HTML 적용
	        let getMessageHTML = '';
	        
	        var roomId = messageBox[0];
	        var senderNo = messageBox[1];
	        var sendTime = messageBox[2];
	        var message = messageBox[3];
	        
	        // 발화자에 따라 다른 형식의 HTML 적용
	        let senderHTML = '';
	        let timeHTML = '';
	        let messageHTML = '';

	        if((senderNo.trim() === `${principal.empNo}`.trim())) {
				senderHTML += `<div class="bubble me">`;
				timeHTML += `<div class="text-end">` + sendTime.substr(11,5) + `</div>`;
			} else {
				senderHTML = `<div class="bubble you">`;
				timeHTML = `<div>` + sendTime.substr(11,5) + `</div>`;
			}
			messageHTML = `<span>` + message + `</span></div>`;
			
			// HTML 하나로 합치기 
			getMessageHTML = senderHTML + messageHTML + timeHTML;
	        	
	        $("#conversation").append(getMessageHTML);
	        
			// 스크롤바 조절
			moveScrollBottom();
	    };
		
		    
	 	// 채팅입력 - 입력한 채팅을 서버로 보내는 스크립트 
		$('.mail-write-box').on('keydown', function(event) {
		    if(event.key === 'Enter') {
		        // 메세지
		    	var message = $(this);
		        var chatMessageValue = message.val();
		        if (chatMessageValue === '') { return; }
				// 발송인, 채팅방ID, 발송시간(현재)
		        let today = new Date();
		        var senderNo = `${principal.empNo}`;
		        var roomId = '${roomId}';
		        var sendTime = today.getFullYear() + '-' + (today.getMonth()+1 +'').padStart(2, 0) + '-' + (today.getDate() +'').padStart(2, 0) + ' '
		                        + (today.getHours() +'').padStart(2, 0) + ':' + (today.getMinutes() +'').padStart(2, 0) + ':'+ (today.getSeconds() +'').padStart(2, 0);
		        
		    	// 서버로 보낼 데이터(발송인, 채팅방ID, 발송시간, 메시지)
                socket.send(roomId + '~' + senderNo + '~' + sendTime + '~' + chatMessageValue);
                
		        var clearmessage = message.val('');

		    }
		})

    </script>
    
</body>
</html>