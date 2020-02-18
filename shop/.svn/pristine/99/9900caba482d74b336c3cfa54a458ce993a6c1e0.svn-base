<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntComnGrpCod">${totalCntComnGrpCod}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
										<th scope="col">순번</th>
										<th scope="col">강의번호</th>
										<th scope="col">강의명</th>
										<th scope="col">담당교수</th>
										<th scope="col">강의실</th>
										<th scope="col">수강인원</th>									
										<th scope="col">비고</th>
								</tr>
							</thead>
							<tbody id="listLectureMgt">
							<c:if test="${totalCntComnGrpCod eq 0 }">
								<tr>
									<td colspan="9">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${listLectureMgtModel}" var="list">
								<tr>
									<td>${totalCntComnGrpCod - nRow}</td>
									<td><a href="javascript:fListComnDtlCod(1, '${list.no}', '${list.title}')">${list.no}</a></td>
									<td>${list.title}</td>
									<td>${list.loginID}</td>
									<td>${list.no}</td>
									<td>${list.pcnt}</td>
									<td>${list.note}</td>

								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>
							