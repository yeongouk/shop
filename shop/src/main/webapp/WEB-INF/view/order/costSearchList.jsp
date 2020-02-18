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
										<th scope="col">순번</th>
										<th scope="col">이용일자</th>
										<th scope="col">PC번호</th>
										<th scope="col">총 사용시간</th>
										<th scope="col">PC방 비용</th>									
										<th scope="col">음식 비용</th>									
										<th scope="col">합계 금액</th>		
								</tr>
							</thead>
							<tbody id="costSearchList">							
							
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${costSearchList}" var="list">
								<tr>
									<td>${nRow+1}</td>
									<td>${list.cost_date}</td>
						            <td>${list.pc_no}</td>
						            <td>${list.use_time}</td>
						            <td>${list.pcamt}</td>
						            <td>${list.foodamt}</td>
						            <td>${list.total}</td>										
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>






















