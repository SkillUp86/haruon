<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 탭마다 이전달/다음달 버튼 Html 모양 변수에 저장 시작 -->
<script>
	let date = new Date();
	const now = new Date();

	var attendanceBtnHtml = `
		<button id="setPreviousMonthForAttendance" type="button" class="btn btn-hover">
	       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
	       <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
	       </svg>
	       이전달
	    </button>
	    <button id="setNextMonthBtnForAttendance" type="button" class="btn btn-hover">
	       다음달
	       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
	           <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8"/>
	       </svg>
	    </button> `;
	    
	var leaveBtnHtml = `<button id="setPreviousMonthForLeave" type="button" class="btn btn-hover">
	    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
	    <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
	</svg>
	이전달
	</button>
	<button id="setNextMonthBtnForLeave" type="button" class="btn btn-hover">
	다음달
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
	    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8"/>
	</svg>
	</button>`;
	
	var businessTripBtnHtml = `<button id="setPreviousMonthForBusinessTrip" type="button" class="btn btn-hover">
		       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
		       <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
		   </svg>
		   이전달
		   </button>
		   <button id="setNextMonthBtnForBusinessTrip" type="button" class="btn btn-hover">
		   다음달
		   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
		       <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8"/>
		   </svg>
		   </button>`;
</script>
<!-- 탭 탭마다 이전달/다음달 버튼 Html 모양 변수에 저장 끝 -->

<!-- 탭마다 이전/다음달 버튼 동적처리 및 이벤트 발생 -->
<script>
	//<근태버튼 동작> 연-월 세팅 및 기능에 맞는 yearAndMonth설정 및 리스트 출력 - 근태
	$(document).on("click", "#setPreviousMonthForAttendance", function() {
	    console.log("이전달 클릭");
	    date = new Date(date.setMonth(date.getMonth() - 1));
	    $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
	    showAttendanceList();
	    if($("#setNextMonthBtnForAttendance").attr("disabled") === "disabled") {
	        $("#setNextMonthBtnForAttendance").removeAttr("disabled");
	    }
	});
	
	$(document).on("click", "#setNextMonthBtnForAttendance", function() {
	  console.log("다음달 클릭");
	  date = new Date(date.setMonth(date.getMonth() + 1));
	  if(now >= date.setMinutes(00,00,0)) {	// 1달 여유있음에도 다음달을 클릭하는 순간 date+1이 now보다 미래가 되지 않도록 분/초단위 설정 
	      $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
	      showAttendanceList();
	  } else {
	      date = new Date(date.setMonth(date.getMonth() - 1));
	      alert("더 이상 조회할 수 있는 달이 없습니다.");
	      $("#setNextMonthBtnForAttendance").attr("disabled", "disabled");
	  }
	});
	      
	// <연차버튼 동작> 연-월 세팅 및 기능에 맞는 yearAndMonth설정 및 리스트 출력 - 연차
		$(document).on("click", "#setPreviousMonthForLeave", function() {
	    console.log("이전달 클릭");
	    date = new Date(date.setMonth(date.getMonth() - 1));
	    $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
	    showLeaveReqList();
	});
		$(document).on("click", "#setNextMonthBtnForLeave", function() {
	    console.log("다음달 클릭");
	    date = new Date(date.setMonth(date.getMonth() + 1));
	    $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
	    showLeaveReqList();
	});
		
	// <출장버튼 동작> 연-월 세팅 및 기능에 맞는 yearAndMonth설정 및 리스트 출력 - 출장
		$(document).on("click", "#setPreviousMonthForBusinessTrip", function() {
	    console.log("이전달 클릭");
	    date = new Date(date.setMonth(date.getMonth() - 1));
	    $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
	    showBusinessTripReqList();
	});
	
		$(document).on("click", "#setNextMonthBtnForBusinessTrip", function() {
	    console.log("다음달 클릭");
	    date = new Date(date.setMonth(date.getMonth() + 1));
	    $(".setYearAndMonth").val(date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0'));
	    showBusinessTripReqList();
	});
</script>

<!-- ajax 호출 성공시 zero-config 초기화/삭제 하는 함수 시작 -->
<script>
	function initDataTable() {
           // 페이징, 검색, rowPerPage 관리 항목 객체 생성
           $('.zero-config').DataTable({
               "dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
                      "<'table-responsive'tr>" +
                      "<'dt--bottom-section d-sm-flex justify-content-sm-center text-center'<'dt--pagination'p>>",
               "oLanguage": {
                   "oPaginate": { 
                       "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', 
                       "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' 
                   },
                   "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
                   "sSearchPlaceholder": "Search...",
                   "sLengthMenu": "Results :  _MENU_",
               },
               "stripeClasses": [],
               "lengthMenu": [7, 10, 20, 50],
               "pageLength": 10
           });
	}
	
	function destroyDataTable() {
		$('.zero-config').DataTable().destroy(); 
	}
</script>
<!-- ajax 호출 성공시 zero-config 초기화 하는 함수 끝 -->