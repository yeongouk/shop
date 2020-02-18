<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id=totalCntAwardMgtDtlCod2>${totalCntAwardMgtDtlCod2}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									    <th scope="col">순번</th>
										<th scope="col">학생명</th>
										<th scope="col">상장번호</th>
										<th scope="col">수상명</th>
										<th scope="col">수상일자</th>
								
								</tr>
							</thead>
							<tbody id="listAwardMgtDtl2">
							<c:if test="${totalCntAwardMgtDtlCod2 eq 0 }">
								<tr>
									<td colspan="12">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:set var="nRow" value="${pageSize*(currentPageComnDtlCod-1)}" />
							<c:forEach items="${listAwardMgtDtlModel2}" var="list">
								<tr>
									<td>${totalCntAwardMgtDtlCod2 - nRow}</td>
									<td>${list.loginID}</td>
									<td><a href="javascript:fPopModalComnDtlCod('${list.seq}')">${list.seq}</a></td>									
									<td>${list.certno}</td>
									<td>${list.reg_date}</td>
									
									<%-- <td>${list.loginID}</td> --%>
									
						            <%-- <td><a class="btnType3 color1" href="javascript:fPopModalComnDtlCod('${list.grp_cod}','${list.dtl_cod}');"><span>수정</span></a></td> --%>
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>