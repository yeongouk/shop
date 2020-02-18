<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>설문결과</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" media="screen" href="${CTX_PATH}/js/statistics/css/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${CTX_PATH}/js/statistics/css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="${CTX_PATH}/js/statistics/css/smartadmin-skins.min.css">

<script src="${CTX_PATH}/js/statistics/js/plugin/morris/raphael.min.js"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/morris/morris.min.js"></script>

<!-- Morris Chart Dependencies 
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.colorhelpers.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.canvas.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.categories.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.crosshair.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.errorbars.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.fillbetween.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.image.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.orderBar.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/jquery.flot.resize.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.selection.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.stack.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.symbol.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.threshold.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.time.min"></script>
<script src="${CTX_PATH}/js/statistics/js/plugin/flot/jquery.flot.tooltip.min"></script>
-->

<style>
	a { cursor:pointer }
	.search { height:50px; }
	.search input { width:100%; height:28px; }
</style>

<script type="text/javascript">

	// 설문결과 페이징 설정
	var pageSizeSurveyResult = 5;
	var pageBlockSizeSurveyResult = 5;
	
	// 설문결과 상세페이지 페이징 설정
	var pageSizeSurveyResultDtl = 5;
	var pageBlockSizeSurveyResultDtl = 10;
	
	/** OnLoad event */ 
	$(function() {
	
		// 설문결과 조회
		fListSurveyResult();
		
	});
	
	
	/** 설문결과 조회 */
	function fListSurveyResult(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeSurveyResult
				,	type : $("#type").val()
				,	keyword : $("#keyword").val()
		}
		
		var resultCallback = function(data) {
			flistSurveyResultResult(data, currentPage);
		};
		
		// 상세목록 초기화
		var resultCallback2 = function(data) {
			flistSatisfactionForGraphResult(data, currentPage);
		};
		
		callAjax("/manageD/listSurveyResult.do", "post", "text", true, param, resultCallback);
		callAjax("/statistics/listSatisfactionForGraph.do", "post", "json", true, param, resultCallback2);
	}
	
	
	/** 설문결과 조회 콜백 함수 */
	function flistSurveyResultResult(data, currentPage) {
		
		//alert(data);
		
		// 기존 목록 삭제
		$('#listSurveyResult').empty();
		//$('#listSurveyResult').find("tr").remove() 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listSurveyResult = $data.find("#listSurveyResult");		
		$("#listSurveyResult").append($listSurveyResult.children());
		
		// 상세목록 초기화
		var initDtlMessage = "<tr><td colspan='3'>강의를 선택해 주세요.</td></tr>";
		$("#listSurveyResultDtl").empty().append(initDtlMessage);
		
		// 총 개수 추출
		var $totalCntSurveyResult = $data.find("#totalCntSurveyResult");
		var totalCntSurveyResult = $totalCntSurveyResult.text();
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntSurveyResult, pageSizeSurveyResult, pageBlockSizeSurveyResult, 'fListSurveyResult');
		
		//alert(paginationHtml);
		$("#surveyResultPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageSurveyResult").val(currentPage);
	}

	
	/** 설문결과 상세 목록 조회 */
	function fListSurveyResultDtl(currentPage, grp_lec_no) {
		
		currentPage = currentPage || 1;
		
		// 설문결과 정보 설정
		$("#tmpGrp_lec_no").val(grp_lec_no);
		
		var param = {
					grp_lec_no : grp_lec_no
				,	currentPage : currentPage
				,	pageSize : pageSizeSurveyResultDtl
		}
		
		var resultCallback = function(data) {
			flistDtlSurveyResultResult(data, currentPage);
		};
		
		callAjax("/manageD/listSurveyResultDtl.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 상세코드 조회 콜백 함수 */
	function flistDtlSurveyResultResult(data, currentPage) {
		
		// 기존 목록 삭제
		$('#listSurveyResultDtl').empty(); 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listSurveyResultDtl = $data.find("#listSurveyResultDtl");		
		$("#listSurveyResultDtl").append($listSurveyResultDtl.children());
		
		// 총 개수 추출
		var $totalCntSurveyResultDtl = $data.find("#totalCntSurveyResultDtl");
		var totalCntSurveyResultDtl = $totalCntSurveyResultDtl.text();
		
		// 페이지 네비게이션 생성
		var grp_lec_no = $("#tmpGrp_lec_no").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCntSurveyResultDtl, pageSizeSurveyResultDtl, pageBlockSizeSurveyResultDtl, 'fListSurveyResultDtl', [grp_lec_no]);
		$("#surveyResultDtlPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageSurveyResultDtl").val(currentPage);
	}
	
	function flistSatisfactionForGraphResult(data) {

		var object = data.satisfactionModelForGraph
		
		if(object.length == 0) {
			
			alert("데이터가 없습니다.");
			$("#wid-id-9").hide();
			
			var str = "<table class='col' id='added'><tr><td>데이터가 존재하지 않습니다.</td></tr></table>";
			$("#wid-id-9").after(str);
			
		}else {
			
			$("#wid-id-9").show();
			$("#added").remove();
			
			var day_data = [];
			
			$.each(object, function(idx,value){
				day_data.push(
								{
									"startdate" : value.grp_lec_startDate,
									"targetNum" : value.grp_surveyAvg,									
								}
							)
			});
			
			console.log(day_data);
			
			Morris.Line({
				element : 'nogrid-graph',
				grid : false,
				data : day_data,
				xkey : 'startdate',
				ykeys : ['targetNum'],
				labels : ['평점']
			});
			
		}
		
	}
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageSurveyResult" value="1">
	<input type="hidden" id="currentPageSurveyResultDtl" value="1">
	<input type="hidden" id="tmpGrp_lec_no" value="">
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
								class="btn_nav">통계</a> <span class="btn_nav bold">만족도
								관리</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>만족도</span>
						</p>
						
						<!-- 검색 -->
						<table>
							<caption>caption</caption>
							<colgroup>
								<col width="200px">
								<col width="300px">
								<col width="420px">
								<col width="100px">
							</colgroup>
							<tr class="search">
								<th scope="row">
									<SELECT id="type">
										<OPTION value="teacherName">강사명</OPTION>
										<OPTION value="title">과목</OPTION>
									</SELECT>
								</th>
								<td class="keword"><input type="text" name="keyword" id="keyword"/></td>
								<td></td>
								<td><a class="btnType blue searchBtn" href="javascript:fListSurveyResult();" name="modal"><span>검색</span></a>
							</tr>
							
						</table>
						
						<div class="divSurveyResultList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="10%">
									<col width="10%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">분류</th>
										<th scope="col">과목</th>
										<th scope="col">강사명(ID)</th>
										<th scope="col">강의시작일</th>
										<th scope="col">강의종료일</th>
										<th scope="col">총평점</th>
										<th scope="col">참여인원</th>
									</tr>
								</thead>
								<tbody id="listSurveyResult"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="surveyResultPagination"> </div>
	
						<p class="conTitle mt50">
							<span>만족도 상세정보</span>
						</p>
	
						<div class="divSurveyResultList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="20%">
									<col width="40%">
									<col width="40%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">학생명(ID)</th>
										<th scope="col">평점</th>
									</tr>
								</thead>
								<tbody id="listSurveyResultDtl">
									<tr>
										<td colspan="3">강의를 선택해 주세요.</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging_area"  id="surveyResultDtlPagination"> </div>

						<p class="conTitle mt50">
							<span>날짜 별 추이(개강일 기준)</span>
						</p>



						<div class="jarviswidget" id="wid-id-9" data-widget-editbutton="false">
								<!-- widget options:
								usage: <div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false">

								data-widget-colorbutton="false"
								data-widget-editbutton="false"
								data-widget-togglebutton="false"
								data-widget-deletebutton="false"
								data-widget-fullscreenbutton="false"
								data-widget-custombutton="false"
								data-widget-collapsed="true"
								data-widget-sortable="false"

								-->

								<!-- widget div-->
								<div>

									<!-- widget edit box -->
									<div class="jarviswidget-editbox">
										<!-- This area used as dropdown edit box -->

									</div>
									<!-- end widget edit box -->

									<!-- widget content -->
									<div class="widget-body no-padding">

										<div id="nogrid-graph" class="chart no-padding"></div>

									</div>
									<!-- end widget content -->

								</div>
								<!-- end widget div -->

							</div>



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