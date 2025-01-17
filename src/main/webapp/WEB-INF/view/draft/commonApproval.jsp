<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="user" />
 <!-- 기안자가 같을때 -->
                            <c:if test="${(d.empNo == user.empNo || d.referEmpNo == user.empNo) && d.approvalState != '반려'}">
	                            <div class="col-xxl-3 col-xl-12 col-lg-12 col-md-12 col-sm-12 mt-xxl-0 mt-4">
	                                <div class="widget-content widget-content-area">
	                                    <div class="row">
	                                        <div class="col-xxl-12 mb-4">
	                                            <div class="form-bootstrap-basic">
	                                                <label class="switch-label">결재 상태</label>
	                                            </div>
	                                        </div>
	                                        <div class="col-xxl-12 mb-4">
	                                                <label class="form-control text-center">${d.approvalState}</label>
	                                        </div>
	                                       <c:if test="${d.empNo == user.empNo && d.approvalState == '결재대기'}">
		                                        <div class="col-xxl-12 col-md-12 mb-4">
														<a class="btn btn-primary w-100" href="${pageContext.request.contextPath}/draft/${d.type}/update/${d.draNo}">수정</a>
		                                        </div>
		                                        <div class="col-xxl-12 col-md-12 mb-4">
														<a class="btn btn-danger w-100" href="${pageContext.request.contextPath}/draft/delete?docType=${d.draftType}&appNo=${d.appNo}&draNo=${d.draNo}">삭제</a>
		                                        </div>
	                                       	</c:if>
												<c:if test="${d.approvalState == '반려'}">
													<div class="col-xxl-12 col-md-12 mb-4">
														<button type="button" class="btn btn-secondary w-100" data-bs-toggle="modal" data-bs-target="#rejectModal">
				                                          반려사유
				                                        </button>
													</div>
												</c:if>
	                                        <div class="col-xxl-12 col-sm-4 col-12 mx-auto">
	                                            <a class="btn btn-gray w-100" href="${pageContext.request.contextPath}/draft/list">돌아가기</a>
	                                        </div>
	
	                                    </div>
	                                </div>
	                            </div>
                            </c:if>
                            <!-- 중간 결재자 -->
                            <c:if test="${d.midApp != null && d.midApp == user.empNo && d.approvalState != '반려' }">
	                           <div class="col-xxl-3 col-xl-12 col-lg-12 col-md-12 col-sm-12 mt-xxl-0 mt-4">
	                                <div class="widget-content widget-content-area">
	                                    <div class="row">
	                                        <div class="col-xxl-12 mb-4">
	                                            <div class="form-bootstrap-basic">
	                                                <label class="switch-label">결재 상태</label>
	                                            </div>
	                                        </div>
	                                        <div class="col-xxl-12 mb-4">
	                                                <label class="form-control text-center">${d.approvalState}</label>
	                                        </div>
	                                       		<c:if test="${ d.approvalState == '결재대기'}">
			                                        <div class="col-xxl-12 col-md-12 mb-4">
			                                        	<a class="btn btn-primary w-100" href="${pageContext.request.contextPath}/approval/${d.type}/mid/${d.draNo}">결재</a>
			                                        </div>
		                                       		
			                                        <div class="col-xxl-12 col-md-12 mb-4">
				                                        <button type="button" class="btn btn-secondary w-100" data-bs-toggle="modal" data-bs-target="#rejectModal">
				                                          반려
				                                        </button>
			                                        </div>
		                                        </c:if>
	                                    	<div class="col-xxl-12 col-md-12 mb-4">
	                                            <a class="btn btn-gray w-100" href="${pageContext.request.contextPath}/draft/list">돌아가기</a>
	                                        </div>
		                                </div>
		                            </div>
		                        </div>
                             </c:if>
                             <!-- 최종 결재자 -->
                             <c:if test="${d.finApp == user.empNo && d.approvalState != '반려'}">
	                            <div class="col-xxl-3 col-xl-12 col-lg-12 col-md-12 col-sm-12 mt-xxl-0 mt-4">
	                                <div class="widget-content widget-content-area">
	                                    <div class="row">
	                                        <div class="col-xxl-12 mb-4">
	                                            <div class="form-bootstrap-basic">
	                                                <label class="switch-label">결재 상태</label>
	                                            </div>
	                                        </div>
	                                        <div class="col-xxl-12 mb-4">
	                                                <label class="form-control text-center">${d.approvalState}</label>
	                                        </div>
	                                        <c:if test="${ d.approvalState == '결재중'}">
	                                        <div class="col-xxl-12 col-md-12 mb-4">
	                                        	<a class="btn btn-primary w-100" href="${pageContext.request.contextPath}/approval/${d.type}/final/${d.draNo}">결재</a>
	                                        </div>
	
	                                        <div class="col-xxl-12 col-md-12 mb-4">
	                                        	<button type="button" class="btn btn-secondary w-100" data-bs-toggle="modal" data-bs-target="#rejectModal">
		                                          반려
		                                        </button>
	                                    	</div>
	                                    	</c:if>
	                                    	<div class="col-xxl-12 col-md-12 mb-4">
	                                            <a class="btn btn-gray w-100" href="${pageContext.request.contextPath}/draft/list">돌아가기</a>
	                                        </div>
	                                        
			                                </div>
			                            </div>
			                        </div>
	                           </c:if>
                            	<c:if test="${d.approvalState == '반려'}">
                            		<div class="col-xxl-3 col-xl-12 col-lg-12 col-md-12 col-sm-12 mt-xxl-0 mt-4">
	                                <div class="widget-content widget-content-area">
	                                    <div class="row">
	                                        <div class="col-xxl-12 mb-4">
	                                            <div class="form-bootstrap-basic">
	                                                <label class="switch-label">결재 상태</label>
	                                            </div>
	                                        </div>
                                        	<c:if test="${ d.approvalState == '반려' }">
                                        		<div class="col-xxl-12 col-md-12 mb-4">
	                                        	<button type="button" class="btn btn-secondary w-100" data-bs-toggle="modal" data-bs-target="#rejectModal">
		                                          반려사유
		                                        </button>
	                                    		</div>
                                        	</c:if>
	                                    	<div class="col-xxl-12 col-md-12 mb-4">
	                                            <a class="btn btn-gray w-100" href="${pageContext.request.contextPath}/draft/list">돌아가기</a>
	                                        </div>
	                                        
			                                </div>
			                            </div>
			                        </div>
                            	</c:if>
                            <!-- Modal -->
	        <div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectModal" aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <h5 class="modal-title" id="exampleModalCenterTitle">반려 사유</h5>
	                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
	                        </button>
	                    </div>
                        <form id="FormReject" method="post" action="${pageContext.request.contextPath}/approval/${d.type}/reject/${d.draNo}">
                            <div class="modal-body">
                                <div class="input-group">
                                <c:if test="${d.reasonDenial != null}">
                                    <textarea class="form-control" rows="5" id="reasonDenial" name="reasonDenial" readonly>${d.reasonDenial}</textarea>
                                </c:if>
                                <c:if test="${d.reasonDenial == null}">
                                    <textarea class="form-control" rows="5" id="reasonDenial" name="reasonDenial"></textarea>
                                </c:if>
                                </div>
                            </div>
                            <div class="modal-footer">
                            	<c:if test="${d.reasonDenial == null}">
                                <button id="btnReject" type="button" class="btn btn-primary">결정</button>
                                </c:if>
                            </div>
                        </form>
	                </div>
	            </div>
	        </div>
	        <c:if test="${msg != null}">
			    <script>
			        let message = '${msg}';
			        let returnUrl = '${url}';
			        alert(message);
			        document.location.href = returnUrl;
			    </script>
			</c:if>
            <c:if test="${rejectMsg != null}">
			    <script>
			        let message = '${rejectMsg}';
			        alert(message);
			    </script>
			</c:if>
            <script>
                $('#btnReject').click(function(){
                   if(!$('#reasonDenial').val()){
                        alert('반려 사유를 입력해주세요')
                        return;
                   }
                   $('#FormReject').submit();
                });

            </script>