<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCntDtl">${totalCntDtl}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">학생명</th>
									<th scope="col">평가점수</th>
								</tr>
							</thead>
							<tbody id="surveyMgtDtl">
							<c:if test="${totalCntDtl eq 0 }">
								<tr>
									<td colspan="2">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageDtl-1)}" />
							<c:forEach items="${surveyMgtDtlModel}" var="list">
								<tr>
									<td>${list.name}</td>
									<td>${list.survey}</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>