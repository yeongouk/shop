<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> Q&A 게시판  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

 
	// 페이징 설정 
	var PageSize = 10;    	// 화면에 뿌릴 데이터 수 
	var PageBlock = 5;		// 블럭으로 잡히는 페이징처리 수
	
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
			
			case 'btnClose' : 
				gfCloseModal();  // 모달닫기 
			    selectQnAList(); // 첫페이지 다시 로딩 
				break;	
			    
			case 'searchBtn' :
				//QnA_search();  // 검색하기
				selectQnAList();
				alert("검색 되었습니다.");
			    break;
			
			case 'btnSave' : 
				fSave();  // save 안에 저장,수정
				break;
				
			case 'btnDelete' : 
				fDelete();	// 만들자 
				break;
			
			case 'btnUpdate' : 
				fUpdate(); // 수정하기
				break;
				
			case 'btnReply' : 
				fReply(); // 답글달기
				break;
				
			case 'btnCommentSave' : 
				fCommentSave(); // 댓글달기
				break;
			}
		});
	}
	
	/* Q&A 리스트 불러오기  */
	function selectQnAList(currentPage){
		
		currentPage = currentPage || 1;   // or		
		
		var title1 = $('#title1');
        var from_date = $('#from_date');
        var to_date = $('#to_date');
		
		var param = {
				       title1 : title1.val()
	               ,   from_date : from_date.val()
	               ,   to_date : to_date.val()
				   ,   currentPage : currentPage 
				   ,   pageSize : PageSize 
		}
		
		console.log(param);
		var resultCallback = function(data){  // 데이터를 이 함수로 넘깁. 
			QnAResult(data, currentPage); 
		}
		
		callAjax("/commuD/qnaList.do","post","text", true, param, resultCallback);
		
	}

	 /* Q&A 리스트 data를 콜백함수를 통해 뿌림   */
	 function QnAResult(data, currentPage){
		 
		 // 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
		 $("#qnaList").empty();
		 //alert("데이터!!! " + data);
		 $("#qnaList").append(data);
		 //alert( $("#usertype").val());
		 
		 console.log("data !!!! " +  data);

		 var totalCnt = $("#totalCnt").val();  // qnaRealList() 에서보낸값 
	
		 var list = $("#tmpList").val();

		 var pagingnavi = getPaginationHtml(currentPage, totalCnt, PageSize, PageBlock, 'selectQnAList',[list]);
		 
		 console.log("pagingnavi : " + pagingnavi);
		 // 비운다음에 다시 append 
		 $("#pagingnavi").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 
		 
		 // 현재 페이지 설정 
		 $("#currentPage").val(currentPage);
		 
	 }
	 
	 
