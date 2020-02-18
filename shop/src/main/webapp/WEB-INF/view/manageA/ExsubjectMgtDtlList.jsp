<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCntExsubjectDtl">${totalCntExsubjectDtl}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									    <th scope="col">순번</th>
										<th scope="col">강의번호</th>
										<th scope="col">학생명</th>
										<th scope="col">점수</th>
										<th scope="col">재시험점수</th>
										<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody id="listExsubjectMgtDtl">
							<c:if test="${totalCntExsubjectDtl > 0 }">
								<tr>
								<!-- 	<td colspan="12">데이터가 존재하지 않습니다.</td> -->
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageExsubjectDtl-1)}" />
							<c:forEach items="${listExsubjectMgtDtlModel}" var="list">
								<tr>
									<td>${totalCntExsubjectDtl - nRow}</td>
									<td>${list.no}</td>
									<td>${list.loginID}</td>
									<td>${list.score}</td>
									<td>${list.score}</td>
									<td>${list.re}</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>