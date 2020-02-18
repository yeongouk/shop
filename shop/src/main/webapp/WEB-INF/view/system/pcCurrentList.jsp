<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
					<div class="hiddenData">
							<span id="totalCnt">${totalCnt}</span>
						</div> 
						<table class="col">
							<thead>
								<tr>
									<th scope="col">pc 번호</th>
									<th scope="col">사용자 ID</th>
									<th scope="col">사용 여부</th>
									<th scope="col">로그인 시간</th>
									<th scope="col">로그아웃 시간</th>
									<th scope="col">사용 시간</th>
									<th scope="col">이용 금액</th>
									<th scope="col">배정/결제</th>
								</tr>
							</thead>
							<tbody id="pcCurrentList">
							<c:if test="${totalCnt eq 0 }">
								<tr>
									<td colspan="9">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if> 
							<input type="hidden" id="totalCnt1" value="${totalCnt}">
		<!-- 이거 중간에 있으면 table 안먹힘  -->
							<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
							<c:forEach items="${pcCurrentListModel}" var="list">
								<tr>
									<td>${list.pc_no}</td>
									<td>${list.pc_name}</a></td>
									<td>${list.useYn}</td>
									<td>${list.login_time}</td>
									<td>${list.logout_time}</td>
									<td>${list.use_time}</td>
									<td>${list.amt}</td>
									<td>
										<a class="btnType3 color1" href="javascript:fPopModalPcCurrent('${list.pc_no}','${list.useYn}');"><span>자리 배정 / 결제</span></a>
										
									</td>
									
								</tr>
								<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
							</tbody>
						</table>
					</div>
					

							