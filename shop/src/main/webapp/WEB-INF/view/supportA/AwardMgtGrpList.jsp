<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntAwardMgt">${totalCntAwardMgt}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
										<th scope="col">순번</th>
										<th scope="col">강의번호</th>
										<th scope="col">과정명</th>
										<th scope="col">시작일</th>
										<th scope="col">마감일</th>
								</tr>
							</thead>
							<tbody id="listAwardMgt">
							<c:if test="${totalCntAwardMgt eq 0 }">
								<tr>
									<td colspan="9">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageComnGrpCod-1)}" />
							<c:forEach items="${listAwardMgtModel}" var="list">
								<tr>
									<td>${totalCntAwardMgt - nRow}</td>
									<td>${list.no}</td>
									<td><a href="javascript:fListComnDtlCod(1,'${list.no}')">${list.title}</a></td>
									<td>${list.startdate}</td>
									<td>${list.enddate}</td>
							
									<%-- <td>
										<a class="btnType3 color1" href="javascript:fPopModalComnGrpCod('${list.grp_cod}');"><span>수정</span></a>
									</td> --%>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>
							