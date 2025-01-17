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
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="${pageContext.request.contextPath}/src/plugins/src/animate/animate.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->

    <!-- BEGIN THEME GLOBAL STYLES -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.css">
    
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/plugins/css/light/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/src/assets/css/dark/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/plugins/css/dark/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->

    <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/src/table/datatable/datatables.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/light/table/datatable/custom_dt_custom.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/dark/table/datatable/dt-global_style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/src/plugins/css/dark/table/datatable/custom_dt_custom.css">
    <!-- END PAGE LEVEL CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="${pageContext.request.contextPath}/src/assets/css/light/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/carousel.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/light/components/tabs.css" rel="stylesheet" type="text/css">
    
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/scrollspyNav.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/components/carousel.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/src/assets/css/dark/components/tabs.css" rel="stylesheet" type="text/css">
    <!--  END CUSTOM STYLE FILE  -->
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
       
    <!-- 페이지 제목 입력칸 -->
    <title>조직도</title>
    <!-- 페이지 제목 입력칸 -->
    
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="https://d3js.org/d3.v7.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/d3-org-chart@3.0.1"></script>
	<script src="https://cdn.jsdelivr.net/npm/d3-flextree@2.1.2/build/d3-flextree.js"></script>
	
    <style>
        .chart-container {
            width: 100%;
            height: 600px;
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
                          <div class="row mb-3">
                              <div class="col-md-12">
                              <h2>조직도</h2>
                              	<div class="tab-pane fade show active" id="전체-tab-pane" role="tabpanel" aria-labelledby="tab1">
                                  	<div class="widget-content widget-content-area br-8">
                                  	
		            					<div class="container" style="margin-top: 50px; margin-bottom: 300px; width: 100%;">
		            						<div id="dept-data" data-json='<c:out value="${deptListJson}" escapeXml="false" />'></div>
		            						<div class="chart-container">
		            							<!-- script -->
		            						</div>
						                </div> <!-- End Container -->
						                
					             	</div>
					         	</div>
	            			</div>
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

	<script>
	// 서버에서 전달받은 JSON 문자열을 JavaScript 객체로 변환
    	// var deptList = JSON.parse(`\${deptListJson}`);
	
	document.addEventListener('DOMContentLoaded', function () {
		var jsonString = document.getElementById('dept-data').dataset.json
	    .replace(/&quot;/g, '"')
	    .replace(/&#39;/g, "'")
	    .replace(/&lt;/g, "<")
	    .replace(/&gt;/g, ">");
		console.log(jsonString);
		
		// JSON 문자열을 객체로 변환
		jsonString = jsonString.replace(/\\n/g, "").replace(/\\"/g, '"');
		var deptList = JSON.parse(jsonString);
		console.log(deptList);

		var data = [{
		    id: 'root',  // 루트 노드
		    name: '회사 조직도',
		    children: []
		}];

		// 부서별로 직원들을 children에 추가
		deptList.forEach(function(dept) {
		    // 부서가 이미 data[0].children에 존재하는지 확인
		    let department = data[0].children.find(d => d.id === dept.depNo);

		    // 부서가 존재하지 않으면 새로 추가
		    if (!department) {
		        department = {
		            id: dept.depNo,  // 부서 ID
		            name: dept.dname,  // 부서 이름
		            position: '',  // 부서 직급은 빈 문자열
		            children: []  // 직원들이 들어갈 children 배열
		        };
		        data[0].children.push(department);
		    }

		    // 부서에 직원 추가
		    department.children.push({
		        id: dept.headEmpNo,  // 직원 ID
		        name: dept.headName,  // 직원 이름
		        position: dept.location,  // 직원 위치 (직급)
		        children: []  // 직원은 자식이 없으므로 빈 배열
		    });
		});
		
		console.log(data)
		
	    // D3.js를 사용하여 조직도 그리기
	    new d3.OrgChart()
	        .nodeHeight((d) => 85 + 25)   // 노드의 높이 설정
	        .nodeWidth((d) => 220 + 2)    // 노드의 너비 설정
	        .childrenMargin((d) => 50)    // 자식 노드 간의 마진 설정
	        .compactMarginBetween((d) => 35) // 노드 간의 간격 설정
	        .compactMarginPair((d) => 30)   // 연결되는 노드 사이의 간격 설정
	        .neighbourMargin((a, b) => 20)  // 이웃 노드 간의 간격 설정
	        .nodeContent(function(d) {
	            const color = '#FFFFFF'; // 노드 배경색
	            return `
			            <div style='width:${d.width}px;height:${d.height}px;padding-top:1px;padding-left:1px;padding-right:1px'>
				            <div style="font-family: 'Inter', sans-serif;background-color:${color};margin-left:-1px;width:${d.width - 2}px;height:${d.height - 2}px;border-radius:10px;border: 1px solid #E4E2E9">
				                <div style="display:flex;justify-content:flex-end;margin-top:5px;margin-right:8px">#${d.data.id}</div>
				                <div style="background-color:${color};margin-top:-20px;margin-left:15px;border-radius:100px;width:50px;height:50px;"></div>
				                
				                <div style="font-size:15px;color:#08011E;margin-left:20px;margin-top:10px">  
				                    ${d.data.name}
				                </div>
				                <div style="color:#716E7B;margin-left:20px;margin-top:3px;font-size:10px;"> 
				                    ${d.data.position}
				                </div>
				            </div>
				        </div>
	            `;
	        })
	        .container('.chart-container')
	        .data(data)
	        .render();
	});
	</script>
</body>
</html>