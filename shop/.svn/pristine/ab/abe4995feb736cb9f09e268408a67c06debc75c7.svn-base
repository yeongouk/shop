<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntComnGrpCod">${totalCntComnGrpCod}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
										<th scope="col">번호</th>
										<th scope="col">상품타입</th>
										<th scope="col">상품종류</th>									
										<th scope="col">상품명</th>
										<th scope="col">상품 가격</th>
								</tr>
							</thead>
							<tbody id="listComnGrpCod">
							<c:if test="${totalCntComnGrpCod eq 0 }">
								<tr>
									<td colspan="9">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageComnGrpCod-1)}" />
							<c:forEach items="${listComnGrpCodModel}" var="list">
								<tr>
									<td>${list.food_id}</td>
									<td>${list.food_type }</td>	
									<td>${list.food_type2 }</td>								
									<td><a href="javascript:fListComnDtlCod(1, '${list.food_id}', '${list.food_type2}')">${list.food_name}</a></td>															
									<td>${list.sale_price}</td>
									
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>
							