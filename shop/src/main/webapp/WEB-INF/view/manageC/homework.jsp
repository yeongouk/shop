<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
	//페이징 설정 
	var PageSize = 10;    	// 화면에 뿌릴 데이터 수 
	var PageBlock = 5;		// 블럭으로 잡히는 페이징처리 수

	var m_Map = new Map();
	
	/* onload 이벤트  */
	$(function(){
		// 학습자료관리 리스트 뿌리기 함수 
		homeworkList();
		
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
			case 'btnSave' : 
				fSave();
		/* 		var file_name = $("#file_name").val();
				if( file_name == null || file_name == undefined ||  file_name == ""){
					fSave();
				}
				else{
					  fTestSave(); 
				} */
				break;
				
			case 'btnDelete' : 
				//fDelete();
				fDeleteFile();
				
				break;
				
			case 'btnClose' : 
				gfCloseModal();  // 모달닫기 
			    selectNoticeList(); // 첫페이지 다시 로딩 
				break;
			
			case 'btnUpdate' : 
				var file_name = $("#file_name").val();
				if( file_name == null || file_name == undefined ||  file_name == ""){
					fUpdate();
				}else{
					  fUpdateFile()
				}
				break;
				
			case 'searchBtn' : 
				//board_search();  // 검색하기
				homeworkList();
				alert("검색 되었습니다.");
			    break;
			
				
			//case 'commentWrite' : fCommentInsert();   // 댓글--> 답변글로 변경 // 저장 
				//break;
			}
		});
	}
	
	
	function homeworkList(currentPage) {
	
		currentPage = currentPage || 1;
		
		/* 	var nt_title = $('#nt_title');
			var seq = $('#seq'); */
			
			var param = {
				/* 	seq : seq.val()
				,	title : nt_title.val() */
			
					currentPage : currentPage
				,   pageSize : PageSize
			}
			
			var resultCallback = function(data) {
				fHomeworkResult(data, currentPage);
			};
			
			callAjax("/manageC/selectHomeworkList.do", "post", "text", true, param, resultCallback);
	}
	
	
	function fHomeworkResult(data, currentPage) {
		
		
		$("#homeworkList").empty();
		
		$("#homeworkList").append(data);
		
		
		var totalCnt =  $("#totalCnt").val();
		
		   if(totalCnt==null || totalCnt==0){
				 alert("데이터가 없습니다.");
				 return;
			 }
		
		 var list = $("#tmpList").val();
		
		var paginationHtml = getPaginationHtml(currentPage, totalCnt, PageSize, PageBlock, 'homeworkList', [list]);
		$("#HomeworkPagination").empty().append(paginationHtml);
		
		$('#currentPage').val(currentPage);
		
	}
	

	
	 /*자료제출 상세 조회*/
	 function fSelectHomeworkDtl(no, seq){
		 //alert("공지사항 상세 조회  ");
		 
		 var param = {
				  no : no
				 ,seq : seq
				 
		 };
		 var resultCallback2 = function(data){
			 fdetailResult(data);
		 };
		 
		 callAjax("/manageC/selectHomework.do", "post", "json", true, param, resultCallback2);
		 //alert("공지사항 상세 조회  22");
	 }
	 
	 /*  자료제출 상세 조회 -> 콜백함수   */
	 function fdetailResult(data){

		 //alert("공지사항 상세 조회  33");
		 if(data.resultMsg == "SUCCESS"){
			 //모달 띄우기 
			 gfModalPop("#layer1");
			 
			// 모달에 정보 넣기 
			frealPopModal(data.result);
		 
		 }else{
			 alert(data.resultMsg);
		 }
	 }
	 
	 /* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	 function frealPopModal(object){

		 var loginId = $("#loginId").val(); //로그인한 아이디
		 var name1 = $("#name1").val(); //로그인한 이름
		 
		 if(object == "" || object == null || object == undefined){

			 $("#regID").val(name1);
			// $("#regID").attr("readonly", true);
			
			$("#no").val();
			$("#seq").val();

			 $("#nt_title").attr("readonly", false);
			 $("#nt_title").val("");
			
			 $("#nt_note").attr("readonly", false);
			 $("#nt_note").val("");
			 
			 $("#filedit").empty();
			 $("#file_name").val("");
			
			 
			 $("#btnDelete").hide(); 
			 $("#btnUpdate").hide();
			 $("#btnClose").show(); 
			 $("#btnSave").show(); 
			
			 
		 }else{
		
				 
		/* 		 var filelink = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"javascript:download('" +object.no+","+object.seq+ "')\">" + object.filename + "</a>";
				 //console.log(filelink);

				 
					if(object.filename == null || object.filename == undefined ||  object.filename == ""){
						 var filedit1 =$("#filedit").val(object.filename);
						 var msg="파일이 없습니다.";
						$("#filedit").empty().append(msg);
					}else{

				        $("#filedit").empty().append(filelink); // 위에꺼를 첨부합니다.
				 } */
					
				 $("#seq").val(object.seq);
				 $("#no").val(object.no); 
				 
				 $("#regID").val(object.name);
				 
				 $("#nt_title").val(object.nt_title);
				 $("#nt_title").attr("readonly", false);
				 
				 $("#nt_note").val(object.nt_note);
				 $("#nt_note").attr("readonly", false);
				 
				 /* $("#file_name").val("");
								 
				 $("#filename").val(object.filename);
				 $("#filesize").val(object.filesize);
				 $("#filepath").val(object.filepath); */

				 $("#btnSave").hide();
				 $("#btnDelete").show();  
				 $("#btnUpdate").show();


		 }
	 }
	 
	 //제출하기
	 function fHomeworkReg(){
		 $("#action").val("I"); // insert 
		 
			frealPopModal(); 
			gfModalPop("#layer1");
		 	 
	 }
	 
	 //저장(파일없이)
	 function fSave(){

		 $("#action").val("I");  // insert
		 
		 var resultCallback3 = function(data){
			 fSaveResult(data);
		 };

		 callAjax("/manageC/homeworkSave.do", "post", "json", true, $("#myHomework").serialize(), resultCallback3);
	 	
	 }
	 

	 
	 /* 저장 ,수정, 삭제 콜백 함수 처리  */   
	 function fSaveResult(data){

		 var currentPage = currentPage || 1; 
		 
		 if($("#action").val() != "I"){
			 currentPage = $("#currentPage").val();
		 }
		 
		 if(data.resultMsg == "SUCCESS"){
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
		 homeworkList(currentPage); // 목록조회 함수 다시 출력 
		 frealPopModal();// 입력폼 초기화
	 }
	 
	 
	 
	 function download(no, seq) {
			
			var params = "";
			params += "<input type='hidden' name='seq' value='"+ seq +"' />";
			   
			jQuery("<form action='/manageC/downloadHomeAtmtFil.do' method='post'>"+params+"</form>").appendTo('body').submit().remove();
		}

	
</script>

</head>
<body>
<form id="myHomework" action=""  method="">
	<input type="hidden" id="currentPage" value="1">		
	<input type="hidden" id="tmpList" value="">
	<input type="hidden" id="loginId" value="${loginId}">
	<input type="hidden" id="name1" value="${name1}">
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" name="no" id="no" value="">
	<input type="hidden" name="seq" id="seq" value="">
	
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
								class="btn_nav">학생</a> <span
									class="btn_nav bold">과제 제출</span> <a href="#"
									class="btn_set refresh">새로고침</a>
						</p>
						
						<p class="conTitle">
							<span>과제 제출 </span> <span class="fr"><a class="btnType blue" href="javascript:fHomeworkReg();" name="modal"><span>제출하기</span></a>
							
						</p>
						
							<table width="100%" cellpadding="5" cellspacing="0" border="1"
							    align="left"
								style="border-collapse: collapse; border: 1px #50bcdf;">
								<tr style="border: 0px; border-color: blue">
									<td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>
									<td width="50" height="25" style="font-size: 100%">강의번호</td>
									<td width="50" height="25" style="font-size: 100%">
									<input type="text" style="width: 120px" id="l_no" name="l_no"></td>
									<td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>
									
									<td width="50" height="25" style="font-size: 100%">제출일</td>
		                           <td  style="font-size: 100%">
		                            <input type="date" style="width: 120px" id="from_date" name="from_date"></td>
		                           <td  style="font-size: 100%">
		                            <input type="date" style="width: 120px" id="to_date" name="to_date"></td>
		                           <td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>	
		                           										
									<td width="110" height="60" style="font-size: 120%">
									<a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a></td> 
								</tr>
								
							</table>							
							
							<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="30%">									
										<col width="20%">
										<col width="10%">
										<col width="30%">		
									</colgroup>
			
									<thead>
										<tr>
										    <th scope="col">순번</th>
											<th scope="col">강의명<br>(강의번호)</th>
											<th scope="col">제출순서</th>
											<th scope="col">제목</th>											
											<th scope="col">제출일</th>
											<th scope="col">학생이름</th>
											<th scope="col">첨부파일</th>		
										</tr>
									</thead>
									
									<tbody id="homeworkList"></tbody>
								</table>								
								
							</div>
						<div class="paging_area"  id="HomeworkPagination"> </div>															
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
				<strong>과제</strong>
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
                        <th scope="row">강의명</th>
                        <td>
                           <select id = "searchType" name = "searchType">
                                <option value="title">어떻게</option>
                                <option value="content">넣어야</option>
                                <option value="user">될까</option>
                            </select>
                            </td>
                        </tr> 	
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td><input type="text" name="nt_title" id="nt_title" /></td>							
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td><input type="text" id="regID" name="regID" disabled></td>
						</tr>						
						<tr>
							<th scope="row">첨부파일</th>
							<td>
							     <input type="file" name="file_name" id="file_name" />
							     <br>
							     <div id="filedit" id="filedit" >
							          <!--  <a href=”javascript:fDownloadRoomFile('b_00033');”>캡처.PNG</a> -->
							     </div>
							</td>							
						</tr>
					</tbody>
					
				</table>
				
				<br><br>
				<b style="font-size: 110%">내용</b>
				<br>
				<textarea style="width: 450;height: 150px" id="nt_note" name="nt_note"></textarea>

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSave" name="btn"><span>등록</span></a>				
					<a href="" class="btnType gray"  id="btnUpdate" name="btn"><span>수정</span></a>
					<a href="" class="btnType gray"  id="btnDelete" name="btn"><span>삭제</span></a>					
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>닫기</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	
	</div>	
	
	
</form>
</body>
</html>