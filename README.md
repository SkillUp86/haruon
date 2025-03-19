# 📝 개요
  - 프로젝트 명 : 프랜차이즈 본사 그룹웨어 HARUON<br>
  - 프로젝트 기간 : 2025.01.06 ~ 2024.02.14<br>
  - (K-Digital Training) 클라우드 활용 자바 개발자 양성과정 86기 파이널 팀 프로젝트<br>

# 📑 서비스 초기 설계 개요
 - <a href="https://drive.google.com/file/d/165VDJQDqiuiWo3ycASGSIZJyNAXy-zLX/view?usp=sharing">스토리보드</a>
 - <a href="https://docs.google.com/spreadsheets/d/1_2jt6uWHEDrZeYYrJ9j3cnmxJiIQ8ytv/edit?usp=sharing&ouid=106995358265152035103&rtpof=true&sd=true">요구사항 정의</a>
 - <a href="https://drive.google.com/file/d/1tqYL68vizimMNjUDtYVkYri1X2adKIGt/view?usp=sharing">테이블 정의서</a>
 - <a href="https://drive.google.com/file/d/1ECC0TI89oR5kalXibpfRy_HdT9egl8Ff/view?usp=sharing">ERD 다이어그램</a>

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
| <a href="https://github.com/LYUN555">이동윤</a>|팀장|전자결재 아키텍처 설계&구현, 사원등록|
| <a href="https://github.com/ES-Im">김은서</a>| 팀원 |근태관리, 실시간 채팅 |
| <a href="https://github.com/najungwoo">나정우</a>|팀원|회의실예약, 일정관리|
| <a href="https://github.com/alim0o0">오아림</a>|팀원|조직도, 커뮤니티|
| <a href="https://github.com/gd2872">장우림</a>|팀원|메일, 가맹점관리|

# 📌 담당 업무

### 📝 결재 문서
- 기본, 매출보고서, 휴가신청서, 출장신청서 총 4개의 기안서 작성 폼 구현
- 기안 작성 시, 모달 창을 통해 중간결재자/최종결재자/수신참조자 선택 가능
- 기안 제출 후 결재대기 상태에서 수정 및 삭제 가능
- 결재문서 수정·삭제 시, 서비스 레이어에서 유효성 검증을 수행하여 본인이 아닐 경우 로그인 페이지로 리다이렉트 처리
- 결재문서에서 기안자가 설정한 결재라인 및 참조자만 열람 가능하도록 권한 검증 메서드 구현
- 결재자가 서명 미등록 시, 알림(alert) 창을 띄우고 마이페이지에서 전자결재 이미지 등록하도록 처리
- 결재 완료 후 PDF 파일로 다운로드 가능
- 결재 완료 시, 일정(Calendar)에 자동 등록하여 업무 일정과 연동
- 결재 목록 및 참조 리스트 관리를 효율적으로 하기 위해 Datatables 라이브러리와 AJAX를 활용하여 리스트 페이지 구현
- 페이징, 검색 기능 추가로 사용자 편의성 향상

### 🏢 신규 사원 등록
- 사원 초대 시 `JavaMailSender`를 활용하여 이메일 발송 구현
- `Spring Security(CustomUserDetailsService)`로 권한·인증 처리 시 프로필 사진까지 세션에 로드하여 사용자별 접근 제어와 UX를 개선
- 데이터베이스에 새로운 사원 등록 시 중복 여부 확인 및 유효성 검증 로직 구현

### 🔒 마이페이지
- `MultipartFile`로 프로필 이미지 업로드 및 서버에 저장, 기존 파일 삭제 처리 구현
- 사원은 본인의 기본 정보를 실시간으로 수정 가능
- 결재 시스템에서 사용되는 디지털 서명 이미지를 추가하거나 수정 가능