/* 	//검색  
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
	               ,   pageSize : PageSize
	         }
	         
	         var resultCallback = function(data) {
	        	 QnAResult(data, currentPage); 
	         };
	         
	         callAjax("/commuD/qnaList.do", "post", "text", true, param, resultCallback);
	         alert("검색되었습니다.");
	   }  */
	 
	 
	 /* Q&A 모달창(팝업) 실행  */
	 function fQnAModal(wno) {
		 
		 // 신규저장 하기 버튼 클릭시 (값이 null)
		 if(wno == null || wno==""){
			// Tranjection type 설정
			//alert("넘을 찍어보자!!!!!!" + wno);
			
			$("#action").val("I"); // insert 
			frealPopModal(); // QnA 게시판 초기화 
			
			//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
			gfModalPop("#popUpQnA");
			
		 }else{

			// Tranjection type 설정
			$("#action").val("U");  // update
			fdetailModal(wno); //번호로 -> QnA 상세 조회 팝업 띄우기
		 }

	 }
	 

	 
	 /* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	 function frealPopModal(object){
		 
		 
		 var writer1= $("#swriter").val();
		 
		 if(object == "" || object == null || object == undefined){
			
			 
			// var reg_date =  $("#sreg_date").val();
		    //alert("작성자: "+writer1);
			 $("#regId").val(writer1);
			 $("#regId").attr("readonly", true);
			 
			 $("#reg_date").val();
			 //$("#reg_date").attr("readonly", true); 
			 
			 //$("#title").show();
			 $("#title").attr("readonly", false);
			 $("#title").val("");
			 
			 $("#note").attr("readonly", false);
			 $("#note").val("");

			 $("#btnSave").show();
			 $("#btnReply").hide();
			 $("#btnDelete").hide(); 
			 $("#btnUpdate").hide();
			 
			 $("#AllComment").hide();

			// $("#showComment").hide();
			 
		 }else{
			 
			 
			 //alert(writer1+"  "+object.regId);
			 
			 
			 var writer2 = writer1;
			 var writer3 = object.regId;
			 
			 
			if(writer2 == writer3){
					
				
					if(object.groupOrd == 0){
						
						//alert(object.groupOrd);
						
						 $("#btnReply").hide();
						 $("#btnSave").hide();
					 	 $("#btnUpdate").show();
					 	 $("#btnDelete").show();
					 	 
					 	$("#regId").val(object.regId);
						 $("#regId").attr("readonly", true); // 작성자 수정불가 
						
						$("#title").show();
						$("#title").val(object.title);	
						$("#title").attr("readonly", false);
						
						 $("#note").val(object.note);
						 $("#note").attr("readonly", false);

						 $("#wno").val(object.wno);// 중요한 num 값도 숨겨서 받아온다. 
						 
						 $("#AllComment").show();
						 
					}else{
						
						 $("#btnReply").hide();
						 $("#btnSave").hide();
					 	 $("#btnUpdate").show();
					 	 $("#btnDelete").show();
					 	 
					 	$("#regId").val(object.regId);
						 $("#regId").attr("readonly", true); // 작성자 수정불가 
						 
						 
						 
						 $("#title").show();
						 $("#title").val(object.title);
						 $("#title").attr("readonly", true);
						 // $("#title").attr("", true);
						 //$("#title").val("");
						 
						 $("#note").val(object.note);
						 $("#note").attr("readonly", false);

						 $("#wno").val(object.wno);// 중요한 num 값도 숨겨서 받아온다. 
						 
						 $("#AllComment").show();
					} 
					  } 
			else {
					
					$("#btnReply").hide();
					$("#btnSave").hide();
					$("#btnUpdate").hide();
				 	$("#btnDelete").hide();
				 	
				 	$("#regId").val(object.regId);
					 $("#regId").attr("readonly", true); // 작성자 수정불가 
					 
					 //$("#title").show();
					 $("#title").val(object.title);
					 $("#title").attr("readonly", true);
					 
					 $("#note").val(object.note);
					 $("#note").attr("readonly", true);
					 
					 $("#wno").val(object.wno); // 중요한 num 값도 숨겨서 받아온다. 
					 $("#wno").attr("readonly", true);
					
					 $("#AllComment").show();
				  }
		   }
	 }
	 
	 
   function fReplyInit(object){ //(wno, groupWno, groupOrd, groupLayer, title)
   
	     //alert("글번호:"+wno+" 그룹번호:"+groupWno+" 그룹순서:"+groupOrd+" 계층:"+groupLayer+" 제목:"+title);
         //alert("글번호:"+object.wno+" 그룹번호:"+object.groupWno+" 그룹순서:"+object.groupOrd+" 계층:"+object.groupLayer+" 제목:"+object.title);
		 //if(object==""||object==null||object==undefined)

         var writer1= $("#swriter").val();

				 $("#regId").val(writer1);
				 $("#regId").attr("readonly", true);
				 
				 $("#reg_date").val();

				 //$("#title").hide();
				 $("#title").val("");	
				 $("#title").attr("readonly", false);
				 
				 $("#note").attr("readonly", false);
				 $("#note").val("");
				 
				 
				 $("#groupWno").val(object.groupWno);
				 $("#groupOrd").val(object.groupOrd);
				 $("#groupLayer").val(object.groupLayer);
				 $("#wno").val(object.wno);
				 $("#title2").val(object.title);

				 $("#btnSave").hide();
				 $("#btnReply").show();
				 $("#btnDelete").hide(); // 삭제버튼 숨기기
				 $("#btnUpdate").hide();
				 
				 $("#AllComment").hide();
				 

   }
   
   
	 /*  Q&A 해당게시글 정보가져오기(모달) => 답글  */
	 function fReplyModal(wno){

		 var param = {wno : wno};
		 var resultCallback4 = function(data){
			 fReplyResult(data);
		 };
		 
		 callAjax("/commuD/detailQnAlist.do", "post", "json", true, param, resultCallback4);
	 }
	 
	 /*  Q&A 해당게시글 정보가져오기(모달) => 답글    콜백함수   */
	 function fReplyResult(data){

		 if(data.resultMsg == "SUCCESS"){
			 
			// 모달에 정보 넣기 
		     fReplyInit(data.result);
			
			 //모달 띄우기 
			 gfModalPop("#popUpQnA");
			 
		
		 
		 }else{
			 alert(data.resultMsg);
		 }
	 }
	 

	 
	 
	 /*  Q&A 상세 조회  */
	 function fdetailModal(wno){

		 var param = {wno : wno};
		 var resultCallback2 = function(data){
			 fdetailResult(data);
		 };
		 
		 callAjax("/commuD/detailQnAlist.do", "post", "json", true, param, resultCallback2);

	 }
	 
	 /*  Q&A 상세 조회 -> 콜백함수   */
	 function fdetailResult(data){

		 if(data.resultMsg == "SUCCESS"){
			 
			 // 모달에 정보 넣기 
			 frealPopModal(data.result);
			
			 //모달 띄우기 
			 gfModalPop("#popUpQnA");
		 
		 }else{
			 alert(data.resultMsg);
		 }
	 }
	 
	
	 
	 
	 /* qna 등록(저장) */
	 function fSave(){

		 var resultCallback3 = function(data){
			 fSaveResult(data);
		 };
		 
		 $("#action").val("I");  // insert
		 
		
		 callAjax("/commuD/qnaSave.do", "post", "json", true, $("#myQnA").serialize(), resultCallback3);
	
	 }
	 
	 /* qna 등록(수정) */
	 function fUpdate(){

		 var resultCallback3 = function(data){
			 fSaveResult(data);
		 };
		 
		 $("#action").val("U");  // update
		 
		 callAjax("/commuD/qnaSave.do", "post", "json", true, $("#myQnA").serialize(), resultCallback3);
	 	
	 }

	 /* qna 게시판 1건 삭제 */
	 function fDelete(){
		 var con = confirm("정말 삭제하겠습니까? \n 삭제시 복구불가합니다."); 
		 if(con){
			 var resultCallback3 = function(data){
				 fSaveResult(data);
			 }
			 $("#action").val("D");  // delete
			 callAjax("/commuD/qnaSave.do", "post", "json", true, $("#myQnA").serialize(), resultCallback3);
			
		 }else{
			 gfCloseModal();	// 모달 닫기
			 selectQnAList(currentPage); // 목록조회 함수 다시 출력 
			 frealPopModal();// 입력폼 초기화
		 }
	 }
	 
	 
	 /* qna 답글 달기 */
	 function fReply(){

		 var resultCallback3 = function(data){
			 fSaveResult(data);
		 };
		 
		 $("#action").val("R");  // insert
		 
		
		 callAjax("/commuD/qnaSave.do", "post", "json", true, $("#myQnA").serialize(), resultCallback3);
	
	 }
	 
	 /*댓글 달기 */
	 function fCommentSave(){
		 
		 
	 }
	 
	 
	 /* 저장 ,수정, 삭제 콜백 함수 처리  */   
	 function fSaveResult(data){
		 
		 //alert("저장!!?? ");
		 var currentPage = currentPage || 1; 
		 
		 if($("#action").val() != "I" || $("#action").val() != "R"){//??
			 currentPage = $("#currentPage").val();
		 } 
		 
		 if(data.resultMsg == "SUCCESS"){
			 //alert(data.resultMsg);	// 받은 메세지 출력 
			 alert("저장 되었습니다.");
		 }else if(data.resultMsg == "UPDATE") {
			 alert("수정 되었습니다.");
		 }else if(data.resultMsg == "DELETE") {
			 alert("삭제 되었습니다.");
		 }else if(data.resultMsg == "REPLY") {
			 alert("답글이 저장되었습니다.");
		 }else{
			 alert(data.resultMsg); //실패시 이거 탄다. 
			 alert("실패 했습니다.");
		 }
		 
		 gfCloseModal();	// 모달 닫기
		 selectQnAList(currentPage); // 목록조회 함수 다시 출력 
		 frealPopModal();// 입력폼 초기화
		 fReplyInit();
	 }
	 
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
							<span>QnA </span> 
							<span class="fr"><a class="btnType blue" href="javascript:fQnAModal(${nullNum});" name="modal">
								<span>글 쓰기</span></a></span>
						</p>
						
					<!--검색창  -->
					<table width="100%" cellpadding="5" cellspacing="0" border="1"
                        align="left"
                        style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>

                           <td width="50" height="25" style="font-size: 100%">제목</td>
                           <td width="50" height="25" style="font-size: 100%">
                            <input type="text" style="width: 120px" id="title1" name="title1"></td>                     
                           <td width="50" height="25" style="font-size: 100%">작성일</td>
                           <td width="50" height="25" style="font-size: 100%">
                            <input type="date" style="width: 120px" id="from_date" name="from_date"></td>
                           <td width="50" height="25" style="font-size: 100%">
                            <input type="date" style="width: 120px" id="to_date" name="to_date"></td>
                          <td width="110" height="60" style="font-size: 120%">
                           <a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a></td> 
                            
                        </tr>
                     </table>           
						
						
						<div class="divQnAList">
							<table class="col">
								<caption>caption</caption>
									<colgroup>
						                   <col width="20px">
						                   <col width="170px">						                   
						                   <col width="70px">
						                   <col width="80px">
						                   <col width="40px">
						                  
						                   
					                 </colgroup>
	
								<thead>
									<tr>
							              <th scope="col">번호</th>
							              <th scope="col">제목</th>	<!-- align="left" 왜 안되지....  -->						              
							              <th scope="col">작성일</th>
							              <th scope="col">작성자 (타입)</th>
							              <th scope="col">답글 작성</th>
							           
							              
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
	<div id="popUpQnA" class="layerPop layerType2" style="width: 600px;">
		<input type="hidden" id="wno" name="wno">
		<input type="hidden" id="groupWno" name="groupWno">
		<input type="hidden" id="groupOrd" name="groupOrd">
		<input type="hidden" id="groupLayer" name="groupLayer">
		<input type="hidden" id="title2" name="title2"> 
		
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
								<textarea class="inputTxt p100" name="note" id="note"></textarea>
								
