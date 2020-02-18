<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCntSurveyResultDtl">${totalCntSurveyResultDtl}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">순번</th>
									<th scope="col">학생명(학생ID)</th>
									<th scope="col">평점</th>
								</tr>
							</thead>
							<tbody id="listSurveyResultDtl">
							<c:if test="${totalCntSurveyResultDtl eq 0 }">
								<tr>
									<td colspan="3">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageSurveyResultDtl-1)}" />
							<c:forEach items="${listSurveyResultDtlModel}" var="list">
								<tr>
									<td>${totalCntSurveyResultDtl - nRow}</td>
									<td>${list.dtl_user_name}(${list.dtl_survey_loginID})</td>
									<td>${list.dtl_survey_survey}</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>