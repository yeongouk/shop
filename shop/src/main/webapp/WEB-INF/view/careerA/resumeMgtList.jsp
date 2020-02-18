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
									<th scope="col">과정명</th>
									<th scope="col">기간</th>
									<th scope="col">대상자 수 </th>
								</tr>
							</thead>
							<tbody id="resumeMgtList">
							<c:if test="${totalCnt eq 0 }">
								<tr>
									<td colspan="3">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${lectureClassList}" var="list">
								<tr>
									<td><a href="javascript:fdetailList(${list.no-2});">${list.title}</a></td>
									<td>${list.startdate} ~ ${list.enddate}</td>
									<td>${list.attendanceinfo}</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>