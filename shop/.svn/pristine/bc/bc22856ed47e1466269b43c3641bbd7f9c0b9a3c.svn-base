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

	// 그룹코드 페이징 설정
	var pageSizeComnGrpCod = 5;
	var pageBlockSizeComnGrpCod = 5;
	
	// 상세코드 페이징 설정
	var pageSizeComnDtlCod = 5;
	var pageBlockSizeComnDtlCod = 10;
	
	// 상세코드 페이징 설정2
	var pageSizeComnDtlCod2 = 5;
	var pageBlockSizeComnDtlCod2 = 10;
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 그룹코드 조회
		fListComnGrpCod();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	
	/* 버튼 이벤트 등록 - 저장, 수정, 삭제  */
	function fRegisterButtonClickEvent(){
		$('a[name=btn]').click(function(e){
			e.preventDefault(); // ?? 
					
			var btnId = $(this).attr('id');
			
			//alert("btnId : " + btnId);
			
			switch(btnId){
			case 'btnSaveDtlCod' : fSaveAward(); // save 안에 저장,수정
				//alert("저장버튼 클릭!!!이벤트!!");
				break;
			case 'btnDeleteDtlCod' : fDeleteAward();	// 만들자 
				//alert("삭제버튼 클릭!!!이벤트!!");		
				break;
			case 'btnCloseDtlCod' : gfCloseModal();  // 모달닫기 
			fListComnGrpCod(); // 첫페이지 다시 로딩 
				break;
			case 'btnUpdateDtlCod' : fUpdateAward();  // 수정하기
				break;
			case 'searchBtn' : board_search();  // 검색하기
			break;
			case 'btnCloseGrpCod' :
			//case 'btnCloseDtlCod' :
				gfCloseModal();
				
			//case 'commentWrite' : fCommentInsert();   // 댓글--> 답변글로 변경 // 저장 
				//break;
			}
		});
	}
	
	
	
	/* 저장 ,수정, 삭제 콜백 함수 처리  */   
	 function fSaveAwardResult(data){
		 var currentPage = currentPage || 1; 
		 
		 if($("#action").val() != "I"){
			 currentPage = $("#currentPage").val();
		 }
		 
		 if(data.resultMsg == "SUCCESS"){
			 //alert(data.resultMsg);	// 받은 메세지 출력 
			 alert("저장 되었습니다.");
		 }else if(data.resultMsg == "UPDATE") {
			 alert("수정 되었습니다.");
		 }else if(data.resultMsg == "DELETE") {
			 alert("삭제 되었습니다.");
		 }else{
			 alert(data.resultMsg); //실패시 이거 탄다. 
			 alert("실패 했습니다.");
		 }
		 
		 gfCloseModal();	// 모달 닫기
		 fListComnGrpCod(currentPage); // 목록조회 함수 다시 출력 
		 fInitFormDtlCod();// 입력폼 초기화
	 }
	

	
	/** 강의목록 조회 */
	function fListComnGrpCod(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeComnGrpCod
		}
		
		var resultCallback = function(data) {
			flistGrpCodResult(data, currentPage);
		};
		
		callAjax("/supportA/listAwardMgt.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 강의목록 조회 콜백 함수 */
	function flistGrpCodResult(data, currentPage) {
		
		//alert(data);
		
		// 기존 목록 삭제
		$('#listAwardMgt').empty();
		//$('#listComnGrpCod').find("tr").remove() 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listAwardMgt = $data.find("#listAwardMgt");		
		$("#listAwardMgt").append($listAwardMgt.children());
		
		// 총 개수 추출
		var $totalCntAwardMgt = $data.find("#totalCntAwardMgt");
		var totalCntAwardMgt = $totalCntAwardMgt.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntAwardMgt, pageSizeComnGrpCod, pageBlockSizeComnGrpCod, 'fListComnGrpCod');
		
		//alert(paginationHtml);
		$("#comnGrpCodPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageComnGrpCod").val(currentPage);
	}

	
	/** 강의목록 저장 */
	function fSaveGrpCod() {

		// vaildation 체크
		if ( ! fValidateGrpCod() ) {
			return;
		}
		
		var resultCallback = function(data) {
			fSaveGrpCodResult(data);
		};
		
		callAjax("/supportA/saveAwardMgt.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
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
	
	
	/** 수상정보 모달 실행 */
	function fPopModalComnDtlCod(seq) {
	
		// 신규 저장
		if (seq == null || seq=="") {
				
			// Tranjection type 설정
			$("#action").val("I");
			// 수상정보 폼 초기화
			fInitFormDtlCod(seq);		
			// 모달 팝업
			gfModalPop("#layer2");

		// 수정 저장
		} else {
			//alert("####모달실행!!!!!!########");
			// Tranjection type 설정
			$("#action").val("U");
			
			// 수상정보 단건 조회
			fSelectDtlCod(seq);
		}
	}
	
	//검색  
	 function board_search(currentPage) {
	      
	      currentPage = currentPage || 1;
	         
	         var title = $('#title');
	       
	         
	         var param = { title : title.val()	              
	               ,   currentPage : currentPage
	               ,   pageSize : pageSizeComnGrpCod
	         }
	         
	         var resultCallback = function(data) {
	        	 flistGrpCodResult(data, currentPage); 
	         };
	         
	         callAjax("/supportA/listAwardMgt.do", "post", "text", true, param, resultCallback);
	         
	         alert("검색되었습니다.");
	   } 
	
	
	/** 수강인원 목록 조회 */
	function fListComnDtlCod(currentPage, no, loginID) {
		
		currentPage = currentPage || 1;
		
		// 그룹코드 정보 설정
		$("#tmpGrpCod").val(no);
		$("#tmpGrpCodNm").val(loginID);
		
		var param = {
					no : no
				,	currentPage : currentPage
				,	pageSize : pageSizeComnDtlCod
		}
		
		var resultCallback = function(data) {
			flistDtlCodResult(data, currentPage);
		};
		
		callAjax("/supportA/listAwardMgtDtl.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 수강인원 조회 콜백 함수 */
	function flistDtlCodResult(data, currentPage) {
		
		// 기존 목록 삭제
		$('#listAwardMgtDtl').empty(); 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listAwardMgtDtl = $data.find("#listAwardMgtDtl");		
		$("#listAwardMgtDtl").append($listAwardMgtDtl.children());
		
		// 총 개수 추출
		var $totalCntAwardMgtDtlCod = $data.find("#totalCntAwardMgtDtlCod");
		var totalCntAwardMgtDtlCod = $totalCntAwardMgtDtlCod.text(); 
		
		// 페이지 네비게이션 생성
		var no = $("#tmpGrpCod").val();
		var loginID = $("#tmpGrpCodNm").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCntAwardMgtDtlCod, 
				pageSizeComnDtlCod, pageBlockSizeComnDtlCod, 'fListComnDtlCod', [no]);
		$("#comnDtlCodPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageComnDtlCod").val(currentPage);
	}
	
	
	/** 수상정보 목록 조회2 */
	function fListComnDtlCod2(currentPage, loginID, reg_date) {
		
		currentPage = currentPage || 1;
		
		// 그룹코드 정보 설정
		$("#tmpGrpCod2").val(loginID);
		$("#tmpGrpCodNm2").val(reg_date);
		
		var param = {
					loginID : loginID
				,	currentPage : currentPage
				,	pageSize : pageSizeComnDtlCod2
		}
		
		var resultCallback = function(data) {
			flistDtlCodResult2(data, currentPage);
		};
		
		callAjax("/supportA/listAwardMgtDtl2.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 수상정보 조회 콜백 함수 2*/
	function flistDtlCodResult2(data, currentPage) {
		
		// 기존 목록 삭제
		$('#listAwardMgtDtl2').empty(); 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listAwardMgtDtl2 = $data.find("#listAwardMgtDtl2");		
		$("#listAwardMgtDtl2").append($listAwardMgtDtl2.children());
		
		// 총 개수 추출
		var $totalCntAwardMgtDtlCod2 = $data.find("#totalCntAwardMgtDtlCod2");
		var totalCntAwardMgtDtlCod2 = $totalCntAwardMgtDtlCod2.text(); 
		
		// 페이지 네비게이션 생성
		var loginID = $("#tmpGrpCod2").val();
		var reg_date = $("#tmpGrpCodNm2").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCntAwardMgtDtlCod2, 
				pageSizeComnDtlCod2, pageBlockSizeComnDtlCod2, 'fListComnDtlCod2', [loginID]);
		$("#comnDtlCodPagination2").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageComnDtlCod2").val(currentPage);
	}
	

	
	/** 수상정보 상세 조회 */
	function fSelectDtlCod(seq) {

		var param = {seq : seq};
		var resultCallback = function(data) {
			fSelectDtlCodResult(data);
		};
		
		callAjax("/supportA/selectAwardMgtDtl.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 수상정보 단건 조회 콜백 함수*/
	function fSelectDtlCodResult(data) {

		if (data.result == "SUCCESS") {

			
			//폼 데이터 설정
			fInitFormDtlCod(data.awardMgtDtlModel);
			
			// 모달 팝업
			gfModalPop("#layer2");
			
			
			
			//fSelectDtlCod(date.result);
			
		} else {
			alert(data.resultMsg);
		}	
	}
	
	/** 수상팝업 폼 초기화 or내용뿌리기*/
	function fInitFormDtlCod(object) {
	
		 
		if( object == "" || object == null || object == undefined) {
			
			
		  	$("#loginID").val("");
		  	$("#no").val("");
		  	$("#reg_date").val("");
		  	$("#seq").val("");
		  	
			$("#certno").val("");
			
			$("#btnDeleteDtlCod").hide(); // 삭제버튼 숨기기
			$("#btnUpdateDtlCod").hide();
			$("#btnSaveDtlCod").show();
			
			
		} else {  

			$("#loginID").val(object.loginID);
			$("#loginID").attr("readonly", true);
			$("#no").val(object.no);
			$("#no").attr("readonly", true);
			$("#reg_date").val(object.reg_date);
	
			$("#certno").val(object.certno);
			$("#seq").val(object.seq);
			$("#seq").attr("readonly", true);
			$("#btnDeleteDtlCod").show(); // 삭제버튼 보이기 
			$("#btnSaveDtlCod").hide();
			$("#btnUpdateDtlCod").css("display","");
			
		}
	}
	
	 /* 공지사항 등록(저장) */
	 function fSaveAward(){
		 
		 //alert("저장 함수 타는지!!!!!?? ");
		 // validation 체크 
		// if(!(fValidatePopup())){ return; }
		 
		 var resultCallback3 = function(data){
			 fSaveAwardResult(data);
		 };
		 
		 $("#action").val("I");  // insert
		 
		 callAjax("/supportA/AwardMgtSave.do", "post", "json", true, $("#myForm").serialize(), resultCallback3);
	 	// $("#myNotice").serialize() => 직렬화해서 name 값들을 그냥 넘김.
	 }
	
	
	 /* 공지사항 등록(수정) */
	 function fUpdateAward(){
		 
		 //alert("수정  함수 타는지!!!!!?? ");
		 // validation 체크 
		// if(!(fValidatePopup())){ return; }
		 
		 var resultCallback3 = function(data){
			 fSaveAwardResult(data);
		 };
		 
		 $("#action").val("U");  // update
		 
		 callAjax("/supportA/AwardMgtSave.do", "post", "json", true, $("#myForm").serialize(), resultCallback3);
	 
	 }
	 
	 /* 공지사항 게시판 1건 삭제 */
	 function fDeleteAward(){
		 var con = confirm("정말 삭제하겠습니까? \n 삭제시 복구불가합니다."); 
		 if(con){
			 var resultCallback3 = function(data){
				 fSaveAwardResult(data);
			 }
			 $("#action").val("D");  // delete
			 callAjax("/supportA/AwardMgtSave.do", "post", "json", true, $("#myForm").serialize(), resultCallback3);
			 // num만 넘겨도되지만 그냥 귀찮으니깐...^^... 
		 }else{
			 gfCloseModal();	// 모달 닫기
			 fListComnGrpCod(currentPage); // 목록조회 함수 다시 출력 
			 fInitFormDtlCod();// 입력폼 초기화
		 }
	 }

</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageComnGrpCod" value="1">
	<input type="hidden" id="currentPageComnDtlCod" value="1">
	<input type="hidden" id="currentPageComnDtlCod2" value="1">
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
	<input type="hidden" id="tmpGrpCod1" value="">
	<input type="hidden" id="tmpGrpCodNm2" value="">
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
								class="btn_nav">관리자페이지</a> <span class="btn_nav bold">상장
								관리</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>
						<p class="conTitle">
							<span>상장 관리 </span> 
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
                            <input type="text" style="width: 200px" id="title" name="title"></td>                     
                          
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
									<col width="6%">
									<col width="6%">
									<col width="6%">
									<col width="14%">
									<col width="14%">																
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">강의번호</th>
										<th scope="col">과정명</th>
										<th scope="col">시작일</th>
										<th scope="col">마감일</th>

									</tr>
								</thead>
								<tbody id="listAwardMgt"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="comnGrpCodPagination"> </div>
	
						<p class="conTitle mt30">
							<span>수강인원</span> <span class="fr"> 								
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
										<th scope="col">순번</th>
										<th scope="col">강의번호</th>
										<th scope="col">학생명</th>
										<th scope="col">시험점수</th>



									</tr>
								</thead>
								<tbody id="listAwardMgtDtl">
									<tr>
										<td colspan="12">그룹코드를 선택해 주세요.</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging_area"  id="comnDtlCodPagination"> </div>
						
						<p class="conTitle mt50">
							<span>수상정보</span> <span class="fr"> <a
								class="btnType blue"  href="javascript:fPopModalComnDtlCod();" name="modal"><span>신규등록</span></a>
							</span>
						</p>
	
						<div class="divComDtlCodList2">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="6%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
																
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">학생명</th>
										<th scope="col">상장번호</th>
										<th scope="col">수상명</th>
										<th scope="col">수상일자</th>
										


									</tr>
								</thead>
								<tbody id="listAwardMgtDtl2">
									<tr>
										<td colspan="12">그룹코드를 선택해 주세요.</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging_area"  id="comnDtlCodPagination2"> </div>

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="layer2" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>상세코드 관리</strong>
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
							<th scope="row">강의번호 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="no" name="no" /></td>
							<th scope="row">학생이름 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="loginID" name="loginID" /></td>
							</tr>
							<tr>
							<th scope="row">순번 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="seq" name="seq" /></td>
							<th scope="row">수상날짜 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="reg_date" name="reg_date" /></td>
							</tr>
							<tr>
							<th scope="row">수상명 <span class="font_red">*</span></th>
							<td colspan="3">
							<select style="width:100px" id="certno" name="certno">									
									<option value="최우수상">최우수상</option>
									<option value="우수상">우수상</option>
									<option value="장려상">장려상</option>
							</select>
																
							</td>
						</tr>
						
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveDtlCod" name="btn"><span>저장</span></a>
					<a href="" class="btnType blue" id="btnUpdateDtlCod" name="btn" style="display:none"><span>수정</span></a>
					<a href="" class="btnType blue" id="btnDeleteDtlCod" name="btn"><span>삭제</span></a>  
					<a href="" class="btnType gray" id="btnCloseDtlCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>