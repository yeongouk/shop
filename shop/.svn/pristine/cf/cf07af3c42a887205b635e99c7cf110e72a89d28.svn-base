<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCntTest">${exquestionTestListCnt}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">과정명</th>
									<th scope="col">시험명</th>
									<th scope="col">구분</th>
									<th scope="col">대상자수</th>
								</tr>
							</thead>
							<tbody id="exquestionTestList">
								<c:if test="${exquestionTestListCnt eq 0 }">
									<tr>
										<td colspan="12">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${exquestionTestModel}" var="list">
									<tr>
										<td>${list.title}</td>
										<td>
											<a class="btnType3 color1 bTestName" name="bTestName">
												<span>${list.testname}</span>
											</a>
											<input type="hidden" value="${list.no}">
											<input type="hidden" value="${list.reCode}">
											<input type="hidden" value="${list.testname}">
										</td>
										<td>${list.re}</td>
										<c:set var="reCode" value="${list.reCode}" />
										<c:choose>
											<c:when test="${ (list.mainCount eq 0) && (list.reCount eq 0)}">
										        <td>${list.mainCount}</td>
										    </c:when>
										    <c:when test="${ (reCode eq 'main') && (list.reCount eq 0)}">
										        <td>${list.mainCount}</td>
										    </c:when>
										    <c:when test="${ (reCode eq 're') && (list.mainCount eq 0)}">
										        <td>${list.reCount}</td>
										    </c:when>
										    <c:otherwise>
										        <a>0</a>
										    </c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>