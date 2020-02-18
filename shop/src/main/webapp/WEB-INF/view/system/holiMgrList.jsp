<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
				<div id="showList">
					<c:forEach items="${listModel}" var="list" varStatus="status">
						<table class="col hover" style="float:left;width:300px;margin-left: 8px;"><!-- table = hover : 오버시 라인색 추가 -->
							<caption>caption</caption>
							<colgroup>
								<col width="123px">
								<col width="*">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">날짜</th>
									<th scope="col">공휴일 명</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listModel[status.index]}" var="i">
									<tr>
										 <c:choose>
											<c:when test="${i.dow eq '1'}">
												<td><font color="red">${i.cal_dt} (일)</font></td>
											</c:when>
											<c:when test="${i.dow eq '2'}">
												<td>${i.cal_dt} (월)</td>
											</c:when>
											<c:when test="${i.dow eq '3'}">
												<td>${i.cal_dt} (화)</td>
											</c:when>
											<c:when test="${i.dow eq '4'}">
												<td>${i.cal_dt} (수)</td>
											</c:when>
											<c:when test="${i.dow eq '5'}">
												<td>${i.cal_dt} (목)</td>
											</c:when>
											<c:when test="${i.dow eq '6'}">
												<td>${i.cal_dt} (금)</td>
											</c:when>
											<c:otherwise>
												<td><font color="blue">${i.cal_dt} (토)</font></td>
											</c:otherwise>
										</c:choose>
										<td>
											<input type="text" class="inputTxt w100" id="${i.cal_dt}" name="sltDt" value="${i.holi_nm}"/>
											<a class="btnType3" href="javascript:fSaveData('${i.cal_dt}');" style="color: #fff;min-width:0px;"><span>저장</span></a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:forEach>
				</div>