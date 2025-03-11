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

## 구현 과정에서 겪은 문제해결 및 개선사례

<details>
<summary><strong>1. 마이페이지 프로필 실시간 반영 이슈</strong></summary>

**문제 :**  
프로필 업데이트 후 오른쪽 상단의 프로필 이미지가 새로고침이나 재로그인 없이 즉시 반영되지 않는 문제가 발생했습니다.  
이를 해결하기 위해 웹소켓을 통한 실시간 통신과 시큐리티 컨텍스트 업데이트 방식 두 가지 방법을 검토했습니다.  
1) **웹소켓 방식:** 실시간 반영에 적합하지만, 구현 난이도가 높고 서버 리소스 사용량이 증가하여 효율적이지 않다고 판단했습니다.  
2) **시큐리티 컨텍스트 업데이트 방식:** 기존 인증 시스템과의 통합이 용이하고 서버 부담이 적어 최적의 해결책으로 보았습니다.

**해결 및 개선 :**  
- 기존 보안 및 세션 관리 체계를 유지하기 위해 **Spring Security 컨텍스트 업데이트** 방식을 선택했습니다.  
- [GITHUB 코드 보러가기](https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/user/service/EmpProfileService.java)  

  - **시큐리티 컨텍스트 동기화:**  
    프로필 정보 업데이트 시 `SecurityContextHolder`에서 현재 사용자의 인증 객체를 재생성하여 변경된 정보를 즉시 반영하도록 구현했습니다.

  - **DB와 세션 데이터 일관성 강화:**  
    DB에 반영된 최신 프로필 정보를 조회한 후 인증 객체에 갱신된 데이터를 설정, 세션과 DB 간 데이터 불일치를 방지했습니다.

  - **리소스 절약:**  
    웹소켓 대신 기존 인증/권한 관리 인프라를 활용해 불필요한 리소스 소비를 최소화했습니다.

**장점 :**  
- **즉각적인 UI 반영:** 프로필 변경 사항이 새로고침 없이 모든 페이지에 즉시 반영됩니다.  
- **보안성 유지:** 별도의 실시간 통신 채널 없이 세션 기반 데이터 동기화 방식으로 안전성을 확보했습니다.  
- **경량화 솔루션:** 추가 라이브러리 도입 없이 기존 Spring Security 인프라만으로 구현했습니다.

**개선점 :**  
- **캐시 최적화:** 브라우저 캐시로 인해 갱신된 이미지가 바로 반영되지 않을 수 있으므로, 이미지 URL에 타임스탬프나 랜덤 파라미터를 추가해 캐시를 무효화할 필요가 있습니다.  
- **세션 갱신 범위 최적화:** 현재는 프로필 이미지 변경 시 사용자 정보를 전부 재생성하고 있어 일부 불필요한 데이터까지 갱신됩니다. 향후 해당 부분만 선택적으로 갱신하도록 개선이 필요합니다.

</details>


<details>
<summary><strong>2. 결재문서 작성 폼</strong></summary>

**문제 :**  
결재 문서를 작성할 때, 각 유형별로 개별 페이지를 만들지, 아니면 한 페이지에서 유형을 선택해 필요한 항목만 동적으로 표시할지를 고민했습니다.

