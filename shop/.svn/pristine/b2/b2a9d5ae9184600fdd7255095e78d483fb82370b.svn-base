<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCnt">${totalCnt}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
										 <th scope="col">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">고객 이름</th>
										<th scope="col">음식 이름</th>
										<th scope="col">구매 금액</th> 
								</tr>
							</thead>
							<tbody id="ctmSpecProCostList">							
							
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${ctmSpecProCostList}" var="list">
								<tr>
									<td>${nRow+1}</td>
									<td>${list.loginID}</td>
						            <td>${list.name}</td>
						            <td>${list.food_name}</td>
						            <td>${list.sale_price}</td>
   									
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>

