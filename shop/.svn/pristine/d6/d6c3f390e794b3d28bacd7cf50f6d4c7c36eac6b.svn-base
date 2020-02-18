<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/x.x.x/jquery.min.js"></script>
    <script src="jquery.bpopup-x.x.x.min.js"></script>
<title>프로젝트관리</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<style type="text/css">


</style>

<script type="text/javascript">
	$(document).ready(function() {

		$('#memberBtn').click(function() {
			var area = $('#area');
			var work_type = $('#work_type');
			var industry_type = $('#industry_type');
			var regId= $('#regId');

			$.ajax({
				url : '/adm/admProject.do',
				type : 'POST',
				dataType : 'text',
				data : {
					area : area.val(),
					work_type : work_type.val(),
					industry_type : industry_type.val(),
					regId : regId.val()
				},
				async : false,
				success : function(data) {

					/* 	   console.log(data);
					   if(data==null){
						   alert("검색조건에 일치하는 회원이 업습니다.");    
						  return false
					   }else {            		   
						  
					          alert("회원 목록입니다.");
					          
					          return false
					   }   */

				},
				error : function(xhr, status, e) {
					console.log("error", e);
					console.log("status", status);
				}
			});

		});
	


		$('#memberBtn2').click(function() {
			var area = $('#area');
			var work_type = $('#work_type');
			var industry_type = $('#industry_type');

			$.ajax({
				url : '/combiz/projectList.do',
				type : 'POST',
				dataType : 'text',
				data : {
					area : area.val(),
					work_type : work_type.val(),
					industry_type : industry_type.val()
				},
				async : false,
				success : function(data) {

				
					window.open('/combiz/projectList.do','projectList','width=1080, height=1080, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no ')
				},
				error : function(xhr, status, e) {
					console.log("error", e);
					console.log("status", status);
				}
			});

		});

	});
	
	

	// 그룹코드 페이징 설정
	var pageSizeComnGrpCod = 5;
	var pageBlockSizeComnGrpCod = 10;

	// 상세코드 페이징 설정
	var pageSizeComnDtlCod = 5;
	var pageBlockSizeComnDtlCod = 10;

	/** OnLoad event */
	$(function() {

		// 그룹코드 조회
		fListComnGrpCod();

		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});

	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
			case 'btnSaveGrpCod':
				fSaveGrpCod();
				break;
			case 'btnDeleteGrpCod':
				fDeleteGrpCod();
				break;
			case 'btnSaveDtlCod':
				fSaveDtlCod();
				break;
			case 'btnDeleteDtlCod':
				fDeleteDtlCod();
				break;
			case 'btnCloseGrpCod':
			case 'btnCloseDtlCod':
				gfCloseModal();
				break;
			}
		});
	}

	/** 그룹코드 폼 초기화 */
	function fInitFormGrpCod(object) {
		$("#grp_cod").focus();
		if (object == "" || object == null || object == undefined) {

			$("#grp_cod").val("");
			$("#grp_cod_nm").val("");
			$("#grp_cod_eplti").val("");
			$("#grp_tmp_fld_01").val("");
			$("#grp_tmp_fld_02").val("");
			$("#grp_tmp_fld_03").val("");
			$("input:radio[name=grp_use_poa]:input[value='Y']").attr("checked",
					true);
			$("#grp_cod").attr("readonly", false);
			$("#grp_cod").css("background", "#FFFFFF");
			$("#grp_cod").focus();
			$("#btnDeleteGrpCod").hide();

		} else {

			$("#grp_cod").val(object.grp_cod);
			$("#grp_cod_nm").val(object.grp_cod_nm);
			$("#grp_cod_eplti").val(object.grp_cod_eplti);
			$("#grp_tmp_fld_01").val(object.tmp_fld_01);
			$("#grp_tmp_fld_02").val(object.tmp_fld_02);
			$("#grp_tmp_fld_03").val(object.tmp_fld_03);
			$(
					"input:radio[name=grp_use_poa]:input[value="
							+ object.use_poa + "]").attr("checked", true);
			$("#grp_cod").attr("readonly", true);
			$("#grp_cod").css("background", "#F5F5F5");
			$("#grp_cod_nm").focus();
			$("#btnDeleteGrpCod").show();
		}
	}

	/** 상세코드 폼 초기화 */
	function fInitFormDtlCod(object) {

		var grpCod = $("#tmpGrpCod").val();
		var grpCodNm = $("#tmpGrpCodNm").val();

		if (object == "" || object == null || object == undefined) {

			$("#dtl_grp_cod").val(grpCod);
			$("#dtl_grp_cod_nm").val(grpCodNm);
			$("#dtl_cod").val("");
			$("#dtl_cod_nm").val("");
			$("#dtl_odr").val("");
			$("#dtl_cod_eplti").val("");
			$("#dtl_tmp_fld_01").val("");
			$("#dtl_tmp_fld_02").val("");
			$("#dtl_tmp_fld_03").val("");
			$("#dtl_tmp_fld_04").val("");
			$("input:radio[name=dtl_use_poa]:input[value='Y']").attr("checked",
					true);

			$("#dtl_grp_cod").attr("readonly", true);
			$("#dtl_grp_cod").css("background", "#F5F5F5");
			$("#dtl_grp_cod_nm").attr("readonly", true);
			$("#dtl_grp_cod_nm").css("background", "#F5F5F5");
			$("#dtl_cod").attr("readonly", false);
			$("#dtl_cod").css("background", "#FFFFFF");
			$("#btnDeleteDtlCod").hide();
			$("#dtl_cod").focus();

		} else {

			$("#dtl_grp_cod").val(object.grp_cod);
			$("#dtl_grp_cod_nm").val(object.grp_cod_nm);
			$("#dtl_cod").val(object.dtl_cod);
			$("#dtl_cod_nm").val(object.dtl_cod_nm);
			$("#dtl_odr").val(object.odr);
			$("#dtl_cod_eplti").val(object.dtl_cod_eplti);
			$("#dtl_tmp_fld_01").val(object.tmp_fld_01);
			$("#dtl_tmp_fld_02").val(object.tmp_fld_02);
			$("#dtl_tmp_fld_03").val(object.tmp_fld_03);
			$("#dtl_tmp_fld_04").val(object.tmp_fld_04);
			$(
					"input:radio[name=dtl_use_poa]:input[value='"
							+ object.use_poa + "']").attr("checked", true);

			$("#dtl_grp_cod").attr("readonly", true);
			$("#dtl_grp_cod").css("background", "#F5F5F5");
			$("#dtl_grp_cod_nm").attr("readonly", true);
			$("#dtl_grp_cod_nm").css("background", "#F5F5F5");
			$("#dtl_cod").attr("readonly", true);
			$("#dtl_cod").css("background", "#F5F5F5");
			$("#btnDeleteDtlCod").show();
			$("#dtl_cod_nm").focus();
		}
	}

	/** 그룹코드 저장 validation */
	function fValidateGrpCod() {

		var chk = checkNotEmpty([ [ "grp_cod", "그룹 코드를 입력해 주세요." ],
				[ "grp_cod_nm", "그룹 코드 명을 입력해 주세요" ],
				[ "grp_cod_eplti", "그룹 코드 설명을 입력해 주세요." ] ]);

		if (!chk) {
			return;
		}

		return true;
	}

	/** 상세코드 저장 validation */
	function fValidateDtlCod() {

		var chk = checkNotEmpty([ [ "dtl_grp_cod", "그룹 코드를 선택해 주세요." ],
				[ "dtl_cod", "상세 코드를 입력해 주세요." ],
				[ "dtl_cod_nm", "상세 코드 명을 입력해 주세요" ],
				[ "dtl_cod_eplti", "상세 코드 설명을 입력해 주세요." ],
				[ "dtl_odr", "상세 코드 설명을 입력해 주세요." ] ]);

		if (!chk) {
			return;
		}

		return true;
	}

	/** 그룹코드 모달 실행 */
	function fPopModalComnGrpCod(grp_cod) {

		// 신규 저장
		if (grp_cod == null || grp_cod == "") {

			// Tranjection type 설정
			$("#action").val("I");

			// 그룹코드 폼 초기화
			fInitFormGrpCod();

			// 모달 팝업
			gfModalPop("#layer1");

			// 수정 저장
		} else {

			// Tranjection type 설정
			$("#action").val("U");

			// 그룹코드 단건 조회
			fSelectGrpCod(grp_cod);
		}
	}

	/** 그룹코드 조회 */
	function fListComnGrpCod(currentPage) {

		currentPage = currentPage || 1;

		var param = {
			currentPage : currentPage,
			pageSize : pageSizeComnGrpCod
		}

		var resultCallback = function(data) {
			flistGrpCodResult(data, currentPage);
		};

		callAjax("/system/listComnGrpCod.do", "post", "text", true, param,
				resultCallback);
	}

	/** 그룹코드 조회 콜백 함수 */
	function flistGrpCodResult(data, currentPage) {

		// 기존 목록 삭제
		$('#listComnGrpCod').empty();
		//$('#listComnGrpCod').find("tr").remove() 

		var $data = $($(data).html());

		// 신규 목록 생성
		var $listComnGrpCod = $data.find("#listComnGrpCod");
		$("#listComnGrpCod").append($listComnGrpCod.children());

		// 총 개수 추출
		var $totalCntComnGrpCod = $data.find("#totalCntComnGrpCod");
		var totalCntComnGrpCod = $totalCntComnGrpCod.text();

		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntComnGrpCod,
				pageSizeComnGrpCod, pageBlockSizeComnGrpCod, 'fListComnGrpCod');
		$("#comnGrpCodPagination").empty().append(paginationHtml);

		// 현재 페이지 설정
		$("#currentPageComnGrpCod").val(currentPage);
	}

	/** 그룹코드 단건 조회 */
	function fSelectGrpCod(grp_cod) {

		var param = {
			grp_cod : grp_cod
		};

		var resultCallback = function(data) {
			fSelectGrpCodResult(data);
		};

		callAjax("/system/selectComnGrpCod.do", "post", "json", true, param,
				resultCallback);
	}

	/** 그룹코드 단건 조회 콜백 함수*/
	function fSelectGrpCodResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer1");

			// 그룹코드 폼 데이터 설정
			fInitFormGrpCod(data.comnGrpCodModel);

		} else {
			alert(data.resultMsg);
		}
	}

	/** 그룹코드 저장 */
	function fSaveGrpCod() {

		// vaildation 체크
		if (!fValidateGrpCod()) {
			return;
		}

		var resultCallback = function(data) {
			fSaveGrpCodResult(data);
		};

		callAjax("/system/saveComnGrpCod.do", "post", "json", true,
				$("#myForm").serialize(), resultCallback);
	}

	/** 그룹코드 저장 콜백 함수 */
	function fSaveGrpCodResult(data) {

		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageComnGrpCod").val();
		}

		if (data.result == "SUCCESS") {

			// 응답 메시지 출력
			alert(data.resultMsg);

			// 모달 닫기
			gfCloseModal();

			// 목록 조회
			fListComnGrpCod(currentPage);

		} else {
			// 오류 응답 메시지 출력
			alert(data.resultMsg);
		}

		// 입력폼 초기화
		fInitFormGrpCod();
	}

	/** 그룹코드 삭제 */
	function fDeleteGrpCod() {

		var resultCallback = function(data) {
			fDeleteGrpCodResult(data);
		};

		callAjax("/system/deleteComnGrpCod.do", "post", "json", true, $(
				"#myForm").serialize(), resultCallback);
	}

	/** 그룹코드 삭제 콜백 함수 */
	function fDeleteGrpCodResult(data) {

		var currentPage = $("#currentPageComnGrpCod").val();

		if (data.result == "SUCCESS") {

			// 응답 메시지 출력
			alert(data.resultMsg);

			// 모달 닫기
			gfCloseModal();

			// 그룹코드 목록 조회
			fListComnGrpCod(currentPage);

		} else {
			alert(data.resultMsg);
		}
	}

	/** 상세코드 모달 실행 */
	function fPopModalComnDtlCod(grp_cod, dtl_cod) {

		// 신규 저장
		if (dtl_cod == null || dtl_cod == "") {

			if ($("#tmpGrpCod").val() == "") {
				alert("그룹 코드를 선택해 주세요.");
				return;
			}

			// Tranjection type 설정
			$("#action").val("I");

			// 상세코드 폼 초기화
			fInitFormDtlCod();

			// 모달 팝업
			gfModalPop("#layer2");

			// 수정 저장
		} else {

			// Tranjection type 설정
			$("#action").val("U");

			// 상세코드 단건 조회
			fSelectDtlCod(grp_cod, dtl_cod);
		}
	}

	/** 상세코드 목록 조회 */
	function fListComnDtlCod(currentPage, grp_cod, grp_cod_nm) {

		currentPage = currentPage || 1;

		// 그룹코드 정보 설정
		$("#tmpGrpCod").val(grp_cod);
		$("#tmpGrpCodNm").val(grp_cod_nm);

		var param = {
			grp_cod : grp_cod,
			currentPage : currentPage,
			pageSize : pageSizeComnDtlCod
		}

		var resultCallback = function(data) {
			flistDtlCodResult(data, currentPage);
		};

		callAjax("/system/listComnDtlCod.do", "post", "text", true, param,
				resultCallback);
	}

	/** 상세코드 조회 콜백 함수 */
	function flistDtlCodResult(data, currentPage) {

		// 기존 목록 삭제
		$('#listComnDtlCod').empty();

		var $data = $($(data).html());

		// 신규 목록 생성
		var $listComnDtlCod = $data.find("#listComnDtlCod");
		$("#listComnDtlCod").append($listComnDtlCod.children());

		// 총 개수 추출
		var $totalCntComnDtlCod = $data.find("#totalCntComnDtlCod");
		var totalCntComnDtlCod = $totalCntComnDtlCod.text();

		// 페이지 네비게이션 생성
		var grp_cod = $("#tmpGrpCod").val();
		var grp_cod_nm = $("#tmpGrpCodNm").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCntComnDtlCod,
				pageSizeComnDtlCod, pageBlockSizeComnDtlCod, 'fListComnDtlCod',
				[ grp_cod ]);
		$("#comnDtlCodPagination").empty().append(paginationHtml);

		// 현재 페이지 설정
		$("#currentPageComnDtlCod").val(currentPage);
	}

	/** 상세코드 단건 조회 */
	function fSelectDtlCod(grp_cod, dtl_cod) {

		var param = {
			grp_cod : grp_cod,
			dtl_cod : dtl_cod
		};

		var resultCallback = function(data) {
			fSelectDtlCodResult(data);
		};

		callAjax("/system/selectComnDtlCod.do", "post", "json", true, param,
				resultCallback);
	}

	/** 상세코드 단건 조회 콜백 함수*/
	function fSelectDtlCodResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer2");

			// 그룹코드 폼 데이터 설정
			fInitFormDtlCod(data.comnDtlCodModel);

		} else {
			alert(data.resultMsg);
		}
	}

	/** 상세코드 저장 */
	function fSaveDtlCod() {

		// vaildation 체크
		if (!fValidateDtlCod()) {
			return;
		}

		var resultCallback = function(data) {
			fSaveDtlCodResult(data);
		};

		callAjax("/system/saveComnDtlCod.do", "post", "json", true,
				$("#myForm").serialize(), resultCallback);
	}

	/** 상세코드 저장 콜백 함수 */
	function fSaveDtlCodResult(data) {

		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageComnDtlCod").val();
		}

		if (data.result == "SUCCESS") {

			// 응답 메시지 출력
			alert(data.resultMsg);

			// 모달 닫기
			gfCloseModal();

			// 목록 조회
			var grp_cod = $("#tmpGrpCod").val();
			var grp_cod_nm = $("#tmpGrpCodNm").val();
			fListComnDtlCod(currentPage, grp_cod, grp_cod_nm);

		} else {
			// 오류 응답 메시지 출력
			alert(data.resultMsg);
		}

		// 입력폼 초기화
		fInitFormDtlCod();
	}

	/** 상세코드 삭제 */
	function fDeleteDtlCod() {

		var resultCallback = function(data) {
			fDeleteDtlCodResult(data);
		};

		callAjax("/system/deleteComnDtlCod.do", "post", "json", true, $(
				"#myForm").serialize(), resultCallback);
	}

	/** 상세코드 삭제 콜백 함수 */
	function fDeleteDtlCodResult(data) {

		var currentPage = $("#currentPageComnDtlCod").val();

		if (data.result == "SUCCESS") {

			// 응답 메시지 출력
			alert(data.resultMsg);

			// 모달 닫기
			gfCloseModal();

			// 그룹코드 목록 조회
			var grp_cod = $("#tmpGrpCod").val();
			var grp_cod_nm = $("#tmpGrpCodNm").val();
			fListComnDtlCod(currentPage, grp_cod, grp_cod_nm);

		} else {
			alert(data.resultMsg);
		}
	}
