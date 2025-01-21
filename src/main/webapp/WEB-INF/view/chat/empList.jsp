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
    <title>HARUON 메신저</title>
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <link href="../src/assets/css/light/apps/contacts.css" rel="stylesheet" type="text/css" />

    <link href="../src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css">
    <link href="../src/assets/css/dark/apps/contacts.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/light/elements/custom-pagination.css" rel="stylesheet" type="text/css" />
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
						    	<span id="connectionStatus" class="badge badge-success ms-2" id="btndefault" type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>
						    	</span>
							    <div class="dropdown-menu" aria-labelledby="btndefault">
							        <a href="${pageContext.request.contextPath}/chat/connection/update?status=온라인" class="dropdown-item"><span class="badge badge-light-success w-100">온라인</span></a>
							        <a href="${pageContext.request.contextPath}/chat/connection/update?status=오프라인" class="dropdown-item"><span class="badge badge-light-secondary w-100">오프라인</span></a>
							        <a href="${pageContext.request.contextPath}/chat/connection/update?status=자리비움" class="dropdown-item"><span class="badge badge-light-info w-100">자리비움</span></a>
							        <a href="${pageContext.request.contextPath}/chat/connection/update?status=회의중" class="dropdown-item"><span class="badge badge-light-warning w-100">회의중</span></a>
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
	                           	<div id="chatList" class="scrollbar item-content mb-2 ms-0 d-flex justify-content-between align-items-center rounded p-3 bg-white" style="width:500px; max-height: 550px; overflow-y: auto;">
	                           		<div class="user-meta-info ms-2">
	                           			<div class="d-flex">
		                           			<img src="${pageContext.request.contextPath}/upload/profile/noProfile.png" style="width:72px; height:72px;" alt="avatar" >
		                           			<div class="ms-2">
			                           			<p>
			                           				이름(부서)
			                           				<span class="badge badge-light-success ms-2">Login</span>
			                           			</p>
	                           					<div>(시간)내용</div>
	                           				</div>
	            						</div>  
			    	    	        </div>
			    	    	        <div class="action-btn">
			    	    	            <a onclick="window.open('${pageContext.request.contextPath}/chat?id=1', '_blank', 'width=410, height=500', 'left=410')" 
			    	    	             type="button" class="btn btn-outline-primary btn-hover">채팅</a>
			    	    	        </div>
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
					                                <form class="form-inline" style="width:570px;">
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
    <script src="../src/plugins/src/global/vendors.min.js"></script>
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <script src="../src/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/plugins/src/jquery-ui/jquery-ui.min.js"></script>
    <script src="../src/assets/js/apps/contact.js"></script>
    <!-- ajax 호출 -->
    <script>
   		$.ajax({
    	   url: '/chat/employees',
    	   method: 'GET',
    	}).done(function(result) {
			let empListHTML = "";
			
    	   $(result).each(function(index, item) {   
     		  let conn = item.connectionStatus; 
    		  let profile = item.fileName + "." + item.ext;
    		  profile = (profile.trim() === "null.null")? "noProfile.png" : profile;
    		  
    		  if(item.empNo === ${principal.empNo}) {
    			  let userProfileHtml = `<img src="${pageContext.request.contextPath}/upload/profile/` + profile + `" style="width:96px; height:96px;" alt="avatar" >`
    			  $('#userProfile').append(userProfileHtml);
    			  $("#connectionStatus").append(conn);
    			  return true;
    		  }
    		  
    	      empListHTML += `<div class="items">
			    	    	    <div class="item-content">
			    	    	        <div class="user-profile align-items-center">
			    	    	 `;
			    	    	 
              empListHTML += `<img src="${pageContext.request.contextPath}/upload/profile/` + profile + `" style="width:72px; height:72px;" alt="avatar" >`
			    	    	            
         	  empListHTML += `<div class="user-meta-info ms-2">
	                			<p class="user-name">` + item.ename;
   	    	 				 ;  	    	          
			    	    	                
			  empListHTML +=  (conn === "온라인")? `<span class="badge badge-light-success ms-2">Login</span>` 
   		    	            : (conn === "오프라인")? `<span class="badge badge-light-secondary ms-2">Logout</span>` 
   		    	            : (conn === "자리비움")? `<span class="badge badge-light-info ms-2">Away</span>` 
   		    	            : `<span class="badge badge-light-warning ms-2">Busy</span>`
   	    	               	+ `</p>`;
			  empListHTML += ` 			<p class="user-dept">` + item.dname + '(' + item.location + ')' + `</p>
	            					</div>  
			 					</div>
			    	    	        <div class="action-btn">
			    	    	            <a onclick="window.open('${pageContext.request.contextPath}/chat?id=` + item.empNo + `', '_blank', 'width=410, height=500', 'left=410')" 
			    	    	             type="button" class="btn btn-outline-primary btn-hover">채팅</a>
			    	    	        </div>
			    	    	    </div>
			    	    	</div>
          					`;
    	   });

    	   $("#empList").append(empListHTML);
    	}).fail(function() {
    	   console.log("ajax 호출 실패");
    	});

    </script>
</body>
</html>