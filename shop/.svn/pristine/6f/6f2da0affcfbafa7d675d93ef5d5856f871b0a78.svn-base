<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							<span id="totalCntExsubject">${totalCntExsubject}</span>
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
							<tbody id="listExsubjectMgt">
							<c:if test="${totalCntExsubject eq 0 }">
								<tr>
									<td colspan="9">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageExsubject-1)}" />
							<c:forEach items="${listExsubjectMgtModel}" var="list">
								<tr>
									<td>${totalCntExsubject - nRow}</td>
									<td>${list.title}</td>															
									<td><a href="javascript:fListComnDtlCod(1, '${list.no}',)">${list.testname}</a></td>								
									<td>${list.re}</td>
									<td>${list.pcnt}</td>
									<td>${list.dmd}</td>																
									<td>${list.al}</td>																
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>
							