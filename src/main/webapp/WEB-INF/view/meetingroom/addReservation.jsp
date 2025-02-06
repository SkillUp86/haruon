   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/src/assets/img/favicon.ico"/>
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/tagify/tagify.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/assets/css/light/forms/switches.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/editors/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/tagify/custom-tagify.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/font-icons/fontawesome/css/regular.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/font-icons/fontawesome/css/fontawesome.css">
    
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/font-icons.css" rel="stylesheet" type="text/css">
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/assets/css/light/apps/ecommerce-create.css">
    <!--  END CUSTOM STYLE FILE  -->
       
    <script src="${pageContext.request.contextPath}/src/plugins/src/font-icons/feather/feather.min.js"></script>
    
    <title> haruon | 회의실 예약 </title>
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
                                                <li class="breadcrumb-item"><a href="#">회의실</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">예약하기</li>
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
        <div class="widget-content widget-content-area blog-create-section">
            <h2 class="mt-3 mb-3">회의실 예약</h2>
            <form id="formInsert" action="${pageContext.request.contextPath}/addReservation/${meetingRoom.meeNo}" method="post" enctype="multipart/form-data">
            <input type="hidden" id="meetingRoomId" name="meetingRoomId" value="${meetingRoom.meeNo}">
                <div class="row mb-4">
                    <div class="col-md-8 d-flex justify-content-center">
					    <img src="${pageContext.request.contextPath}/upload/meetingroom/${meetingRoom.fileName}.${meetingRoom.fileExt}" 
					         style="width: 100px; height: 100px; object-fit: cover; max-width: 100%;" />
					</div>
                </div>

                <div class="row mb-4">
                    <div class="col-sm-6">
                        <label for="capacity" class="form-label">수용가능 인원</label>
                        <!-- 수용가능 인원 출력 -->
                        <input type="number" class="form-control" id="capacity" name="capacity" 
                               value="${meetingRoom.capacity}" readonly>
                    </div>
                    <div class="col-sm-6">
                        <label for="availYn" class="form-label">예약상태</label>
                        <!-- 예약 상태 출력 -->
                        <select class="form-select" id="availYn" name="availYn" disabled>
                            <option value="Y" ${meetingRoom.availYn == 'Y' ? 'selected' : ''}>예약 가능</option>
                            <option value="N" ${meetingRoom.availYn == 'N' ? 'selected' : ''}>예약 불가</option>
                        </select>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="info" class="form-label">회의실 정보</label>
                    <!-- 회의실 정보 출력 -->
                    <textarea class="form-control" id="info" name="info" rows="5" readonly>${meetingRoom.info}</textarea>
                </div>

                   <div class="row mb-4">
                   <div class="col-sm-6">
                       <label for="revDate" class="form-label">예약 일자</label>
                       <input type="date" class="form-control" id="revDate" name="revDate" required>
                   </div>
                   <div class="col-sm-6">
                       <label for="revTime" class="form-label">예약 시간</label>
                       <select class="form-control" id="revTime" name="revTime" required>
                      <option value="" selected>시간을 선택하세요</option>
                      <c:forEach var="time" items="${reservationTime}">
                          <option value="${time.commonCode},${time.descript}">${time.descript}</option>
                      </c:forEach>
                  </select>
                   </div>
               </div>


            <div class="form-group row invoice-note">
                             <label>예약 정보</label>
                             <div class="col-sm-12">
                                 <textarea class="form-control" id="info" name="content" style="height: 300px;" required></textarea>
                             </div>
                         </div>
                
                <div class="input-group mb-4">
                <div class="input-group">
                    <span class="input-group-text label-text">참여자</span>
                    <input type="hidden" class="form-control" id="attendees" name="attendees" value="" required>
                    <input type="text" class="form-control" id="attendeeNames" placeholder="참여자 목록" required readonly>
                </div>
            </div>

                <div class="text-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#approvalModal">
                        참여자 선택
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                    </button>
                </div>
                
                
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary">예약하기</button>
                    <a href="javascript:history.back()" class="btn btn-secondary ms-2">뒤로가기</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 참조자 선택 모달 -->
<div class="modal fade " id="approvalModal" tabindex="-1" role="dialog" aria-hidden="true">
       <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title">회의 참여자 선택</h5>
               </div>
               <div class="modal-body container">
                   <div class="row">
                   <div class="col-6 border-end">
                       <h6>부서 목록</h6>
                       <div class="list-group">
                           <c:forEach var="d" items="${deptList}">
                               <button class="btn mb-1 dept" type="button" value="${d.depNo}">${d.dname}</button>
                           </c:forEach>
                       </div>
                   </div>
                   
                   <div class="col-6 d-flex">
                       <div class="flex-grow-1">
                           <h6>직원 목록</h6>
                           <div class="list-group" id="employeeList">
                           
                           </div>
                       </div>
                      </div>
                   </div>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-primary" id="btnInsertApprover" >선택</button>
                   <button type="button" class="btn btn-light-dark" data-bs-dismiss="modal">
                       <i class="flaticon-cancel-12"></i> 취소
                   </button>
               </div>
               </div>
           </div>
       </div>
   </div>
    <!-- 결재자 모달END -->

                <!-- 메인컨텐츠 END -->
            </div>
            <!--  BEGIN FOOTER  -->
            <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
            <!--  END FOOTER  -->
        </div>
        <!--  END CONTENT AREA  -->

    <!-- END MAIN CONTAINER -->

   <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/global/vendors.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/src/plugins/src/highlight/highlight.pack.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/editors/quill/quill.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/filepond.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginFileValidateType.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImageExifOrientation.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImagePreview.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImageCrop.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImageResize.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/FilePondPluginImageTransform.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/filepond/filepondPluginFileValidateSize.min.js"></script>

    <script src="${pageContext.request.contextPath}/src/plugins/src/tagify/tagify.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/apps/ecommerce-create.js"></script>
