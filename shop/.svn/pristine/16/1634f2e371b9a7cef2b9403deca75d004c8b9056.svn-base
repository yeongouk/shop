<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntFailedNum">${totalCntFailedNum}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">순번</th>
									<th scope="col">강의번호</th>
									<th scope="col">과정명</th>
									<th scope="col">기간</th>
									<th scope="col">대상자수</th>
									<th scope="col">과락수</th>
								</tr>
							</thead>
							<tbody id="listFailedNum">
							<c:if test="${totalCntFailedNum eq 0 }">
								<tr>
									<td colspan="6">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageFailedNum-1)}" />
							<c:forEach items="${listFailedNumModel}" var="list">
								<tr>
									<td>${totalCntFailedNum - nRow}</td>
									<td>${list.no}</td>
									<td>${list.title}</td>
									<td>${list.startdate} ~ ${list.enddate}</td>
									<td>${list.targetNum}</td>
									<td>${list.failedNum}</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
						
					</div>
							