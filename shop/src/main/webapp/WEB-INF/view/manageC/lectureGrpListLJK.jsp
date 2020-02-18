<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntLectureGrp">${totalCntLectureGrp}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
										<th scope="col">분류</th>
										<th scope="col">과목</th>
										<th scope="col">강사명(ID)</th>									
										<th scope="col">강의시작일</th>
										<th scope="col">강의종료일</th>
										<th scope="col">수강인원</th>
										<th scope="col">정원</th>
										<th scope="col">진도</th>
										<th scope="col">출석</th>
								</tr>
							</thead>
							<tbody id="listLectureGrp">
							<c:if test="${totalCntLectureGrp eq 0 }">
								<tr>
									<td colspan="9">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageLectureGrp-1)}" />
							<c:forEach items="${listLectureGrpModel}" var="list">
								<tr>
									<td><a href="javascript:fPopModalLectureGrp(${list.no});">${list.title}</a></td>
									<td>${list.name}</td>
									<td>${list.startdate}</td>
									<td>${list.enddate}</td>
									<td>${list.room}</td>
									<td>${list.attend}</td>
									<td>${list.lateness}%</td>
									<td>${list.absent}%</td>
									<td>${list.proceed}%</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>
							