<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>강의 계획서</title>
<script type="text/javascript">
	// 페이징 설정 
	var PageSize = 5;    	// 화면에 뿌릴 데이터 수 
	var PageBlock = 10;		// 블럭으로 잡히는 페이징처리 수
	var roomNo=$("#");
		

	/* onload 이벤트  */
	$(function() {
		lectureRoomList();
		clickEvent();
	});
	
	function ValidateCHK(){
		var CHK=checkNotEmpty(
			[
				["room","강의실 번호를 입력하세요."],
				["ccount","수용인원을 입력해주세요."],
			]		
		);
		if(!CHK){return;}
	 	return true;
	}
	
	function ValidateWare(){
		var CHK=checkNotEmpty(
			[
				["Wname","장비명을 입력하세요."],
				["Wccount","장비갯수를 입력해주세요."],
			]		
		);
		if(!CHK){return;}
	 	return true;
	}
		
	
	
	function clickEvent(){
		$('a[name=btn]').click(function(e){
 		e.preventDefault();
			
		var btnId=$(this).attr('id');
	
		//alert(btnId);
			switch (btnId) {
			case "roomSearchBtn":		
				lectureRoomList();
				 
				break;
				
			case "roomInsertBtn":
				gfModalPop("#roomModal");					
				break;
				
			case "btnCancel":
				$("#roomModal").hide();		
				break;
				
			case "btnSave":
				
				var result = confirm("저장하시게습니까?");
				if(result){
					roomInsert();
				}
				break;
				
			case "btnCancelWare":
				$("#roomWareModal").hide();		
				break;	
				
			case "btnSaveWare":
				
				var result = confirm("저장하시게습니까?");
				if(result){
					var action="I";
					insertWare(action);
				}else {
					$("#roomWareModal").hide();	
				}
				break;
				
			case "btnUpdateWare":
				var result = confirm("수정하시게습니까?");
				if(result){
					var action="U";
					insertWare(action);
				}else {
					$("#roomWareModal").hide();	
				}
				break;	
			}
		})
	}
	
	
	//LIST 조회
	function lectureRoomList(currentPage) {
		currentPage = currentPage || 1;
		var room = $('#serchKey').val();
		
		var param = {
				 room : room, 
				currentPage : currentPage,
				pageSize : PageSize
			}

		var resultCallback = function(data) { // 데이터 받아옴
			ResultRoomList(data, currentPage);
		}

		callAjax("/manageF/lectureRoomInfo.do", "post", "text", true, param,
				resultCallback);
	}

	//callBack
	function ResultRoomList(data, currentPage) {
		$("#LectureRoomList").empty();
		$("#LectureRoomList").append(data);
		
		var totalCnt = $("#totalCnt").val();
		if (totalCnt == null || totalCnt == 0) {
			alert("데이터가 없습니다.");
			return;
		}

		var list = $("#lectureRoom_list").val();
		var pagingnavi = getPaginationHtml(currentPage, totalCnt, PageSize,
				PageBlock, 'LectureRoomList', [ list ]);
		$("#pagingnavi").empty().append(pagingnavi);

		// 현재 페이지 설정 
		$("#currentPage").val(currentPage);
	}
	
	
	//신규 강의실 등록
	function roomInsert(){
		if(!ValidateCHK()){
			return;
		}
		 var resultCallback1 = function(data){
			 var currentPage = currentPage || 1;
			 if(data.resultMsg=="INSERT"){
				 alert("등록 되였습니다.");
				 gfCloseModal();
				 fSaveResult(data);
			 }
		 };
		callAjax("/manageF/InsertRoomInfo.do", "post", "json", true, $("#frmRoomModal").serialize(), resultCallback1);
	}
	
	function fSaveResult(data){
		var currentPage = currentPage || 1; 
		
		switch (data.resultMsg) {
		case "INSERT":
			alert("저장되였습니다.");
			break;
			
		}
		 gfCloseModal();	// 모달 닫기
		 lectureRoomList(currentPage); // 목록조회 함수 다시 출력 
		
	}
	
	
	/*장비 파트 satrt */
	
	//장비 정보 리스트조회
	function roomWareList(room,currentPage){
		currentPage = currentPage || 1;
		
		$("#roomNo").val(room);
		var param = {
				room : room ,
				currentPage : currentPage,
				pageSize : PageSize
			}

		var resultCallback = function(data) { // 데이터 받아옴
			resultWareList(data, currentPage);
		}

		callAjax("/manageF/selectWareList.do", "post", "text", true, param,resultCallback); 
	}
	
	//callBack
	function resultWareList(data, currentPage) {
		$("#roomWareList").empty();

		$("#roomWareList").append(data);

		var totalCnt = $("#totalCnt").val();
		if (totalCnt == null || totalCnt == 0) {
			alert("데이터가 없습니다.");
			return;
		}

		var list = $("#roomWare_List").val();
		var pagingnavi = getPaginationHtml(currentPage, totalCnt, PageSize,
				PageBlock, 'roomWareList', [ list ]);
		$("#pagingnavi").empty().append(pagingnavi);

		// 현재 페이지 설정 
		$("#currentPage").val(currentPage);
	}
	
		//장비등록 모달 팝업
	function wareInsertBtn(seq,room){
		//신규 등록
		if (seq == null || seq == "") {
			$("#btnUpdateWare").hide();
			$("#btnSaveWare").show();
			var roomNo=$("#roomNo").val();
			if(roomNo==""){
				alert("등록할 장비의 강의실을 선택 해주세요!");
				return;
			}
			
			$("#wdRoom").val(roomNo);
			gfModalPop("#roomWareModal");
		}else if(seq!=null) {
		 	var param = {
				    seq : seq
				  }; 
				 var resultCallback = function(data){
					 alert(data.resultMsg);
					 detailReadResult(data);
				 };
				callAjax("/manageF/readWareDetail.do", "post", "json", true, param, resultCallback);
		}
	}
		
		
	function detailReadResult(data){
		if(data.resultMsg == "READ"){
			 $("#btnSaveWare").hide();
			 $("#btnUpdateWare").show();
			 $("#btnDeleteWare").show();
			 gfModalPop("#roomWareModal");
			dataSetPopModal(data.resultOneWare);
		 }else{
			 alert("조회 할수가 업습니다.");
		 }
	}
	
	//데이타 리셋||셋팅
	function dataSetPopModal(object){
		var writer = $("#name").val();
		$("#l_name").val(writer);
		$("#l_name").attr("readonly", true);
		
		 if(object == "" || object == null || object == undefined){
				
				$("#wdRoom").val("");
				$("#Wccount").val("");
				$("#Wname").val("");
				$("#Wetc").val("");
				$("#Wseq").val("");
		 }else{
				$("#wdRoom").val(object.room);
				$("#Wccount").val(object.ccount);
				$("#Wname").val(object.name);
				$("#Wetc").val(object.etc);
				$("#Wseq").val(object.seq);
		 }
	}
	
	//신규 장비 등록
	function insertWare(action){
		if(action=="I"){
				aelrt("입력");
				var roomNo=$("#roomNo").val();
			 	if(!ValidateWare()){
					return;
				} 
				var resultCallback = function(data){
					 var currentPage = currentPage || 1; 
					 if(data.resultMsg=="INSERT"){
						 gfCloseModal();
						 wareResult(data);
					 }
					 
				 };
				callAjax("/manageF/InsertWareInfo.do", "post", "json", true, $("#frmWareModal").serialize(), resultCallback);
			}else if (action="U") {
				alert($("#frmWareModal").serialize());
				var resultCallback = function(data){
					 var currentPage = currentPage || 1; 
					 if(data.resultMsg=="UPDATE"){
						 gfCloseModal();
						 wareResult(data);
					 }
				 };	
				callAjax("/manageF/updateWareInfo.do", "post", "json", true, $("#frmWareModal").serialize(), resultCallback);
			
			}
	}
		
	
	function wareResult(data){
		var currentPage = currentPage || 1; 
		var roomNo=data.room;
		switch (data.resultMsg) {
			case "INSERT":
				alert("저장 되였습니다.");
				break;
				
			case "READ":
				alert("조회 되였습니다.");
				break;
				
			case "UPDATE":
				alert("수정 되였습니다.");
				break;
				

		}
		 gfCloseModal();	// 모달 닫기
		 roomWareList(roomNo,currentPage); // 목록조회 함수 다시 출력 
		
	}
	
	
	/*장비 파트  end*/
 	
 
 
