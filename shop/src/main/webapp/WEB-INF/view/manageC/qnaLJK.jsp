<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	table {
	 border: 1px solid black;
	}
	td {
	 border: 1px solid black;
	}
</style>
<title> Q&A 게시판  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

 
	// 페이징 설정 
	var qNadPageSize = 10;    	// 화면에 뿌릴 데이터 수 
	var qNaPageBlock = 5;		// 블럭으로 잡히는 페이징처리 수
	
	/* onload 이벤트  */
	$(function(){
		// 자유게시판 리스트 뿌리기 함수 
		selectQnAList();
		
		// 버튼 이벤트 등록 (저장, 수정, 삭제, 모달창 닫기)
		fButtonClickEvent();
	});
	
	/* 버튼 이벤트 등록 - 저장, 수정, 삭제  */
	function fButtonClickEvent(){
		$('a[name=btn]').click(function(e){
			e.preventDefault(); // ?? 
					
			var btnId = $(this).attr('id');
			
		//alert("btnId : " + btnId);
			
			switch(btnId){		
			
			case 'btnClose' : gfCloseModal();  // 모달닫기 
			selectQnAList(1); // 첫페이지 다시 로딩 
			break;	
			
			case 'searchBtn' : QnA_search();  // 검색하기
			break;
			
			case 'btnReplyQnA' : fReplyQnAModal();  // 검색하기
			break;
			
			case 'insertBtn' : fQnAModal();  // 글쓰기 버튼 해서 모달 띄우기
			//alert("모달?");
			break;
			
			case 'btnSaveQnA' : QnA_Save();  // 모달 내용 저장하기
			break;
			
			case 'btnUpdateQnA' : QnA_Save();  // 모달 내용 수정하기
			break;
			
			case 'btnReplySaveQnA' : ReplyQnA_Save();  // 모달 내용 수정하기
			break;
			
			case 'btnCommentSave' : CommentQnA_Save();  // 댓글 저장
			break;
			
			case 'btnCommentUpdate' : CommentQnA_Update();  // 댓글 저장
			break;
			
			case 'btnCommentDelete' : CommentQnA_Delete();  // 댓글 저장
			break;
			
			case 'btnDeleteQnA' : 
				$("#action").val("D");
				QnA_Save();  // 모달 내용 삭제하기
			break;
			
			
			
			
			//case 'commentWrite' : fCommentInsert();   // 댓글--> 답변글로 변경 // 저장 
			   //break;
			}
		});
	}
	
	
	 /* 코멘트 qna 등록(수정) */
	 function CommentQnA_Save(){

		 var resultCallback3 = function(data){
			var wno = $("#rwno").val();
			 fQnAModal(wno);
		 };
		 
		 $("#action").val("CI");  // update
		 
		 callAjax("/manageC/qnaLJKSave.do", "post", "json", true, $("#myQnA").serialize(), resultCallback3);
	 	
	 }
	 /* 코멘트 qna 등록(수정) */
	 function CommentQnA_Update(){

		 var resultCallback3 = function(data){
			var wno = $("#rwno").val();
			 fQnAModal(wno);
		 };
		 
		 $("#action").val("CI");  // update
		 
		 callAjax("/manageC/qnaLJKSave.do", "post", "json", true, $("#myQnA").serialize(), resultCallback3);
	 	
	 }
	 /* 코멘트 qna 등록(수정) */
	 function CommentQnA_Delete(){

		 var resultCallback3 = function(data){
			var wno = $("#rwno").val();
			 fQnAModal(wno);
		 };
		 
		 $("#action").val("CI");  // update
		 
		 callAjax("/manageC/qnaLJKSave.do", "post", "json", true, $("#myQnA").serialize(), resultCallback3);
	 	
	 }
	 

	 

	
	/* Q&A 리스트 불러오기  */
	function selectQnAList(currentPage){
		
		currentPage = currentPage || 1;   // or		
		
//alert("지금 현재 페이지를 찍어봅시다. " + currentPage);
		
		var param = {
				currentPage : currentPage ,
				pageSize : qNadPageSize 
		}
		
		console.log(param);
		var resultCallback = function(data){  // 데이터를 이 함수로 넘깁. 
			QnAResult(data, currentPage); 
		}
		
		callAjax("/manageC/qnaLJKList.do","post","text", true, param, resultCallback);
		
	}
	

	 /* Q&A 리스트 data를 콜백함수를 통해 뿌림   */
	 function QnAResult(data, currentPage){
		 
		 // 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
		 $("#qnaList").empty();
		 //alert("데이터!!! " + data);
		 console.log("data !!!! " +  data);
		 
		 //var $data = $( $(data).html() ); // data의 .html()통해서 html구문을 끌어온다.
		 //alert("데이터 찍어보자!!!! " +  $data); // object
		 
		 $("#qnaList").append(data);
		 
		 // 리스트의 총 개수를 추출합니다. 
		 //var totalCnt = $data.find("#totalCnt").text();
		 var totalCnt = $("#totalCnt").val();  // qnaRealList() 에서보낸값 
	 //alert("totalCnt 나와라!!! " + totalCnt);
		 
		 // * 페이지 네비게이션 생성 (만들어져있는 함수를 사용한다 -common.js)
		 // function getPaginationHtml(currentPage, totalCount, pageRow, blockPage, pageFunc, exParams)
		 // 파라미터를 참조합시다. 
		 var list = $("#tmpList").val();
		 //var listnum = $("#tmpListNum").val();
		 var pagingnavi = getPaginationHtml(currentPage, totalCnt, qNadPageSize,qNaPageBlock, 'selectQnAList',[list]);
		 
		 console.log("pagingnavi : " + pagingnavi);
		 // 비운다음에 다시 append 
		 $("#pagingnavi").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 
		 
		 // 현재 페이지 설정 
		 $("#currentPage").val(currentPage);
		 
	 }
	 
	 
	//글쓰기  
	 function QnA_Save(currentPage) {
		
		 var action = $("#action").val();
		
	      //alert(action + "액션?")
	      currentPage = currentPage || 1;
	         
	         var title1 = $('#title1');
	         var from_date = $('#from_date');
	         var to_date = $('#to_date');
	         
	         var param = {
	                   title1 : title1.val()
	               ,   from_date : from_date.val()
	               ,   to_date : to_date.val()
	               ,   currentPage : currentPage
	               ,   pageSize : qNadPageSize
	               ,   action : action
	         }
	         
	         var resultCallback = function(data) {
	        	 QnAInsertResult(data, currentPage); 
	         };
	         
	         callAjax("/manageC/qnaLJKSave.do", "post", "json", true, $("#myQnA").serialize(), resultCallback);
	   } 
	
	 /* 글쓰기 콜백 함수   */
	 function QnAInsertResult(data, currentPage){
		 
		 //alert("저장!!?? ");
		 var currentPage = currentPage || 1; 
		 
		 if($("#action").val() != "I"){
			 currentPage = $("#currentPage").val();
		 }
		 
		 if(data.resultMsg == "INSERT"){
			 //alert(data.resultMsg);	// 받은 메세지 출력 
			 alert("저장 되었습니다.");
		 }else if(data.resultMsg == "UPDATE") {
			 alert("수정 되었습니다.");
		 }else if(data.resultMsg == "DELETE") {
			 alert("삭제 되었습니다.");
		 }else if(data.resultMsg == "REPLY") {
			 alert("답글 저장 되었습니다.");
		 }else if(data.resultMsg == "COMMENT") {
			 alert("댓글 저장 되었습니다.");
		 }else{
			 alert(data.resultMsg); //실패시 이거 탄다. 
			 alert("실패 했습니다.");
		 }
		 
		 if(data.resultMsg == "COMMENT"){
			 alert("얜 모달 안닫음");
			 frealPopModal(wno);// 입력폼 초기화
		 }else{
			 gfCloseModal();	// 모달 닫기
			 frealPopModal();// 입력폼 초기화
		 }
		 
		 selectQnAList(currentPage); // 목록조회 함수 다시 출력 
		 
		 
	 }
	 
	 
	//검색  
	 function QnA_search(currentPage) {
	      
	      currentPage = currentPage || 1;
	         
	         var title1 = $('#title1');
	         var from_date = $('#from_date');
	         var to_date = $('#to_date');
	         
	         var param = {
	                   title1 : title1.val()
	               ,   from_date : from_date.val()
	               ,   to_date : to_date.val()
	               ,   currentPage : currentPage
	               ,   pageSize : qNadPageSize
	         }
	         
	         var resultCallback = function(data) {
	        	 QnAResult(data, currentPage); 
	         };
	         
	         callAjax("/manageC/qnaLJKList.do", "post", "json", true, $("#myQnA").serialize(), resultCallback);
	   } 
	 
	 
	 /* Q&A 모달창(팝업) 실행  */
	 function fQnAModal(wno ,groupWno ,groupOrd ,groupLayer) {
		 
		 $("#rwno").val(wno);
		 $("#groupWno").val(groupWno);
		 $("#groupOrd").val(groupOrd);
		 $("#groupLayer").val(groupLayer);
		 
		 // 신규저장 하기 버튼 클릭시 (값이 null)
		 if(wno == null || wno==""){
			// Tranjection type 설정
			//alert("넘을 찍어보자!!!!!!" + wno);
			
			
			$("#action").val("I"); // insert 
			frealPopModal(wno); // QnA 게시판 초기화 
			
			//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
			gfModalPop("#popUpQnA");
			
		 }else{

			// Tranjection type 설정
			$("#action").val("U");  // update
			fdetailModal(wno); //번호로 -> QnA 상세 조회 팝업 띄우기
		 }

	 }
	 
	 /* Q&A 리플 모달창(팝업) 실행  */
	 function fReplyQnAModal() {
		 
		    var rwno = $("#rwno").val();
		    alert(rwno + "리플 번호");
			frealPopModal();
			gfModalPop("#popUpQnA");
			

	 }
	 /* Q&A 리플 모달창(팝업) 실행  */
	 function ReplyQnA_Save() {
	 
		 var resultCallback3 = function(data){
			 QnAInsertResult(data);
		 };
		 
		 $("#action").val("R");  // insert
		 
		 alert("리플 컨트롤러 직전?");
		
		 callAjax("/manageC/qnaLJKSave.do", "post", "json", true, $("#myQnA").serialize(), resultCallback3);

	 }
	 
	 /*  Q&A 상세 조회  */
	 function fdetailModal(wno){
		 //alert("자유게시판 상세 조회  ");
		 
		 var param = {wno : wno};
		 var resultCallback2 = function(data){
			 fdetailResult(data);
		 };
		 
		 callAjax("/manageC/detailQnAlist.do", "post", "json", true, param, resultCallback2);
		// alert("자유게시판 상세 조회  2");
	 }
	 
	 /*  Q&A 상세 조회 -> 콜백함수   */
	 function fdetailResult(data){

		 if(data.resultMsg == "SUCCESS"){
			 //모달 띄우기 
			 gfModalPop("#popUpQnA");
			 
			// 모달에 정보 넣기 
			frealPopModal(data);
		 
		 }else{
			 alert(data.resultMsg);
		 }
	 }
	 
	 /* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	 function frealPopModal(object){
		 
		 var rwno = $("#rwno").val();
		 
		 if(object == "" || object == null || object == undefined){
			 var writer1= $("#swriter").val();
			// var reg_date =  $("#sreg_date").val();
			//alert("작성자: "+writer1);
			 $("#regId").val(writer1);
			 $("#regId").attr("readonly", true);
			 
			 $("#reg_date").val();
			 //$("#reg_date").attr("readonly", true); 
			 
			 $("#title").val("");
			 $("#note").val("");
			 $("#c_note").val("");

			 $("#btnDeleteQnA").hide(); // 삭제버튼 숨기기
			 $("#btnUpdateQnA").hide();
			 $("#btnReplyQnA").hide();
			 $("#AllComment").hide();
			// $("#CommentTable").hide();
			 //$("#CommentTableBtn").hide();
			 //$("#CommentTableInfo").hide();
			 
			 
			 if(rwno == "" || rwno == null || rwno == undefined){
				 $("#btnSaveQnA").show();
				 $("#btnReplySaveQnA").hide();

			 }else {
				 $("#btnReplySaveQnA").show();
				 $("#btnSaveQnA").hide();

				 
			 }
			 
			 
			 
			// $("#showComment").hide();
			 
		 }else{
			 var result = object.result;
			 var commentList = object.commentList;
			 //var yuri = object.reg_date;
			 //alert("날짜" + yuri);
			 //alert("숫자찍어보세 : " + object.wno);// 페이징 처리가 제대로 안되서 
			 //alert("작성자 찍어보세 : " + object.writer);
			 if(result == null || result =="" || result == undefined){
				 
				 alert("??");
				 
			 }else {
				 alert("!!");
				 
				 $("#c_note").val("");
				 $("#regId").val(result.regId);
				 $("#regId").attr("readonly", true); // 작성자 수정불가 
				 
				 $("#reg_date").val(result.reg_date);
				 $("#reg_date").attr("readonly", true); // 처음 작성된 날짜 수정불가 
				 
				 $("#title").val(result.title);
				 $("#note").val(result.note);
				
				 
				 $("#wno").val(result.wno); // 중요한 num 값도 숨겨서 받아온다. 
				 
			 }
			 
			 $("#btnDeleteQnA").show(); // 삭제버튼 숨기기
			 $("#btnUpdateQnA").show();
			 $("#btnReplyQnA").show();
			 $("#btnReplySaveQnA").hide();
			 $("#btnSaveQnA").hide();
			 $("#AllComment").show();
			 
			 $('#CommentTableListMid').empty(); 
			 	
			 
			//var c_no = ${commentList1.c_no};
			
			
	 		var inserthtml7 = "";
	 		
	 		//alert(commentList);
	 		
	 		if(commentList == null || commentList == "") {
	 			
	 			//alert("노댓글?");
	 			
	 			inserthtml7 +=	"<td colspan='5' align='center' style='border: 1px solid #A4A4A4;'>" +  '댓글이 없습니다.'  + "</td>";
	 			
	 		}else {
	 		    $.each(commentList, function(index, item) {
	 	          inserthtml7 +=			
	 	        	  
	 	        	  
	 				        	 			"<tr style='border: 1px solid black;' height='10'>" + 
	 				         					 "<td style='border: 1px solid #A4A4A4;' height='10'>" + item.c_regId   + "</td>" +
	 				         					 
	 				         					 "<td style='border: 1px solid #A4A4A4;' height='10'>" +
											 			"<textarea class='inputTxt p5' name='c_cnote' id='c_cnote' style='resize: none;'   readonly>" +
	 				         					 		     item.c_note +    
											 			"</textarea>"
		         					 			+ "</td>" +
		         					 			
	 				         					 "<td align='center' style='border: 1px solid #A4A4A4;' height='10'>" +  item.c_reg_date  + "</td>" +
	 				         					 "<td style='border: 1px solid #A4A4A4;' height='10'>" + 
	 				         					 	"<a href='' class='btnType gray'  id='btnClose' name='btn'>" + "<span>수정</span>" + "</a>"
	 				         					 + "</td>" +
	 				         					 "<td style='border: 1px solid #A4A4A4;' height='10'>" + 
	 				         					 	"<a href='' class='btnType gray'  id='btnClose' name='btn'>" + "<span>삭제</span>" + "</a>"
	 				         					 + "</td>" +
	 		       				     	    "</tr>";
	 		     }); 
	 			
	 		}
			 		
 
 		   
			 		
		 	//$("#CommentTableListMid").append($CommentTableListMid.children());
		     $("#CommentTableListMid").empty().append(inserthtml7); 
			 
			 
			// $("#CommentTable").show();
			 //$("#CommentTableBtn").show();
			 //$("#CommentTableInfo").show();
			 
			
			 //if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
			 //$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정
			 //$("#showComment").val(object2.c_note);
			 //$("#showComment").show(); // 코멘트 보이기 
		     selectQnAList();
		 }
	 }
	 
	 function fCommentSaveResult(data) {
		 	/* 
		 	$('#CommentTableListMid').empty(); 
		 	
		 	//var $data = $( $(data).html() );
		 	//var $CommentTableListMid = $data.find("#CommentTableListMid");	
		 	    var persontext = JSON.stringify(data.paymentresult);
		 		var inserthtml7 = "";
		 		var persont = data.paymentresult;
		 		

		 		 $.each(persont, function(index, item) {
		 	         inserthtml7 += 
		 	        	 	
		 				        	 			"<tr>" + 
		 				         					 "<td>" + item.pc_no   + "</td>" +
		 				         					 "<td>" + item.loginID   + "</td>" +
		 				         					 "<td>" + item.seq   + "</td>" +
		 				         					 "<td>" + item.pcuseamt   + "</td>" +
		 				         					 "<td>" + item.foodamt   + "</td>" +
		 				         					 "<td>" + item.totalamt   + "</td>" +
		 				         					 "<td>" + item.cpl_yn   + "</td>" +
		 				         					 "<td>" + 
		 				         					 	"<a href='javascript:fPopModalUserPayment(" + item.loginID + ',' + data.pc_no +',' + item.seq +" );'> "  
		 				         					 	    	+ "<span> 결제 </span>" +
		 				         					 	"</a>"
		 				         					 + "</td>" +
		 		       				     	   "</tr>";
		 	   alert(item.seq);
		 	   });
		 		
		 	//$("#CommentTableListMid").append($CommentTableListMid.children());
		 		 $("#CommentTableListMid").empty().append(inserthtml7); 
		 		  */
		 		 
		 }
	 
	
	/*  
	 // 댓글 저장하기 
	function fCommentInsert(){
		
		alert("댓글 함수 타죠?? "); 
		alert("찍어보자 넘값" + $("#wno").val());   
		 
		// validation 체크  만들기 
		 var resultCallback3 = function(data){
			 fCommentSave(data);
		 };
		 
		$("#action").val("C");  // comments Insert
		 
		 callAjax("/commu/FreeBoard_save.do", "post", "json", true, $("#myFreeBoard").serialize(), resultCallback3);
	 }
	 
	 // 댓글 저장 콜백함수  
	 function fCommentSave(data){
		 alert("저장이 완료되었습니다!"  + data);
	 } */
	 
