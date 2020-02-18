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
	var PageBlock = 5;		// 블럭으로 잡히는 페이징처리 수
	var m_Map = new Map();	// 이미지 파일을 저장하기 위한 map

	/* onload 이벤트  */
	$(function() {
		lecturePlanList();
		clickEvent();
	});
	
	function ValidateCHK(){
		var CHK=checkNotEmpty(
			[
				["l_title","등록할 강의 명을 입력하세요."],
				["pcnt","등록할 강의의 인원수를 입력하세요."],
				["room_no","강의실 번호을 입력하세요."],
				["l_startdate","개강일을 입력하세요."],
				["l_enddate","종강일을 입력하세요."],
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
			case "lectureSearchBtn":			
				lecturePlanList();
				 
				break;
				
			case "lectureInsertBtn":
				lectureModal();	 					
				break;
				
			case "btnCancel":
				$("#LectureModal").hide();		
				break;
				
			case "btnSave":
				lectureInsert();
				break;
				
			case "btnUpdate":
				lectureUpdate();

				break;	
				
			}
		})
	}
	
	
	//강의 목록 수정
	function lectureUpdate(){
		
		if(!ValidateCHK()){
			return;
		}
		
		var resultCallback1 = function(data){
		 alert("update");
			 fSaveResult(data);
		};
		
		// 첨부파일 수정 유무에 따른 분기
		if( $("#file_name").val() != null && $("#file_name").val() != "" ) {
			
			console.log("withFile1");
			var frm1 = document.getElementById("frmLectureModal");
			frm1.enctype = 'multipart/form-data';
			var fileData1 = new FormData(frm1);
			
			$.each(m_Map, function(idx) {
				var file1 = m_Map.get(idx);
				if(file1 != null && file1 != "" && file1 != undefined) {
					
				}
			});
			
			var tmp_filename1 = $("#tmp_filename").val();
			var tmp_no1 = $("#tmp_no").val();
			
			fileData1.append("empty", "empty");
			fileData1.append("tmp_filename", tmp_filename1);
			fileData1.append("no", tmp_no1);
			
			callAjaxFileUploadSetFormData("/supportD/UpdatelectureWithFile.do", "post", "json", true, fileData1, resultCallback1);
			
		}else {
			
			if( $("#tmpDeleteFile").val() != null && $("#tmpDeleteFile").val() != "") {
				
				console.log("withFile2");
				var frm2 = document.getElementById("frmLectureModal");
				frm2.enctype = 'multipart/form-data';
				var fileData2 = new FormData(frm2);
				
				$.each(m_Map, function(idx) {
					var file2 = m_Map.get(idx);
					if(file2 != null && file2 != "" && file2 != undefined) {
						
					}
				});
				
				var tmp_filename2 = $("#tmp_filename").val();
				var tmp_no2 = $("#tmp_no").val();
				
				fileData2.append("empty", "empty");
				fileData2.append("tmp_filename", tmp_filename2);
				fileData2.append("no", tmp_no2);
				
				callAjaxFileUploadSetFormData("/supportD/UpdatelectureWithFile.do", "post", "json", true, fileData2, resultCallback1);
				
			} else {
				
				console.log("withoutFile");
				callAjax("/supportD/Updatelecture.do", "post", "json", true, $("#frmLectureModal").serialize(), resultCallback1);
				
			}
			
		}
		
	}
	
	
	//신규 강의 등록
	function lectureInsert(){
		
		if(!ValidateCHK()){
			return;
		}
		
		// 파일업로드
		var frm = document.getElementById("frmLectureModal");
		frm.enctype = 'multipart/form-data';
		var fileData = new FormData(frm);
		
		$.each(m_Map, function(idx) {
			var file = m_Map.get(idx);
			if(file != null && file != "" && file != undefined) {
				
			}
		});
		
		fileData.append("empty", "empty");
		
		var resultCallback1 = function(data){
			 fSaveResult(data);
		};
		callAjaxFileUploadSetFormData("/supportD/Insertlecture.do", "post", "json", true, fileData, resultCallback1);
	}
	
	function fSaveResult(data){
		var currentPage = currentPage || 1; 
		
		switch (data.resultMsg) {
		case "INSERT":
			alert("저장되였습니다.");
			break;
			
		case "UPDATE":
			alert("수정되였습니다.");
			break;
			
		}
		gfCloseModal();	// 모달 닫기
		lecturePlanList(currentPage); // 목록조회 함수 다시 출력 
		
	}
	

	//모달 팝업 창 open
	function lectureModal(no) {
		
		var writer = $("#name").val();
		$("#l_name").val(writer);
		$("#l_name").attr("readonly", true);
		//신규 등록
		if (no == null || no == "") {
			
			dataSetPopModal();
			
			$("#btnUpdate").hide();
			$("#btnSave").show();
			gfModalPop("#LectureModal");

		} else {
		//상제조회 Transaction
			var param = {
				    no : no
				  };
				 var resultCallback = function(data){
					 detailReadResult(data);
				 };
				callAjax("/supportD/selectOnelectureDetail.do", "post", "json", true, param, resultCallback);
		}

	}
	
	
	function detailReadResult(data){
		if(data.resultMsg == "READ"){
			 $("#btnSave").hide();
			 $("#btnUpdate").show();
			 gfModalPop("#LectureModal");
			dataSetPopModal(data.resultData);
		 }else{
			 alert("조회 할수가 업습니다.");
		 }
	}
	
	function dataSetPopModal(object){
		
		/* $("#teacherContact").hide(); */
		$("#tmp_filename").val("");
		$("#tmp_filepath").val("");
		$("#tmp_filesize").val("");
		$("#tmpDeleteFile").val("");
		$("#tmp_no").val("");
		$("#modMsg").removeClass("hidden");
		$("#l_hp").attr("readonly", false);
			
		if(object == "" || object == null || object == undefined){
			
			$("#teacherContact").show();
			$("#modMsg").addClass("hidden");
			
			var writer = $("#name").val();
		
			$("#l_name").val(writer);
			$("#l_name").attr("readonly", true);
			
			$("#l_title").val("");
			$("#category").val("");
			$("#room_no").val("");
			$("#l_startdate").val("");
			$("#l_enddate").val("");
			$("#l_hp").val("");
			$("#l_email").val("");
			$("#l_goal").val("");
			$("#l_plan").val("");
			$("#pcnt").val("");
			$("#file_name").val("");
			
			$("#filedit").empty();
			
			$("#tmp_filename").val("");
			$("#tmp_filepath").val("");
			$("#tmp_filesize").val("");
			
		}else{
			
			$("#l_title").val(object.title);
			$("#category").val(object.category);
			$("#l_name").val(object.name);
			$("#l_name").attr("readonly", true);
			$("#room_no").val(object.room);
			$("#l_startdate").val(object.startdate);
			$("#l_enddate").val(object.enddate);
			$("#l_hp").val(object.hp);
			$("#l_hp").attr("readonly", true);
			$("#l_email").val(object.email);
			$("#l_goal").val(object.goal);
			$("#l_plan").val(object.plan);
			$("#l_no").val(object.no);
			$("#pcnt").val(object.pcnt);
			$("#file_name").val("");
			
			var beforeFileMsg = "<span>파일변경 : </span>"; 
			var filelink = "<p>기존파일 : <a href=\"javascript:download('" + object.no + "')\">" + object.filename + "</a> &nbsp;&nbsp;&nbsp;&nbsp;";
			filelink += "<a href='javascript:tempDeleteFile()'>[파일삭제]</p>" ;
			console.log(filelink);
			
			$("#filedit").empty().append(filelink).show();
			
			$("#tmp_filename").val(object.filename);
			$("#tmp_no").val(object.no);
		 
		}
	}
	
	function tempDeleteFile() {
		$("#tmpDeleteFile").val("Y");
		$("#filedit").hide();
	}
	
	// 파일다운로드
	function download(no) {
		
		var reqParam = "";
		reqParam += "<input type='hidden' name='no' value='"+no+"' />";
		
		console.log(reqParam);
		
		jQuery("<form action='/supportD/downloadLecturePlanAtmtFil.do' method='post'>"+reqParam+"</form>").appendTo('body').submit().remove();
		
	}
	
	
	//LIST 조회
	function lecturePlanList(currentPage) {
		currentPage = currentPage || 1;

		//alert("lecturePlanList"); 
		var all = $('#all').val();
		var keyword = $('#keyword');
		var from_date = $('#from_date');
		var to_date = $('#to_date');
		var searchType = $('#searchType option:selected').val();

		var param = {
			searchType : searchType,
			keyword : keyword.val(),
			from_date : from_date.val(),
			to_date : to_date.val(),
			currentPage : currentPage,
			pageSize : PageSize,
			all : all

		}

		var resultCallback = function(data) { // 데이터를 이 함수로 넘깁시다. 
			lectureListResult(data, currentPage);
		}

		callAjax("/supportD/lecturePlanList.do", "post", "text", true, param,
				resultCallback);
	}

	//callBack
	function lectureListResult(data, currentPage) {
		$("#LecturePlanList").empty();

		$("#LecturePlanList").append(data);

		var totalCnt = $("#totalCnt").val();

		if (totalCnt == null || totalCnt == 0) {
			alert("데이터가 없습니다.");
			return;
		}

		var list = $("#lecture_list").val();
		var pagingnavi = getPaginationHtml(currentPage, totalCnt, PageSize,
				PageBlock, 'lecturePlanList');
		$("#pagingnavi").empty().append(pagingnavi);

		// 현재 페이지 설정 
		$("#currentPage").val(currentPage);
	}
	
	
