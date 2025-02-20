$(document).ready(function() {
  // `.user-list-box .person` 중 첫 번째 요소를 기준으로 동작 실행
  	const $firstPerson = $('.user-list-box .person').first();

    const findChat = $firstPerson.attr('data-chat');

    // 활성화 상태 업데이트
    $('.chat[data-chat="' + findChat + '"]').addClass('active-chat');

    // 기타 스타일 적용
    $('.chat-box .chat-box-inner').css('height', '100%');
    $('.chat-box .overlay-phone-call').css('display', 'block');
    $('.chat-box .overlay-video-call').css('display', 'block');
    $('.chat-meta-user').addClass('chat-active');
    $('.chat-box').css('height', 'calc(93vh)');
    $('.chat-footer').addClass('chat-active');


    // 스크롤 컨테이너의 초기 위치 설정
    const getScrollContainer = document.querySelector('.chat-conversation-box');
    getScrollContainer.scrollTop = 0;

	// `user-list-box-show` 클래스 제거 (로드 시점에서 처리)
	if ($('.user-list-box').hasClass('user-list-box-show')) {
	  $('.user-list-box').removeClass('user-list-box-show');
	}
});