### 📅 일정 관리
- `FullCalendar.js`와 REST API를 활용해 달력에 일정 표시
- 일정 페이지에서 AJAX 통신을 통해 서버에서 실시간으로 불러와 달력에 표시
- 사용자가 새 일정을 추가할 수 있는 기능 제공
- 일정 상세보기 페이지에서 수정, 삭제 기능

# 구현 과정에서 겪은 문제해결 및 개선사례 

<details>
<summary><h3><strong>1. [결재문서 상세보기] 역할별 접근 제어 & 보안 설계 - click</strong></h3></summary>

**문제 :**  
결재문서 상세보기 페이지에서 결재 라인, 참조자, 그리고 해당 팀의 부서장만 문서를 열람할 수 있도록 구현해야 했습니다.  
하지만, 권한이 없는 사용자가 URL을 직접 입력해 접근하려고 할 경우를 어떻게 차단할지 고민이 있었습니다.  

단순히 본인만 볼 수 있는 결재문서는 Spring Security에서 세션 정보를 이용해 확인할 수 있었지만,  
부서장, 중간/최종 결재자, 참조자 등 다양한 역할별로 접근 권한을 부여해야 하는 상황에서 어떻게 구현할지 고민이 컸습니다.

**해결 및 개선 :**  
이 문제를 해결하기 위해 **Access 메서드**를 별도로 구현하여,  
현재 로그인된 사용자의 **역할(Role) 및 PK**를 조회하고,  
해당 문서에 접근 가능한 사용자 목록과 비교하도록 처리했습니다.  
<strong style="color: #66afe9"><a href="https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/draft/service/DraftService.java#L36" target='_blank'>DraftService.java(접근 로직) 코드</a></strong>

이를 통해, 접근 권한이 있는 사용자만 상세보기를 허용하고,  
권한이 없는 사용자가 URL을 직접 입력해 접근을 시도할 경우 차단하도록 구현했습니다.

**장점 :**  
- **신뢰성 있는 사용자 인증:**  
  Spring Security의 `SecurityContextHolder`를 활용하여 현재 사용자의 인증 정보와 권한을 안전하게 가져온 뒤, DB에서 조회한 데이터와 비교함으로써 무단 접근을 효과적으로 차단했습니다.  
- **명확한 역할 기반 접근 제어:**  
  부서장, 중간 결재자, 최종 결재자, 참조자 등 각 역할에 따른 접근 권한을 개별 메서드로 구분하여 처리함으로써, 구체적이고 세밀한 권한 검증이 가능해졌습니다.  
- **URL 직접 입력에 대한 방어:**  
  권한이 없는 사용자가 URL을 직접 입력하여 접근하려고 하는 상황을 미리 차단할 수 있도록, 필요한 권한을 충족하지 않으면 상세보기 페이지에 도달할 수 없도록 하여 보안을 강화했습니다.  
- **모듈화된 승인 검증:**  
  결재 과정의 각 단계(중간, 최종, 반려)에 대해 독립적인 유효성 검사 메서드를 구현하여 각 승인 단계별 검증 로직을 체계적으로 관리할 수 있게 했습니다.  
  <strong style="color: #66afe9"><a href="https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/approval/service/ApprovalActionService.java#L41" target='_blank'>ApprovalActionService.java(결재 로직) 코드</a></strong>
</details>

<details>
<summary><h3><strong>2. [결재 승인 쿼리 로직] 단계별 서명 최적화 - click</strong></h3></summary>

**문제 :**  
중간 결재자 또는 최종 결재자가 승인해야만 서명 이미지가 표시되도록 해야 했습니다.  
결재 상태(A01: 결재대기, A02: 결재중, A03: 결재완료, A04: 반려)에 따라 서명 이미지를 동적으로 처리하는 로직이 필요했으나,  
단순 DB 조회 시 승인되지 않은 서명도 노출되는 문제가 있었습니다.