</script>


</head>
<body>


<form id="roomform" action="">
	<input type="hidden" id="currentPage" value="1">
	<input type="hidden" id="lectureRoom_list" value="">
	<input type="hidden" id="roomNo" value="">
	
	
			<div id="wrap_area">
	
			<h2 class="hidden">header 영역</h2>
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
	
			<h2 class="hidden">컨텐츠 영역</h2>
			<div id="container">
				<ul>
					<li class="lnb">
						<!-- lnb 영역 --> 
						<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
					</li>
					<li class="contents">
						<!-- contents -->
						<h3 class="hidden">contents 영역</h3> <!-- content -->
						<div class="content">
	
							<p class="Location">
								<a href="#" class="btn_set home">메인으로</a> 
								<a href="#" class="btn_nav">물품관리</a> 
								<span class="btn_nav bold">강의실 관리</span> 
								<a href="#" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span style="margin-right:70%">강의실 관리</span>
		                        <a href="" class="btnType blue" id="roomInsertBtn" name="btn"><span >등&emsp;록</span></a> 
							</p>
							
						<!--검색창  -->
						<table width="100%" cellpadding="5" cellspacing="0" border="1" style="border-collapse: collapse; border: 1px #50bcdf;">
	                        <tr style="border: 0px; border-color: blue; align-content: center; " >
	                        <td style="width: 80px; margin-left: 50px">강의실&nbsp;
	                         <input type="text" style="width: 150px; height: 30px;" id="serchKey" name="serchKey"></td>                     
	                           <td width="50" height="60" style="font-size: 120%; margin-right:90px;">
	                           <a href="" class="btnType blue" id="roomSearchBtn" name="btn"><span>검  색</span></a></td> 
	                        </tr>
	                     </table>    
							
							<div class="divComGrpCodList">
								<table class="col">
									<thead>
										<tr>
											<th width="15%">강의실 번호</th>
											<th width="20%">강의실 명</th>
											<th width="25%">수용인원/현 인원</th>
											<th width="30%">비고</th>
										</tr>
									</thead>
									<tbody id="LectureRoomList"></tbody>
								</table>
								
								<!-- 페이징 처리  -->
								<div class="paging_area" id="pagingnavi">
									<div class="paging">
										<a class="first" href="javascript:LectureRoomList(1)">
										<span class="hidden">맨앞</span></a>
										<a class="pre" href="javascript:LectureRoomList(1)">
										<span class="hidden">이전</span></a>
										<strong>1</strong> 
										<a href="javascript:LectureRoomList(2)">2</a> 
										<a href="javascript:LectureRoomList(3)">3</a> 
										<a href="javascript:LectureRoomList(4)">4</a>
										<a href="javascript:LectureRoomList(5)">5</a>
										<a class="next" href="javascript:LectureRoomList(5)">
										<span class="hidden">다음</span></a>
										<a class="last" href="javascript:LectureRoomList(5)">
										<span class="hidden">맨뒤</span></a>
									</div>
								</div>
								
								
								<!--***********장비 관리*************  -->
								<p class="conTitle mt50">
									<span style="margin-right:70%">장비 관리</span>
			                        <a href="javascript:wareInsertBtn();" class="btnType blue" id="roomWareInsertBtn" name="modal"><span >장 비 등 록</span></a> 
								</p>
								
								<div class="roomWareListDIV">
									<table class="col">
										<thead>
											<tr>
												<th width="15%">강의실 번호</th>
												<th width="35%">장비명</th>
												<th width="20%">PCS</th>
												<th width="40%">비고</th>
											</tr>
										</thead>
										<tbody id="roomWareList">
											<tr>
												<td colspan="4">그룹코드를 선택해 주세요.</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!--***********장비 관리*************  -->
								
							</div>
						</div> <!--// content -->
					</li>
				</ul>
			</div>
		</div>
	</form>
	
	
