<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<th scope="col">상태</th>
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
					<td>${list.grp_lec_category}</td>
					<td>${list.grp_lec_title}</td>
					<td>${list.grp_user_teacherName }(${list.grp_user_teacherID})</td>
					<td>${list.grp_lec_startDate}</td>
					<td>${list.grp_lec_endDate}</td>
					<td><span class="fr"><a class="btnType blue" 
							href="javascript:fSelectSurveyReg('${list.grp_lec_no}');" name="modal">
						<span>설문조사</span></a></span></td>				
				</tr>
				
				<c:set var="nRow" value="${nRow + 1}" />
			</c:forEach>
		</tbody>
	</table>
</div>