<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="cutil" uri="tld/CommonUtil.tld"%>

	
			<!-- 갯수가 0인 경우  -->
		<c:if test="${totalCnt eq 0 }">
		
			<tr>
				<td colspan="6">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
	
	
		<!-- 갯수가 있는 경우  -->
		<c:if test="${totalCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
			<c:forEach items="${SelectHomeworkList}" var="h">
				<tr>
				    <td>${nRow + 1}</td>
					<td>${h.title}(${h.no})</td>
					<td>${h.seq}</td>
					<td><a href="javascript:fSelectHomeworkDtl(${h.no},${h.seq});"><span>${h.nt_title}</span></a></td>					
					<td>${h.reg_date}</td>
					<td>${h.name}</td>
					<td><p><a href="javascript:fDownloadHomeFile(${h.no},${h.seq});">${h.filename}</a></p></td>
				</tr>
				<c:set var="nRow" value="${nRow + 1}" />
			</c:forEach>
		</c:if>
		
		
		<input type="hidden" id="totalCnt" value="${totalCnt}">
		<!-- 이거 중간에 있으면 table 안먹힘  -->