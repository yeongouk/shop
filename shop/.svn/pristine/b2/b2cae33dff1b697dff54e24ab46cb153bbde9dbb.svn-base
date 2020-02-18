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
	var pageSizeLectureGrp = 10;
	var pageBlockSizeLectureGrp = 5;
	
	/** OnLoad event */ 
	$(function() {
	
		// 수강목록/진도 조회
		fListLectureGrp();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	
	
	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSaveGrp' :
					fSaveGrp();
					break;
				case 'btnCloseGrp' :
					gfCloseModal();
					break;
			}
		});
	}
	
	
	/** 수강목록/진도 폼 초기화 */
	function fInitFormGrp(object) {
		$("#grp_cod").focus();
		if( object == "" || object == null || object == undefined) {
			
			$("#grp_lec_no").val(""); // hidden
			
			$("#grp_lec_title").val("");
			$("#grp_user_teacherName").val("");
			$("#grp_lec_startDate").val("");
			$("#grp_lec_endDate").val("");
			$("#grp_lec_plan").text(""); // textarea
			$("#grp_pro_processRate").val("");
			$("#grp_lec_attend").val("");
			$("#grp_lec_lateness").val("");
			$("#grp_lec_absent").val("");
			
		} else {
			
			$("#grp_lec_no").val(object.grp_lec_no); // hidden
			
			$("#grp_lec_title").val(object.title);
			$("#grp_user_teacherName").val(object.name);
			$("#grp_lec_startDate").val(object.startdate);
			$("#grp_lec_endDate").val(object.enddate);
			$("#grp_lec_plan").text(object.plan); // textarea
			$("#grp_pro_processRate").val(object.proceed);
			$("#grp_lec_attend").val(object.attend);
			$("#grp_lec_lateness").val(object.lateness);
			$("#grp_lec_absent").val(object.absent);
			
			$("#grp_lec_title").attr("readonly", true);
			$("#grp_user_teacherName").attr("readonly", true);
			$("#grp_lec_startDate").attr("readonly", true);
			$("#grp_lec_endDate").attr("readonly", true);
			$("#grp_lec_plan").attr("readonly", true);
			
			$("#grp_lec_title").css("background", "#F5F5F5");
			$("#grp_user_teacherName").css("background", "#F5F5F5");
			$("#grp_lec_startDate").css("background", "#F5F5F5");
			$("#grp_lec_endDate").css("background", "#F5F5F5");
			$("#grp_lec_plan").css("background", "#F5F5F5");
			
			$("#grp_pro_processRate").focus();
			
		}
	}
	
	
	/** 수강목록/진도 저장 validation */
	function fValidateGrp() {

		var chk = checkNotEmpty(
				[
						[ "grp_pro_processRate", "진도율을 입력해 주세요." ]
					,	[ "grp_lec_attend", "출석(명)을 입력해 주세요" ]
					,	[ "grp_lec_lateness", "지각(명)을 입력해 주세요." ]
					,	[ "grp_lec_absent", "결석(명)을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	/** 수강목록/진도 모달 실행 */
	function fPopModalLectureGrp(no) {
		
		// 신규 저장
		if (no == null || no=="") {
		
			// Tranjection type 설정
			$("#action").val("I");
			
			// 수강목록/진도 폼 초기화
			fInitFormGrp();
			
			// 모달 팝업
			gfModalPop("#layer1");

		// 수정 저장
		} else {
			
			// Tranjection type 설정
			$("#action").val("U");
			
			// 수강목록/진도 단건 조회
			fSelectGrp(no);
		}
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
	
	
	/** 수강목록/진도 단건 조회 */
	function fSelectGrp(no) {
		
		var param = { no : no };
		
		var resultCallback = function(data) {
			fSelectGrpResult(data);
		};
		
		callAjax("/manageC/selectLectureLJKGrp.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 수강목록/진도 단건 조회 콜백 함수*/
	function fSelectGrpResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer1");
			
			// 수강목록/진도 폼 데이터 설정
			fInitFormGrp(data.lectureGrpModel);
			
		} else {
			alert(data.resultMsg);
		}	
	}
	
	
	/** 수강목록/진도 저장 */
	function fSaveGrp() {

		// vaildation 체크
		if ( ! fValidateGrp() ) {
			return;
		}
		
		var resultCallback = function(data) {
			fSaveGrpResult(data);
		};
		
		callAjax("/manageC/saveLectureLJKGrp.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	
	/** 수강목록/진도 저장 콜백 함수 */
	function fSaveGrpResult(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageLectureGrp").val();
		}
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			alert(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 목록 조회
			fListLectureGrp(currentPage);
			
		} else {
			// 오류 응답 메시지 출력
			alert(data.resultMsg);
		}
		
		// 입력폼 초기화
		fInitFormGrp();
	}
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageLectureGrp" value="1">
	<input type="hidden" id="currentPageLectureDtl" value="1">
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" id="grp_lec_no" name="grp_lec_no" value="1">
	
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
								class="btn_nav">학습 관리</a> <span class="btn_nav bold">수강목록/진도</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>수강목록/진도</span>
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
									<col width="10%">
									<col width="10%">
									<col width="10%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">과목</th>
										<th scope="col">강사명</th>
										<th scope="col">강의시작일</th>
										<th scope="col">강의종료일</th>
										<th scope="col">강의실</th>
										<th scope="col">출석</th>
										<th scope="col">지각</th>
										<th scope="col">결석</th>
										<th scope="col">진도</th>
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
				<strong>수강목록/진도 관리</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="100px">
						<col width="*">
						<col width="100px">
						<col width="*">
						<col width="100px">
						<col width="*">
					</colgroup>

					<tbody>
						<tr>
							<th scope="col">과목명</th><td></td>
							<th scope="col">강사</th><td></td>
							<th scope="col">강의기간</th><td></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" class="inputTxt p100" name="grp_lec_title" id="grp_lec_title" disabled/></td>
							<td colspan="2"><input type="text" class="inputTxt p100" name="grp_user_teacherName" id="grp_user_teacherName" disabled/></td>
							<td colspan="2">
								<input type="date" name="grp_lec_startDate" id="grp_lec_startDate" disabled>
								&nbsp;&nbsp;~&nbsp;&nbsp;
								<input type="date" name="grp_lec_endDate" id="grp_lec_endDate" disabled>
							</td>
						</tr>
						<tr>
							<th scope="row">강의내용</th>
						</tr>
						<tr>
							<td colspan="6"><textarea class="inputTxt p100" name="grp_lec_plan" id="grp_lec_plan" style="resize: none;" disabled></textarea></td>
						</tr>
						<tr>
							<th scope="row">진도(%) <span class="font_red">*</span></th>
						</tr>
						<tr>
							<td colspan="2"><input type="text" class="inputTxt p100"
								name="grp_pro_processRate" id="grp_pro_processRate" disabled/></td>
						</tr>
						<tr>
							<th scope="col">출석(명) <span class="font_red">*</span></th><td></td>
							<th scope="col">지각(명) <span class="font_red">*</span></th><td></td>
							<th scope="col">결석(명) <span class="font_red">*</span></th><td></td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" class="inputTxt p100" name="grp_lec_attend" id="grp_lec_attend" disabled/></td>
							<td colspan="2"><input type="text" class="inputTxt p100" name="grp_lec_lateness" id="grp_lec_lateness" disabled/></td>
							<td colspan="2"><input type="text" class="inputTxt p100" name="grp_lec_absent" id="grp_lec_absent" disabled/></td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href=""	class="btnType gray"  id="btnCloseGrp" name="btn"><span>닫기</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>