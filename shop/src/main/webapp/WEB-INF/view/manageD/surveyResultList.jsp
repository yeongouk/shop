<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntSurveyResult">${totalCntSurveyResult}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">순번</th>
									<th scope="col">분류</th>
									<th scope="col">과목</th>
									<th scope="col">강사명(ID)</th>
									<th scope="col">강의시작일</th>
									<th scope="col">강의종료일</th>
									<th scope="col">총평점</th>
									<th scope="col">참여인원</th>
								</tr>
							</thead>
							<tbody id="listSurveyResult">
							<c:if test="${totalCntSurveyResult eq 0 }">
								<tr>
									<td colspan="8">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageSurveyResult-1)}" />
							<c:forEach items="${listSurveyResult}" var="list">
								<tr>
									<td>${totalCntSurveyResult - nRow}</td>
									<td>${list.grp_lec_category}</td>
									<td><a href="javascript:fListSurveyResultDtl(1, '${list.grp_lec_no}');">${list.grp_lec_title}</a></td>
									<td>${list.grp_user_teacherName}(${list.grp_user_teacherID})</td>
									<td>${list.grp_lec_startDate}</td>
									<td>${list.grp_lec_endDate}</td>
									<td>${list.grp_surveyAvg}</td>
									<td>${list.grp_surveyCount}</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>
							