</script>


</head>
<body>
<form id="lectureform" action="">
	<input type="hidden" id="currentPage" value="1">
	<input type="hidden" id="lecture_list">
	<input type="hidden" id="tmp_filename" value="">
	<input type="hidden" id="tmp_filepath" value="">
	<input type="hidden" id="tmp_filesize" value="">
	<input type="hidden" id="tmpDeleteFile" value="">
	<input type="hidden" id="tmp_no" value="">
</form>

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
							<a href="#" class="btn_nav">학습지원</a> 
							<span class="btn_nav bold">강의 계획서</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span style="margin-right:78%">강의 목록</span>
	                        <a href="" class="btnType blue" id="lectureInsertBtn" name="btn"><span >등    록</span></a> 
						</p>
						
					<!--검색창  -->
					<table width="100%" cellpadding="5" cellspacing="0" border="1"
                        align="left"
                        style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                        <td style="width: 80px; margin-left: 20px">
							<select id="searchType" name="searchType">
								<option value="all">전체</option>
								<option value="title">과목명</option>
								<option value="name">강사명</option>
							</select>
                         <input type="text" style="width: 150px; height: 30px;" id="keyword" name="keyword"></td>                     
                           <td width="20" height="25" style="font-size: 100%">개강&nbsp;
                            <input type="date" style="width: 120px" id="from_date" name="from_date"></td>
                           <td width="20" height="25" style="font-size: 100%">종강&nbsp;&nbsp;
                            <input type="date" style="width: 120px" id="to_date" name="to_date"></td>
                           <td width="50" height="60" style="font-size: 120%">
                           <a href="" class="btnType blue" id="lectureSearchBtn" name="btn"><span>검  색</span></a></td> 
                        </tr>
                     </table>    
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="15%"><!--분류  -->
									<col width="25%"><!--과목  -->
									<col width="10%"><!--강사명  -->
									<col width="15%"><!--개강  -->
									<col width="15%"><!--종강  -->
									<col width="10%"><!--신청인원 -->
									<col width="10%"><!--정원  -->
								</colgroup>
								<thead>
									<tr>
										<th scope="col">분류</th>
										<th scope="col">과목</th>
										<th scope="col">강사명</th>
										<th scope="col">개강</th>
										<th scope="col">종강</th>
										<th scope="col">신청인원</th>
										<th scope="col">정원</th>
									</tr>
								</thead>
								<tbody id="LecturePlanList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingnavi">
								<div class="paging">
									<a class="first" href="javascript:lecturePlanList(1)">
									<span class="hidden">맨앞</span></a>
									<a class="pre" href="javascript:lecturePlanList(1)">
									<span class="hidden">이전</span></a>
									<strong>1</strong> 
									<a href="javascript:lecturePlanList(2)">2</a> 
									<a href="javascript:lecturePlanList(3)">3</a> 
									<a href="javascript:lecturePlanList(4)">4</a>
									<a href="javascript:lecturePlanList(5)">5</a>
									<a class="next" href="javascript:lecturePlanList(5)">
									<span class="hidden">다음</span></a>
									<a class="last" href="javascript:lecturePlanList(5)">
									<span class="hidden">맨뒤</span></a>
								</div>
							</div>
						</div>
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
		</div>
	</div>
	
	
	
	<form  name="frmLectureModal" action=""  method="" id="frmLectureModal">
		<input type="hidden" id="loginID" value="${loginId}">
		<input type="hidden" id="name" value="${writer}">
		<input type="hidden" id="no" value="">
		<!--등록 팝엄창  -->
		<div id="LectureModal" class="layerPop layerType2" style="width: 800px;">
			
			<dl>
				<dt>
					<strong>강 의 계 획 서</strong>		
				</dt>
				<dd class="content">
					<table class="row">
					<caption>caption</caption>
							<tr>
								<th scope="row">강의명</th>

									<td><input type="text" class="inputTxt p100" name="l_title" id="l_title" />
										<input type="hidden" class="inputTxt p100" name="l_no" id="l_no" />
									</td>
									
								<th scope="row">분류</th>
								<td width="80px">
									<select id="category" name="category">
										<option value="">선택</option>
										<option value="재직자">재직자</option>
										<option value="근로자">근로자</option>
										<option value="교육">교육</option>
									</select>
								</td>
								<th scope="row">정원</th>
									<td><input type="text" class="inputTxt p100" name="pcnt" id="pcnt" /></td>
							</tr>
							<tr>
							 	<th scope="col">강사명</th>
								<td colspan="2"><input type="text" class="inputTxt p100" value="l_name" id="l_name" /></td>
								<th scope="row">강의실</th>
								<td colspan="2"><input type="text" class="inputTxt p100" name="room_no" id="room_no" /></td>
							</tr>
							<tr>
								<th scope="row">개강일</th>
								<td colspan="2"><input type="date" class="inputTxt p100" name="l_startdate" id="l_startdate" /></td>
								<th scope="row">종강일</th>
								<td colspan="2"><input type="date" class="inputTxt p100" name="l_enddate" id="l_enddate" /></td>
							</tr>
							<tr id="teacherContact">
								<th scope="row">연락처</th>
								<td colspan="2"><input type="text" class="inputTxt p100" name="l_hp" id="l_hp" /></td>
								<th scope="row">이메일</th>
								<td colspan="2"><input type="text" class="inputTxt p100" name="l_email" id="l_email" /></td>
							</tr>
							<tr>
								<th scope="row">수업목표</th>
								<td colspan="5"><textarea class="inputTxt p100" name="l_goal" id="l_goal"> </textarea></td>
							</tr>
							<tr>
								<th scope="row">강의계획</th>
								<td colspan="5"><textarea class="inputTxt p100" name="l_plan" id="l_plan"> </textarea></td>
							</tr>
							<tr>
								<th scope="row">첨부파일 </th>
								<td colspan="5">
									<span class="hidden" id="modMsg">파일 변경: </span><input type="file" class="inputTxt p100" name="file_name" id="file_name" />
									<div id="filedit" name="filedit" />
								</td>
							</tr>
						</tbody>
					</table>
						
		
				
				
				<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSave" name="btn"><span>저 장</span></a> 
						<a href="" class="btnType blue" id="btnUpdate" name="btn"><span>수 정</span></a> 
						<a href="" class="btnType blue" id="btnCancel" name="btn"><span>취 소</span></a> 
				</div>
				
				</dd>
			</dl>	
		</div>
	</form>
	<!--등록 팝엄창  -->
	
	
	
</body>
</html>