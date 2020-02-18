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
									<th scope="col">분류</th>
									<th scope="col">과목</th>
									<th scope="col">강사</th>
									<th scope="col">강의시작일</th>
									<th scope="col">강의종료일</th>
									<th scope="col">총평점</th>
									<th scope="col">참여인원</th>
								</tr>
							</thead>
							<tbody id="surveyMgtList">
							<c:if test="${totalCnt eq 0 }">
								<tr>
									<td colspan="7">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${listSurveyModel}" var="list">
								<tr>
									<td>${list.category}</td>
									<td><a href="javascript:fdetailModal('${list.no}')">${list.title}</a></td>
									<td>${list.name }</td>
									<td>${list.startdate }</td>
									<td>${list.enddate }</td>
									<td>${list.survey }</td>
									<td>${list.pcnt }</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>