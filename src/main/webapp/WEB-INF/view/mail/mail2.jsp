<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/png" href="../src/assets/img/favicon.ico" />
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="../src/plugins/src/notification/snackbar/snackbar.min.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/src/sweetalerts2/sweetalerts2.css" rel="stylesheet" type="text/css" />

    <link href="../src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/editors/quill/quill.snow.css">
    <link href="../src/assets/css/light/apps/mailbox.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/light/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />

    <link href="../src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/dark/editors/quill/quill.snow.css">
    <link href="../src/assets/css/dark/apps/mailbox.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/dark/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    
    <!--  END CUSTOM STYLE FILE  -->
    
    <!-- 페이지 제목 입력칸 -->
    <title>쪽지함</title>
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
                                            	<!-- 여기도 페이지 마다 이름 바꿔줘야 합니다 -->
                                                <li class="breadcrumb-item"><a href="#">Franchises</a></li>
                                                <!-- 여기도 페이지 마다 이름 바꿔줘야 합니다!!!!!!!!!!!!!!!!! -->
                                                <li class="breadcrumb-item active" aria-current="page">Question List</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </header>
                        </div>
                    </div>
                    <!--  END BREADCRUMBS  -->
                
                <!-- 메인컨텐츠 입력칸 -->
					<div class="row layout-top-spacing">
                        <div class="col-xl-12 col-lg-12 col-md-12">
    
                            <div class="row">
    
                                 <div class="col-xl-12  col-md-12">
                                    <!-- 메세지 박스 시작 -->
                                    <div class="mail-box-container">

                                        <div class="mail-overlay"></div>

                                        <div class="tab-title">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-12 text-center mail-btn-container">
                                                    <a id="btn-compose-mail" class="btn btn-block" href="javascript:void(0);"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg></a>
                                                </div>
                                                <div class="col-md-12 col-sm-12 col-12 mail-categories-container">
                                                    <div class="mail-sidebar-scroll"></div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div id="mailbox-inbox" class="accordion mailbox-inbox">
    

    
                                            <div class="action-center">
                                                <div class="">
                                                    <div class="form-check form-check-primary form-check-inline mt-1" data-bs-toggle="collapse" data-bs-target>
                                                        <input class="form-check-input inbox-chkbox" type="checkbox" id="inboxAll">
                                                    </div>
                                                </div>
    
                                               
                                            </div>
                                    
                                            <div class="message-box">
                                                
                                                <div class="message-box-scroll" id="ct">
                                                    <!-- 받은 쪽지함 시작 -->
                                                    <div class="mail-item trashed">
                                                        <!-- 메일 리스트 HTML 동적처리할 부분-->
                                                        <div class="animated animatedFadeInUp fadeInUp" id="메일번호">
                                                            <div class="mb-0">
                                                                <div class="mail-item-heading work collapsed"  data-bs-toggle="collapse" role="navigation" data-bs-target="#메일Collapse이름" aria-expanded="false">
                                                                    <div class="mail-item-inner">
                                                                        <div class="d-flex">
                                                                            <div class="form-check form-check-primary form-check-inline mt-1" data-bs-toggle="collapse" data-bs-target>
                                                                                <input class="form-check-input inbox-chkbox" type="checkbox" id="form-check-default2">
                                                                            </div>
                                                                            <div class="f-head">
                                                                                발신자 프로필 사진
                                                                                <img src="../src/assets/img/profile-16.jpeg" class="user-profile" alt="avatar">
                                                                            </div>
                                                                            <div class="f-body">
                                                                                <div class="meta-mail-time">
                                                                                    <p class="user-email">발신자 이름</p>
                                                                                </div>
                                                                                <div class="meta-title-tag">
                                                                                    <p class="mail-content-excerpt" data-mailDescription='{"ops":[{"insert":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi pulvinar feugiat consequat. Duis lacus nibh, sagittis id varius vel, aliquet non augue. Vivamus sem ante, ultrices at ex a, rhoncus ullamcorper tellus. Nunc iaculis eu ligula ac consequat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum mattis urna neque, eget posuere lorem tempus non. Suspendisse ac turpis dictum, convallis est ut, posuere sem. Etiam imperdiet aliquam risus, eu commodo urna vestibulum at. Suspendisse malesuada lorem eu sodales aliquam.\n"}]}'>
                                                                                        <span class="mail-title">메일 제목 - </span>메일 상세보기 내용</p>
                                                                                    <p class="meta-time align-self-center">발신 일자</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- 메일 리스트 HTML 동적처리할 부분-->
                                                    </div>
                                                </div>
                                            </div>
    
                                            <div class="content-box">
                                                <div class="d-flex msg-close">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left close-message"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
                                                    <h2 class="mail-title" data-selectedMailTitle=""></h2>
                                                </div>

                                                <!-- 메일 상세보기 시작 - HTML 동적 처리할 부분 -->
                                                <div id="메일Collapse이름" class="collapse" aria-labelledby="메일번호" data-bs-parent="#mailbox-inbox">
                                                    <div class="mail-content-container sentmail">
    
                                                        <div class="d-flex justify-content-between mb-3">
                                                            <div class="d-flex user-info">
                                                                <div class="f-body">
                                                                    <div class="meta-mail-time">
                                                                        <div class="">
                                                                            <p class="user-email"><span>To,</span> 수신자</p>
                                                                        </div>
                                                                        <p class="mail-content-meta-date current-recent-mail">발송일자 -</p>
                                                                        <p class="meta-time align-self-center">발송시간</p>
                                                                    </div>
                                                                </div>
                                                            </div>
    
                                                            <div class="action-btns">
                                                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" data-original-title="Reply">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-up-left reply"><polyline points="9 14 4 9 9 4"></polyline><path d="M20 20v-7a4 4 0 0 0-4-4H4"></path></svg>
                                                                </a>
                                                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" data-original-title="Forward">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-up-right forward"><polyline points="15 14 20 9 15 4"></polyline><path d="M4 20v-7a4 4 0 0 1 4-4h12"></path></svg>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <p class="mail-content"> 
                                                           첫번째 메일 상세 내용</p>
                                                        <p>발신자 이름</p>
    
                                                        <div class="attachments">
                                                            <h6 class="attachments-section-title">Attachments</h6>
    
                                                            <div class="attachment file-folder">
                                                                <div class="media">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path></svg>
                                                                    <div class="media-body">
                                                                        <p class="file-name">첨부파일 이름</p>
                                                                        <p class="file-size">첨부파일 크기</p>
                                                                    </div>
                                                                </div>
                                                            </div>
    
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- 메일 상세보기 끝 -->
                                                 
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 메세지 박스 끝 -->

                                    <!-- 메세지 보내는 Modal 창 시작 -->
                                    <div class="modal fade" id="composeMailModal" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title add-title" id="notesMailModalTitleeLabel">Compose</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                        <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                                    </button>
                                                </div>

                                                <div class="modal-body">
                                                    <!-- <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-bs-dismiss="modal"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg> -->
                                                    <div class="compose-box">
                                                        <div class="compose-content">
                                                            <form>
                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="mb-4 mail-form">
                                                                            <p>From:</p>
                                                                            <select class="form-control" id="m-form">
                                                                                <option value="info@mail.com">Info &lt;info@mail.com&gt;</option>
                                                                                <option value="shaun@mail.com">Shaun Park &lt;shaun@mail.com&gt;</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="mb-4 mail-to">
                                                                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg> To:</p>
                                                                            <div class="">
                                                                                <input type="email" id="m-to" class="form-control">
                                                                                <span class="validation-text"></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-6">
                                                                        <div class="mb-4 mail-cc">
                                                                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3" y2="6"></line><line x1="3" y1="12" x2="3" y2="12"></line><line x1="3" y1="18" x2="3" y2="18"></line></svg> CC:</p>
                                                                            <div>
                                                                                <input type="text" id="m-cc" class="form-control">
                                                                                <span class="validation-text"></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="mb-4 mail-subject">
                                                                    <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> Subject:</p>
                                                                    <div class="w-100">
                                                                        <input type="text" id="m-subject" class="form-control">
                                                                        <span class="validation-text"></span>
                                                                    </div>
                                                                </div>
                                                                
                                                                <div class="">
                                                                    <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> Upload Attachment:</p>
                                                                    <!-- <input type="file" class="form-control-file" id="mail_File_attachment" multiple="multiple"> -->
                                                                    <input class="form-control file-upload-input" type="file" id="formFile" multiple="multiple">
                                                                </div>
    
                                                                <div id="editor-container">
    
                                                                </div>
    
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button id="btn-save" class="btn float-left btn-success"> Save</button>
                                                    <button id="btn-reply-save" class="btn float-left btn-success"> Save Reply</button>
                                                    <button id="btn-fwd-save" class="btn float-left btn-success"> Save Fwd</button>
    
                                                    <button class="btn" data-bs-dismiss="modal"> <i class="flaticon-delete-1"></i> Discard</button>
    
                                                    <button id="btn-reply" class="btn btn-primary"> Reply</button>
                                                    <button id="btn-fwd" class="btn btn-primary"> Forward</button>
                                                    <button id="btn-send" class="btn btn-primary"> Send</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 메세지 보내는 Modal 창 끝 -->
                                </div>
    
    
                            </div>
    
                        </div>
                    </div>
                <!-- 메인컨텐츠 END -->
				</div>
			</div>
		</div>
	</div>
            
		        <!--  BEGIN FOOTER  -->
		        <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
		        <!--  END FOOTER  -->
        	<!--  END CONTENT AREA  -->

    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/plugins/src/global/vendors.min.js"></script>
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/plugins/src/editors/quill/quill.js"></script>
    <script src="../src/plugins/src/sweetalerts2/sweetalerts2.min.js"></script>
    <script src="../src/plugins/src/notification/snackbar/snackbar.min.js"></script>
    <script src="../src/assets/js/apps/mailbox.js"></script>

	<!-- END PAGE LEVEL SCRIPTS -->
		<script>
			function show() {
				$.ajax({
					url: "/MsgReaders/"+"${empNo}",
					method: 'GET',
				}).done(function(result) {
					destroyDataTable();
					$("#html ID").empty(); // 이전 탭 내역 지움
		            
					let MsgReaders = "";
		            
		            $(result).each(function(index, item) {
		         	  MsgReaders += `"<tr role="row" class="text-center">"`;
		         	   						
		         	  MsgReaders += `   <td>` + item.ename + `(` + item.descript + `)` + `</td>
		         	   						   <td>` + item.descript + `</td>
		         	   						   <td  class="sorting_01">` + item.content + `</td>
				 		                       <td><a href=/draft/detail/business/` + item.draNo + ` class="btn btn-hover btn-outline-primary btn-sm ms-4">상세보기</a>`;
                      MsgReaders += "</tr>";
		            
		            });
		            
		            $("#deptBusinessTripReqList").append(BusinessTriphtml); // html 코드 이어줌
					
					initDataTable();
				}).fail(function() {
					console.log("showBusinessTripReqList ajax fail");
				});
			} 
		</script>
	
</body>
</html>