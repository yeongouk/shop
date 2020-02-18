<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<div class="divEmpty">
						<div class="hiddenData">
							  <span id="totalCntExam">${exquestionExamListCnt}</span>
						</div>
						<table class="col">
							<thead>
								<tr>
									<th scope="col">문제번호</th>
									<th scope="col">문제</th>
									<th scope="col">정답</th>
									<th scope="col">보기①</th>
									<th scope="col">보기②</th>
									<th scope="col">보기③</th>
									<th scope="col">보기④</th>
									<th scope="col">점수</th>
								</tr>
							</thead>
							<tbody id="exquestionExamList">
								<c:if test="${exquestionExamListCnt eq 0 }">
									<tr>
										<td colspan="12">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${exquestionExamListModel}" var="list">
									<tr name="ExamTrArea">
										<td>${list.seq}</td>
										<td>
											<a class="btnType3 color1" name="ExamTitle">
												<span>${list.problem}</span>
											</a>
											<input type="hidden" value="${list.no}">
											<input type="hidden" value="${list.re}">
										</td>
										<td>${list.answer}</td>
										<td>${list.answer1}</td>
										<td>${list.answer2}</td>
										<td>${list.answer3}</td>
										<td>${list.answer4}</td>
										<td>${list.point}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>