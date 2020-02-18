<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="divEmpty">
	<div class="hiddenData">
		<span id="totalCntExam">${totalCntExam}</span>
	</div>
	<table class="col">
		<thead>
			<tr>
				<th scope="col">강의번호</th>
				<th scope="col">시험명</th>
				<th scope="col">구분</th>
				<th scope="col">점수</th>
			</tr>
		</thead>
		<tbody id="listExam">
			<c:set var="nRow" value="${pageSize*(currentPageExam-1)}" />
			<c:forEach items="${Exam}" var="list">
				<tr>
					<td>${list.no}</td>
					<td><a href="javascript:fProblemDtl('${list.no}', '${list.re}')">${list.testname}</a></td>
					<td>${list.re}</td>
					<td>${list.point}</td>
				</tr>
				<c:set var="nRow" value="${nRow + 1}" />
			</c:forEach>
		</tbody>
	</table>
</div>
