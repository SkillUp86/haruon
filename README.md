# 📝 개요
  - 프로젝트 명 : 프랜차이즈 본사 그룹웨어 HARUON<br>
  - 프로젝트 기간 : 2024-12-23 ~ 2025-02-12<br>
  - (K-Digital Training) 클라우드 활용 자바 개발자 양성과정 86기 파이널 팀 프로젝트<br>

# 📑 서비스 초기 설계 개요
 - <a href="https://drive.google.com/file/d/165VDJQDqiuiWo3ycASGSIZJyNAXy-zLX/view?usp=sharing">스토리보드</a>
 - <a href="https://docs.google.com/spreadsheets/d/1_2jt6uWHEDrZeYYrJ9j3cnmxJiIQ8ytv/edit?usp=sharing&ouid=106995358265152035103&rtpof=true&sd=true">요구사항 정의</a>
 - <a href="https://drive.google.com/file/d/1tqYL68vizimMNjUDtYVkYri1X2adKIGt/view?usp=sharing">테이블 정의서</a>

# 🧰 개발 환경 및 기술 스택
#### LANGUAGE & SKILL
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
#### Framework
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring%20Boot&logoColor=white)
#### DATABASE
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
#### LIBLARY
![jQuery](https://img.shields.io/badge/jquery-%230769AD.svg?style=for-the-badge&logo=jquery&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
![JSTL](https://img.shields.io/badge/jstl-E4F7BA?style=for-the-badge)
![Lombok](https://img.shields.io/badge/Lombok-FFA7A7?style=for-the-badge)
![MyBatis](https://img.shields.io/badge/MyBatis-47C83E?style=for-the-badge)
#### WAS Apache
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat%2010-23F8DC75.svg?style=for-the-badge&logo=apache%20tomcat%2010&logoColor=black)
#### TOOL
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white)
![Heidi](https://img.shields.io/badge/Heidi%20SQL-6B9900?style=for-the-badge)
![Spring Tool Suite 4](https://img.shields.io/badge/Spring%20Tool%20Suite%204-8A2BE2?style=for-the-badge)
![Google Spread Sheet](https://img.shields.io/badge/Google%20Spread%20Sheet-4285F4?style=for-the-badge&logo=google&logoColor=white)


# 📚 데이터 베이스 구조
<img src="https://github.com/user-attachments/assets/65572ec2-05cf-4023-8992-c2dbad68abc9" width="700" height="600"/>

# 🗂️ 주요 기능
그룹웨어 사이트를 전자결재, 일정관리, 메일, SNS, 사내 커뮤니티 및 피드형 게시판 등 필수적인 기능을 기획/제작한 웹 사이트입니다.

<details>
<summary><b>각 기능 상세보기</b></summary>
<div markdown="1">
	
|기능|설명|
|---|---|
| 조직도 | 1. 조직도로 부서장 정보, 부서별 직원 조회 <br> 2. 전체 사원 조회, 검색, 사원 등록 <br> 3. 회사/부서 정보 조회, 수정, 상태변경 기능 |
| 전자결재 | 1. 양식별 결재 작성 및 기안 <br> 2. 중간/최종 결재 처리 <br> 3. 결재 상태별 문서 확인 |
| 근태관리 | 1. 전날 출장, 연차 등을 고려하여 근태 기록 자동 업데이트 <br> 2. 권한에 따른 근태유형 변경 및 근태 승인 <br> 3. 부서별, 개인별 출장 및 연차 신청 기록 조회 4. 권한에 따른 연차 조정 기능 |
| 일정관리 | 1. 내 일정 등록, 수정, 삭제 기능 <br> 2. 권한에 따른 부서일정 등록, 수정, 삭제 기능 <br> 3. 출장,연차 결재완료 시 일정 자동 등록 <br> 4. 회의실 예약 시 일정 자동 등록  |
| 가맹점관리 | 1. 가맹점 목록 조회, 수정, 가맹점별 매출 통계 <br> 2. 가맹점 대상 교육 목록 조회, 등록 <br> 3. 가맹점 문의사항 조회, 답변 등록 |
| 커뮤니티 | 1. 권한에 따른 부서 공지사항 조회, 등록, 수정, 삭제 기능 <br> 2. 카테고리별 피드형 게시판(댓글, 좋아요, 조회수, 파일 첨부)|
| 메일함 | 1. 메일 전송(파일 첨부) <br> 2.수신/답장 기능 <br> 3.임시 저장, 삭제 기능 |
| 메신저 | 1. 웹 소켓을 이용한 채팅 기능 <br> 2. 사원을 검색하여 초대 <br> 3. 접속상태 조회 및 변경 |
</div>
</details>



# 🧑‍🤝‍🧑 Collaborators
| 팀원 | 역할 | 담당업무 |
|---|---|---|
| <a href="https://github.com/LYUN555">이동윤</a>|팀장|전자결재, security 설정|
| <a href="https://github.com/ES-Im">김은서</a>| 팀원 |근태관리, 실시간 채팅 |
| <a href="https://github.com/najungwoo">나정우</a>|팀원|회의실예약, 일정관리|
| <a href="https://github.com/alim0o0">오아림</a>|팀원|조직도, 커뮤니티|
| <a href="https://github.com/gd2872">장우림</a>|팀원|메일, 가맹점관리|
	