**고민했던 대안 :**  
- **서버에서 서명 노출 제어:**  
  DB에서 모든 서명을 받아온 뒤 결재 상태를 확인해 필요한 서명만 보여주는 방식은, 사용하지 않는 데이터도 한꺼번에 서버로 전송되고 서버가 메모리에 적재 후 필터링하는 비즈니스 로직으로 인해 전송 비용과 서버 자원 소모가 크게 증가하며 로직도 복잡해집니다.  
- **클라이언트에서 서명 노출 제어:**  
  서버가 서명 정보를 전부 전달하고, 브라우저에서 표시 여부를 결정하는 방식은 간단하지만, 정보 조작을 통해 민감 정보가 노출될 위험이 있어 보안이 취약합니다.  
- **DB에서 CASE문 분기 처리 (최종 선택):**  
  쿼리 단계에서 결재 상태별로 서명 이미지를 조건부로 반환하는 방식으로, 한 번의 SELECT로 처리 가능해 서비스와 프론트 로직이 단순해지고 보안도 강화됩니다.

**해결 및 개선 :**  
CASE문을 통해 A02(결재중) 상태일 때만 중간 결재자 서명을,  
A03(결재완료) 상태일 때 최종 결재자 서명까지 표시하도록 설계했습니다.  
이로써 승인되지 않은 서명 노출 문제를 해소했고, 각 승인 단계별 서명 흐름을 명확히 분리할 수 있었습니다.  
<strong style="color: #66afe9"><a href="https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/draft/mapper/DraftMapper.xml#L22" target='_blank'>DraftMapper.xml (결재 상세보기 & 페이징/검색 쿼리 포함) 코드</a></strong>

**장점 :**  
- **정교한 승인 흐름:**  
  DB에서 한 번에 로직을 분기해, 승인 단계와 서명 이미지 표시 여부가 한눈에 파악됩니다.  
- **보안성·유지보수성:**  
  서버와 프론트에서 불필요하게 민감 정보를 다루지 않아 보안상 안전하며, 로직 중복이 줄어들었습니다.  
- **간결한 코드:**  
  CASE문 분기로 결재 상태를 일괄 처리해 여러 메서드에서 분산 구현할 필요가 없어졌습니다.
</details>

<details>
<summary><h3><strong>3. [결재 문서 목록] 대량 데이터 페이징 & 검색 성능 개선 - click</strong></h3></summary>

**문제 :**  
프로젝트 초기에 결재 문서 누적에 대비하고자, 테스트 환경에서 약 5,000건 이상의 더미 데이터를 생성해 로딩 속도를 확인했습니다.  
초기에는 DataTables 라이브러리를 기본 설정인 클라이언트 사이드렌더링(CSR)을 사용했는데, 모든 데이터를 한 번에 로딩해야 해서 성능이 급격히 떨어졌습니다.  
데이터가 늘어날수록 브라우저가 처리해야 할 양이 기하급수로 증가하고, 서버가 대용량 JSON을 한꺼번에 보내느라 응답 지연이 발생했습니다.

**해결 및 개선 :**  
이 문제를 해결하기 위해 Datatables 라이브러리의 기능을 검색하여 AJAX를 활용해 커스텀으로 페이징 및 검색을 처리할 수 있는 방법을 찾았습니다.  
Mapper에서 페이징 처리와 검색 기능 쿼리를 추가한 후, 서버에서 필요한 데이터만 가져오도록 개선하여 수정한 결과,  
**평균 3초 이상** 걸리던 로딩 시간이 **1초 이하**로 단축되었으며, 데이터가 늘어나도 안정적으로 처리할 수 있게 되었습니다.  
<strong style="color: #66afe9"><a href="https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/draft/mapper/DraftMapper.xml#L394" target='_blank'>DraftMapper.xml (페이징/검색 & 결재 상세보기 쿼리 포함) 코드</a></strong>

**장점 :**  
- **페이징 속도 향상:**  
  클라이언트에서 전체 데이터를 보관·렌더링하는 부담이 사라지고 로딩 시간이 약 2~3초에서 1초 이하로 단축되었습니다(테스트 기준).  
