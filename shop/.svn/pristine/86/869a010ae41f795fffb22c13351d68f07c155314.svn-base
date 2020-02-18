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
										<th scope="col">순서</th>
							            <th scope="col">PC번호</th>
										<th scope="col">아이디</th>
										<th scope="col">번호</th>
										<th scope="col">PC사용금액</th>
										<th scope="col">음식사용금액</th>  
										<th scope="col">판매날짜</th> 
								</tr>
							</thead>
							<tbody id="UseCostList">							
							
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${UseCostList}" var="list">
								<tr>
									<td>${nRow+1}</td>
									<td>${list.pc_no}</td>
									<td>${list.loginId}</td>
									<td>${list.seq}</td>
						            <td>${list.pcuseamt}</td>
						            <td>${list.foodamt}</td>
						            <td>${list.reg_date}</td>
						            
						            									
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>

