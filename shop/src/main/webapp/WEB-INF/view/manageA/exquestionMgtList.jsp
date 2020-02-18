<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCnt">${ExquestionListTotalCnt}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">순번</th>
									<th scope="col">과정명</th>
									<th scope="col">기간</th>
								</tr>
							</thead>
							<tbody id="listExquestionLe">
								<c:if test="${ExquestionListTotalCnt eq 0 }">
									<tr>
										<td colspan="12">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${ExquestionListMgtModel}" var="list">
									<tr>
										<td>${list.row_num}</td>
										<td>
											<a class="btnType3 color1" name="listTitle">
												<span>${list.title}</span>
											</a>
											<input type="hidden" value="${list.no}">
										</td>
										<td>${list.startdate} ~ ${list.enddate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>