- **클라이언트 성능 최적화:**  
  서버에서 데이터를 미리 정제하여 전송하므로, 브라우저가 대량 데이터를 관리할 필요 없이 적은 리소스로 원활하게 작동할 수 있습니다.  
- **확장성 증가:**  
  데이터가 많아질수록 기존 방식은 성능 저하가 심했지만, 서버에서 직접 페이징 및 검색을 처리하므로 데이터량이 증가해도 원활하게 운영할 수 있습니다.
</details>

<details>
<summary><h3><strong>4. [URL 매핑 구조] 중복 매핑 리팩토링으로 유지보수성 향상 - click</strong></h3></summary>

**문제 :**  
결재 문서 리스트를 구현할 때, 처음에는 각 결재 문서 유형별로 URL을 다르게 설정하고 이를 각각 `@GetMapping`으로 매핑하여 상세보기 페이지로 이동하도록 구현했습니다.  
그러나 이 방식은 반복되는 코드가 많아 유지보수에 어려움이 있었습니다.  
- **첫 번째 문제 :** 새로운 결재 유형이 추가될 때마다 컨트롤러에서 별도의 매핑을 추가해야 한다는 점.  
- **두 번째 문제 :** 각 유형별 메서드에서 결재 첨부파일을 불러오는 코드가 반복되어 코드의 가독성과 유지보수성이 떨어졌습니다.

**해결 및 개선 :**  
이러한 문제를 해결하기 위해 URL을 `@PathVariable`을 활용하는 방식으로 리팩토링했습니다.  
결재 문서의 유형과 해당 문서의 PK 번호를 URL에 포함시켜 단일 `@GetMapping`에서 모든 유형을 처리할 수 있도록 변경했습니다.  
이를 통해 각 문서 유형을 별도로 매핑할 필요 없이, URL 자체로 문서 유형을 식별하면서도 유지보수가 용이한 고유한 URL 구조를 구현했습니다.  
<strong style="color: #66afe9"><a href="https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/draft/controller/DraftController.java#L28" target='_blank'>DraftController.java(GITHUB 코드 보러가기)</a></strong>

**개선점 :**  
URL 만으로 문서 유형을 식별할 수 있도록 설계했지만, 프로젝트를 처음 접하는 사람들도 쉽게 이해할 수 있도록 직관적인 URL 구조를 고려했어야 합니다.  
현재는 공통 코드(ex: C01, C02)를 URL 주소로 사용하다 보니, URL만으로는 어떤 문서의 상세보기인지 쉽게 파악하기 어려운 문제가 있습니다.  
또한, 공통 코드의 `description` 컬럼이 한글로 저장되어 있어 이를 직접 URL에 적용하는 데 어려움이 있어 개선이 필요합니다.
</details>

<details>
<summary><h3><strong>5. [결재문서 작성 폼] 유형별 공통화와 최적화 방식 결정 - click</strong></h3></summary>

**문제 :**  
결재 문서를 작성할 때, 각 유형별로 개별 페이지를 만들어야 할지 아니면 한 페이지에서 유형을 선택하면 필요한 항목만 동적으로 표시하도록 구현해야 할지 고민이 있었습니다.

