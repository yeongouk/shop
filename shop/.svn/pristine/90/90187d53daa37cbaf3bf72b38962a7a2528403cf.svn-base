<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" href="#">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>과제관리</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 과제 리스트  페이징 설정
	var pageSize= 5;
	var pageBlockSize = 10;
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 과제 리스트 조회
		fListHomework();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});

	/** 버튼 이벤트 등록  - */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
			
				case 'searchBtn' : 	homework_search();  // 검색하기
					break;	
				case 'btnCloseGrpCod' :
				case 'btnClose' :	gfCloseModal();
					break;
			}
		});
	}

	
	/** 과제 리스트 불러오기 */
	function fListHomework(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSize
				
		}
		/* console.log(param);
		console.log(keyword); */
		var resultCallback = function(data) {
			flistHomeworkResult(data, currentPage);
		};
		          
		callAjax("/manageD/listHomework.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 목록 조회 콜백 함수 */
	function flistHomeworkResult(data, currentPage) {
		
		//alert(data);		
		// 기존 목록 삭제
		$('#listHomework').empty();
		//$('#listComnGrpCod').find("tr").remove() 
		//console.log("data !!!!!!!!!!!!!!!!!!!!! " +  data);
		 var data = $( $(data).html() );
 
		// 신규 목록 생성
		var listHomework = data.find("#listExamResultDtl");		
		$("#listHomework").append(listHomework.children()); 
		
		
		// 총 개수 추출
		var $totalCntHomework = data.find("#totalCntHomework");
		var totalCntHomework = $totalCntHomework.text();
				
		if (totalCntHomework == null || totalCntHomework == 0) {
			alert("데이터가 없습니다.");
			return;
		}
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntHomework, pageSize, pageBlockSize, 'fListHomework');
		
		// console.log("paginationHtml : " + paginationHtml);
		//alert(paginationHtml);
		$("#Pagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPage").val(currentPage);
	}

	//검색  
	 function homework_search(currentPage) {
	      
	      currentPage = currentPage || 1;
	         
	   	   var nt_title = $('#nt_title');
		   var loginID = $('#loginID');
			
			var param = {
					nt_title : nt_title.val()
				,	loginID : loginID.val()
				,	currentPage : currentPage
				,   pageSize : pageSize
			}
	         
	         var resultCallback = function(data) {
	        	 flistHomeworkResult(data, currentPage); 
	         };
	         
	         callAjax("/manageD/listHomework.do", "post", "text", true, param, resultCallback);
	         
	         //alert("검색되었습니다.");
	   }

	 
	 /* 과제 모달창(팝업) 실행  */
	 function fHomeworkModal(no,seq) {
		 
		 //alert("seq"+seq);
		 
		 // 신규저장 하기 버튼 클릭시 (값이 null)
		 if(seq == null || seq ==""){
			// Tranjection type 설정
			//alert(" 찍어보자!!!!!!" + no);
			
			$("#action").val("I"); // insert 
			frealPopModal(seq); // 공지사항 초기화 
			
			//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
			gfModalPop("#homework");
			
		 }else{
			 
			 //alert("일루?");
			// Tranjection type 설정
			$("#action").val("U");  // update
			fdetailModal(no,seq); //번호로 -> 공지사항 상세 조회 팝업 띄우기
		 }

	 }
	 
	 
	 /*관리 목록 상세 조회*/
	 function fdetailModal(no,seq){
		
		 //alert("공지사항 상세 조회  ");
		 
		 var param = {
				 			no:no,
				         seq : seq
				        
		             };
		 
		 var resultCallback2 = function(data){
			 fdetailResult(data);
		 };
		 
		 callAjax("/manageD/selectHomework.do", "post", "json", true, param, resultCallback2);
		 //alert("공지사항 상세 조회  22");
	 }
	 
	 /*  관리 목록 상세 조회 -> 콜백함수   */
	 function fdetailResult(data){

		 //alert("공지사항 상세 조회  33");
		 if(data.result == "SUCCESS"){
			
			 //alert("들어오나요?!  ");
			// 모달에 정보 넣기 
			frealPopModal(data.Model);
			 //모달 띄우기 
			 gfModalPop("#homework");
		 
		 }else{
			 alert(data.resultMsg);
		 }
	 }
	 
	 /* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	 function frealPopModal(object){
		 
		 if(object == "" || object == null || object == undefined){
			 var writer = $("#swriter").val();
			 //var Now = new Date();
			 
			 $("#loginID").val(writer);
			 $("#loginID").attr("readonly", true);
			 
			 $("#reg_date").val();
			 
			 $("#nt_title").val("");
			 $("#nt_note").val("");
			 
			
			
			 
		 }else{
			 
			 //alert("숫자찍어보세 : " + object.loginID);// 페이징 처리가 제대로 안되서 
			 $("#loginId").val(object.loginID);
			 $("#loginId").attr("readonly", true); // 작성자 수정불가 
			 
			 /* $("#reg_date").val(object.reg_date);
			 $("#reg_date").attr("readonly", true); // 처음 작성된 날짜 수정불가  */
			 
			 $("#title").val(object.nt_title);
			 $("#title").attr("readonly", true); // 처음 작성된 제목 수정불가 
			 
			 $("#note").val(object.nt_note);
			 $("#note").attr("readonly", true); // 처음 작성된 제목 수정불가 
			 
			 
			 
			 $("#no").val(object.no); // 중요한 num 값도 숨겨서 받아온다. 
					 //$("#btnUpdateNotice").css("display","");
			 
			 if(object.filename == "null" || object.filename == null || object.filename == "") {
					
					var downhtml = 	"<span>" + "파일이 없습니다." + " </span>";						
					 $("#filedownload").empty().append(downhtml); // 위에꺼를 첨부합니다. 
					 
				} else {
					
					var downhtml = 	"<a href='javascript:fDownloadRoomFile(" + object.no + "," + object.seq + " );'> "  
				    						+ "<span>" + object.filename + " </span>" +
									"</a>";
					 $("#filedownload").empty().append(downhtml); // 위에꺼를 첨부합니다. 
					
				}
			
			 
		 }
	 }
	 
		// 강의계획서 다운로드
		function fDownloadRoomFile(no,seq) {
			
			
			if(seq == null || seq == "" || seq == "null"){
				
				alert("다운로드 할 파일이 없습니다.");
				
			} else {
			   
			   var params = "";
			   params += "<input type='hidden' name='seq' value='"+ seq +"' />";
			   params += "<input type='hidden' name='no' value='"+ no +"' />";
			   
			   
			   jQuery("<form action='/manageD/documentDown.do' method='post'>"+params+"</form>").appendTo('body').submit().remove();
			   
			}
			   
		}
	 
	 
	
	
	
