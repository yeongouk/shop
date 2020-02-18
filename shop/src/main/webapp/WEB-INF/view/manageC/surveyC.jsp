<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>수강목록/진도</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<style>
	a { cursor:pointer; }
	.search th, .search td { width:100px; height:50px; }
	.search select { width:70px; }
	.search .keyword { width:230px; }
	.search input { width:180px; height:30px; }
	.search .title { width:50px; }
	.search .inputDate { width:550px; }
</style>

<script type="text/javascript">

	// 수강목록/진도 페이징 설정
	var pageSizeLectureGrp = 5;
	var pageBlockSizeLectureGrp = 5;
	
	
	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSaveSurvey' :
					fSaveSurvey();
					break;
				
				case 'btnCloseDtlCod' :
					gfCloseModal();
					break;
			}
		});
	}
	
	/** OnLoad event */ 
	$(function() {
	
		// 수강목록/진도 조회
		fListLectureGrp();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	
	
	/** 수강목록/진도 폼 초기화 */
	function fInitFormGrp(object) {
		
		$("#dtl_lec_no").val(object.dtl_lec_no);
		
		$("#title").val(object.dtl_lec_title);
		$("#title").attr("readonly", true);
		$("#title").css("background", "#F5F5F5");
		$("#teacherLoginID").val(object.dtl_user_teacherID);
		$("#teacherLoginID").attr("readonly", true);
		$("#teacherLoginID").css("background", "#F5F5F5");
		$("#input:radio[name=dtl_use_poa]:input[value='1']").attr("checked", true);
		
	}
	
	
	/** 수강목록/진도 조회 */
	function fListLectureGrp(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeLectureGrp
				,	type : $("#type").val()
				,	keyword : $("#keyword").val()
				,	startDate : $("#startDate").val()
				,	endDate : $("#endDate").val()
		}
		
		var resultCallback = function(data) {
			flistLectureGrpResult(data, currentPage);
		};
		
		callAjax("/manageC/listLectureLJKGrp.do", "post", "text", true, param, resultCallback);
		
	}
	
	
	/** 수강목록/진도 조회 콜백 함수 */
	function flistLectureGrpResult(data, currentPage) {
		
		// 기존 목록 삭제
		$('#listLectureGrp').empty();
		//$('#listLectureGrp').find("tr").remove() 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listLectureGrp = $data.find("#listLectureGrp");		
		$("#listLectureGrp").append($listLectureGrp.children());
		
		// 총 개수 추출
		var $totalCntLectureGrp = $data.find("#totalCntLectureGrp");
		var totalCntLectureGrp = $totalCntLectureGrp.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntLectureGrp, pageSizeLectureGrp, pageBlockSizeLectureGrp, 'fListLectureGrp');
		
		$("#lectureGrpPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageLectureGrp").val(currentPage);
	}
	
	
	function fSelectSurveyReg(grp_lec_no) {
		
		var param = { grp_lec_no : grp_lec_no };
		
		var resultCallback = function(data) {
			fSelectSurveyRegResult(data)
		}
		
		
		callAjax("/manageC/selectSurveyReg.do", "post", "json", true, param, resultCallback);
		
	}
	
	function fSelectSurveyRegResult(data) {
		
		var object = data.selectSurveyRegModel;
		
		if (object.dtl_sur_survey == 0) {
			
			gfModalPop("#layer1");
			fInitFormGrp(object);
			
		} else {
			
			alert("이미 설문에 참여하셨습니다.");
			
		}
			
	}
	
	function fSaveSurvey() {
		
		var resultCallback = function(data) {
			fSaveSurveyResult(data);
		};
		
		callAjax("/manageC/saveSurveyReg.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
		
	}
	
	function fSaveSurveyResult(data) {
		
		alert(data.resultMsg);
		
		gfCloseModal();
		
		fListLectureGrp();
		
	}
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageLectureGrp" value="1">
	<input type="hidden" id="currentPageLectureDtl" value="1">
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
	<input type="hidden" id="dtl_lec_no" name="dtl_lec_no" value="">
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
								class="btn_nav">학습 관리</a> <span class="btn_nav bold">설문조사</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>설문조사</span>
						</p>
						
						
						<div class="divLectureGrpList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="15%">
									<col width="15%">
									<col width="10%">									
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">분류</th>
										<th scope="col">과목</th>
										<th scope="col">강사명(ID)</th>
										<th scope="col">강의시작일</th>
										<th scope="col">강의종료일</th>
										<th scope="col">상태</th>
										
									</tr>
								</thead>
								<tbody id="listLectureGrp"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="lectureGrpPagination"> </div>
	
					</div> <!--// content -->

					<h3 class="hidden">푸터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 모달팝업 -->
	<div id="layer1" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>설문조사</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">강의 명 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="title" name="title" /></td>
							<th scope="row">강사 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="teacherLoginID" name="teacherLoginID" /></td>
						</tr>
						<tr>
							<th scope="row">질문</th>
							<td colspan="6">
								<input type="radio" id="survey"
								name="dtl_use_poa" value="1" /> <label for="radio1-1">매우불만</label>
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="survey"
								name="dtl_use_poa" value="2" /> <label for="radio1-1">불만</label>
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="survey"
								name="dtl_use_poa" value="3" /> <label for="radio1-2">보통</label>
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="survey"
								name="dtl_use_poa" value="4" /> <label for="radio1-2">만족</label>
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="survey"
								name="dtl_use_poa" value="5" /> <label for="radio1-1">매우만족</label>
							</td>
						</tr>						
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">					
					<a href="" class="btnType blue" id="btnSaveSurvey" name="btn"><span>제출</span></a>  
					<a href="" class="btnType gray" id="btnCloseDtlCod" name="btn"><span>닫기</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>