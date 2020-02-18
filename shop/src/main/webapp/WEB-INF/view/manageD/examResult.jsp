<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>시험결과조회</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 시험결과 페이징 설정
	var pageSizeExamResult = 5;
	var pageBlockSizeExamResult = 5;
	
	// 상세 목록 페이징 설정
	var pageSizeExamResultDtl = 5;
	var pageBlockSizeExamResultDtl = 10;
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 시험결과 조회
		fListExamResult();
		
	});
	
	
	/** 시험결과 조회 */
	function fListExamResult(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeExamResult
		}
		
		var resultCallback = function(data) {
			flistExamResultResult(data, currentPage);
		};
		
		callAjax("/manageD/listExamResult.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 시험결과 조회 콜백 함수 */
	function flistExamResultResult(data, currentPage) {
		
		//alert(data);
		
		// 기존 목록 삭제
		$('#listExamResult').empty();
		//$('#listExamResult').find("tr").remove() 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listExamResult = $data.find("#listExamResult");		
		$("#listExamResult").append($listExamResult.children());
		
		// 상세목록 초기화
		var initDtlMessage = "<tr><td colspan='5'>시험명을 선택해 주세요.</td></tr>"
		$("#listExamResultDtl").empty().append(initDtlMessage);
		
		// 총 개수 추출
		var $totalCntExamResult = $data.find("#totalCntExamResult");
		var totalCntExamResult = $totalCntExamResult.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntExamResult, pageSizeExamResult, pageBlockSizeExamResult, 'fListExamResult');
		
		//alert(paginationHtml);
		$("#examResultPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageExamResult").val(currentPage);
	}
	
	
	/** 상세 목록 조회 */
	function fListExamResultDtl(currentPage, grp_test_no, grp_test_re) {
		
		currentPage = currentPage || 1;
		
		// 시험결과 정보 설정
		$("#tmpTestNo").val(grp_test_no);
		$("#tmpTestRe").val(grp_test_re);
		
		var param = {
					grp_test_no : grp_test_no
				,	grp_test_re : grp_test_re
				,	currentPage : currentPage
				,	pageSize : pageSizeExamResultDtl
		}
		
		var resultCallback = function(data) {
			flistDtlExamResultResult(data, currentPage);
		};
		
		callAjax("/manageD/listExamResultDtl.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 상세 조회 콜백 함수 */
	function flistDtlExamResultResult(data, currentPage) {
		console.log(data);
		// 기존 목록 삭제
		$('#listExamResultDtl').empty(); 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listExamResultDtl = $data.find("#listExamResultDtl");		
		$("#listExamResultDtl").append($listExamResultDtl.children());
		
		// 총 개수 추출
		var $totalCntExamResultDtl = $data.find("#totalCntExamResultDtl");
		var totalCntExamResultDtl = $totalCntExamResultDtl.text(); 
		
		// 페이지 네비게이션 생성
		var grp_test_no = $("#tmpTestNo").val();
		var grp_test_re = $("#tmpTestRe").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCntExamResultDtl, pageSizeExamResultDtl, pageBlockSizeExamResultDtl, 'fListExamResultDtl', [grp_test_no,grp_test_re]);
		$("#examResultDtlPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageExamResultDtl").val(currentPage);
	}
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageExamResult" value="1">
	<input type="hidden" id="currentPageExamResultDtl" value="1">
	<input type="hidden" id="tmpTestNo" value="">
	<input type="hidden" id="tmpTestRe" value="">
	<input type="hidden" name="action" id="action" value="">
	
	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">

						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> <a href="#"
								class="btn_nav">학습관리</a> <span class="btn_nav bold">시험결과조회</span>
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>시험결과조회</span>
						</p>
						
						<div class="divExamResultList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
								</colgroup>
	
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
								<tbody id="listExamResult"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="examResultPagination"> </div>
	
						<p class="conTitle mt50">
							<span>상세 목록</span>
						</p>
	
						<div class="divExamResultDtl">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">학생명(ID)</th>
										<th scope="col">점수</th>
										<th scope="col">구분</th>
										<th scope="col">결과</th>
									</tr>
								</thead>
								<tbody id="listExamResultDtl">
									<tr>
										<td colspan="5">시험명을 선택해 주세요.</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging_area"  id="examResultDtlPagination"> </div>

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

</form>
</body>
</html>