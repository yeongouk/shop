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
				case 'btnSaveGrpCod' :
					fSaveGrpCod();
					break;
				case 'btnDeleteGrpCod' :
					fDeleteGrpCod();
					break;
				case 'btnSaveDtlCod' :
					fSaveDtlCod();
					break;
				case 'btnDeleteDtlCod' :
					fDeleteDtlCod();
					break;
				case 'searchBtn' : board_search();  // 검색하기
				break;
				case 'btnCloseGrpCod' :
				case 'btnCloseDtlCod' :
					gfCloseModal();
					break;
			}
		});
	}
	
	
	


	
	/** 수업관리 리스트 조회 */
	function fListComnGrpCod(currentPage) {
		
		currentPage = currentPage || 1;
		
		var searchBox = $('#searchBox');
	
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeComnGrpCod
		}
		
		var resultCallback = function(data) {
			flistGrpCodResult(data, currentPage);
		};
		
		callAjax("/manageA/listLectureMgt.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 그룹코드 조회 콜백 함수 */
	function flistGrpCodResult(data, currentPage) {
		
		//alert(data);
		
		// 기존 목록 삭제
		$('#listLectureMgt').empty();
		//$('#listComnGrpCod').find("tr").remove() 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listLectureMgt = $data.find("#listLectureMgt");		
		$("#listLectureMgt").append($listLectureMgt.children());
		
		// 총 개수 추출
		var $totalCntComnGrpCod = $data.find("#totalCntComnGrpCod");
		var totalCntComnGrpCod = $totalCntComnGrpCod.text(); 
		
		var list = $("#tmpListDtl").val();
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntComnGrpCod, pageSizeComnGrpCod, pageBlockSizeComnGrpCod, 'fListComnGrpCod',[list]);
		
		//alert(paginationHtml);
		$("#comnGrpCodPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageExsubject").val(currentPage);
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
			 alert("휴학신청완료.");
		 }else if(data.resultMsg == "DELETE") {
			 alert("삭제 되었습니다.");
		 }else{
			 alert(data.resultMsg); //실패시 이거 탄다. 
			 alert("실패 했습니다.");
		 }
		 //fListComnGrpCod();
		 //gfCloseModal();	// 모달 닫기
		// fListComnGrpCod(currentPage); // 목록조회 함수 다시 출력 
		// fInitFormDtlCod();// 입력폼 초기화
	 }
	
	
	/* 휴강신청 */
	 function fUpdateAward(no,loginID,currentPage){
		
		 currentPage = currentPage || 1;
		
		// 그룹코드 정보 설정
			$("#no").val(no);
			$("#loginID").val(loginID);
		
			
			var param = {
						no : no
					,	loginID : loginID
					,	currentPage : currentPage
					,	pageSize : pageSizeComnDtlCod
			}
		
	 var resultCallback = function(data){
			 fSaveAwardResult(data);
		 };
		 
		 
		 $("#action").val("U");  // update
		 
		 callAjax("/manageA/AdviceMgtSave.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	 
	 }
	
	
	/** 휴강신청 목록 조회 */
	function fListComnDtlCod(currentPage, no) {
		
		currentPage = currentPage || 1;
		
		// 그룹코드 정보 설정
		$("#tmpGrpCod").val(no);
	
		
		var param = {
					no : no
				,	currentPage : currentPage
				,	pageSize : pageSizeComnDtlCod
		}
		
		var resultCallback = function(data) {
			flistDtlCodResult(data, currentPage);
		};
		
		callAjax("/manageA/listLectureMgtDtl.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 수강인원 조회 콜백 함수 */
	function flistDtlCodResult(data, currentPage) {
		
		// 기존 목록 삭제
		$('#listLectureMgtDtl').empty(); 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listLectureMgtDtl = $data.find("#listLectureMgtDtl");		
		$("#listLectureMgtDtl").append($listLectureMgtDtl.children());
		
		// 총 개수 추출
		var $totalCntComnDtlCod = $data.find("#totalCntComnDtlCod");
		var totalCntComnDtlCod = $totalCntComnDtlCod.text(); 
		
		// 페이지 네비게이션 생성
		var no = $("#tmpGrpCod").val();
		//var grp_cod_nm = $("#tmpGrpCodNm").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCntComnDtlCod, pageSizeComnDtlCod, pageBlockSizeComnDtlCod, 'fListComnDtlCod', [no]);
		$("#comnDtlCodPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageExsubjectDtl").val(currentPage);
	}
	
	//검색  
	 function board_search(currentPage) {
	      
	      currentPage = currentPage || 1;
	         
	         var searchBox = $('#searchBox');
	         var a_such = $('#a_such option:selected').val();
	        /*  var title = $('#title');
	         var no = $('#no');
	         var loginID = $('#loginID'); */
	       
	         
	         var param = {
	        		//	 title : title.val()
	   			   // ,	 no : no.val() */
	     		//   ,	 loginID : loginID.val()	              
	     		   		 searchBox : searchBox.val()	              
	     		   ,	 a_such : a_such	              
	               ,  	 currentPage : currentPage
	               ,  	 pageSize : pageSizeComnGrpCod
	         }
	         
	         var resultCallback = function(data) {
	        	 flistGrpCodResult(data, currentPage); 
	         };
	         
	         callAjax("/manageA/listLectureMgt.do", "post", "text", true,  param, resultCallback);
	         
	         alert("검색되었습니다.");
	   } 
		
		/** 수강인원 단건 조회 콜백 함수*/
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
		
		
		
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageComnGrpCod" value="1">
	<input type="hidden" id="currentPageComnDtlCod" value="1">
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" name="no" id="no" value="">
	<input type="hidden" name="loginID" id="loginID" value="">
	<!-- <input type="hidden" name="a_such" id="a_such" value=""> -->
	<input type="hidden" name="title" id="title" value="">
	<!-- <input type="hidden" name="searchBox" id="searchBox" value=""> -->
	
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
								class="btn_nav">관리자페이지</a> <span class="btn_nav bold">수강목록
								관리</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>
						<p class="conTitle">
							<span>수강목록 관리 </span> 
				            </p>
						 <table>
												<tr>
													<td><select id="a_such" name="a_such">
															<option value="">선택</option>
															<option value="title">과목명</option>
															<option value="no">강의번호</option>
															<option value="loginID">강사명</option>
													</select> <input type="text" style="width: 150px; height: 30px;"
														id="searchBox" name="searchBox"></td>
													<td width="50" height="60" style="margin-left:800px; font-size: 120;"><a
														href="" class="btnType blue" id="searchBtn" name="btn" ><span>검 색</span></a></td>
												</tr>
											</table> 
						
						<!--검색창  -->
						<!--  <table width="100%" cellpadding="5" cellspacing="0" border="1"align="left" style="border-collapse: collapse; border: 1px #50bcdf;">
                         <tr style="border: 0px; border-color: blue">
                           <td style="font-size: 100%">
                           <select id = "a_such" name = "a_such">
                                <option value="title">강의명</option>
                                <option value="no">강의번호</option>
                                <option value="loginID">담당교수</option>
                            </select>
                            <input type="text" style="width: 150px; height: 30px;" style="font-size: 100%" id="title" name="title"></td>         
                          
                           <td width="50" height="60" style="margin-left:800px; font-size: 120;">
                           <a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a></td>
						
						</tr>
						</table>  -->
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="6%">
									<col width="6%">
									<col width="14%">
									<col width="14%">
									<col width="5%">
									<col width="10%">
									<col width="10%">
								
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">강의번호</th>
										<th scope="col">강의명</th>
										<th scope="col">담당교수</th>
										<th scope="col">강의실</th>
										<th scope="col">수강인원</th>									
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody id=listLectureMgt></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="comnGrpCodPagination"> </div>
	
						<p class="conTitle mt50">
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
									<col width="5%">
									<col width="5%">
									<col width="9%">
									<col width="9%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">강의번호</th>
										<th scope="col">학생명</th>
										<th scope="col">강의명</th>
										<th scope="col">출석율</th>
										<th scope="col">개강일</th>
										<th scope="col">종강일</th>
										<th scope="col">휴강신청</th>

									</tr>
								</thead>
								<tbody id="listLectureMgtDtl">
									<tr>
										<td colspan="12">그룹코드를 선택해 주세요.</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging_area"  id="comnDtlCodPagination"> </div>

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

		
	<!--// 모달팝업 -->
</form>
</body>
</html>