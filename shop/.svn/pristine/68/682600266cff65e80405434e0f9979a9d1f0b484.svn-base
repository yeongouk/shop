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
	
	//과정 페이징 설정
	var pageSizeExquestionMgt = 5;
	var pageBlockSizeExquestionMgt = 10;
	
	// 상세코드 페이징 설정
	var pageSizeExquestionMgtSub = 5;
	var pageBlockSizeExquestionMgtSub = 10;
	
	// POP-UP 시험문제 목록 페이징 설정
	var pageSizeExquestionMgtExam = 5;
	var pageBlockSizeExquestionMgtExam = 10;
	
	/** OnLoad event */ 
// 	$(function() {
	$(document).ready(function() {
		
		fRegisterButtonClickEvent();
		
		// 그룹코드 조회
		fListExquestionMgt();
	});
	
	function listTitleClickEvent() {
		// 과정 목록 제목 클릭이벤트
		$('a[name=listTitle]').off('click').on('click', function() {
			
			var keyVal = $(this).next().val();
			$('#testPkNo').val(keyVal);
			
			fTestListMgt();
		});
	}
	
	function testListClickEvent() {
		// 시험 목록 제목 클릭이벤트
		$('a[name=bTestName]').off('click').on('click', function() {
			
			// 팝업 Input 데이터 초기화
			popDateinit();
			
			var keyValNo= $(this).next().val();
			$('#popOpenNo').val(keyValNo);
			
			var keyValRe= $(this).next().next().val();
			$('#popOpenRe').val(keyValRe);
			
			var keyValTestNm = $(this).next().next().next().val();
			$('#popOpenTestNm').val(keyValTestNm);
			
			/*************************/
			fExamListMgt();
			
			/*************************/
			gfModalPop("#layer2");
		});
	}
	
	function testInsertClickEvent() {
		// 시험명 등록 이벤트
		$('#insertTestNm').off('click').on('click', function(e) {
			
			gfModalPop("#layer1");
			
			fLectureTitleAjax();
		});
	}
	
	/** 시험명 조회 */
	function fLectureTitleAjax() {
		
		var resultCallback = function(data) {
			fLectureTitleResult(data);
		};
		
		var param = {}
		
		callAjax("/manageA/selectLectureTitle.do", "post", "text", true, param, resultCallback);
	}
	
	function fLectureTitleResult(data) {
		
		var json = JSON.parse(data);
		var no = "";
		var title = "";
		
		if(json.resultMsg == "SUCCESS"){
			
			var data = '<select id="lectureNo" name="lectureNo">';
			
			for(var i = 0; i < json.titleNm.length; i++) {
				
				no = json.titleNm[i].no;
				title = json.titleNm[i].title;
				
				if(i == 0) {
					data += '<option value="'+no+'" selected="selected">'+title+'</option>';
				} else {
					data += '<option value="'+no+'">'+title+'</option>';	
				}
				
			}
			data += '</select>';
			
			$('#lectureNoArea').empty().append(data);
		} else {
			alert("오류");
		}
	}
	
	function popCloseEvent() {
		// 팝업 이벤트
		$('a[name=btn]').off('click').on('click', function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
// 				case 'btnSaveGrpCod' :
// 					fSaveGrpCod();
// 					break;
// 				case 'btnDeleteGrpCod' :
// 					fDeleteGrpCod();
// 					break;
// 				case 'btnSaveDtlCod' :
// 					fSaveDtlCod();
// 					break;
// 				case 'btnDeleteDtlCod' :
// 					fDeleteDtlCod();
// 					break;
// 				case 'btnCloseGrpCod' :
				case 'closeModalMgt' :
					gfCloseModal();
					popDataClear();
					break;
			}
		});
	}
	
	function examTitleClickEvent() {
		$('a[name=ExamTitle]').off('click').on('click', function() {
			// 수정 구분코드
			var sendState = 'U';
			var stateVal = $('#sendState').val(sendState);
			
			var seqVal = $(this).parent().prev().text();
			var problemVal = $(this).children().text();
			var noVal = $(this).next().val();
			var reVal = $(this).next().next().val();
			var answerVal = $(this).parent().next().text();
			var answer1Val = $(this).parent().next().next().text();
			var answer2Val = $(this).parent().next().next().next().text();
			var answer3Val = $(this).parent().next().next().next().next().text();
			var answer4Val = $(this).parent().next().next().next().next().next().text();
			var scoreVal = $(this).parent().next().next().next().next().next().next().text();
			
			// Hidden
			$('#popOpenNo').val(noVal);
			$('#popOpenRe').val(reVal);
			
			$('#ExamSeq').val(seqVal);
			$('#ExamProblem').val(problemVal);
			$('#ExamScore').val(scoreVal);
			$('#ExamAnswer').val(answerVal);
			$('#ExamAnswer1').val(answer1Val);
			$('#ExamAnswer2').val(answer2Val);
			$('#ExamAnswer3').val(answer3Val);
			$('#ExamAnswer4').val(answer4Val);
			
		
		});
	}
		
		
	
	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {

		$(document).on('click', '#inAndmodiExamData', function() {
			
			var sendState = $('#sendState').val();
			
			var popOpenNo = $('#popOpenNo').val();
			var popOpenRe = $('#popOpenRe').val();
			
			var popOpenTestNm = $('#popOpenTestNm').val();
			var ExamSeq = $('#ExamSeq').val();
			var ExamProblem = $('#ExamProblem').val();
			var ExamScore = $('#ExamScore').val();
			var ExamAnswer = $('#ExamAnswer').val();
			var ExamAnswer1 = $('#ExamAnswer1').val();
			var ExamAnswer2 = $('#ExamAnswer2').val();
			var ExamAnswer3 = $('#ExamAnswer3').val();
			var ExamAnswer4 = $('#ExamAnswer4').val();
			
			if(ExamSeq == null || ExamSeq == "" || ExamSeq == undefined) {
				alert('문제번호를 입력해주세요.');
				return;
				
			} else if(ExamProblem == null || ExamProblem == "" || ExamProblem == undefined) {
				alert('문제를 입력해주세요.');
				return;
				
			} else if(ExamScore == null || ExamScore == "" || ExamScore == undefined) {
				alert('점수를 입력해주세요.');
				return;
				
			} else if(ExamAnswer == null || ExamAnswer == "" || ExamAnswer == undefined) {
				alert('정답을 입력해주세요.');
				return;
				
			} else if(ExamAnswer1 == null || ExamAnswer1 == "" || ExamAnswer1 == undefined) {
				alert('보기①를 입력해주세요.');
				return;
				
			} else if(ExamAnswer2 == null || ExamAnswer2 == "" || ExamAnswer2 == undefined) {
				alert('보기②를 입력해주세요.');
				return;
				
			} else if(ExamAnswer3 == null || ExamAnswer3 == "" || ExamAnswer3 == undefined) {
				alert('보기③를 입력해주세요.');
				return;
				
			} else if(ExamAnswer4 == null || ExamAnswer4 == "" || ExamAnswer4 == undefined) {
				alert('보기④를 입력해주세요.');
				return;
			}
			
			//신규 등록
			if(sendState == null || sendState == "" || sendState == undefined) {
				
				sendState = 'I';
				// 수정
			} else {
			}
			
			var param = {
					sendState : sendState
					, no : popOpenNo
					, re : popOpenRe
					, seq : ExamSeq
					, testname : popOpenTestNm
					, problem : ExamProblem
					, point : ExamScore
					, answer : ExamAnswer
					, answer1 : ExamAnswer1
					, answer2 : ExamAnswer2
					, answer3 : ExamAnswer3
					, answer4 : ExamAnswer4
			}
			
			saveExamAjax(param);
			
		});
		
		// 초기화 버튼
		$(document).on('click', '#initInput', function() {
		
			popDateinit();
		});
		
		// 삭제 버튼
		$(document).on('click', '#deleteExamData', function() {
			
			var sendState = 'D';
			
			var popOpenNo = $('#popOpenNo').val();
			var popOpenRe = $('#popOpenRe').val();
			var ExamSeq = $('#ExamSeq').val();
			var ExamScore = $('#ExamScore').val();
			
			if( (popOpenNo == null || popOpenNo == "" || popOpenNo == undefined) || 
				(popOpenRe == null || popOpenRe == "" || popOpenRe == undefined) ||
				(ExamSeq == null || ExamSeq == "" || ExamSeq == undefined) ) {
				alert('삭제할 데이터를 선택해주세요.');
				return;
			} 
			
			var param = {
					sendState : sendState
					, no : popOpenNo
					, re : popOpenRe
					, seq : ExamSeq
					, point : ExamScore
			}
			
			saveExamAjax(param);
		});
		
		// 시험명 팝업 닫기 이벤트
		$(document).on('click', '#popInsertClose', function() {
			
			gfCloseModal();
			popTestClose();
		});
		
		// 시험명 등록 이벤트
		$(document).on('click', '#popInsertBtn', function() {
			
			var pNo = $('select[name=lectureNo] option:selected').val();
			var pRe = $('select[name=sBoxRe] option:selected').val();
			var pTitle = $('#pTitle').val();
			
			if(pNo == null || pNo == "" || pNo == undefined) {
				alert("강의명을 선택해주세요.");
				return;
			} else if(pRe == null || pRe == "" || pRe == undefined) {
				alert("구분을 선택해주세요.");
				return;
			} else if(pTitle == null || pTitle == "" || pTitle == undefined) {
				alert("시험명을 입력해주세요.");
				return;
			}
			
			var param = {
				no : pNo
				, re : pRe
				, testname : pTitle
			}
			saveTestNmAjax(param);
			
		});
		
		testInsertClickEvent();
	}
	
	/** 시험명 등록*/
	function saveTestNmAjax(param) {
		
		var resultCallback = function(data) {
			saveTestNmAjaxResult(data);
		};
		
		callAjax("/manageA/saveTestNm.do", "post", "text", true, param, resultCallback);
	}
	
	// 시험명 콜백함수
	function saveTestNmAjaxResult(data) {
		
		var json = JSON.parse(data);
		
		if(json.resultMsg == "SUCCESS"){
			alert('저장 되었습니다.');
			gfCloseModal();
		} else {
			alert("저장 실패하였습니다.");
		}
	}
	
	// 시험명 팝업 초기화 함수
	function popTestClose() {
		
		$('select[name=sBoxRe]').val('main').attr('selected', 'selected');
		$('#pTitle').val('');
		
	}
	
	// 팝업 초기화 함수
	function popDateinit() {
		
		$('#sendState').val('');
		
		$('#popOpenTestNm').val('');
		$('#ExamSeq').val('');
		$('#ExamProblem').val('');
		$('#ExamScore').val('');
		$('#ExamAnswer').val('');
		$('#ExamAnswer1').val('');
		$('#ExamAnswer2').val('');
		$('#ExamAnswer3').val('');
		$('#ExamAnswer4').val('');
	}
	
	function popDataClear() {
		$('#popOpenNo').val('');
		$('#popOpenRe').val('');
	}
	
	/** 시험문제 저장*/
	function saveExamAjax(param) {
		
		var resultCallback = function(data) {
			saveExamAjaxResult(data);
		};
		
		callAjax("/manageA/saveExamData.do", "post", "text", true, param, resultCallback);
	}
	
	/** 시험문제 저장 콜백 함수*/
	function saveExamAjaxResult(data) {
		
		var json = JSON.parse(data);
		
		if(json.resultMsg == "SUCCESS"){
			alert('저장 되었습니다.');
			fExamListMgt();
		} else if(json.resultMsg == "UPDATE"){
			alert('수정 되었습니다.');
			fExamListMgt();
		} else if(json.resultMsg == "DELETE"){
			alert('삭제 되었습니다.');
			popDateinit();
			
			fExamListMgt();
		} else {
			alert("저장 실패하였습니다.");
		}
		
	}
	
	/** 과정 조회 */
	function fListExquestionMgt(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeExquestionMgtSub
				,   keyword : $("#keyword").val()
		};
		var resultCallback = function(data) {
			fListExquestionMgtResult(data, currentPage);
		};
		
		callAjax("/manageA/exquestionMgtList.do", "post", "text", true, param, resultCallback);
	}
	
	/** 과정 조회 콜백 함수 */
	function fListExquestionMgtResult(data, currentPage) {
		
		// 기존 목록 삭제
		$('#listExquestion').empty();
		
		var $data = $( $(data).html() );
		
		// 신규 목록 생성
		var $listComnGrpCod = $data.find("#listExquestionLe");		
		$("#listExquestion").append($listComnGrpCod.children());
		
		// 총 개수 추출
		var $totalCntComnGrpCod = $data.find("#totalCnt");
		var totalCnt = $totalCntComnGrpCod.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCnt, pageSizeExquestionMgt, pageBlockSizeExquestionMgt, 'fListExquestionMgt');
		
		$("#comnGrpCodPagination").empty().append( paginationHtml );
		
		// 이벤트
		listTitleClickEvent();
		
	}
	
	/** 시험 목록 조회 */
	function fTestListMgt(currentPageTest) {
		
		currentPageTest = currentPageTest || 1;
		
		var param = {
					currentPage : currentPageTest
				,	pageSize : pageSizeExquestionMgt
				,	no		: $('#testPkNo').val()
		};
		var resultCallback = function(data) {
			fTestListMgtResult(data, currentPageTest);
		};
		
		callAjax("/manageA/exquestionTestList.do", "post", "text", true, param, resultCallback);
	}
	
	/** 시험 목록 조회 콜백 함수 */
	function fTestListMgtResult(data, currentPageTest) {
		
		// 기존 목록 삭제
		$('#exquestionTestArea').empty();
		
		var $data = $( $(data).html() );
		
		// 신규 목록 생성
		var $exquestionTestList = $data.find("#exquestionTestList");		
		$("#exquestionTestArea").append($exquestionTestList.children());
		
		// 총 개수 추출
		var $totalCntTest = $data.find("#totalCntTest");
		var totalCnt = $totalCntTest.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPageTest, totalCnt, pageSizeExquestionMgtSub, pageBlockSizeExquestionMgtSub, 'fTestListMgt');
		
		$("#comnTestPagination").empty().append( paginationHtml );
		
		// 이벤트
		testListClickEvent();
	}
	
	/** 시험문제 목록 조회 */
	function fExamListMgt(currentPageExam) {
		
		currentPageExam = currentPageExam || 1;
		
		var param = {
					currentPage : currentPageExam
				,	pageSize : pageSizeExquestionMgtExam
				,   no : $("#popOpenNo").val()
				,	re		: $('#popOpenRe').val()
		};
		var resultCallback = function(data) {
			fExamListMgtResult(data, currentPageExam);
		};
		
		callAjax("/manageA/exquestionExamList.do", "post", "text", true, param, resultCallback);
	}
	
	/** 시험문제 목록 조회 콜백 함수 */
	function fExamListMgtResult(data, currentPageExam) {
		
		// 기존 목록 삭제
		$('#exquestionExamArea').empty();
		
		var $data = $( $(data).html() );
		
		// 신규 목록 생성
		var $exquestionTestList = $data.find("#exquestionExamList");		
		$("#exquestionExamArea").append($exquestionTestList.children());
		
		// 총 개수 추출
		var $totalCntExam = $data.find("#totalCntExam");
		var totalCnt = $totalCntExam.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPageExam, totalCnt, pageSizeExquestionMgtExam, pageBlockSizeExquestionMgtExam, 'fExamListMgt');
		
		$("#comnExamPagination").empty().append( paginationHtml );
		
		examTitleClickEvent();
		popCloseEvent();
	}
	
