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
									<th scope="col">학생명</th>
									<th scope="col">평가점수</th>
									<th scope="col">구분</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							
							<tbody id="resumeMgtDtl">
							
							<c:if test="${totalCnt eq 0 }">
								<tr>
									<td colspan="4">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalCnt > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageDtl-1)}" />
								<c:forEach items="${lectureClassListDtl}" var="list">
									<tr>
										<td><a href="javascript:fResumeModal('${list.name}','${list.loginID}');">${list.name}</a></td>
										<td>${list.score}</td>
										<td>${list.re}</td>
										<td>${list.status}</td>
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							<input type="hidden" id="totalCnt" value="${totalCnt}">
							
							</tbody>
						</table>
					</div>