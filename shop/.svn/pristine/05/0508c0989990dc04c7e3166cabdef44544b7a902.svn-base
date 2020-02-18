<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntProduct">${totalCntProduct}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">번호</th>
										<th scope="col">상품타입</th>
										<th scope="col">상품종류</th>
										<th scope="col">상품 명</th>
										<th scope="col">상품 가격</th>
										<th scope="col">잔여 갯수</th>
										<th scope="col">입고</th>
								</tr>
							</thead>
							<tbody id="listProduct">
							<c:if test="${totalCntProduct eq 0 }">
								<tr>
									<td colspan="9">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageProduct-1)}" />
							<c:forEach items="${listProductModel}" var="list">
							
								<tr>
									<td>${totalCntProduct - nRow}</td>
									
									<td>${list.food_type}</td>									
									<td>${list.food_type2}</td>
									<td>${list.food_name}</td>
									<td>${list.sale_price}</td>
									<td>${list.stock_count}</td>																
									<td>
										<a class="btnType3 color1" href="javascript:fPopModalProduct('${list.food_id}');"><span>입고/수정</span></a>
									</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>
							