<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cutil" uri="tld/CommonUtil.tld"%>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCntHomework">${totalCntHomework}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">강의번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">제출시간</th>
									<th scope="col">파일</th>
								</tr>
							</thead>
							<tbody id="listExamResultDtl">
	                           <c:if test="${totalCntHomework eq 0 }">		
			                      <tr>
				                       <td colspan="6">데이터가 존재하지 않습니다.</td>
			                      </tr>
		                       </c:if>
                                <c:if test="${totalCntHomework > 0 }">
                                <c:set var="nRow" value="${pageSize*(currentPageHome-1)}" />
	                             <c:forEach items="${listHomeworkModel}" var="t">
	                      	       <tr>
	                      	       	   <td width="5%">${t.no}</td>
		                      	       <td width="25%"><a href="javascript:fHomeworkModal('${t.no}','${t.seq}');">${t.nt_title}</a></td>
		                      	       <td width="10%">${t.loginID}</td>
		                      	       <td width="30%">${t.reg_date}</td>
		                      	       <td width="30%"><a href="javascript:fDownloadRoomFile('${t.no}','${t.seq}');">${t.filename}</a></td>
	                      	       </tr>
	                      	       <c:set var="nRow" value="${nRow + 1}" />
	                             </c:forEach>
	                             </c:if>
							</tbody>
						</table>
					</div>	



