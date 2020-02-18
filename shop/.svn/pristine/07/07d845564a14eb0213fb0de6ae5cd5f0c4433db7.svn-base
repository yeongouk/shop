<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCntExamResultDtl">${totalCntExamResultDtl}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">순번</th>
									<th scope="col">학생명(ID)</th>
									<th scope="col">점수</th>
									<th scope="col">구분</th>
									<th scope="col">결과</th>
								</tr>
							</thead>
							<tbody id="listExamResultDtl">
							<c:if test="${totalCntExamResultDtl eq 0 }">
								<tr>
									<td colspan="5">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageExamResultDtl-1)}" />
							<c:forEach items="${listExamResultDtlModel}" var="list">
								<tr>
									<td>${totalCntExamResultDtl - nRow}</td>
									<td>${list.dtl_user_name}(${list.dtl_ta_loginID})</td>
									<td>${list.dtl_ta_score}</td>
									<td>${list.dtl_testType}</td>
									<td>${list.dtl_isPass}</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>