</script>

</head>
<body>
	<form id="myForm" action="" method="">
		<input type="hidden" id="currentPageComnGrpCod" value="1"> <input
			type="hidden" id="currentPageComnDtlCod" value="1"> <input
			type="hidden" id="tmpGrpCod" value=""> <input type="hidden"
			id="tmpGrpCodNm" value=""> <input type="hidden" name="action"
			id="action" value="">

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
									class="btn_nav">프로젝트</a> <span class="btn_nav bold">프로젝트
									관리</span> <a href="#" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
							<table width="100%" cellpadding="5" cellspacing="0" border="1"
								align="left"
								style="border-collapse: collapse; border: 1px #50bcdf;">
								<tr style="border: 0px; border-color: blue">
									<td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;프로젝트
										조회</td>

									<td width="100" height="25" style="font-size: 100%">주소</td>
									<td width="70" height="25" style="font-size: 80%"></td>
									<td width="100" height="25" style="font-size: 100%">직무</td>
									<td width="70" height="25" style="font-size: 80%"></td>
									<td width="100" height="25" style="font-size: 100%">산업</td>
									<td width="70" height="25" style="font-size: 80%"></td>
								</tr>
								<tr class="col1" style="border: 0px; border-color: #50bcdf">
									<td width="100" height="25" style="font-size: 80%"></td>

									<td width="100" height="25" style="font-size: 100%"><select
										id="area" name="area" style="width: 98px">
											<option value="02" id="area1">서울</option>
											<option value="031" id="area2">경기</option>
											<option value="041" id="area3">충남</option>
											<option value="042" id="area4">충븍</option>
											<option value="051" id="area5">전남</option>
											<option value="052" id="area6">전북</option>
											<option value="061" id="area7">경남</option>
											<option value="062" id="area8">경북</option>
											<option value="063" id="area9">강원</option>
											<option value="054" id="area10">부산</option>
											<option value="064" id="area11">제주</option>
									</select></td>
									<td width="70" height="25" style="font-size: 80%"></td>
									<td width="100" height="25" style="font-size: 100%"><select
										id="work_type" name="work_type" style="width: 98px"><option
												value="1" id="work1">경영사무</option>
											<option value="2" id="work2">마케팅광고</option>
											<option value="3" id="work3">IT인터넷</option>
											<option value="4" id="work4">디자인</option>
											<option value="5" id="work5">무역유통</option>
											<option value="6" id="work6">영업</option>
											<option value="7" id="work7">서비스</option>
											<option value="8" id="work8">연구개발설계</option>
											<option value="9" id="work9">생산제조</option>
											<option value="10" id="work10">교육</option>
											<option value="11" id="work11">건설</option>
											<option value="12" id="work12">의료</option>
											<option value="13" id="work13">미디어</option>
											<option value="14" id="work14">특수직</option></td>
									</select>
									<td width="70" height="25" style="font-size: 80%"></td>
									<td width="100" height="25" style="font-size: 100%"><select
										id="industry_type" name="industry_type" style="width: 98px">
											<option value="K64" id="K64">금융은행업</option>
											<option value="J62" id="J62">IT정보통신업</option>
											<option value="G45" id="G45">판매유통업</option>
											<option value="C10" id="C10">제조생산화학업</option>
											<option value="P85" id="P85">교육업</option>
											<option value="F41" id="F41">건설업</option>
											<option value="Q86" id="Q86">의료제약업</option>
											<option value="J58" id="J58">미디어광고업</option>
											<option value="M70" id="M70">문화예술디자인업</option>
											<option value="S94" id="S94">기관협회</option></td>
									</select>
									<td width="70" height="25" style="font-size: 80%"></td>

								</tr>
								<tr class="col1" style="border: 0px; border-color: lightgray">
									<td width="100" height="15" style="font-size: 80%"></td>

									<td width="100" height="15" style="font-size: 70%"></td>
									<td width="70" height="15" style="font-size: 80%"></td>
									<td width="100" height="15" style="font-size: 70%"></td>
									<td width="70" height="15" style="font-size: 80%"></td>
									<td width="100" height="15" style="font-size: 70%"></td>
									<td width="110" height="60" style="font-size: 120%"><input
										type="submit" value="검  색  " id="memberBtn" class="test_btn1"
										border="0"
										style="border-collapse: collapse; border: 0px gray solid; background-color: #50bcdf; width: 70px; color: white" /></td>

								</tr>
							</table>
	</form>
	<br>
	<form>
		<table width="100%" cellpadding="5" cellspacing="0" border="1"
			align="left"
			style="border-collapse: collapse; border: 1px gray solid;">

			<tr class="col1"
				style="border: 1; background-color: white; border-color: gray">
				<td width="80" height="30" style="font-size: 100%">&nbsp;&nbsp;프로젝트명</td>
				<td width="80" height="30" style="font-size: 100%">지역</td>
				<td width="80" height="30" style="font-size: 100%">직무</td>
				<td width="80" height="30" style="font-size: 100%">산업</td>
				<td width="100" height="30" style="font-size: 100%">작성일</td>
				<td width="100" height="30" style="font-size: 100%">모집마감일</td>
				<td width="90" height="30" style="font-size: 100%">작성 회사</td>
			</tr>


			<c:forEach items="${test}" var="t">
				<tr class="col1" style="border: 1; border-color: gray">
					<td width="80" height="30" style="font-size: 100%">&nbsp;&nbsp;${t.project_name}</td>
					<td width="80" height="30" style="font-size: 100%">${t.area}</td>
					<td width="80" height="30" style="font-size: 100%">${t.work_type}</td>
					<td width="80" height="30" style="font-size: 100%">${t.industry_type}</td>
					<td width="100" height="30" style="font-size: 100%">${t.reg_date}</td>
					<td width="100" height="30" style="font-size: 100%">${t.receive_to_date}</td>
					<td width="90" height="30" style="font-size: 100%">${t.regId}</td>
				</tr>
			</c:forEach>
			<tr class="col1" style="border: 1; border-color: white">
				<td width="80" height="30" style="font-size: 80%"></td>
				<td width="80" height="30" style="font-size: 80%"></td>
				<td width="80" height="30" style="font-size: 80%"></td>
				<td width="80" height="30" style="font-size: 80%"></td>
				<td width="100" height="30" style="font-size: 80%"></td>
				<td width="100" height="30" style="font-size: 80%"></td>
				<td width="90" height="30" style="font-size: 80%"></td>
			</tr>

		</table>
		<br> <br> <br> <br>

		<table width="100%" cellpadding="5" cellspacing="0" border="0"
			align="left"
			style="border-collapse: collapse; border: 0px gray solid;">


			<tr class="col1" style="border: 0px; border-color: lightgray">
				<td width="100" height="15" style="font-size: 80%"></td>

				<td width="100" height="15" style="font-size: 70%"></td>
				<td width="70" height="15" style="font-size: 80%"></td>
				<td width="100" height="15" style="font-size: 70%"></td>
				<td width="70" height="15" style="font-size: 80%"></td>
				<td width="100" height="15" style="font-size: 70%"></td>
				<td width="110" height="60" style="font-size: 120%"><input
					type="button" value="상세정보  " id="memberBtn2" class="test_btn1"
					border="0"
					style="border-collapse: collapse; border: 0px gray solid; background-color: #50bcdf; width: 70px; color: white" /></td>

			</tr>
			
		</table>
		<input type="text" value="asdasd" id="regId" name="regId" style="border: 0px;color: white">
	</form>
</body>
</html>