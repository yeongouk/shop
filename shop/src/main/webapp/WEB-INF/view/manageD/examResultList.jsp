<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntExamResult">${totalCntExamResult}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">순번</th>
									<th scope="col">과정명</th>
									<th scope="col">시험명</th>
									<th scope="col">구분</th>
									<th scope="col">대상자수</th>
									<th scope="col">응시자수</th>
									<th scope="col">미응시자수</th>
								</tr>
							</thead>
							<tbody id="listExamResult">
							<c:if test="${totalCntExamResult eq 0 }">
								<tr>
									<td colspan="7">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageExamResult-1)}" />
							<c:forEach items="${listExamResultModel}" var="list">
								<tr>
									<td>${totalCntExamResult - nRow}</td>
									<td>${list.grp_lec_title}</td>
									<td><a href="javascript:fListExamResultDtl(1, '${list.grp_test_no}', '${list.grp_test_re}')">${list.grp_test_name}</a></td>
									<td>${list.grp_testType}</td>
									<td>${list.grp_testTargetNum}</td>
									<td>${list.grp_testedNum}</td>
									<td>${list.grp_notTestedNum}</td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>
							