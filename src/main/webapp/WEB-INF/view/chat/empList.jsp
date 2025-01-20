<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <div class="row layout-spacing layout-top-spacing" id="cancel-row">
                <div class="col-lg-12">
                	<!-- 내 프로필 -->
       				<div class="row card mb-2" style="width:500px">
      					<span><img src="/upload/profile/noProfile.png" alt="avatar" style="width:96px; height:96px;"></span>
               			<p class="user-name">
               				Ellwood McEllen
               				<span class="badge badge-light-secondary ms-2">Logout</span>
               			</p>
               			<p class="user-dept">가맹점관리과(부서장)</p>
 						<p>상태메세지</p>
 					</div>
 					
                    <div class="widget-content searchable-container list">
                        <!-- 사원조회 시작 -->
                        <div class="searchable-items list">
                            <div class="items items-header-section">
                                <div class="item-content layout-spacing " style="width:500px">
		                            <div class="filtered-list-search align-self-center">
		                                <form class="form-inline" style="width:400px;">
		                                    <div class="mw-100">
		                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
		                                        <input type="text" class="form-control product-search" id="input-search" placeholder="직원 검색...">
		                                    </div>
		                                </form>
		                            </div>
						            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#5c5c5c" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
                                </div>
	                           	<div id="empList" class="scrollbar" style="max-height: 550px; overflow-y: auto;"></div>
                            </div>
                        </div>
                        <!-- 사원조회 종료 -->
                    </div>
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
    		   
    	      empListHTML += `<div class="items">
			    	    	    <div class="item-content">
			    	    	        <div class="user-profile align-items-center">
			    	    	 `;
			    	    	 
              empListHTML += (profile.trim() === "null.null")? 
            		 		 `<img src="${pageContext.request.contextPath}/upload/profile/noProfile.png" alt="avatar" >`
            		  		: `<img src="${pageContext.request.contextPath}/upload/profile/` + profile + `" alt="avatar" >`
			    	    	            
         	  empListHTML += `<div class="user-meta-info ms-2">
	                			<p class="user-name">` + item.ename;
   	    	 				 ;  	    	          
			    	    	                
			  empListHTML +=  (conn === "로그인")? `<span class="badge badge-light-success ms-2">Login</span>` 
   		    	            : (conn === "로그아웃")? `<span class="badge badge-light-secondary ms-2">Logout</span>` 
   		    	            : (conn === "자리비움")? `<span class="badge badge-light-info ms-2">Away</span>` 
   		    	            : `<span class="badge badge-light-warning ms-2">Busy</span>`
   	    	               	+ `</p>`;
			  empListHTML += ` 			<p class="user-dept">` + item.dname + '(' + item.location + ')' + `</p>
			  							<p>집가고싶다</p>
	            					</div>  
			 					</div>
			    	    	        <div class="action-btn">
			    	    	            <a href="${pageContext.request.contextPath}/chat?id=` + item.empNo + `" type="button" class="btn btn-outline-primary btn-hover">채팅</a>
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