</script>


</head>
<body>
	<!-- ///////////////////// html 페이지  ///////////////////////////// -->

<form id="myQnA" action="" method="">

	<input type="hidden" id="currentPage" value="1">  <!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
	<input type="hidden" id="tmpList" value=""> 
	<input type="hidden" id="tmpListNum" value=""> <!-- 스크립트에서 값을 설정해서 넘길거임 / 임시 리스트 넘버 -->
	<input type="hidden" name="action" id="action" value=""> <!-- 이것은 무엇에 쓰는 물건인고? -->
	<input type="hidden" id="swriter" value="${writer}"> <!-- 작성자 session에서 java에서 넘어온값 -->
	<input type="hidden" name="rwno" id="rwno" value=""> <!-- 작성자 session에서 java에서 넘어온값 -->
	<input type="hidden" name="groupWno" id="groupWno" value=""> <!-- 작성자 session에서 java에서 넘어온값 -->
	<input type="hidden" name="groupOrd" id="groupOrd" value=""> <!-- 작성자 session에서 java에서 넘어온값 -->
	<input type="hidden" name="groupLayer" id="groupLayer" value=""> <!-- 작성자 session에서 java에서 넘어온값 -->
	

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
							<a href="#" class="btn_nav">커뮤니티</a> 
								<span class="btn_nav bold">QnA</span> 
								<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>QnA </span> <span class="fr"></span>
						</p>
						
					<!--검색창  -->
					<table width="100%" cellpadding="5" cellspacing="0" border="1"
                        align="left"
                        style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>

                           <td width="50" height="25" style="font-size: 100%">제목</td>
                           <td width="50" height="25" style="font-size: 100%">
                            <input type="text" style="width: 120px" id="+1" name="title1"></td>                     
                           <td width="50" height="25" style="font-size: 100%">작성일</td>
                           <td width="50" height="25" style="font-size: 100%">
                            <input type="date" style="width: 120px" id="from_date" name="from_date"></td>
                           <td width="50" height="25" style="font-size: 100%">
                            <input type="date" style="width: 120px" id="to_date" name="to_date"></td>
                          <td width="110" height="60" style="font-size: 120%">
                           <a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a></td> 
                          <td width="110" height="60" style="font-size: 120%">
                           <a href="" class="btnType blue" id="insertBtn" name="btn"><span>글 쓰 기</span></a></td> 
                            
                        </tr>
                     </table>           
						
						
						<div class="divQnAList">
							<table class="col">
								<caption>caption</caption>
									<colgroup>
						                   <col width="40px">
						                   <col width="120px">						                   
						                   <col width="100px">
						                    <col width="80px">
						                   
					                 </colgroup>
	
								<thead>
									<tr>
							              <th scope="col">번호</th>
							              <th scope="col">제목</th>							              
							              <th scope="col">작성일</th>
							              <th scope="col">작성자(직책)</th>
							              
									</tr>
								</thead>
								<!-- ** 이자리에 뿌릴 겁니다. ** -->	
								<tbody id="qnaList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingnavi">
								<div class="paging">
									<a class="first" href="javascript:selectQnAList(1)">
									<span class="hidden">맨앞</span></a>
									<a class="pre" href="javascript:selectQnAList(1)">
									<span class="hidden">이전</span></a>
									<strong>1</strong> 
									<a href="javascript:selectQnAList(2)">2</a> 
									<a href="javascript:selectQnAList(3)">3</a> 
									<a href="javascript:selectQnAList(4)">4</a>
									<a href="javascript:selectQnAList(5)">5</a>
									<a class="next" href="javascript:selectQnAList(5)">
									<span class="hidden">다음</span></a>
									<a class="last" href="javascript:selectQnAList(5)">
									<span class="hidden">맨뒤</span></a>
								</div>
							</div>
											
						</div>

		
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>


	<!-- Q&A게시판 모달팝업 -->
	<div id="popUpQnA" class="layerPop layerType2" style="width: 1000px;">
		<input type="hidden" id="wno" name="wno"> <!-- 수정시 필요한 num 값을 넘김  -->
		
		<dl>
			<dt>
				<strong>QnA게시판</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>

					<tbody>
						<tr>
							<th scope="row">작성자 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="regId" id="regId" /></td>
							</tr>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100" name="title" id="title" /></td>							
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="3">
								<textarea class="inputTxt p100" name="note" id="note" style="resize: none;"></textarea>
							</td>
						</tr>
						
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href=""	class="btnType blue"  id="btnReplyQnA" name="btn"><span>답글 달기</span></a>
					<a href=""	class="btnType blue"  id="btnSaveQnA" name="btn"><span>저장</span></a>
					<a href=""	class="btnType blue"  id="btnReplySaveQnA" name="btn"><span>저장</span></a>
					<a href=""	class="btnType blue"  id="btnUpdateQnA" name="btn"><span>수정</span></a>
					<a href=""	class="btnType blue"  id="btnDeleteQnA" name="btn"><span>삭제</span></a>
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>닫기</span></a>
				</div>
				<div id="AllComment">
					<div align="left" id="CommentTableInfo">
							<img src="/images/site/comment1.png"/><span style="color:red">댓글 목록</span>
					</div>
					<table width="100%" style="border: 1px solid black;" id="CommentTableListBig">
						<thead align="center">
							<tr style="border: 1px solid black;">
								<th width="10%">아이디</th>
								<th width="60%">내용</th>
								<th width="10%">등록일</th>
								<th width="10%">수정</th>
								<th width="10%">삭제</th>
							</tr>
						</thead>
						<tbody id="CommentTableListMid">
						
						</tbody>
					</table>
				
					<table class="row" id="CommentTable">
						<caption>caption</caption>
	
						<tbody>
							<tr width="700">
								<td width="650">
									<textarea class="inputTxt p100" name="c_note" id="c_note" style="resize: none;" placeholder="댓글을 입력하세요"></textarea>
								</td>
								<td class="btnType blue" width="50">
									<a href=""	class="btnType blue"  id="btnCommentSave" name="btn"><span>댓글 저장</span></a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</dd>
		
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>


</form>

</body>
</html>

