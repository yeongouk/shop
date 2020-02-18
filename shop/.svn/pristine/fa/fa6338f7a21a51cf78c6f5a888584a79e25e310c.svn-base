<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>JobKorea</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
var pageSizeBoard = 5;
var pageBlockSizeComnBoard = 10;

$(function() {
	
	// 그룹코드 조회
	freeboardlist();
	
	// 버튼 이벤트 등록
	//fRegisterButtonClickEvent();
});

	
$(document).ready(function() {
	$('#boardBtn').click(function() {
		board_search();
	});
	
	
	$('#btnSaveBoard').click(function() {
		alert("btnSaveBoard");
		var resultRegCallback = function(data) {
			fBoardRegResult(data);
		};
		
		var ctitle = $('#ctitle').val();
		var ccontent = $('#ccontent').val();
		
		
		
		
		$.ajax({
			url : '/stats/BoardReg.do',
			type : 'POST',
			dataType : 'text',
			data : {
				title : ctitle,
				content : ccontent
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
	
	$('#btnUpdateBoard').click(function() {
		var resultUpdateCallback = function(data) {
			fBoardUpdateResult(data);
		};
		
		var utitle = $('#title2').val();
		var ucontent = $('#content').val();
		var boardNum = $('#rboardNum').val();
		
		
		
		$.ajax({
			url : '/stats/BoardUpdate.do',
			type : 'POST',
			dataType : 'text',
			data : {
				title : utitle,
				content : ucontent,
				boardNum : boardNum
			},
			
			async : false,
			success : function(data) {
				resultUpdateCallback();
			},
			error : function(xhr, status, e) {
				console.log("error", e);
				console.log("status", status);
			}
			
		});
	});
	
	$('#btnDeleteBoard').click(function() {
		var resultDeleteCallback = function(data) {
			fBoardDeleteResult(data);
		};
				
		var dboardNum = $('#rboardNum').val();
		
		
		
		$.ajax({
			url : '/stats/BoardDelete.do',
			type : 'POST',
			dataType : 'text',
			data : {				
				boardNum : dboardNum
			},
			
			async : false,
			success : function(data) {
				resultDeleteCallback();
			},
			error : function(xhr, status, e) {
				console.log("error", e);
				console.log("status", status);
			}
			
		});
	});
	
	
	
	board_search();
});
	
	
	function board_search(currentPage) {
		
		currentPage = currentPage || 1;
			
			var loginID = $('#loginID');
			var from_date = $('#from_date');
			var to_date = $('#to_date');
			
			var param = {
						loginID : loginID.val()
					,	from_date : from_date.val()
					,	to_date : to_date.val()
					,	currentPage : currentPage
					,	pageSize : pageSizeBoard
			}
			
			var resultCallback = function(data) {
				fBoardResult(data, currentPage);
			};
			
			callAjax("/stats/BoardList.do", "post", "text", true, param, resultCallback);
	}
	/* QnA 리스트 불러오기  */
	function freeboardlist(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
				currentPage : currentPage,
				pageSize : pageSizeBoard
		}
		
		var resultCallback = function(data) {  // 데이터를 이 함수로 넘깁시다.
			fBoardResult(data, currentPage);
		};
		
		callAjax("/stats/BoardList.do", "post", "text", true, param, resultCallback);
	}
	
	function fBoardResult(data, currentPage) {
		
		$('#freeboardList').empty();
		
		var $data = $( $(data).html() );
		
		console.log(data);
		
		console.log(JSON.stringify($data));
		
		var $freeboardList = $data.find("#freeboardList");
		$("#freeboardList").append($freeboardList.children());
		
		var $totalCntBoard = $data.find("#totalCntBoard");
		var totalCntBoard = $totalCntBoard.text();
		
		var paginationHtml = getPaginationHtml(currentPage, totalCntBoard, pageSizeBoard, pageBlockSizeComnBoard, 'freeboardlist'); 
		$("#boardPagination").empty().append(paginationHtml);
		
		$("#currentPageBoard").val(currentPage);
	}
	
	
	
	function freeboardDtl(pc_no) {
		
		fSelectBoardDtl(pc_no);
	}
	
	function fSelectBoardDtl(pc_no) {
		
		var param = {
				pc_no : pc_no
		};
		
		var BoardResultCallback = function(data) {
			fSelectBoardResult(data);
		};
		
		callAjax("/stats/selectBoard.do", "post", "json", true, param, BoardResultCallback);
	}
	
	function fSelectBoardResult(data) {
		if(data.result == "SUCCESS") {
			
			gfModalPop("#layer1");
			
			
			
			fSetBoard(data.dto);
		} else {
			alert(data.resultMsg);
		}
	}
	
	function fSetBoard(object) {
		$("#pc_no ").val(object.pc_no);
		$("#loginID ").val(object.loginID);
		$("#pcuseamt").val(object.pcuseamt);
		$("#foodamt ").val(object.foodamt);
		$("#reg_date").val(object.reg_date);
				
	}
	
	function fBoardUpdateResult(data) {
		if(data.result == "SUCCESS") {
			
			alert(data.resultMsg);
			
			gfCloseModal();

		} else {
			alert(data.resultMsg);
		}
	}
	
	function fBoardDeleteResult(data) {
		if(data.result == "SUCCESS") {
			alert(data.resultMsg);
			
			gfCloseModal();
		} else {
			alert(data.resultMsg);
		}
	}
	
	
	
	function fBoardReg() {
		
		gfModalPop("#layer2");
	}
	
	function fBoardRegResult(data) {
		if(data.result == "SUCCESS") {
			
			alert(data.resultMsg);
			
			gfCloseModal();

		} else {
			alert(data.resultMsg);
		}
	}
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageBoard" value="1">	
	<!-- <input type="hidden" id="loginId" value=""> -->
	<input type="hidden" id="name" value="">
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" id="rboardNum" value="">		
	
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
								class="btn_nav">통계</a> <span class="btn_nav bold">매출통계
								</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>
						
						<p class="conTitle">
							<span>매출통계 </span> <span class="fr"><!-- <a class="btnType blue" href="javascript:fBoardReg();" name="modal"><span>글쓰기</span></a> -->
							
						</p>
							<table width="100%" cellpadding="5" cellspacing="0" border="1"
								align="left"
								style="border-collapse: collapse; border: 1px #50bcdf;">
								<tr style="border: 0px; border-color: blue">
									<td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>

									<td width="50" height="25" style="font-size: 100%">ID</td>
									<td width="50" height="25" style="font-size: 100%"><input type="text"
										 style="width: 120px" id="title" name="title"></td>							
									<td width="50" height="25" style="font-size: 100%">구매일</td>
									<td width="50" height="25" style="font-size: 100%"><input type="date"
										 style="width: 120px" id="from_date" name="from_date">
										 
									</td>
									<td width="50" height="25" style="font-size: 100%"><input type="date"
										 style="width: 120px" id="to_date" name="to_date">
										 
									</td>
									<td width="110" height="60" style="font-size: 120%">
									<input type="button" value="검  색  " id="boardBtn" class="test_btn1" 
										style="border-collapse: collapse; border: 0px gray solid; background-color: #50bcdf; width: 70px; color: white"/></td>
								</tr>
								
							</table>						
							
						
						
							
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="15%">
									<col width="25%">
									<col width="20%">																			
									<col width="20%">																			
								</colgroup>
		
								<thead>
									<tr>
										<th scope="col">PC번호</th>
										<th scope="col">고객ID</th>
										<th scope="col">PC사용금액</th>
										<th scope="col">음식사용금액</th>									
										<th scope="col">구매일</th>									
									</tr>
								</thead>
								<tbody id="freeboardList">
								
								</tbody>
							</table>
							
							<table>
								<tr>
									<td height="20"></td>
								</tr>
							</table>
						</div>					
						
						
                        <div class="paging_area"  id="boardPagination"> 
                                        
                       </div>                        
                        
					</div> <!--// content -->
					
					
					
					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="layer1" class="layerPop layerType2" style="width: 900px;">
		
		<dl>
			<dt>
				<strong>게시글</strong>
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
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td><input type="text" name="title2" id="title2" /></td>
							<th style="width:120px" scope="row">작성일<span class="font_red">*</span></th>
							<td><input type="text" name="reg_date" id="reg_date" /></td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td><input type="text" id="editor" name="editor" disabled></td>
						</tr>						
						
					</tbody>
					
				</table>
				
				<br><br>
				<b style="font-size: 110%">내용</b>
				<br>
				<textarea style="width: 450;height: 150px" id="content" name="content"></textarea>

				<div class="btn_areaC mt30">					
					<a href="" class="btnType gray"  id="btnUpdateBoard" name="btn"><span>수정</span></a>
					<a href="" class="btnType gray"  id="btnDeleteBoard" name="btn"><span>삭제</span></a>					
					<a href=""	class="btnType gray"  id="btnCloseGrpCod" name="btn"><span>닫기</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	
	</div>
	
	<div id="layer2" class="layerPop layerType2" style="width: 900px;">
		
		<dl>
			<dt>
				<strong>게시글</strong>
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
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td><input type="text" name="ctitle" id="ctitle" /></td>							
						</tr>					
					</tbody>
					
				</table>
				
				<br><br>
				<b style="font-size: 110%">내용</b>
				<br>
				<textarea style="width: 450;height: 150px" id="ccontent" name="ccontent"></textarea>

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveBoard" name="btn"><span>등록</span></a>					
					<a href="" class="btnType gray"  id="btnCloseGrpCod" name="btn"><span>닫기</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
		
	</div>
	
</form>
</body>
</html>