<!-- 								<input type="hidden" class="inputTxt p100" name="groupWno" id="groupWno" />
								<input type="hidden" class="inputTxt p100" name="groupOrd" id="groupOrd" />
								<input type="hidden" class="inputTxt p100" name="groupLayer" id="groupLayer" /> -->
							</td>
						</tr>
					
						
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
				 <a href=""	class="btnType blue"  id="btnReply" name="btn"><span>답글 저장</span></a> 
				    <a href="" class="btnType blue" id="btnSave" name="btn"><span>저장</span></a> 
					<a href="" class="btnType blue" id="btnUpdate" name="btn"><span>수정</span></a> 
					<a href="" class="btnType blue" id="btnDelete" name="btn"><span>삭제</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>닫기</span></a>
				</div>
				
				<div id="AllComment">
					<div align="left" id="CommentTableInfo">
							<img src="/images/site/comment1.png"/><span style="color:red">댓글 목록</span>
					</div>
					<table width="100%" border="1" id="CommentTableListBig">
						<thead align="center">
							<tr>
								<th>아이디</th>
								<th>내용</th>
								<th>등록일</th>
								<th>수정</th>
								<th>삭제</th>
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
									<textarea class="inputTxt p100" name="replynNote" id="replynNote" style="resize: none;" placeholder="댓글을 입력하세요"></textarea>
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