</script>
</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageComnDtlCod" value="1">
	<input type="hidden" id="currentPageComnDtlCod2" value="1">
	<input type="hidden" id="testPkNo" value="">
	<input type="hidden" id="popOpenNo" value="">
	<input type="hidden" id="popOpenRe" value="">
	<input type="hidden" id="popOpenTestNm" value="">
	<input type="hidden" id="sendState" value="">
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
								class="btn_nav">관리자페이지</a> <span class="btn_nav bold">시험문제
								관리</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

					<!-- 	<p class="conTitle">
							<span>강의목록</span> <span class="fr"> <a
								class="btnType blue" href="javascript:fPopModalComnGrpCod();" name="modal"><span>등록</span></a>
							</span>
						</p> -->
						
						<!--검색창  -->
						<table width="100%" cellpadding="5" cellspacing="0" border="1"
                        align="left"
                        style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>

                           <td width="50" height="25" style="font-size: 100%">과정명</td>
                           <td width="50" height="25" style="font-size: 100%">
                            <input type="text" style="width: 200px" id="keyword"></td>                     
                          
                           <td width="110" height="60" style="font-size: 120%">
                           <a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a></td> 
                            <!-- <input type="button" value="검  색  " id="searchBtn" name="btn" class="test_btn1" 
                              style="border-collapse: collapse; border: 0px gray solid; background-color: #50bcdf; width: 70px; color: white"/> -->
                        </tr>
                     </table>
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%%">
									<col width="30%">
									<col width="50%">														
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">과정명</th>
										<th scope="col">기간</th>
									</tr>
								</thead>
								<tbody id="listExquestion"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="comnGrpCodPagination"> </div>
	
						<p class="conTitle mt30">
							<span>시험 목록</span> 
							<span class="fr"> 								
								<a class="btnType blue" id="insertTestNm" style="cursor: pointer;">
									<span>등록</span>
								</a>
							</span>
						</p>
	
						<div class="divComDtlCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="6%">
									<col width="10%">
									<col width="10%">
									<col width="10%">								
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">과정명</th>
										<th scope="col">시험명</th>
										<th scope="col">구분</th>
										<th scope="col">대상자수</th>
									</tr>
								</thead>
								<tbody id="exquestionTestArea">
									<tr>
										<td colspan="12">과정명을 선택해 주세요.</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging_area"  id="comnTestPagination"> </div>

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="layer2" class="layerPop layerType2" style="width: 1000px;">
		<dl>
			<dt>
				<strong>시험문제 등록</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="65px">
						<col width="120px">
						<col width="300px">
						<col width="120px">
						<col width="65px">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">문제번호 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="ExamSeq" name="no" /></td>
							<th scope="row">문제 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="ExamProblem" /></td>
						</tr>
						<tr>
							<th scope="row">문항별 점수 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="ExamScore" /></td>
							<th scope="row">정답 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="ExamAnswer" /></td>
						</tr>
						<tr>
							<th scope="row">보기① <span class="font_red">*</span></th>
							<td colspan="5"><input type="text" class="inputTxt p100" id="ExamAnswer1" name="seq" /></td>
						</tr>
						<tr>
							<th scope="row">보기② <span class="font_red">*</span></th>
							<td colspan="5"><input type="text" class="inputTxt p100" id="ExamAnswer2" name="seq" /></td>
						</tr>
						<tr>
							<th scope="row">보기③ <span class="font_red">*</span></th>
							<td colspan="5"><input type="text" class="inputTxt p100" id="ExamAnswer3" name="seq" /></td>
						</tr>
						<tr>
							<th scope="row">보기④ <span class="font_red">*</span></th>
							<td colspan="5"><input type="text" class="inputTxt p100" id="ExamAnswer4" name="seq" /></td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt20">
					<a href="" class="btnType blue" id="inAndmodiExamData" name="btn"><span>저장</span></a>
