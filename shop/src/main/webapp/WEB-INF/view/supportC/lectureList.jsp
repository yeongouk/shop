<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntLecture">${totalCntLecture}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
										<th scope="col">강좌명</th>
										<th scope="col">수강인원(정원)</th>
										<th scope="col">강의 시작 일</th>
										<th scope="col">강의 종강 일</th>
										<th scope="col">교수님 성함</th>
								</tr>
							</thead>
							<tbody id="listLecture">
							<c:if test="${totalCntLecture eq 0 }">
								<tr>
									<td colspan="9">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageLecture-1)}" />
							<c:forEach items="${listLectureModel}" var="list">
								<tr>
									<td>${totalCntLecture - nRow}</td>
									<td><a href="javascript:fPopModalLectureDtl('${list.no}', '${list.title}', '${list.name}', '${list.aply}', '${list.pcnt}')">${list.title}</a></td>
									<td>${list.aply}(${list.pcnt})</td>
									<td>${list.startdate}</td>
									<td>${list.enddate}</td>
									<td>${list.name}</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>
							