**해결 및 개선 :**  
- 유형별 공통 항목이 많다는 점을 고려하여, **한 페이지에서 유형을 선택**하면 필요한 값만 표시하고 나머지는 숨기는 방식을 적용했습니다.  
- 숨겨진 부분의 내용은 초기화하여 불필요한 데이터가 전달되지 않도록 처리했으며, 최종적으로 각 유형별로 입력된 데이터를 분리해 DB에 저장되도록 설계했습니다.  
- [결재작성 페이지 코드 보러가기](https://github.com/LYUN555/haruon/blob/ldy/src/main/webapp/WEB-INF/view/approval/approval.jsp)

**장점 :**  
- **한 페이지에서 유형별 폼 관리:** 새로운 유형이 추가되더라도 페이지 이동 없이 직관적으로 폼을 작성할 수 있습니다.  
- **공통 필드와 개별 필드 검증 분리:** 숨겨진 필드의 데이터를 초기화하여 불필요한 정보가 서버로 전달되지 않도록 최적화할 수 있습니다.

**개선점 :**  
- **가독성 저하 가능성:** 유형별 입력 항목이 많아질 경우 한 페이지 내에서 검증과 필드가 복잡해질 수 있습니다.  
- **잘못된 데이터 전송 가능성:** 유형 변경 시 필요 없는 필드 값이 남아 있을 수 있으므로, 컨트롤러와 서비스 레이어에서 공통 필드와 유형별 필드를 구분해 검증하고, 매퍼에서 불필요한 데이터가 DB에 들어가지 않도록 필터링을 적용했습니다.

</details>


<details>
<summary><strong>3. 결재문서 상세보기</strong></summary>

**문제 :**  
처음에는 결재 문서 유형별로 URL을 다르게 설정하고 각 유형마다 `@GetMapping`을 따로 구현했는데, 이 방식은 중복 코드가 많아 유지보수에 어려움이 있었습니다.  
- **첫 번째 문제:** 새로운 결재 유형이 추가될 때마다 컨트롤러에서 별도의 매핑을 추가해야 했습니다.  
- **두 번째 문제:** 각 유형별 메서드에서 첨부파일 로딩 코드가 반복되어 코드 가독성과 유지보수성이 떨어졌습니다.

**해결 및 개선 :**  
- **@PathVariable**을 활용해 결재 문서의 유형과 PK 번호를 URL에 포함시켜 **단일 `@GetMapping`**에서 모든 유형을 처리하도록 리팩토링했습니다.  
- 이를 통해 각 문서 유형별 매핑을 따로 관리할 필요 없이, URL 자체로 문서 유형을 식별하면서도 유지보수가 용이한 구조를 구현했습니다.  
- [GITHUB 코드 보러가기](https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/draft/controller/DraftController.java)

**개선점 :**  
- **URL 구조의 직관성 부족:** 공통 코드(ex: C01, C02)로만 구분되어 있어, 어떤 문서인지 한눈에 파악하기 어려운 점이 있습니다.  
- **한글 description 사용 제한:** 공통 코드의 `description` 컬럼이 한글로 저장되어 있어 URL에 직접 적용하기 어려웠는데, 이 부분을 개선할 필요가 있습니다.

</details>


<details>
<summary><strong>4. 결재문서 상세보기 - 권한 검증 & 보안</strong></summary>

**문제 :**  
결재문서 상세보기 페이지에서 결재 라인, 참조자, 해당 팀의 부서장만 문서를 열람할 수 있도록 해야 했습니다.  
그러나 권한이 없는 사용자가 URL을 직접 입력해 접근하려 할 경우를 어떻게 차단할지 고민이 컸습니다.  

단순히 본인만 볼 수 있는 문서는 Spring Security 세션 정보로 검증할 수 있었지만,  
부서장, 중간/최종 결재자, 참조자 등 **다양한 역할별**로 접근을 허용해야 해서 추가 로직이 필요했습니다.

**해결 및 개선 :**  
- 별도의 **Access 메서드**를 구현해, 현재 로그인된 사용자의 **역할(Role)과 PK**를 조회한 뒤, 해당 문서에 접근 권한이 있는 사용자 목록과 비교하도록 처리했습니다.  
- [Access GITHUB 코드 보러가기](https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/draft/service/DraftService.java)

이를 통해 권한이 있는 사용자만 상세보기를 허용하고,  
권한이 없는 사용자가 URL을 직접 입력해 접근을 시도해도 차단되었습니다.

**장점:**

- **신뢰성 있는 사용자 인증:**  
  `SecurityContextHolder`를 활용해 로그인 사용자의 인증 정보와 권한을 가져온 뒤 DB 데이터와 비교함으로써 무단 접근을 막았습니다.

- **명확한 역할 기반 접근 제어:**  
  부서장, 중간 결재자, 최종 결재자, 참조자 등 각 역할별로 접근 권한 검증 로직을 나누어 세밀한 권한 제어가 가능했습니다.

- **URL 직접 입력 방어:**  
  필요한 권한을 충족하지 못하면 상세보기 페이지에 도달할 수 없도록 차단해 보안을 강화했습니다.

- **모듈화된 승인 검증:**  
  결재 과정(중간, 최종, 반려 등)별로 독립적인 유효성 검사 메서드를 구현, 승인 단계별 로직을 체계적으로 관리했습니다.  
  [승인 로직 GITHUB 코드 보러가기](https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/approval/service/ApprovalActionService.java)

</details>


<details>
<summary><strong>5. 결재문서 페이징 처리</strong></summary>

**문제 :**  
프로젝트 초기에 결재 문서 누적에 대비하고자, 테스트 환경에서 **약 5,000건 이상의 더미 데이터를 생성**해 로딩 속도를 확인했습니다.  
당시 DataTables 라이브러리를 기본 설정(클라이언트 사이드 렌더링, CSR)으로 사용했는데, 모든 데이터를 한 번에 로딩하면서 성능이 급격히 떨어졌습니다.  
데이터가 늘어날수록 브라우저가 처리해야 할 양이 기하급수로 증가하고, 서버도 대용량 JSON을 한꺼번에 전송하느라 응답 지연이 발생했습니다.

**해결 및 개선 :**  
- DataTables 라이브러리의 **Ajax(서버 사이드) 모드**를 활용해 커스텀으로 페이징 및 검색 기능을 처리하도록 변경했습니다.  
- Mapper에서 페이징 처리와 검색 기능 쿼리를 추가하고, 서버에서 필요한 데이터만 응답하도록 개선했습니다.  
- 그 결과, **평균 3초 이상** 걸리던 로딩 시간이 **1초 이하**로 단축되었고, 데이터가 늘어나도 안정적으로 처리할 수 있게 되었습니다.  
- [DraftMapper.xml (페이징/검색 & 결재 상세보기 쿼리 포함) 코드](https://github.com/LYUN555/haruon/blob/ldy/src/main/java/com/haruon/groupware/draft/mapper/DraftMapper.xml)

**장점 :**  
- **페이징 속도 향상:**  
  클라이언트에서 모든 데이터를 보관·렌더링하지 않고, 필요한 데이터만 요청해 로딩 시간이 2~3초에서 1초 이하로 단축되었습니다(테스트 기준).

- **클라이언트 성능 최적화:**  
  서버에서 데이터를 미리 정제해 전송하므로, 브라우저가 대량 데이터를 관리할 필요 없이 적은 리소스로도 원활하게 작동합니다.

- **확장성 증가:**  
  서버가 직접 페이징과 검색을 처리하므로, 데이터량 증가에도 큰 성능 저하 없이 안정적으로 운영할 수 있습니다.

</details>
	
