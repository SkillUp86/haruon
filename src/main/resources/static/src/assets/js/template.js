document.addEventListener('DOMContentLoaded', function() {
    const menuLinks = document.querySelectorAll('.menu a'); // 모든 메뉴 링크 선택

    menuLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            // 기존의 active 클래스 제거
            menuLinks.forEach(link => link.closest('li').classList.remove('active'));

            // 클릭한 메뉴 항목에 active 클래스 추가
            this.closest('li').classList.add('active');
        });
    });
});