<!-- 					<a href="" class="btnType blue" id="modifyExamData" name="btn"><span>수정</span></a> -->
					<a href="" class="btnType blue" id="deleteExamData" name="btn"><span>삭제</span></a>  
					<a href="" class="btnType gray" id="closeModalMgt" name="btn"><span>취소</span></a>
					<a href="" class="btnType blue" id="initInput" name="btn"><span>초기화</span></a>
				</div>
				
				<div class="divComDtlCodList mt10">
					<table class="col">
						<caption>caption</caption>
						<colgroup>
							<col width="10%">
							<col width="30%">
							<col width="6%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="10%">					
						</colgroup>

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
						<tbody id="exquestionExamArea">
							<tr>
								<td colspan="12">시험 문제를 등록해주세요.</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="paging_area"  id="comnExamPagination"> </div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
	
	<div id="layer1" class="layerPop layerType2" style="width: 700px;">
		<dl>
			<dt>
				<strong>시험명 등록</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="65px">
						<col width="120px">
						<col width="300px">
						<col width="120px">
						<col width="65px">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">강의명 <span class="font_red">*</span></th>
							<td id="lectureNoArea">
							</td>
							<th scope="row">구분 <span class="font_red">*</span></th>
							<td>
								<select id="sBoxRe" name="sBoxRe">
									<option value="main" selected="selected">main</option>
									<option value="re">re</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">시험명 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100" id="pTitle" /></td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt20">
					<a href="javascript:void(0);" class="btnType blue" id="popInsertBtn" name="btn" ><span>등록</span></a>
					<a href="javascript:void(0);" class="btnType gray" id="popInsertClose" name="btn" ><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>