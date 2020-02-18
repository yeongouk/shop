<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntBoard">${totalCntBoard}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">PC번호</th>
									<th scope="col">고객ID</th>
									<th scope="col">PC사용금액</th>
									<th scope="col">음식사용금액</th>									
									<th scope="col">구매일</th>	
																	
																		
								</tr>
							</thead>
							<tbody id="freeboardList">							
							
							<c:set var="nRow" value="${pageSize*(currentPageBoard-1)}" />
							<c:forEach items="${board}" var="bo">
								<tr>
									<%-- <td>${nRow+1}</td> --%>
									<%-- <td><a href="javascript:freeboardDtl('${PC.pc_no}');"><span>${PC.pc_no}</span></a></td> --%>									
									<td>${bo.pc_no}</td>
									<td>${bo.loginID}</td>
									<td>${bo.pcuseamt}</td>
									<td>${bo.foodamt}</td>																		
									<td>${bo.reg_date}</td>																		
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>