<!--강의실 등록폼  Start-->
	<form name="frmRoomWare" action="" method="" id="frmRoomModal">
		<input type="hidden" id="loginID" value="${loginId}"> 
		<input type="hidden" id="name" value="${writer}">
		<!--등록 팝엄창  -->
		<div id="roomModal" class="layerPop layerType2" style="width: 600px;">
			<dl>
				<dt>
					<strong style="font-size:15px;">강 의 실 등 록</strong>
				</dt>
				<dd class="content">
					<table class="row">
						<caption>caption</caption>
						<tr>
							<th scope="row">강의실 번호</th>
							<td ><input type="text" class="inputTxt p100" name="room" id="room" /></td>
						</tr>
						<tr>
							<th scope="row">강의실 명</th>
							<td ><input type="text" class="inputTxt p100" name="name" id="name" /></td>
						</tr>
						<tr>
							<th scope="row">정원</th>
							<td ><input type="text" class="inputTxt p100" name="ccount" id="ccount" /></td>
						</tr>
						<tr>
							<th scope="row">비고</th>
							<td ><input type="text" class="inputTxt p100" name="etc" id="etc" /></td>
						</tr>
						</tbody>
					</table>

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSave" name="btn"><span>저	장</span></a> 
						<a href="" class="btnType blue" id="btnCancel" name="btn"><span>취 소</span></a>
					</div>

				</dd>
			</dl>
		</div>
	</form>
	<!--강의실 등록폼 END -->
	
	<!--강의실장비 등록폼START  -->
	<form name="frmWareModal" action="" method="" id="frmWareModal">
		<input type="text" id="loginID" value="${loginId}"> 
		<input type="hidden" id="roomWare_List" value="">
		<input type="hidden" id="wRoom" value="${room}">
		<input type="hidden" id="seq" value="">
		<!--등록 팝엄창  -->
		<div id="roomWareModal" class="layerPop layerType2" style="width: 800px;">
			<dl>
				<dt>
					<strong style="font-size:15px;">장 비 등 록</strong>
				</dt>
				<dd class="content">
					<table class="row">
						<caption>caption</caption>
						<tr>
							<th scope="row">강의실 번호</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="wdRoom" id="wdRoom" readonly/>
								<input type="text" class="inputTxt p100" name="Wseq" id="Wseq" readonly/>
							</td>
						</tr>
						<tr>
							<th scope="col">장비명</th>
							<td ><input type="text" class="inputTxt p100" name="Wname" id="Wname" /></td>
							<th scope="row">갯수</th>
							<td ><input type="text" class="inputTxt p100" name="Wccount" id="Wccount" /></td>
						</tr>
						<tr>
							<th scope="row">비고</th>
							<td colspan="3"><textarea class="inputTxt p100" name="Wetc" id="Wetc"> </textarea></td>
						</tr>
					</table>

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSaveWare" name="btn"><span>저	장</span></a> 
						<a href="" class="btnType blue" id="btnUpdateWare" name="btn"><span>수 정</span></a> 
						<a href="" class="btnType blue" id="btnDeleteWare" name="btn"><span>삭 제</span></a> 
						<a href="" class="btnType blue" id="btnCancelWare" name="btn"><span>취 소</span></a>
					</div>

				</dd>
			</dl>
		</div>
	</form>
	<!--강의실장비 등록폼END  -->
	
	<!--등록 팝엄창  -->
	
	
</body>
</html>