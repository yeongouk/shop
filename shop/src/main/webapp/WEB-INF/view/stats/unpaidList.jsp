<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntUnpaid">${totalCntUnpaid}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
										<th scope="col">번호</th>
										<th scope="col">미납 일자</th>
										<th scope="col">pc 번호</th>
										<th scope="col">아이디</th>
										<th scope="col">pc 사용번호</th>
										<th scope="col">음식 주문 금액</th>
										<th scope="col">PC방 이용 금액</th>									
										<th scope="col">총 이용 금액</th>
										<th scope="col">완납 여부</th>	
								</tr>
							</thead>
							<tbody id="unpaidList">							
							
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${unpaidList}" var="list">
								<tr>
									<td>${nRow+1}</td>
									<td>${list.reg_date}</td>
						            <td>${list.pc_no}</td>
						            <td>${list.loginID}</td>
						            <td>${list.seq}</td>
						            <td>${list.foodamt}</td>	
						            <td>${list.pcuseamt}</td>
						            <td>${list.totalamt}</td>	
						            <td>${list.cpl_yn}</td>										
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>

