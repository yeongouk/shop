<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>과락인원</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<!-- nogrid-graph 세팅 시작 -->

	<!-- Basic Styles -->
	<!-- 
	<link rel="stylesheet" type="text/css" media="screen" href="${CTX_PATH}/js/statistics/css/bootstrap.min.css"> 
	이거 적용하면 그래프 width는 제대로 출력되지만 기존 메뉴 css가 틀어진다.  
	-->
	
	<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
	<link rel="stylesheet" type="text/css" media="screen" href="${CTX_PATH}/js/statistics/css/smartadmin-production-plugins.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="${CTX_PATH}/js/statistics/css/smartadmin-production.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="${CTX_PATH}/js/statistics/css/smartadmin-skins.min.css">
	
	<!-- Morris Chart Dependencies -->
	<script src="${CTX_PATH}/js/statistics/js/plugin/morris/raphael.min.js"></script>
	<script src="${CTX_PATH}/js/statistics/js/plugin/morris/morris.min.js"></script>
	
<!-- nogrid-graph 세팅 끝 -->

<style>
	a { cursor:pointer; }
	.search { height:50px; }
</style>

<script type="text/javascript">

	// 과락인원 페이징 설정
	var pageSizeFailedNum = 5;
	var pageBlockSizeFailedNum = 5;
	
	/** OnLoad event */ 
	$(function() {
	
		// 과락인원 조회
		fListFailedNum();
		
	});

	
	/** 과락인원 조회 */
	function fListFailedNum(currentPage) {
		
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		
		if (startDate != "" && endDate != "") {
			if (startDate > endDate) alert("종료일이 시작일보다 앞선 날짜입니다. 확인해 주세요.");
		}
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeFailedNum
				,	startDate : startDate
				,	endDate : endDate
		}
		
		var resultCallback = function(data) {
			flistFailedNumResult(data, currentPage);
		};
		
		var resultCallback2 = function(data) {
			flistFailedNumForGraphResult(data, currentPage);
		};
		
		callAjax("/statistics/listfailedNum.do", "post", "text", true, param, resultCallback);
		callAjax("/statistics/listFailedNumForGraph.do", "post", "json", true, param, resultCallback2);
	}
	
	
	/** 과락인원 조회 콜백 함수 */
	function flistFailedNumResult(data, currentPage) {
		
		//alert(data);
		
		// 기존 목록 삭제
		$('#listFailedNum').empty();
		//$('#listFailedNum').find("tr").remove() 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listFailedNum = $data.find("#listFailedNum");		
		$("#listFailedNum").append($listFailedNum.children());
		
		// 총 개수 추출
		var $totalCntFailedNum = $data.find("#totalCntFailedNum");
		var totalCntFailedNum = $totalCntFailedNum.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntFailedNum, pageSizeFailedNum, pageBlockSizeFailedNum, 'fListFailedNum');
		
		//alert(paginationHtml);
		$("#failedNumPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageFailedNum").val(currentPage);
	}
	
	
	/** 과락인원 전체조회(그래프 출력용) 콜백 함수*/
	function flistFailedNumForGraphResult(data) {

		$("#nogrid-graph").empty();
		$("#added").remove();
		
		var object = data.failedNumModelForGraph
		
		if(object.length == 0) {
			
			alert("데이터가 없습니다.");
			$("#wid-id-9").hide();
			
			var str = "<table class='col' id='added'><tr><td>데이터가 존재하지 않습니다.</td></tr></table>";
			$("#wid-id-9").after(str);
			
		}else {
			
			$("#wid-id-9").show();
			
			var day_data = [];
			
			$.each(object, function(idx,value){
				day_data.push(
								{
									"startdate" : value.startdate,
									"targetNum" : value.targetNum,
									"failedNum" : value.failedNum
								}
							)
			});
			
			Morris.Line({
				element : 'nogrid-graph',
				grid : false,
				data : day_data,
				xkey : 'startdate',
				ykeys : ['targetNum', 'failedNum'],
				labels : ['대상자', '과락수']
			});
			
		}
		
	}
	
	// 새로고침 버튼
	function fListFailedNumInit() {
		
		$("#startDate").val("");
		$("#endDate").val("");
		
		fListFailedNum();
		
	}
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageFailedNum" value="1">
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
								class="btn_nav">통계</a> <span class="btn_nav bold">과락인원</span> <a href="javascript:fListFailedNumInit();" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>과락인원</span>
						</p>
						
						<!-- 검색 -->
						<table>
							<caption>caption</caption>
							<colgroup>
								<col width="80px">
								<col width="540px">
								<col width="300px">
								<col width="100px">
							</colgroup>
							<tr class="search">
								<td>개설기간 :</td>
								<td><input type="date" name="startDate" id="startDate">&nbsp;&nbsp;~&nbsp;&nbsp;<input type="date" name="endDate" id="endDate"></td>
								<td></td>
								<td><a class="btnType blue searchBtn" href="javascript:fListFailedNum();" name="modal"><span>검색</span></a></td>
							</tr>
						</table>
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="15%">
									<col width="15%">
									<col width="20%">
									<col width="20%">
									<col width="15%">
									<col width="15%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">강의번호</th>
										<th scope="col">과정명</th>
										<th scope="col">기간</th>
										<th scope="col">대상자수</th>
										<th scope="col">과락수</th>
									</tr>
								</thead>
								<tbody id="listFailedNum"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="failedNumPagination"> </div>
	
						<!-- 그래프 영역 -->
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
							<!-- end widget -->
						

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