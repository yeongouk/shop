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
										<th scope="col">음식 타입</th>
										<th scope="col">음식 종류</th> 
										<th scope="col">상품 번호</th>
										<th scope="col">음식 이름</th>
										<th scope="col">재고 개수</th>  
										<th scope="col">입고 가격</th> 
										<th scope="col">판매 가격</th> 
								</tr>
							</thead>
							<tbody id="curInsuffStockList">							
							
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${curInsuffStockList}" var="list">
								<tr>
									<td>${nRow+1}</td>
									<td>${list.food_type}</td>
									<td>${list.food_type2}</td>
						            <td>${list.food_id}</td>
						            <td>${list.food_name}</td>
						            <td>${list.stock_count}</td>
						            <td>${list.input_price}</td>
						            <td>${list.sale_price}</td>
						            									
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>

