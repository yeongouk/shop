<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCntComnDtlCod">${totalCntComnDtlCod}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									    <th scope="col">순번</th>
										<th scope="col">강의번호</th>
										<th scope="col">학생명</th>
										<th scope="col">강의명</th>
										<th scope="col">출석율</th>
										<th scope="col">개강일</th>
										<th scope="col">종강일</th>
										<th scope="col">휴강신청</th>
								</tr>
							</thead>
							<tbody id="listLectureMgtDtl">
							<c:if test="${totalCntComnDtlCod eq 0 }">
								<tr>
								<!-- 	<td colspan="12">데이터가 존재하지 않습니다.</td> -->
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageComnDtlCod-1)}" />
							<c:forEach items="${listLectureMgtDtlModel}" var="list">
								<tr>
									<td>${totalCntComnDtlCod - nRow}</td>
									<td>${list.no}</td>
									<td>${list.loginID}</td>
									<td>${list.title}</td>
									<td>${list.attend}</td>
									<td>${list.startdate}</td>
									<td>${list.enddate}</td>
									<td><a class="btnType3 color1" href="javascript:fUpdateAward('${list.no}','${list.loginID}');"><span>휴강신청</span></a></td>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>