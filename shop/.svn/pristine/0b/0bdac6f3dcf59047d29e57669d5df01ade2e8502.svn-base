<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			
			
		
						<c:if test="${totalCnt eq 0 }">
								<tr>
									<td colspan="9">강좌가 없습니다.</td>
								</tr>
						</c:if>
							
							
						<c:if test="${totalCnt > 0 }">
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${evaluationMgtList}" var="list">
								<tr>
									<td>${nRow+1}</td>
									<td>${list.no}</td>
									<td><a href="javascript:fStudentList(1, '${list.no}', '${list.title}')">${list.title}</a></td>
									<td>${list.date}</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
                           </c:if>
							
			<input type="hidden" id="totalCnt" value="${totalCnt}">
		<!-- 이거 중간에 있으면 table 안먹힘  -->
							