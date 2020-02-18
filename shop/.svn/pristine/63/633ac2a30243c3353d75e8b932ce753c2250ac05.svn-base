<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			
			
		
						<c:if test="${totalCnt eq 0 }">
								<tr>
									<td colspan="9">수강중인 학생이 없습니다.</td>
								</tr>
						</c:if>
							
							
						<c:if test="${totalCnt > 0 }">
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${studentList}" var="list">
								<tr>
									<td>${nRow+1}</td>
									<td><a href="javascript:fSelectStudent('${list.no}', '${list.loginID}', '${list.name}')">${list.name}</a></td>
									 <c:if test="${list.sumScore == null }"><td>미응시</td></c:if>
									<c:if test="${list.sumScore != null }"><td>${list.sumScore}점</td></c:if> 
									<td>
										<a class="btnType3 color1" href="javascript:fDetailStudent('${list.no}', '${list.loginID}')"><span>보기 / 수정</span></a>
									</td>

								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
                           </c:if>
							
			<input type="hidden" id="totalCnt" value="${totalCnt}">
		<!-- 이거 중간에 있으면 table 안먹힘  -->
							