**해결 및 개선 :**  
유형별 공통 항목이 많다는 점을 고려하여, 한 페이지에서 유형을 선택하면 필요한 값만 표시하고 나머지는 숨기는 방식을 선택했습니다.  
숨겨진 부분의 내용은 초기화하여 불필요한 데이터가 전달되지 않도록 처리했고, 최종적으로 각 유형별로 입력된 데이터를 분리하여 DB에 저장되도록 설계했습니다.  
- [approval.jsp (JavaScript) 코드 보기](https://github.com/LYUN555/haruon/blob/ldy/src/main/webapp/WEB-INF/view/approval/approval.jsp#L446)  
- [ApprovalService.java (유효성 검증 로직) 코드 보기](https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/approval/service/ApprovalService.java#L65)

**장점 :**  
- 한 페이지에서 유형별 폼을 관리하므로 새로운 유형이 추가될 경우 페이지 이동 없이 직관적으로 폼을 작성할 수 있습니다.  
- 공통 필드와 개별 필드의 검증을 분리하여 처리할 수 있으며, 숨겨진 필드의 데이터를 초기화하여 불필요한 정보가 저장되는 것을 방지하고, 필요한 데이터만 서버로 전송되도록 최적화할 수 있습니다.
</details>

<details>
<summary><h3><strong>6. [마이페이지 프로필] 실시간 반영을 위한 Security Context 업데이트 - click</strong></h3></summary>

**문제 :**  
로그인 후 모든 페이지에 표시되는 프로필 이미지가 매번 DB에 요청되는 방식이 비효율적이라 판단하여, Security Context에 프로필 정보를 저장하는 방법을 도입했습니다.  
하지만 프로필 변경 시, 컨텍스트 홀더에 저장된 정보가 갱신되지 않는 문제가 발생했습니다.

**고민했던 대안 :**  
- **AJAX를 통한 새로고침 방식:**  
  프로필 변경 후 클라이언트에서 AJAX를 이용해 최신 이미지를 비동기적으로 로드하는 방식은 항상 최신 정보를 가져올 수 있으나, 페이지 이동 시마다 DB 호출이 필요해 서버 부하가 증가할 수 있습니다.  
- **SecurityContextHolder 업데이트 방식 (최종 선택):**  
  프로필 변경 시 보안 컨텍스트에 저장된 사용자 정보를 갱신하여 최신 이미지가 반영되도록 하는 방식으로, 모든 페이지에 DB 요청 없이 캐시된 정보를 활용하여 서버 부하를 줄였습니다.

**해결 및 개선 :**  
매 페이지마다 DB에 요청하는 방식의 비효율성을 개선하기 위해 SecurityContextHolder 업데이트 방식을 최종 선택했습니다.  
<strong style="color: #66afe9"><a href="https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/user/service/EmpProfileService.java#L55" target="_blank">EmpProfileService.java (Security Context Update) 코드 보기</a></strong>

- **시큐리티 컨텍스트 동기화:**  
  프로필 정보 업데이트 시 `SecurityContextHolder`에서 현재 사용자의 인증 객체를 재생성하여 변경된 정보를 즉시 반영하도록 구현했습니다.
- **DB와 세션 데이터 일관성 강화:**  
  DB에 반영된 최신 프로필 정보를 조회한 후 인증 객체에 갱신된 데이터를 설정하여, 세션과 DB 간 데이터 불일치 문제를 방지했습니다.
- **리소스 절약:**  
  AJAX 방식이나 매 페이지 DB 호출 대신 보안 컨텍스트를 활용하여 불필요한 DB 호출을 줄이고 서버 리소스 소모를 최소화했습니다.

**장점 :**  
- **즉각적인 UI 반영:**  
  프로필 변경 사항이 새로고침 없이 모든 페이지에 즉시 반영됩니다.  
- **보안성 유지:**  
  세션 기반 데이터 동기화 방식으로 안전성을 확보합니다.  
- **경량화 솔루션:**  
  추가 라이브러리 도입 없이 기존 Spring Security로 구현하여 시스템 복잡도를 낮췄습니다.

**개선점 :**  
- **캐시 최적화:**  
  브라우저 캐시로 인해 갱신된 이미지가 바로 반영되지 않는 문제를 해결하기 위해, 이미지 URL에 타임스탬프 또는 랜덤 파라미터를 추가해 캐시를 무효화하는 방식을 고려해야 합니다.  
- **세션 갱신 범위 최적화:**  
  현재 프로필 이미지 변경 시 사용자 전체 정보를 갱신하는 방식으로 동작하여 불필요한 데이터까지 재생성되는 비효율성이 존재합니다. 향후 필요한 데이터만 갱신하도록 개선할 필요가 있습니다.
</details>


