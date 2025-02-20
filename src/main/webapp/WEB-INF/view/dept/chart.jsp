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

	<!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="${pageContext.request.contextPath}/src/plugins/src/animate/animate.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->

    <!-- BEGIN THEME GLOBAL STYLES -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.css">
    
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/plugins/css/light/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->

    <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/custom_dt_custom.css">
    <!-- END PAGE LEVEL CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/carousel.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/tabs.css" rel="stylesheet" type="text/css">
    <!--  END CUSTOM STYLE FILE  -->
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
      
    <!-- 페이지 제목 입력칸 -->
    <title>HARUON | 조직도</title>
    <!-- 페이지 제목 입력칸 -->
    
    <style>
	.tree {
	    width: 100%;
	    height: auto;
	    margin: 0 auto; /* 중앙 정렬 */
	    position: relative;
	    overflow-x: auto; /* 가로 스크롤 가능 */
	}
	
	.tree::after {
	    content: "";
	    display: table;
	    clear: both;
	}
	
	.tree ul {
		display: flex;
	    padding-top: 70px; position: relative;
		transition: all 0.5s;
		justify-content: center;
		-webkit-transition: all 0.5s;
		-moz-transition: all 0.5s;
	}
	
	.tree li {
		float: left; text-align: center;
		list-style-type: none;
		position: relative;
		padding: 60px 0px 0px 0px;
		transition: all 0.5s;
		-webkit-transition: all 0.5s;
		-moz-transition: all 0.5s;
	}
	
	/*We will use ::before and ::after to draw the connectors*/
	
	.tree li::before, .tree li::after{
		content: '';
		position: absolute; top: 0; right: 40%;
		border-top: 1px solid #7a7979;
		width: 60%; height: 60px;
	}
	.tree li::after{
		right: auto; left: 60%;
		border-left: 1px solid #7a7979;
	}
	
	/*We need to remove left-right connectors from elements without 
	any siblings*/
	.tree li:only-child::after, .tree li:only-child::before {
		display: none;
	}
	
	/*Remove space from the top of single children*/
	.tree li:only-child{ padding-top: 0;}
	
	/*Remove left connector from first child and 
	right connector from last child*/
	.tree li:first-child::before, .tree li:last-child::after{
		border: 0 none;
	}
	/*Adding back the vertical connector to the last nodes*/
	.tree li:last-child::before{
		border-right: 1px solid #7a7979;
		border-radius: 0 5px 0 0;
		width: 50%;
		-webkit-border-radius: 0 5px 0 0;
		-moz-border-radius: 0 5px 0 0;
	}
	.tree li:first-child::after{
		border-radius: 5px 0 0 0;
		-webkit-border-radius: 5px 0 0 0;
		-moz-border-radius: 5px 0 0 0;
	}
	
	/*Time to add downward connectors from parents*/
	.tree ul ul::before{
		content: '';
		position: absolute; top: 0; left: 50%;
		border-left: 1px solid #7a7979;
		width: 0; height: 70px;
	}
	
	.tree li a{
		border: 2px solid #7a7979; /* 테두리 색상 */
	    padding: 3vh 3vw;
	    text-decoration: none;
	    color: #333; /* 글자 색상 */
	    font-family: Arial, Verdana, Tahoma;
	    font-size: 18px;
		display: inline-block;
		
		border-radius: 5px;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		
		transition: all 0.5s;
		-webkit-transition: all 0.5s;
		-moz-transition: all 0.5s;
	}
	
	/*Time for some hover effects*/
	/*We will apply the hover effect the the lineage of the element also*/
	.tree li a:hover, .tree li a:hover+ul li a {
		background: #ffffff !important; border: 2px solid #d6e1ff; font-weight: bold;
	}
	/*Connector styles on hover*/
	.tree li a:hover+ul li::after, 
	.tree li a:hover+ul li::before, 
	.tree li a:hover+ul::before,
	.tree li a:hover+ul ul::before{
		border-color:  #90aeff;
	}
	.btn.dept {
		background-color: #d6e1ff !important;
	}
	.btn.head {
		background-color: #d6e1ff !important;
		font-size: larger; font-style: italic;
	}
	
	.author-img {
	    width: 100px;
	    height: 100px;
	    background-size: cover; 
	    background-position: center; /* 이미지 중앙 정렬 */
	    border-radius: 50%; /* 원형으로 만들기 */
	     display: block;
	    margin: 0 auto;
	}
	.profile-image-area {
    	text-align: center;
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
                                                <li class="breadcrumb-item"><a href="#">조직도</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">조직도</li>
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
                
                 <div class="account-settings-container layout-top-spacing">
                      <div class="account-content">
                          <div class="card row mb-3">
           					<div class="container" style="margin-bottom: 100px; width: 100%;">
           					 	<div class="orgChart tree">
           							<!-- 조직도 차트 -->
           						</div>
			                </div> <!-- End Container -->
			                
			                <!-- Modal - 부서장 정보-->
							<div class="modal fade" id="empModal" tabindex="-1" role="dialog" aria-labelledby="empModal" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">부서장</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true">
												<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
													<line x1="18" y1="6" x2="6" y2="18"></line> <line x1="6" y1="6" x2="18" y2="18"></line></svg>
											</button>
										</div>
										
										<div class="modal-body">
											<div class="profile-image">
										    	<c:if test="${e.fileName != null}">
											      <div class="profile-image-area mb-2">
							                      	<img class="author-img mb-2" src="${pageContext.request.contextPath}/upload/profile/${e.fileName}.${e.ext}" id="author-img">
								                  </div>
										    	</c:if>
										    	<c:if test="${e.fileName == null}">
											      <div class="profile-image-area mb-2">
							                      	<img class="author-img mb-2" src="${pageContext.request.contextPath}/upload/profile/noProfile.png" id="author-img">
								                  </div>
										    	</c:if>
										    </div>
											<div class="mb-3">
												<label class="form-label">이름</label> 
												<input type="text" class="form-control" name="ename" readonly>
											</div>
											<div class="mb-3">
												<label class="form-label">부서</label> 
												<input type="text" class="form-control" name="dname" readonly>
											</div>
											<div class="mb-3">
												<label class="form-label">직급</label> 
												<input type="text" class="form-control" name="location" readonly>
											</div>
											<div class="mb-3">
												<label class="form-label">이메일</label> 
												<input type="text" class="form-control" name="email" readonly>
											</div>
											<div class="mb-3">
												<label class="form-label">내선번호</label> 
												<input type="text" class="form-control" name="extNum" readonly>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary mt-2 mb-2 btn-no-effect" data-bs-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div> <!-- END Modal - 부서장 정보-->
							
							<!-- Modal - 부서 정보-->
							<div class="modal fade" id="deptModal" tabindex="-1" role="dialog" aria-labelledby="deptModal" aria-hidden="true">
								<div class="modal-dialog" role="document" style="max-width: 900px; width: 85%;">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">부서 정보</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true">
												<svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
													stroke-linecap="round" stroke-linejoin="round" class="feather feather-x">
													<line x1="18" y1="6" x2="6" y2="18"></line> <line x1="6" y1="6" x2="18" y2="18"></line></svg>
											</button>
										</div>
										
										<div class="modal-body">
											<div class="mb-3">
												<label class="form-label">부서명</label> 
												<input type="text" class="form-control" name="dname" readonly>
											</div>
											<table class="table">
							                    <thead>
							                        <tr>
							                            <th>이름</th>
							                            <th>직급</th>
							                            <th>이메일</th>
							                            <th>내선번호</th>
							                        </tr>
							                    </thead>
							                    <tbody>
							                        <!-- 직원 정보 -->
							                    </tbody>
							                </table>
											
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary mt-2 mb-2 btn-no-effect" data-bs-dismiss="modal">확인</button>
										</div>
									</div>
								</div>
							</div><!-- END Modal - 부서 정보 -->
					
	        			</div>
		    		</div>
				</div>
                <!-- 메인컨텐츠 END -->
            </div>
            
            <!--  BEGIN FOOTER  -->
            <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
            <!--  END FOOTER  -->
        </div>
        <!--  END CONTENT AREA  -->

    </div>
    <!-- END MAIN CONTAINER -->

    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/highlight/highlight.pack.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/assets/js/dashboard/dash_1.js"></script>
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->

    <!-- BEGIN THEME GLOBAL STYLE -->
    <script src="${pageContext.request.contextPath}/src/assets/js/scrollspyNav.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/custom-sweetalert.js"></script>
    <!-- END THEME GLOBAL STYLE --> 
    
    <script>
		const deptList =  JSON.parse('${deptListJson}'); // 서버에서 전달된 deptList를 JSON으로 변환
		
		// 1. 계층 구조 생성
		const treeData = {
		  id: "root",
		  name: "CEO <br>${c.leader}", // 회사 대표 이름
		  children: []
		};
		
		deptList.forEach((dept) => {
		  // 부서 찾기
		  let department = treeData.children.find(d => d.id === String(dept.depNo));
		  if (!department) { // 부서 존재하지 않으면 새로 추가
		    department = {
		      id: String(dept.depNo),
		      name: dept.dname,
		      children: []
		    };
		    treeData.children.push(department);
		  }
		
		  // 부서장 추가
		  department.children.push({
		    id: String(dept.headEmpNo),
		    name: dept.headName || '-',
		    dname: dept.dname,
            location: dept.location,
		    position: "부서장",
		    email: dept.email, 
		    extNum: dept.extNum
		  });
		  
		});
		
		// 2. 계층 구조를 HTML로 변환
		function generateTreeHTML(node) {
			if (!node.children || node.children.length === 0) {
			  return `
					  <li>
					     <a class="btn head" data-bs-toggle="modal" data-bs-target="#empModal" 
				  				data-name="\${node.name || '-'}" data-dname="\${node.dname}" data-location="\${node.location}" data-email="\${node.email || '-'}" data-extnum="\${node.extNum || '-'}" 
				  				onclick="setModalDataFromElement(this)">\${node.name}</a>
					   </li>
				  `;
			}
			
			let childrenHTML = node.children.map(child => generateTreeHTML(child)).join("");
			return `
					<li>
						<a class="btn dept" data-bs-toggle="modal" 
								data-bs-target="\${node.name === 'CEO <br>${c.leader}' ? '' : '#deptModal'}" 
					            data-dname="\${node.name}" data-depno="\${node.id}" 
					            onclick="if('${node.name}' === 'CEO <br>${c.leader}') return false; else setModalDataFromElement(this)">\${node.name}</a>
		  				<ul>
					       \${childrenHTML}
					     </ul>
				  	</li>
				 `; // CEO는 모달 XX
		}
		
		// 3. 트리 HTML 생성 및 삽입
		const treeHTML = generateTreeHTML(treeData);
		// console.log(treeHTML);
		document.addEventListener("DOMContentLoaded", () => {
			document.querySelector(".orgChart").innerHTML = `<ul>\${treeHTML}</ul>`;
		});
		
		// 모달창마다 데이터 받기
		function setModalDataFromElement(element) {
			const name = element.getAttribute('data-name');
			const dname = element.getAttribute('data-dname');
			const location = element.getAttribute('data-location');
			const email = element.getAttribute('data-email');
			const extNum = element.getAttribute('data-extnum');
	
			if (element.classList.contains('head')) { // 부서장 클릭
		        setEmpModalData({
		            name: name,
		            dname: dname,
		            location: location,
		            email: email,
		            extNum: extNum
		        });
		    } else {
		        // 부서 클릭
		        const depNo = element.getAttribute('data-depno'); 
		        getEmployeesByDept(depNo).then(employees => {
		            setDeptModalData({
		                dname: dname,
		                employees: employees
		            });
		        });
		    }
		}
		
		// 직급 코드 -> 직급명
		const position = {
    		'I01': '사원',
   	        'I02': '팀장',
   	        'I03': '부서장'		
	    }
		
		
		// 부서장 정보 모달 데이터 설정 함수
		function setEmpModalData(nodeData) {
		    // nodeData는 선택된 부서장 또는 부서의 데이터
		    document.querySelector('.modal-body .form-control[name="ename"]').value = nodeData.name || '';
		    document.querySelector('.modal-body .form-control[name="dname"]').value = nodeData.dname || '';
		    document.querySelector('.modal-body .form-control[name="location"]').value =  position[nodeData.location] || '-';
		    document.querySelector('.modal-body .form-control[name="email"]').value = nodeData.email || '';
		    document.querySelector('.modal-body .form-control[name="extNum"]').value = nodeData.extNum || '';
		}
		
		// 부서별 직원 모달 데이터 설정 함수
		function setDeptModalData(department) {
		    document.querySelector('#deptModal .modal-body .form-control[name="dname"]').value = department.dname || '';

		    // 직원 정보 출력
		    const employeeList = department.employees.map(emp => `
		        <tr>
		            <td>\${emp.ename}</td>
		            <td>\${position[emp.location] || '-'}</td>
		            <td>\${emp.email || '-'}</td>
		            <td>\${emp.extNum || '-'}</td>
		        </tr>
		    `).join('');
			
		    // console.log('Employee List:', employeeList);
		    document.querySelector('#deptModal .modal-body .table tbody').innerHTML = employeeList;
		}
		
		var contextPath = '${pageContext.request.contextPath}';
		
		// 부서별 직원 정보를 가져오는 함수
		function getEmployeesByDept(depNo) {
		    return fetch(contextPath + '/depts/employees?depNo=' + depNo)
		        .then(response => {
		            if (!response.ok) {
		                throw new Error('서버 응답 실패');
		            }
		            return response.json(); // JSON 형태로 응답을 파싱
		        })
		       .then(data => {
		    	   // console.log('Employees Data:',data);
		            return data; // 가져온 데이터를 반환
		        })
		        .catch(error => {
		            return []; // 오류가 발생하면 빈 배열 반환
		        });
		}
	</script>
</body>
</html>