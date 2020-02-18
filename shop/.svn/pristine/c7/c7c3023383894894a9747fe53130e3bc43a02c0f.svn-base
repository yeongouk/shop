<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>학생 평가 관리</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 로그인한 강사의 강좌 목록 페이징 설정
	var pageSize = 5;
	var pageBlockSize = 5;
	
	// 상세코드 페이징 설정
	var pageSizeStudent = 5;
	var pageBlockSizeStudent = 10;
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 로그인한 강사의 강좌 목록 
		fLectureList();
		
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	
	

	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
			    case 'btnSearch' :
				   // fSearch();
				   fLectureList();
				   alert("검색 되었습니다.");
				    break;
			
				case 'btnSave' :
					fSave();
					break;
					
				case 'btnUpdate' :
					fUpdate();
					break;
					
				case 'btnDelete' :
					fDelete();
					break;
					
				case 'btnClose' :
					gfCloseModal();
					break;
			}
		});
	}
	
/* 	 //검색  
	 function fSearch(currentPage) {
	
	      
	        currentPage = currentPage || 1;
	      
	       // var searchBox = $('#searchBox');
	       // var from_date = $('#from_date');
	       // var to_date = $('#to_date'); 
	         var searchType = $('#searchType option:selected').val();
	        
	         //var searchType2 = $("#searchType option:selected").val();
	         //var searchType3 = $("select[name=searchType]").val();
	         //var searchType3 = $("select[id=searchType]").val();
	         
	         //console.log("searchBox : " + searchBox.val());
	          console.log("searchType : " + searchType);
	         //console.log("searchType2 : " + searchType2);
	         //console.log("searchType3 : " + searchType3);
	         
	         
	         var param = {
	        		  searchType : searchType
	               ,   currentPage : currentPage
	               ,   pageSize : pageSize
	         }
	        
	         var resultCallback = function(data) {
	        	 fLectureResult(data, currentPage); 
	         };
	         
	         callAjax("/manageD/evaluationMgtList.do", "post", "text", true, param, resultCallback);
	         
	         
	         alert("검색되었습니다.");
	   } 
	 */

	/** 강좌목록 조회 */
	function fLectureList(currentPage) {
		
		currentPage = currentPage || 1;
		
		 var searchType = $('#searchType option:selected').val();
		
		var param = {
				     searchType : searchType
				 ,   currentPage : currentPage
				 ,	 pageSize : pageSize
		}
		
		var resultCallback = function(data) {
			fLectureResult(data, currentPage);
		};
		
		callAjax("/manageD/evaluationMgtList.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 강좌목록 조회 콜백 함수 */
	function fLectureResult(data, currentPage) {
		
		//alert(data);
		
		// 기존 목록 삭제
		$('#lectureList').empty();
		//$('#listComnGrpCod').find("tr").remove() 
	     //var $data = $( $(data).html() );

		// 신규 목록 생성
	    //var $lectureList = $data.find("#lectureList");		
	    $("#lectureList").append(data);
		
		
		
		// 총 개수 추출
	    var totalCnt = $("#totalCnt").val();
      
		
		
		 if(totalCnt==null || totalCnt==0){
			 alert("데이터가 없습니다.");
			 return;
		 }

		 
	    var list = $("#tmpList").val();
		// 페이지 네비게이션 생성
		var pagingnavi = getPaginationHtml(currentPage, totalCnt, pageSize, pageBlockSize, 'fLectureList',[list]);
		
		console.log("pagingnavi : " + pagingnavi);
		
		//alert(paginationHtml);
		$("#lecturePagination").empty().append( pagingnavi );
		
		// 현재 페이지 설정
		$("#currentPageLecture").val(currentPage);

	}
	
	/** 학생 목록 조회 */
	function fStudentList(currentPage, no, title) {
		
		currentPage = currentPage || 1;
		
		// 강의목록 정보 설정
		$("#tmpList").val(no);
		$("#tmpListNm").val(title);
		
		var param = {
				    no : no
				,	currentPage : currentPage
				,	pageSize : pageSizeStudent
		}
		
		var resultCallback = function(data) {
			fStudentListResult(data, currentPage);
		};
		
		callAjax("/manageD/studentList.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 학생 조회 콜백 함수 */
	function fStudentListResult(data, currentPage) {
		
		// 기존 목록 삭제
		$('#studentList').empty(); 
         $("#studentList").append(data);
		

		// 총 개수 추출
	    var totalCnt = $("#totalCnt").val();

		 if(totalCnt==null || totalCnt==0){
			 alert("데이터가 없습니다.");
			 return;
		 }

		 
	    var list = $("#tmpList").val();
	    
	    
		// 페이지 네비게이션 생성
		var lecture_no = $("#tmpList").val();
		var lecture_name = $("#tmpListNm").val();
		var pagingnavi = getPaginationHtml(currentPage, totalCnt, pageSizeStudent, pageBlockSizeStudent, 'fLectureList', [list], [lecture_no]);
		
		$("#studentPagination").empty().append( pagingnavi );
		
		// 현재 페이지 설정
		$("#currentPageStudent").val(currentPage);

	}
	
	

	 /*학생평가 상세 조회*/
	 function fDetailStudent(no, loginID){
		 //alert(" 학생평가 상세 조회  ");
		 $('#btnSave').hide();
		 
		    //$("#tmpNo").val(no);
			//$("#tmpLoginID").val(loginID);
			//$("#tmpName").val(name);
		 
		 //alert("no : "+no+"/ loginID : "+loginID);
		 var param = {
			     no : no
				, loginID : loginID
			};
		 
		 var resultCallback2 = function(data){
			 fdetailResult(data);
		 };
		 
		 callAjax("/manageD/selectStudent.do", "post", "json", true, param, resultCallback2);
	 }
	 
	 /*  학습자료관리 상세 조회 -> 콜백함수   */
	 function fdetailResult(data){

		 if(data.resultMsg == "SUCCESS"){
			 //모달 띄우기 
			 gfModalPop("#layer");
			 
			// 모달에 정보 넣기 
			fInitFormEval(data.result);
		 
		 }else{
			 alert(data.resultMsg);
		 }
	 }
	
	
	//학생이름 클릭 시
	function fSelectStudent(no, loginID, name) {
		
		$("#tmpNo").val(no);
		$("#tmpLoginID").val(loginID);
		$("#tmpName").val(name);
		alert(name+"을 평가등록 합니다. 평가등록 버튼을 눌러주세요." );
		
	}
	
	/** 학생 평가 모달 실행 */
	function fPopModalEvaluation(no, loginID) {
		
		$('#btnDelete').hide();
		$('#btnUpdate').hide();
		

			// 신규 저장
			if (no == null || no=="") {
			
				if ($("#tmpList").val() == "") {  //뭘 걸어야 되지???
					alert("강좌를 선택해 주세요.");
					return;
				}
				
				if($("#tmpNo").val() == null || $("#tmpNo").val() == undefined ||$("#tmpNo").val() == ""){
					
					alert("학생을 클릭하세요"); //값을 어디서 지워야 될까...
					return;
						
				} 
				
				// Tranjection type 설정
				$("#action").val("I");
				
				// 상세코드 폼 초기화
				fInitFormEval();
				
				// 모달 팝업
				gfModalPop("#layer");
	
			// 수정 저장
			} else {
				
				// Tranjection type 설정
				$("#action").val("U");
				
				// 상세코드 단건 조회
				//fSelectDtlCod(grp_cod, dtl_cod);
			}
		
	}
	
	/** 평가내용 폼 초기화 */
	function fInitFormEval(object) {

		//var grpCod = $("#tmpGrpCod").val();

		if( object == "" || object == null || object == undefined) {
			
			//$("#dtl_grp_cod").val(grpCod);
			
			$("#st_evaluation").val("");
			$("#st_evaluation").focus();
			//$("input:radio[name=dtl_use_poa]:input[value='Y']").attr("checked", true);
			//$("#dtl_grp_cod").attr("readonly", true);
			
			$("#btnSave").show();
			//$("#btnUpdate").hide();
			//$("#btnDelete").hide();
			
		} else {

			$("#st_evaluation").val(object.evaluation);
			
			$("#btnDelete").show();
			$("#btnUpdate").show();
			//$("#btnSave").hide();
		}
	}

	/** 평가내용 저장 validation : 사용안함*/
	function fValidate() {

		var chk = checkNotEmpty(
				[
						[ "dtl_grp_cod", "그룹 코드를 선택해 주세요." ]

				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	/** 평가내용 저장 */
	function fSave() {

		// vaildation 체크
		//if ( ! fValidate() ) {return;}
		
		var resultCallback = function(data) {
			fSaveResult(data);
		};
		
		$("#action").val("I");
		
		callAjax("/manageD/saveEvaluation.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	
	/** 평가내용 저장 콜백 함수 */
	function fSaveResult(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageStudent").val();
		}
		
		if (data.resultMsg == "SUCCESS") {
			 alert("저장 되었습니다.");
		 }else if(data.resultMsg == "UPDATE") {
			 alert("수정 되었습니다.");
		 }else if(data.resultMsg == "DELETE") {
			 alert("삭제 되었습니다.");
		 }else{
			 alert(data.resultMsg); //실패시 이거 탄다. 
			 alert("실패 했습니다.");
		 }
		
		// 모달 닫기
		gfCloseModal();
		
		// 목록 조회
		var no = $("#tmpList").val();
		var title = $("#tmpListNm").val();
		fStudentList(currentPage, no, title);
		
		// 입력폼 초기화
		fInitFormEval();
		$('#tmpNo').val('');
		$('#tmpLoginID').val('');
		$('#tmpName').val('');
	}
	
	 /* 평가내용 등록(수정) */
	 function fUpdate(){
		 
		 //alert("수정  함수 타는지!!!!!?? ");
		 // validation 체크 
		 if(!(fValidate())){ return; }
		 
		 var resultCallback4 = function(data){
			 fUpdateResult(data);
		 };
		 
		 $("#action").val("U");  // update
		 
		 callAjax("/manageD/saveEvaluation.do", "post", "json", true, $("#myForm").serialize(), resultCallback4);
	 	// $("#myQna").serialize() => 직렬화해서 name 값들을 그냥 넘김.
	 }
	 
		/** 평가내용 수정 콜백 함수 */
		function fUpdateResult(data) {
			
			var currentPage = $("#currentPageStudent").val();
			
			if (data.resultMsg == "UPDATE") {
				
				// 응답 메시지 출력
				 alert("수정 되었습니다.");
				//alert(data.resultMsg);
				
				// 모달 닫기
				gfCloseModal();
				
				// 목록 조회
				var no = $("#tmpList").val();
				var title = $("#tmpListNm").val();
				fStudentList(currentPage, no, title);
				
			} else {
				alert("실패했습니다!");
			}	
		}
	 
	
	 /* 평가내용  1건 삭제 */
	 function fDelete(){
		 var con = confirm("정말 삭제하겠습니까? \n 삭제시 복구불가합니다."); 
		 if(con){
			 var resultCallback5 = function(data){
				 fDeleteResult(data);
			 }
			 $("#action").val("D");  // delete
			 callAjax("/manageD/saveEvaluation.do", "post", "json", true, $("#myForm").serialize(), resultCallback5);
			 
		 }else{
			 gfCloseModal();	// 모달 닫기
			 fLectureList(currentPage); // 목록조회 함수 다시 출력 
			 fInitFormEval();// 입력폼 초기화
		 }
	 }
		/** 평가내용 삭제 콜백 함수 */
		function fDeleteResult(data) {
			
			var currentPage = $("#currentPageStudent").val();
			
			if (data.resultMsg == "DELETE") {
				
				
				// 응답 메시지 출력
				 alert("삭제 되었습니다.");
				//alert(data.resultMsg);
				
				// 모달 닫기
				gfCloseModal();
				
				// 목록 조회
				var no = $("#tmpList").val();
				var title = $("#tmpListNm").val();
				fStudentList(currentPage, no, title);
				
			} else {
				alert("실패했습니다!");
			}	
		}
	

	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageLecture" value="1">
	<input type="hidden" id="currentPageStudent" value="1">
	<input type="hidden" id="tmpList" value=""> 
	<input type="hidden" id="tmpListNm" value=""> <!-- 스크립트에서 값을 설정해서 넘길거임 / 임시 리스트 넘버(이름) -->
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" name="tmpNo" id="tmpNo" value="">
	<input type="hidden" name="tmpLoginID" id="tmpLoginID" value="">
    <input type="hidden" name="tmpName" id="tmpName" value="">
<!--<input type="hidden" id="loginId" value="${loginId}">
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value=""> -->
	
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
							<a href="#" class="btn_set home">메인으로</a> <a href="#" class="btn_nav">학습관리</a> 
							<span class="btn_nav bold">평가관리</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>평가관리 </span> 
						</p>
						
					<!--검색창  -->
					<table width="100%" cellpadding="5" cellspacing="0" border="1"align="left" style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td style="font-size: 100%">
                           <select id = "searchType" name = "searchType">
                                <option value="all">전체</option>
                                <option value="ing">진행중 강좌</option>
                                <option value="past">지난 강좌</option>
                            </select></td> 
                           <!-- <input type="text"  style="font-size: 100%" id="searchBox" name="searchBox"> -->        
                         
                           <td style="font-size: 120%">
                           <a href="" class="btnType blue" id="btnSearch" name="btn"><span>검  색</span></a></td> 
                            <!-- <input type="button" value="검  색  " id="searchBtn" name="btn" class="test_btn1" 
                              style="border-collapse: collapse; border: 0px gray solid; background-color: #50bcdf; width: 70px; color: white"/> -->
                        </tr>
                     </table>
                  &nbsp; &nbsp; &nbsp;
						
						<!--강좌목록  -->
						<div class="divLectureList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="6%">
									<col width="6%">
									<col width="14%">
									<col width="14%">
							
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">강좌번호</th>
										<th scope="col">과정명</th>
										<th scope="col">기간</th>
									</tr>
								</thead>
								 <tbody id="lectureList"></tbody> 
							</table>
						</div>
						
	<div class="paging_area"  id="lecturePagination"> </div>
	
	
	<!------------수강중인 학생 목록----------------------------------------------------->

						<p class="conTitle mt50">
							<span>수강중인 학생</span> 
							<span class="fr"> 
							<a class="btnType blue"  href="javascript:fPopModalEvaluation();" name="modal"><span>평가등록</span></a>
							<div>&nbsp;&nbsp; &nbsp; 학생을 클릭 후 평가등록을 눌러주세요</div>

							</span>
							
						</p>
	                    
						<div class="divStudentList">
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
									<th scope="col">학생명</th>
									<th scope="col">최종 점수</th>
									<th scope="col">평가 내용</th>
									
									</tr>
								</thead>
								<tbody id="studentList">
									<tr>
										<td colspan="12">강좌를 선택해 주세요.</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging_area"  id="studentPagination"> </div>

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>




	<!-----------------------------모달팝업------------------------------------>
	<div id="layer" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>평가 내용</strong>
			</dt>
			<dd class="content">

				<!-- s : 여기에 내용입력 -->

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
					
					</colgroup>

					<tbody>
				
						<tr>
							<th scope="row">평가 내용</th>
							<td colspan="3">
							<input type="text" class="inputTxt p100" id="st_evaluation" name="st_evaluation" /></td>
						</tr>
						
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSave" name="btn" style="display:none;"><span>저장</span></a>
					<a href="" class="btnType blue" id="btnUpdate" name="btn" style="display:none;"><span>수정</span></a>
					<a href="" class="btnType blue" id="btnDelete" name="btn" style="display:none;"><span>삭제</span></a>  
					<a href="" class="btnType gray" id="btnClose" name="btn"><span>닫기</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>