</script>

</head>
<body>
	<!-- ///////////////////// html 페이지  ///////////////////////////// -->

<form id="myHomework" action=""  method="">
	<input type="hidden" id="currentPageHome" value="1">		
	<!-- <input type="hidden" id="wno" value=""> -->
	<%-- <input type="hidden" id="loginID" value="${loginId}">
	<input type="hidden" id="name" value="${name}"> --%>
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" id="swriter" value="${writer}">
	<!-- 모달 배경 -->

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
							<a href="#" class="btn_set home">메인으로</a> 
							<a href="#" class="btn_nav">학습관리</a> 
								<span class="btn_nav bold">과제관리</span> 
								<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>과제확인</span> <span class="fr">
							</span>
						</p>						
						<table width="100%" cellpadding="5" cellspacing="0" border="1"
							    align="left"
								style="border-collapse: collapse; border: 1px #50bcdf;">
								<tr style="border: 0px; border-color: blue">
									<td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>
									<td width="50" height="25" style="font-size: 100%">제목</td>
									<td width="50" height="25" style="font-size: 100%"><input type="text"
										 style="width: 120px" id="nt_title" name="nt_title">
										 
									</td>
									
									<td width="50" height="25" style="font-size: 100%">작성자</td>
									<td width="50" height="25" style="font-size: 100%">
									<input type="text" style="width: 120px" id="loginID" name=loginID></td>				
																		
									<td width="110" height="60" style="font-size: 120%">
                           			<a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a></td> 
								</tr>
								
							</table>			
								
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<thead>
									<tr>
										<th width="5">강의번호</th>
										<th width="25%">제목</th>
										<th width="10%">작성자</th>
										<th width="20%">제출시간</th>											
										<th width="20%">파일</th>										
									</tr>
								</thead>
								<!-- ** 이자리에 뿌릴 겁니다. ** -->
								<tbody id="listHomework"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area"  id="Pagination"> </div>
							
						</div>	
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
<!--모달팝업 -->	
	<div id="homework" class="layerPop layerType2" style="width: 900px;">
		
		<dl>
			<dt>
				<strong>과제</strong>
			</dt>
			<dd class="content">				
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>			
					
					<tbody>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="title" id="title" /></td>
						</tr>
						<tr>						
							<th scope="row">작성자 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="loginId" id="loginId" /></td>
						</tr>																
						<tr>
							<th scope="row">내용</th>
							<td colspan="3">
								<textarea class="inputTxt p100" name="nt_note" id="note"></textarea>
							</td>
						</tr>
						<tr>	
							<th scope="row">파일명</th>
							<td>
							     <div id="filedownload" name="filedownload">
							     	
							     </div>
							</td>	
						</tr>
					</tbody>
				</table>
				<div class="btn_areaC mt30">
					<a href=""	class="btnType gray"  id="btnCloseGrpCod" name="btn"><span>닫기</span></a>					
				</div>
			</dd>
		</dl>
	</div>

	
</form>
</body>
</html>