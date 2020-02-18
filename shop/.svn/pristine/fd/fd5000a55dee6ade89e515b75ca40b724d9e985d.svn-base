<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
								
		<!-- 갯수가 0인 경우  -->
		<c:if test="${totalCnt eq 0 }">
			<tr>
				<td colspan="6">게시글이 없습니다.</td>
			</tr>
		</c:if>
		

		<!-- 갯수가 있는 경우  -->
		<c:if test="${totalCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
			<c:forEach items="${qnaList}" var="list">
				 
				 <tr>
					    <td><a href="javascript:fQnAModal(${list.wno});">${nRow + 1}</a></td>
						<td style="text-align: left;"> &nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${list.groupLayer > 0}">
									<c:forEach var="i" begin="1" end="${list.groupLayer}" step="1">
										<img src="/images/site/reply.png"/>
									</c:forEach>
								</c:if>
						<a href="javascript:fQnAModal(${list.wno});">${list.title}</a>
						<c:if test="${list.newyn == 'y'}"><img src="/images/site/new1.png"/></c:if>
						</td>
						<td>${list.update_date}</td>
						<td>${list.regId} (${list.type})</td>
						<td><a class="btnType gray" href="javascript:fReplyModal(${list.wno});" name="modal">답글 쓰기 &nbsp;&nbsp;</a></td>
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
				</tr>

				 <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>
		</c:if>
		
			<input type="hidden" id="totalCnt" value="${totalCnt}">
		<!-- 이거 중간에 있으면 table 안먹힘  -->
		
		
		
		<%-- 			<c:if test="${list.user_type eq 'D'}"> 
			
				<tr>
					    <td><a href="javascript:fQnAModal(${list.wno});">${nRow + 1}</a></td>
						<td><a href="javascript:fQnAModal(${list.wno});">${list.title}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="btnType gray" href="javascript:fReplyModal(${nullNum});" name="modal">답글 쓰기&nbsp;&nbsp;</a></td>
						<td>${list.reg_date}</td>
						<td>${list.regId} (강사)</td>
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				</c:if>
				
			
			<c:if test="${list.user_type eq 'C'}">
			
				<tr>
					    <td><a href="javascript:fQnAModal(${list.wno});">${nRow + 1}</a></td>
						<td><a href="javascript:fQnAModal(${list.wno});">${list.title}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="btnType gray" href="javascript:fReplyModal(${nullNum});" name="modal">답글 쓰기&nbsp;&nbsp;</a></td>
						<td>${list.reg_date}</td>
						<td>${list.regId} (학생)</td>
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				</c:if>
				 --%>
