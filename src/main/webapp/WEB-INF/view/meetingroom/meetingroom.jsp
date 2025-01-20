<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
     <link href="../src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
 	<link href="../src/assets/css/light/apps/contacts.css" rel="stylesheet" type="text/css" />

 <link href="../src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css">
 <link href="../src/assets/css/dark/apps/contacts.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
    <!-- 페이지 제목 입력칸 -->
    <title>메인 페이지</title>
    <!-- 페이지 제목 입력칸 -->
</head>
<body>
	               
                <div class="row layout-spacing layout-top-spacing" id="cancel-row">
                    <div class="col-lg-12">
                        <div class="widget-content searchable-container list">

                            <div class="row">
                                <div class="col-xl-4 col-lg-5 col-md-5 col-sm-7 filtered-list-search layout-spacing align-self-center">
                                    <form class="form-inline my-2 my-lg-0">
                                        <div class="">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                            <input type="text" class="form-control product-search" id="input-search" placeholder="Search Contacts...">
                                        </div>
                                    </form>
                                </div>

                                <div class="col-xl-8 col-lg-7 col-md-7 col-sm-5 text-sm-right text-center layout-spacing align-self-center">
                                    <div class="d-flex justify-content-sm-end justify-content-center">
                                        <svg id="btn-add-contact" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line></svg>
                                    </div>

                                    <!-- Modal -->
                                    <div class="modal fade" id="addContactModal" tabindex="-1" role="dialog" aria-labelledby="addContactModalTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title add-title" id="addContactModalTitleLabel1">회의실 추가</h5>
                                                    <h5 class="modal-title edit-title" id="addContactModalTitleLabel2" style="display: none;">Edit Contact</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                      <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                                    </button>
                                                </div>

                                                <div class="modal-body">
                                                    <div class="add-contact-box">
                                                        <div class="add-contact-content">
                                                            <form id="pa">
                                                                <div class="row">
                                                                    <div class="col-md-6 mb-3">
                                                                        <div class="contact-name">
                                                                            <input type="text" id="c-name" class="form-control" placeholder="">
                                                                            <span class="validation-text"></span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6 mb-3">
                                                                        <div class="contact-email">
                                                                            <input type="text" id="c-email" class="form-control" placeholder="Email">
                                                                            <span class="validation-text"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-md-6 mb-3">
                                                                        <div class="contact-occupation">
                                                                            <input type="text" id="c-occupation" class="form-control" placeholder="Occupation">
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-6 mb-3">
                                                                        <div class="contact-phone">
                                                                            <input type="text" id="c-phone" class="form-control" placeholder="Phone">
                                                                            <span class="validation-text"></span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-md-12">
                                                                        <div class="contact-location">
                                                                            <input type="text" id="c-location" class="form-control" placeholder="Location">
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button id="btn-edit" class="float-left btn btn-success">저장</button>

                                                    <button id="btn-add" class="btn btn-primary">추가</button>
                                                    
                                                    <button class="btn" data-bs-dismiss="modal"> <i class="flaticon-delete-1"></i> 삭제</button>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="searchable-items list">
                                <div class="items items-header-section">
                                    <div class="item-content">
                                        <div class="d-inline-flex">
                                            <div class="n-chk align-self-center text-center">
                                                <div class="form-check form-check-primary me-0 mb-0">
                                                    <input class="form-check-input inbox-chkbox" id="contact-check-all" type="checkbox">
                                                </div>
                                            </div>
                                            <h4>호실</h4>
                                        </div>
                                        <div class="user-email">
                                            <h4>수용인원</h4>
                                        </div>
                                        <div class="user-location">
                                            <h4 style="margin-left: 0;">예약상태</h4>
                                        </div>
                                       
                                        <div class="action-btn">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2  delete-multiple"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

  

	<!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
	<script src="../src/plugins/src/global/vendors.min.js"></script>
	<script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
	<script src="../src/plugins/src/waves/waves.min.js"></script>
	<script src="../layouts/vertical-light-menu/app.js"></script>
	<script src="../src/assets/js/custom.js"></script>
	<!-- END GLOBAL MANDATORY SCRIPTS -->
	<script src="../src/plugins/src/jquery-ui/jquery-ui.min.js"></script>
	<script src="../src/assets/js/apps/contact.js"></script>
</body>
</html>