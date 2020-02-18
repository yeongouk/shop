<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCntComnDtlCod">${totalCntComnDtlCod}</span>
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
							<tbody id="listComnDtlCod">
							<c:if test="${totalCntComnDtlCod eq 0 }">
								<tr>
									<td colspan="12">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageComnDtlCod-1)}" />
							<c:forEach items="${listComnDtlCodModel}" var="list">
								<tr>								
									<td>${list.food_id}</td>
									<td>${list.food_type }</td>	
									<td>${list.food_type2 }</td>
									<td>${list.food_name }</td>
									<td>${list.sale_price }</td>									
								 <td><input type="number" class="form-control num_only num_comma num_sum" id="itemCnt" name="itemCnt" value="0" min="1"></td> 
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>