<script>
//참조자 선택 후 선택된 사람들을 입력창에 표시
$('.dept').click(function() {
         let deptNo = $(this).val();
         $.ajax({
            url: '/reservation/depts/' + deptNo + '/employee',
            method: "GET"
         }).done(function(response) {
            emp = response;
            employeeList(emp);  // 직원 목록 표시
         }).fail(function() {
            alert('실패');
         })
      });
      
function employeeList(emp) {
   let empList = $('#employeeList');
   let empSubList = $('#employeeSubList');
   empList.empty();
   empSubList.empty();
   if (emp && emp.length > 0) {
      emp.forEach(function(item) {
         //console.log(item)
   
         let selectEmpList = $(`
                  <li class="form-check">
                     <input type="checkbox" class="form-check-input" namxe="employeeRadio" id="\${item.empNo}" value="\${item.empNo}">
                     <label class="form-check-label" for="\${item.empNo}">(\${item.descript}) \${item.ename}</label>
                  </li>
                  `);
         
         empSubList.append(selectEmpList.clone());
         empList.append(selectEmpList.clone());
      });
   } 
}
$('#btnInsertApprover').on('click', function () {
    let selectedEmps = [];
    let selectedEmpIds = [];
    $('.form-check-input:checked').each(function () {
        let empName = $(this).next('label').text().trim();
        let empId = $(this).val();
        selectedEmps.push(empName);
        selectedEmpIds.push(empId);
    });
    if (selectedEmpIds.length === 0) {
        alert('참여자를 선택해주세요.');
        return;
    }
    $('#attendees').val(selectedEmpIds.join(','));
    $('#attendeeNames').val(selectedEmps.join(', '));
    $('#approvalModal').modal('hide');
});


//예약 날짜 변경 시 시간 목록 가져오기

$('#revDate').on('change', function () {
    let meeNo = $('#meetingRoomId').val();
    let revDate = $(this).val();

    // 값을 콘솔에 출력하여 확인
    console.log('Meeting Room ID:', meeNo); // meeNo 값 확인
    console.log('Selected Date:', revDate); // revDate 값 확인

    // AJAX 요청 전 revDate 값 확인
    console.log('AJAX 요청 URL:', `/addReservation/${meeNo}/times?revDate=${revDate}`);

    // AJAX 요청
    $.ajax({
        url: '/addReservation/'+ meeNo + '/times', // URL 경로
        method: 'GET',
        data: { revDate: revDate }, // 전달 데이터
        success: function(times) {
            // 요청 성공 시 응답 데이터를 콘솔에 출력
            console.log('Received Times:', times);    

            const revTimeSelect = $('#revTime');
            revTimeSelect.empty();
            revTimeSelect.append(`<option value="">시간을 선택하세요</option>`);

            if (times && times.length > 0) {
                times.forEach(function (time) {
                   revTimeSelect.append(`<option value="\${time.commonCode},\${time.descript}">\${time.descript}</option>`);
                });
            } else {
                console.log('No times available');
                alert('선택한 날짜에 예약 가능한 시간이 없습니다.');
            }
        },
        error: function(xhr, status, error) {
            // 요청 실패 시 오류 메시지 출력
            console.error('AJAX Error:', status, error);
            console.log('AJAX Error Response:', xhr.responseText); // 서버 응답 내용
            alert('시간 데이터를 가져오는 데 실패했습니다.');
        }
    });
});

$('#formInsert').submit(function(e) {
    e.preventDefault();

    let formData = $(this).serialize();
    console.log('Form Data:', formData);

    let meeNo = $('#meetingRoomId').val();
    console.log('Meeting Room ID:', meeNo);

    $.ajax({
        url: '/addReservation/' + meeNo,
        method: 'POST',
        data: formData,
        success: function(response) {
            alert('회의실 예약이 완료되었습니다.');
            window.location.href = '/myReservation';
        },
        error: function(xhr, status, error) {
            console.error('Error Response:', xhr.responseText);
            alert('예약 처리 중 오류가 발생했습니다.');
        }
    });
});
$('#revTime').on('change', function() {
    let selectedOption = $(this).find('option:selected');
    let descriptValue = selectedOption.data('descript');
    $('<input>').attr({
        type: 'hidden',
        name: 'revTimeDescript',
        value: descriptValue
    }).appendTo('#formInsert');
});

document.getElementById('revDate').min = new Date().toISOString().split('T')[0];

//폼 제출 시 추가 검증
document.querySelector('#formInsert').addEventListener('submit', function(e) {
 const selectedDate = new Date(document.getElementById('revDate').value);
 const now = new Date().setHours(0,0,0,0);
 
 if(selectedDate < now) {
     e.preventDefault();
     alert('과거 날짜 예약 불가');
     document.getElementById('revDate').value = '';
 }
});

</script>
</body>
</html>