<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCntAdviceMgtDtlCod">${totalCntAdviceMgtDtlCod}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									    <th scope="col">순번</th>
										<th scope="col">강의번호</th>
										<th scope="col">학생명</th>
										<th scope="col">시험점수</th>
								
								</tr>
							</thead>
							<tbody id="listAdviceMgtDtl">
							<c:if test="${totalCntAdviceMgtDtlCod eq 0 }">
								<tr>
									<td colspan="12">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageComnDtlCod-1)}" />
							<c:forEach items="${listAdviceMgtDtlModel}" var="list">
								<tr>
									<td>${totalCntAdviceMgtDtlCod - nRow}</td>
									<td>${list.no}</td>
									<td><a href="javascript:fListComnDtlCod2(1,'${list.loginID}')">${list.loginID}</a></td>
									<%-- <td>${list.loginID}</td> --%>
									<td>${list.score}</td>
						            <%-- <td><a class="btnType3 color1" href="javascript:fPopModalComnDtlCod('${list.grp_cod}','${list.dtl_cod}');"><span>수정</span></a></td> --%>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>