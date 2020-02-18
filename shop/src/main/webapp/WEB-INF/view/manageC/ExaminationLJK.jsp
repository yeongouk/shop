<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>JobKorea</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 강의목록 페이징 설정
	var pageSizeExam = 5;
	var pageBlockSizeLectureExam = 5;
	var totproblencnt = 0;
	
$(document).ready(function() {
	$('#btnSaveExam').click(function() {
		
		var studentId = $("#loginID").val(); 		
		var wno = $("#no").val();
		var type = $("#re").val();
		
		var i = 1;
		var loop=1;
		var answer = "";
		
		for(loop=1;loop<=totproblencnt;loop++) {
			var temp = $('input[name=p_' +loop+ ']:radio:checked').val();
			var prono = loop;
			
			answer = answer + temp + ":"; 
		}

		$.ajax({
			url : '/manageC/testReg.do',
			type : 'POST',
			dataType : 'json',
			data : {
				no : wno,
				answer : answer, 
				seq : prono,
				re : type,
				studentId : studentId
			},
			
			async : false,
			success : function(data) {
				resultRegCallback();
			},
			error : function(xhr, status, e) {
				console.log("error", e);
				console.log("status", status);
			}
		});	
		
	});
});
	
	/** OnLoad event */ 
	$(function() {
		// 그룹코드 조회
		fListExam();
	});
	
	/** 강의목록 조회 */
	function fListExam(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeExam
		}
		
		var resultCallback = function(data) {
			flistExamResult(data, currentPage);
		};
		
		callAjax("/manageC/listExaminationLJK.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 강의목록 조회 콜백 함수 */
	function flistExamResult(data, currentPage) {
		
		//alert(data);
		
		// 기존 목록 삭제
		$('#listExam').empty();
		//$('#listExam').find("tr").remove() 
		
		var $data = $($(data).html());

		// 신규 목록 생성
		var $listExam = $data.find("#listExam");		
		$("#listExam").append($listExam.children());
		
		// 총 개수 추출
		var $totalCntExam = $data.find("#totalCntExam");
		var totalCntExam = $totalCntExam.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntExam, pageSizeExam, pageBlockSizeLectureExam, 'flistExam');
		
		//alert(paginationHtml);
		$("#ExamPaginnation").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageExam").val(currentPage);
	}
	
	function fProblemDtl(no, re) {
		fSelectProblemDtl(no, re);
	}
	
	function fSelectProblemDtl(no, re) {		
		
		$("#no").val(no);
		$("#re").val(re);
		
		var param = {			
				no : no
			,   re : re
			,   loginID : $("#loginID").val()
		};
		
		var problemResultCallback = function(data) {
			fSelectProblemResult(data);
		};
		
		callAjax("/manageC/selectproblem.do", "post", "json", true, param, problemResultCallback);
	}
	
	function fSelectProblemResult(data) {		
		
		//console.log("111111 : " + JSON.stringify(data));
		
		//console.log("222222 : " + JSON.stringify(data.Problem));		
		
		var problemdata = data.Problem;
		var problemhtml = "";
		
		var resno = "";
		totproblencnt = 0;
		var pno = 1;
		var exist = false;
		
		$.each(problemdata, function(i, item) {
			totproblencnt++;			
						
			$("#point").val(item.score);
			$("#result").val(item.result);
			
			console.log(i + "   no : " + item.no);
			console.log(i + "   problem : " + item.problem);
			console.log(i + "   answer : " + item.answer);
			console.log(i + "   answer1 : " + item.answer1);
			
			problemhtml += totproblencnt + ".  " + item.problem + "<br>";		
			console.log(problemhtml);
			
			resno = "p_"+pno;		
			
			
			if(item.score > 0 && item.answer == 1)
			{
				exist = true;
				problemhtml += "&nbsp&nbsp&nbsp<input type='radio' id="+resno+" name="+ resno +" value='1' checked='checked'>"+item.answer1+"&nbsp&nbsp&nbsp";
			} else {
				problemhtml += "&nbsp&nbsp&nbsp<input type='radio' id="+resno+" name="+ resno +" value='1'>"+item.answer1+"&nbsp&nbsp&nbsp";
			} 
			
			if(item.score > 0 && item.answer == 2)
			{
				problemhtml += "<input type='radio' id="+resno+" name="+ resno +" value='2' checked='checked'>"+item.answer2+"&nbsp&nbsp&nbsp";
			} else {
				problemhtml += "<input type='radio' id="+resno+" name="+ resno +" value='2'>"+item.answer2+"&nbsp&nbsp&nbsp";
			} 			
			
			if(item.score > 0 && item.answer == 3)
			{
				problemhtml += "<input type='radio' id="+resno+" name="+ resno +" value='3' checked='checked'>"+item.answer3+"&nbsp&nbsp&nbsp";
			} else {
				problemhtml += "<input type='radio' id="+resno+" name="+ resno +" value='3'>"+item.answer3+"&nbsp&nbsp&nbsp";
			} 
			
			if(item.score > 0 && item.answer == 4)
			{
				problemhtml += "<input type='radio' id="+resno+" name="+ resno +" value='4' checked='checked'>"+item.answer4+"&nbsp&nbsp&nbsp";		
			} else {
				problemhtml += "<input type='radio' id="+resno+" name="+ resno +" value='4'>"+item.answer4+"&nbsp&nbsp&nbsp";
								
			}				
			
			problemhtml += "<br><br>";	
			
			pno++;
			
		});	
		
		if(exist) {
			$('#btnSaveExam').remove();
		}
		
		/* if(item.score > 0 && item.answer == 2) {
			$('#btnSaveExam').remove();
		}
		if(item.score > 0 && item.answer == 3) {
			$('#btnSaveExam').remove();
		}
		if(item.score > 0 && item.answer == 4) {
			$('#btnSaveExam').remove();
		} */
		
		console.log("333333 : " + problemhtml);
		$("#totproblencnt").val(totproblencnt);
		
		$("#problemlist").empty().append( problemhtml );	
		
		
		gfModalPop("#layer2");		
		
	}

</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageExam" value="1">
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" name="DtlNo" id="DtlNo" value="">
	<input type="hidden" id="loginID" value="${loginID}">
	<input type="hidden" id="no" value="">
	<input type="hidden" id="re" value="">
	<input type="hidden" name="totproblencnt" id="totproblencnt" value="">
	
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
								class="btn_nav">학습관리</a> <span class="btn_nav bold">시험 응시</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>시험 목록</span>
						</p>
						
						<div class="divExamList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="25%">
									<col width="50%">
									<col width="15%">
									<col width="10%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">강의번호</th>
										<th scope="col">시험명</th>
										<th scope="col">구분</th>
										<th scope="col">점수</th>
									</tr>
								</thead>
								<tbody id="listExam"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="ExamPaginnation"> </div>
	

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>


	<div id="layer2" class="layerPop layerType2" style="overflow:auto; width: 600px;">
		<dl>
			<dt>
				<strong>시험응시</strong>
			</dt>
			<dd class="content">				
				
				<span>점수</span>&nbsp;&nbsp;<input type="text" id="point" name="point" style="width:75px" disabled>&nbsp;
				<span>상태</span>&nbsp;&nbsp;<input type="text" id="result" name="result" style="width:75px" disabled>
				<br><br>
				
				<div class="divExamList"  id="problemlist" style="font-weight: bold ;"> </div>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveExam" name="btn"><span>제출</span></a> 
					<a href="" class="btnType gray" id="btnCloseDtlCod" name="btn"><span>닫기</span></a>
				</div>
			</dd>
		</dl>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>