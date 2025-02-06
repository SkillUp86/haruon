<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<sec:authentication property="principal" var="principal"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/png" href="../src/assets/img/favicon.ico" />
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="../src/plugins/src/notification/snackbar/snackbar.min.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/src/sweetalerts2/sweetalerts2.css" rel="stylesheet" type="text/css" />

    <link href="../src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/editors/quill/quill.snow.css">
    <link href="../src/assets/css/light/apps/mailbox.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/light/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />

    
    <!--  END CUSTOM STYLE FILE  -->
    
    <!-- 페이지 제목 입력칸 -->
    <title> HARUON | 임시 보관함</title>
    <!-- 페이지 제목 입력칸 -->
    
    <style>
		.button {
		  background: none;
		  border: none;
		  padding: 0;
		  width : 100%;
		  font: inherit;
		  color: inherit;
		  outline: none;
		}
    </style>
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
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
                                </a>
                                <div class="d-flex breadcrumb-content">
                                    <div class="page-header">

                                        <div class="page-title">
                                        </div>
                        
                                        <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#"> 메일함 </a></li>
                                                <li class="breadcrumb-item active" aria-current="page"> 임시보관함</li>
                                            </ol>
                                        </nav>
                        
                                    </div>
                                </div>
                                
                            </header>
                        </div>
                    </div>
                    <!--  END BREADCRUMBS  -->
                
                <!-- 임시보관함 편집 시작 -->
                
                <div class="row layout-top-spacing">
                	<h2 class="mt-3 mb-3">임시 보관함</h2>
                        <div class="col-xl-12 col-lg-12 col-md-12">
    
                            <div class="row">
    
                                 <div class="col-xl-12  col-md-12">
                                    <!-- 메세지 박스 시작 -->
                                    <div class="mail-box-container">

                                        <div id="mailbox-inbox" class="accordion mailbox-inbox">

                                            <div class="mail-overlay">
                                                <div class="tab-title">
                                                    <div class="row">

                                                        <div class="col-md-12 col-sm-12 col-12 mail-categories-container">
                                                            <div class="mail-sidebar-scroll"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="action-center">
                                                <div class="d-flex">
                                                    <div class="" data-bs-toggle="collapse" data-bs-target>
                                                        <input class="" type="hidden" id="inboxAll">
                                                    </div>
                                                    <div class="col-md-12 col-sm-12 col-12 text-center mail-btn-container">
                                                        <a id="btn-compose-mail" class="btn btn-block" href="javascript:void(0);">메일 보내기</a>
                                                    </div>
                                                </div>
                                            </div>
                                    
                                            <div class="message-box">
                                                
                                                <div class="message-box-scroll" id="ct">
                                                    <!-- 임시 보관함 시작 -->
                                                    <div class="mail-item">
                                                        <!-- 메일 리스트 HTML 동적처리할 부분-->
                                                        <div id="msgTemporarys" class="mail-item">
                                                        </div>
                                                        <!-- 메일 리스트 끝 -->
                                                    </div>
                                                </div>
        
                                                <div class="content-box">
                                                    <div class="d-flex msg-close">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left close-message"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
                                                        <h2 class="mail-title" data-selectedMailTitle=""></h2>
                                                    </div>

                                                    <div id="msgTemporary">
                                                    <!-- 임시 발송 - HTML 동적 처리할 부분 -->                                               
                                                    <!-- 임시 발송 끝 -->
                                                    </div>
                                                        
                                                </div>
                                            </div>
                                        </div>
	                                    <!-- 메세지 박스 끝 -->
	
	                                    <!-- 메세지 보내는 Modal 창 시작 -->
                                        <div class="modal fade" id="composeMailModal" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title add-title" id="notesMailModalTitleeLabel">발송</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                            <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                                        </button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <!-- <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-bs-dismiss="modal"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg> -->
                                                        <div class="compose-box">
                                                            <div class="compose-content">
                                                                <form id="m-form" method="post" action="${pageContext.request.contextPath}/insertMsg" enctype="multipart/form-data">
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <div class="mb-4 mail-to">
	                                                                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg> 수신인:</p>
                                                                                <select class="form-control" id="m-to" name="empNoR">
	                                                                                <option value="">직원 선택</option>
	                                                                                <c:forEach items="${empList}" var="el">
		                                                                                <option value="${el.empNo}">${el.ename} &lt;${el.email}&gt;</option>
	                                                                                </c:forEach>
                                                                            	</select>
                                                                        	</div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="row">
	                                                                    <div class="col-md-12">
	                                                                    	<div class="mb-4 mail-form">
	                                                                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg> 발신인: </p>
	                                                                            <input type="email" id="m-from" class="form-control" name="emailS" value="${ename} &lt;${email}&gt;" readonly> 
	                                                                            <input type="hidden" name="empNoS" value="${empNo}">
	                                                                            <input type="hidden" id="stateS" name="stateS" value="E01">
	                                                                        </div>
	                                                                    </div>
	
																		<!--
																		 ??? 참조자 어떻게 할건지 ???
	                                                                    <div class="col-md-6">
	                                                                        <div class="mb-4 mail-cc">
	                                                                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3" y2="6"></line><line x1="3" y1="12" x2="3" y2="12"></line><line x1="3" y1="18" x2="3" y2="18"></line></svg> CC:</p>
	                                                                            <div>
	                                                                                <input type="text" id="m-cc" class="form-control">
	                                                                                <span class="validation-text"></span>
	                                                                            </div>
	                                                                        </div>
	                                                                    </div>
	                                                                   -->
                                                                	</div>
                                                                
                                                                    <div class="mb-4">
                                                                        <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> 제목:</p>
                                                                        <div class="w-100">
                                                                            <input type="text" id="m-title" name="title" class="form-control">
                                                                        </div>
                                                                    </div>
                                                                    
											                        <div class="mb-4">
											                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> 첨부파일:</p>
											                            <!-- <input type="file" class="form-control-file" id="mail_File_attachment" multiple="multiple"> -->
											                            <input class="form-control file-upload-input" type="file" id="formFile" name="msgFiles">
											                        </div>
											                        
											                        <div class="">
											                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> 내용:</p>
								                                        <div class="col-sm-12">
								                                            <textarea class="form-control" id="m-content" name="content" placeholder="내용 작성" style="height: 300px;"></textarea>
								                                        </div>
							                                    	</div>
                                                                </form>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button id="btn-send" class="btn btn-primary"> 발송</button>
                                                        <button id="btn-save" class="btn float-left btn-success"> 저장</button>
                                                        <button class="btn" data-bs-dismiss="modal"> <i class="flaticon-delete-1"></i> 취소</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 메세지 보내는 Modal 창 끝 -->
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- 쪽지함 편집 끝 -->
                </div>
            <!--  BEGIN FOOTER  -->
            <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
            <!--  END FOOTER  -->
            </div>
        </div>
	</div>
            
              
           <!--  END CONTENT AREA  -->

    <!-- END MAIN CONTAINER -->
   
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/global/vendors.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js" defer></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/editors/quill/quill.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/notification/snackbar/snackbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/apps/mailbox.js"></script>

   <!-- END PAGE LEVEL SCRIPTS -->
   
    <!-- 모달 메일 발송 -->
	<script>
		// 발송 버튼 클릭 시 
		$('#btn-send').click(function() {
			// state 값을 E02로 변경
			$('#stateS').val("E02");
			
			if($('#m-to').val() == '') {
				alert('수신인을 선택해주세요');
			} else if($('#m-title').val() == '') {
				alert('제목을 입력해주세요');
			} else if($('#m-content').val() == '') {
				alert('내용을 입력해주세요');
			} else {
				$('#m-form').submit(); // 폼 제출
			}
		});
		
		// 저장 버튼 클릭 시 
		$('#btn-save').click(function() {
			
			if($('#m-to').val() == '') {
				alert('수신인을 선택해주세요');
			} else if($('#m-title').val() == '') {
				alert('제목을 입력해주세요');
			} else if($('#m-content').val() == '') {
				alert('내용을 입력해주세요');
			} else {
				$('#m-form').submit(); // 폼 제출
			}
		});

	</script>
	 
	 <script>
	   $(document).ready(function() {
		   showTemporaryMsgList();
	   });
	   
       document.addEventListener('click', function(event) {
           // closest()를 사용해 클릭한 요소에서 가장 가까운 버튼 확인
           let button = event.target.closest('button');
           
		   // 임시저장 발송 버튼 클릭 시 
	       if (button && button.id.startsWith('btn-mt-send')) {
	       console.log('임시저장 발송 버튼 클릭 ' + button.id);
	       let targetId = button.id.replace('btn-mt-send', '');
	
	           $("#stateS"+targetId).val("E02");
	           
	           if ($("#mt-to"+targetId).val() == '') {
	               alert('수신인을 선택해주세요');
	           } else if ($("#mt-title"+targetId).val() == '') {
	               alert('제목을 입력해주세요');
	           } else if ($("#mt-content"+targetId).val() == '') {
	               alert('내용을 입력해주세요');
	           } else {
	               $("#mt-form"+targetId).submit(); // 폼 제출
	           }
	       }
		   
		   // 임시저장 삭제 버튼 클릭 시 
	       if (button && button.id.startsWith('btn-mt-delete')) {
	       console.log('임시저장 삭제 버튼 클릭 ' + button.id);
	       let targetId = button.id.replace('btn-mt-delete', '');
			
      		 var isConfirm = confirm('삭제하시겠습니까?');
           
	         if(isConfirm) {
	       	    $("#mt-delete-form"+targetId).submit(); // 폼 제출
	         }
	       }
	    });
      </script>
	
	<!-- 뷰 -->
    <script>
    	function showTemporaryMsgList() {
	         $.ajax({
	                url: "/MsgTemporarys/" + "${principal.empNo}",
	                method: 'GET', 
	            }).done(function(result) {
	            	
	            	$('#msgTemporarys').empty();
	                // $('#msgTemporary').empty();
	           		
	                let msgTemporarysHTML = "";
	                let msgTemporaryModal = "";
	                let no = 0;
	                
	                $(result).each(function(index, item) {
	                    msgTemporarysHTML += `<div class="animated animatedFadeInUp fadeInUp" id="`+ "outNo" + no +`">
		                    					  <button id="btn-temporary-mail" id="swich` + item.msgNo + `" class="btn button" data-bs-toggle="modal" data-bs-target="#temporaryMailModal` + item.msgNo + `">
				                                      <div class="mb-0">
					                                      <div class="mail-item-heading work collapsed" data-bs-toggle="collapse" role="navigation" data-bs-target="#inNo` + no + `" aria-expanded="false"  aria-controls="inNo` + no + `">
					                                          <div class="mail-item-inner">
						                                          <div class="d-flex">
							                                          <div class="f-head ms-3">` +
																	       ((item.fileNameE != null)?
																		       `<img src="${pageContext.request.contextPath}/upload/profile/` + item.fileNameE + '.' + item.extE + `" class="user-profile" alt="avatar">`
																		     : `<img src="${pageContext.request.contextPath}/upload/profile/noProfile.png" class="user-profile" alt="avatar">`)
															      + ` </div>
							                     	                  <div class="f-body">
								                                          <div class="meta-mail-time">
								                                              <p class="user-email">` + item.enameR + "(" + item.descriptR + ")" +` </p>
								                                          </div>
								                                          <div class="meta-title-tag">
									                                          <p class="mail-content-excerpt" data-mailDescription='{"ops":[{"insert":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi pulvinar feugiat consequat. Duis lacus nibh, sagittis id varius vel, aliquet non augue. Vivamus sem ante, ultrices at ex a, rhoncus ullamcorper tellus. Nunc iaculis eu ligula ac consequat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum mattis urna neque, eget posuere lorem tempus non. Suspendisse ac turpis dictum, convallis est ut, posuere sem. Etiam imperdiet aliquam risus, eu commodo urna vestibulum at. Suspendisse malesuada lorem eu sodales aliquam.\n"}]}'>
									                                          <span class="mail-title">` + item.title + `
								                                          </div>
							                                          </div>
						                                    	  </div>
					                                          </div>
				                                          </div>
				                                      </div>
				                                  </button>
			                                  </div>`
	
						msgTemporaryModal += `<div id="inNo` + no + `" class="collapse" aria-labelledby="#outNo` + no + `">
												<div class="modal fade" id="temporaryMailModal` + item.msgNo + `" tabindex="-1" role="dialog" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered" role="document">
													    <div class="modal-content">
													        <div class="modal-header">
													            <h5 class="modal-title add-title">발송</h5>
													            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
													                <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
													            </button>
													        </div>
													
													        <div class="modal-body">
													            <!-- <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-bs-dismiss="modal"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg> -->
													            <div class="compose-box">
													                <div class="compose-content">
													                    <form id="mt-form` + item.msgNo + `" method="post" action="${pageContext.request.contextPath}/modifyMsg/` + item.msgNo + `" enctype="multipart/form-data">
													                        <div class="row">
													                            <div class="col-md-12">
													                                <div class="mb-4 mail-to">
													                                 <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg> To:</p>
													                                    <select class="form-control" id="mt-to` + item.msgNo + `" name="empNoR">
													                                     <option value="` + item.empNoR + `">` + item.enameR + ` &lt;` + item.emailR + `&gt;</option>
													                                     <c:forEach items="${empList}" var="el">
													                                      <option value="${el.empNo}">${el.ename} &lt;${el.email}&gt;</option>
													                                     </c:forEach>
													                                	</select>
													                            	</div>
													                            </div>
													                        </div>
													                        
													                        <div class="row">
														                        <div class="col-md-12">
														                        	<div class="mb-4 mail-form">
														                                <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg> From: </p>
														                                <input type="text" id="mt-from` + item.msgNo + `" class="form-control" name="emailS" value="${ename} &lt;${email}&gt;" readonly> 
														                                <input type="hidden" name="empNoS" value="${empNo}">
														                                <input type="hidden" id="stateS` + item.msgNo + `" name="stateS" value="E01">
														                            </div>
														                        </div>
													
														                        <!--
																				 ??? 참조자 어떻게 할건지 ???
			                                                                    <div class="col-md-6">
			                                                                        <div class="mb-4 mail-cc">
			                                                                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3" y2="6"></line><line x1="3" y1="12" x2="3" y2="12"></line><line x1="3" y1="18" x2="3" y2="18"></line></svg> CC:</p>
			                                                                            <div>
			                                                                                <input type="text" id="m-cc" class="form-control">
			                                                                                <span class="validation-text"></span>
			                                                                            </div>
			                                                                        </div>
			                                                                    </div>
			                                                                   	-->
													                    	</div>
													                    
													                        <div class="mb-4">
													                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> Title:</p>
													                            <div class="w-100">
													                                <input type="text" id="mt-title` + item.msgNo + `" name="title" class="form-control" value="` + item.title + `">
													                            </div>
													                        </div>
													                        
													                        <div class="mb-4">
													                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> File:</p>
													                            <!-- <input type="file" class="form-control-file" id="mail_File_attachment" multiple="multiple"> -->
													                            ` + ((item.originNameM != null)?
													                            	 `<div class="d-flex">
													                            	 	<input type="text" class="form-control" value="` + item.originNameM + "." + item.extM + `" readonly>
													                            	  </div>`
													                            	 : `<input class="form-control file-upload-input" type="file" id="formFile` + item.msgNo + `" name="msgFiles">`
													                            	 ) + `
													                        </div>
													                        
													                        <div class="">
													                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> Content:</p>
										                                        <div class="col-sm-12">
										                                            <textarea class="form-control" id="mt-content` + item.msgNo + `" name="content" placeholder="내용 작성" style="height: 300px;">` + item.content + `</textarea>
										                                        </div>
									                                    	</div>
			
			                                                            </form>
			                                                            <form id="mt-delete-form` + item.msgNo + `" method="post" action="${pageContext.request.contextPath}/deleteMsg/` + item.msgNo + `" enctype="multipart/form-data">
			                                                            </form>
		                                                        	</div>
		                                                    	</div>
		                                                	</div>
													        <div class="modal-footer">
													            <button type="button" id="btn-mt-send` + item.msgNo + `" class="btn btn-primary send-button" data-msgNo="` + item.msgNo + `"> 발송</button>
													            <button type="button" id="btn-mt-delete` + item.msgNo + `" class="btn btn-success" data-msgNo="` + item.msgNo + `"> 삭제</button>
													            <button class="btn" data-bs-dismiss="modal"> <i class="flaticon-delete-1"></i> 취소</button>
													        </div>
													    </div>
													</div>
												</div>
											</div>`
	
	                    no++;
	                });
	                
	                const script = document.createElement("script");
	                script.src = `${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js`;
	                script.type = "text/javascript";
	                script.async = true;
	                document.body.appendChild(script);
	                
	                
	                $('#msgTemporarys').append(msgTemporarysHTML);
	                $('#msgTemporary').append(msgTemporaryModal);
	                
	            }).fail(function() {
	                console.log("temporarysMsg fail");
	            });
    	}
	</script>


</body>
</html>