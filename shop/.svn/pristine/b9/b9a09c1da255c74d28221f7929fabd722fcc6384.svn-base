<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
								
		<!-- 갯수가 0인 경우  -->
		<c:if test="${totalCnt eq 0 }">
		
			<tr>
				<td colspan="6">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		

		<!-- 갯수가 있는 경우  -->
		<c:if test="${totalCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
			<c:set var="cnt" value="${CCnt}"/>
			<c:forEach items="${qnaList}" var="list">
			
						<!-- 레벨에 따른 들어쓰기 -->
			 		
					<tr>
						    <td><a href="javascript:fQnAModal(${list.wno});">${list.wno}</a></td>
							<td style="text-align: left;">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${list.groupLayer > 0}">
									<c:forEach var="i" begin="1" end="${list.groupLayer}" step="1">
										<img src="/images/site/reply.png"/>
									</c:forEach>
								</c:if>
								<a href="javascript:fQnAModal(${list.wno},${list.groupWno},${list.groupOrd},${list.groupLayer});">${list.title}</a>
								<span style="color:#FE642E;font-weight:bold">(${list.cnt})</span>
								<!-- 오늘 입력된 글은 글 제목 앞에 NEW를 표시한다. -->
								<c:if test="${list.newyn == 'y'}">
									<img src="/images/site/new1.png"/>
								</c:if>
							</td>
							<td>${list.reg_date}</td>
							<td>${list.regId}(${list.user_type})</td>
						<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
					</tr>
			 			
					
					 <c:set var="nRow" value="${nRow + 1}" /> 
					 
			</c:forEach>
		</c:if>
		
		<input type="hidden" id="totalCnt" value="${totalCnt}">
		<!-- 이거 중간에 있으면 table 안먹힘  -->
	