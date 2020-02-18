<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>이력서 관리</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- D3 -->

<script type="text/javascript">

	// 페이징 설정 
	var pageSize = 10;    	 // 화면에 뿌릴 데이터 수 
	var noticePageBlock = 5; // 블럭으로 잡히는 페이징처리 수
	
	// 상세코드 페이징 설정
	var pageSizeDtl = 5;
	var pageBlockSizeDtl = 10;
	
	$(function(){
		// 자유게시판 리스트 뿌리기 함수 
		lectureClassList();
		
		// 버튼 이벤트 등록 (저장, 수정, 삭제, 모달창 닫기)
		fButtonClickEvent();
	});
	
	function fButtonClickEvent(){
		$('a[name=btn]').click(function(e){
			e.preventDefault();
			
			var btnId = $(this).attr('id');
			
			if(btnId == 'searchBtn'){
				lectureClassList();
			} else if(btnId == 'btnClose'){
				gfCloseModal();
			}
		});
	}
	
	/* 첫번째 게시판 - 강좌목록 불러오기  */
	function lectureClassList(currentPage){
		
		currentPage = currentPage || 1;   // or		
		
		var searchBox = $('#searchBox');
		
		var param = {
				currentPage : currentPage 
			   ,pageSize : pageSize
			   ,searchBox : searchBox.val()
		}
		
		var resultCallback = function(data){  // 데이터를 이 함수로 넘깁시다. 
			lectureClassListResult(data, currentPage); 
		}
		
		callAjax("/careerA/resumeMgtList.do","post","text", true, param, resultCallback);
		
	}
	
	 /* 강좌목록 리스트 data를 콜백함수를 통해 뿌려봅시당   */
	 function lectureClassListResult(data, currentPage){
		  
		// 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
 		$("#resumeMgtList").empty();
		 
		var $data = $( $(data).html() ); // data의 .html()통해서 html구문을 끌어온다.
		console.log('$data ===== >>>>>> ' + $data );
		 
	  	var $resumeMgtList = $data.find("#resumeMgtList");	 	
		$("#resumeMgtList").append($resumeMgtList.children());
	
		 // 리스트의 총 개수를 추출합니다. 
		 var totalCnt = $data.find("#totalCnt").text();
		 var $totalCnt = $("#totalCnt").val();  // qnaRealList() 에서보낸값 
		 
		 console.log('totalCnt = : ' + totalCnt);
		 console.log('$totalCnt == >> ' + $totalCnt);
		 
		 // * 페이지 네비게이션 생성 (만들어져있는 함수를 사용한다 -common.js)
	     var pagingnavi = getPaginationHtml(currentPage, totalCnt, pageSize, noticePageBlock, 'lectureClassList');
		 
		 // 비운다음에 다시 append 
	     $("#pagingnavi").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 
		 
		 // 현재 페이지 설정 
	    $("#currentPage").val(currentPage);
		 
	 }
	 
	  
	 // 두번재 게시판 : 상세 조회
	 function fdetailList(no,currentPage){
		 
		 currentPage = currentPage || 1;
		 
		 var param = {
			 currentPage : currentPage
			 ,no     : no
			 ,pageSize : pageSizeDtl
		 };
		 
		 var resultCallback2 = function(data){
			 flistDtlResult(data, currentPage);
		 };
		 
		 callAjax("/careerA/resumeMgtDtl.do", "post", "text", true, param, resultCallback2);
	 }
	 
	 
		/** 상세코드 조회 콜백 함수 */
	function flistDtlResult(data, currentPage) {
			
			// 기존 목록 삭제
			$('#resumeMgtDtl').empty(); 
			
			var $data = $( $(data).html() );

			// 신규 목록 생성
			var $resumeMgtDtl = $data.find("#resumeMgtDtl");		
			$("#resumeMgtDtl").append($resumeMgtDtl.children());
			
			// 총 개수 추출
			var $totalCntComnDtlCod = $data.find("#totalCnt");
			var totalCntComnDtlCod = $totalCntComnDtlCod.text(); 
			
			// 페이지 네비게이션 생성
			var grp_cod = $("#tmpGrpCod").val();
			var grp_cod_nm = $("#tmpGrpCodNm").val();
			var list = $("#tmpListDtl").val();
			
			var paginationHtml = getPaginationHtml(currentPage, totalCntComnDtlCod, pageSizeDtl, pageBlockSizeDtl, 'fdetailList');
			console.log('paginationHtml ===== >>>>> ' + paginationHtml);
			$("#resumeDtlPagination").empty().append( paginationHtml );
			
			// 현재 페이지 설정
			$("#currentPage").val(currentPage);
		}
		
		
		
		
	/* ----------------------------- M O D A L ------------------------------- */
		
	// 모달 팝업 실행
	function fResumeModal(name,loginID){
		
		 // 신규저장 하기 버튼 클릭시 (값이 null)
		 if(nt_no == null || nt_no==""){
			// Tranjection type 설정
			
			
			$("#action").val("I"); // insert 
			frealPopModal(nt_no); // 공지사항 초기화 
			
			//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
			gfModalPop("#layer1");
			
		 }else{
			// Tranjection type 설정
			
			$("#action").val("U");  // update
			fdetailModal(name,loginID); //번호로 -> 공지사항 상세 조회 팝업 띄우기
		 }
	}
	
	/*모달 팝업 조회*/
	 function fdetailModal(name,loginID){
		
		// $("#loginID2").val(loginID);
		
		
		 var param = {name : name
				,	  loginID : loginID		 
		 
		 };
		 var resultCallback2 = function(data){
			 fdetailResult(data);
		 };
		 
		 callAjax("/careerA/detailResumeList.do", "post", "json", true, param, resultCallback2);
		 //alert("공지사항 상세 조회  22");
	 }
	
	//모달 팝업 콜백함수
	function fdetailResult(data){
		if(data.resultMsg == "SUCCESS"){
			//모달 띄우기 
			 gfModalPop("#layer1");
			
			// 모달에 정보 넣기 
			frealPopModal(data.result);
		} else {
			alert(data.resultMsg);
		}
	}
	
	 /* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	 function frealPopModal(object){
		 
		 if(object == "" || object == null || object == undefined){
			 //var writer = $("#swriter").val();
			 //var Now = new Date();
			
			 $("#loginID").val(loginID);
			 $("#loginID").attr("readonly", true);
			 
			 $("#write_date").val();
			 
			 $("#nt_title").val("");
			 $("#nt_note").val("");
			 
			 $("#btnDeleteNotice").hide(); // 삭제버튼 숨기기
			 $("#btnUpdateNotice").hide();
			 $("#btnSaveNotice").hide(); 
			
			 
		 }else{
			 
			 //alert("숫자찍어보세 : " + object.wno);// 페이징 처리가 제대로 안되서 
			 $("#loginID").val(object.loginID);
			 $("#loginID").attr("readonly", true); // 작성자 수정불가 
			 
			 $("#write_date").val(object.write_date);
			 $("#write_date").attr("readonly", true); // 처음 작성된 날짜 수정불가 
			 
			 $("#name").val(object.name);
			 $("#hp").val(object.hp);
			 $("#title").val(object.title); 
			 $("#score").val(object.score);
			 $("#certno").val(object.certno);
			 $("#reg_date").val(object.certno);
			 $("#seq").val(object.certno);
			 $("#birthday").val(object.birthday);
			 $("#email").val(object.email);
			 $("#sex").val(object.sex);
			 
			 $("#btnDeleteNotice").hide();  // 삭제버튼 보이기 
			 $("#btnSaveNotice").hide();
			 //$("#btnUpdateNotice").css("display","");
			 //if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
			 //$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정
			
			 
		 }
	 }
	 
</script>
</head>
<body>

	<form id="form" action="" method="">
		<!-- <input type="hidden" id="name" value=""> -->
		<input type="hidden" name="action" id="action" value=""> 
		<input type="hidden" id="currentPage" value="1">
		<input type="hidden" id="tmpListNum" value=""> <!-- 스크립트에서 값을 설정해서 넘길거임 / 임시 리스트 넘버 -->
		<input type="hidden" id="loginID2" value=""> 
		<input type="hidden" id="swriter" value="${writer}"> <!-- 작성자 session에서 java에서 넘어온값 -->
	<!-- 모달 배경 -->
	<div id="mask"></div>
		
	<div id="wrap_area">

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 -->
					 <jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
					 <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">

						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> 
							<span class="btn_nav bold">이력서 관리</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<div class="dashboard2 mt30 mb20" >
							<ul>
								<li>
									<div class="col">
										
									
										<p class="conTitle">
											<span>과정명 조회</span> <span class="fr"> 
										</p>

											<table>
												<tr>
													<td>
														<input type="text" style="width: 150px; height: 30px;" id="searchBox" name="searchBox">
													</td>
													
													<td width="50" height="60" style="margin-left:800px; font-size: 120;"><a
														href="" class="btnType blue" id="searchBtn" name="btn" >
														<span>검 색</span></a>
													</td>
												</tr>
											</table>

											<table class="col2 mb10" style="width:1000px;">
										
										
										<colgroup>
						                   <col width="30px">
						                   <col width="70px">
						                   <col width="30px">
					                 	</colgroup>
					                 
											<thead>
												<tr>
													<th>과정명</th>
													<th>기간</th>
													<th>대상자 수</th>
												</tr>
											</thead>
											<tbody id="resumeMgtList"></tbody>
		
										</table>
									</div>
								</li>						
							</ul>
							
												<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingnavi" align="center" style="width:990px;">
								<div class="paging">
									<a class="first" href="javascript:lectureClassList(1)">
									<span class="hidden">맨앞</span></a>
									<a class="pre" href="javascript:lectureClassList(1)">
									<span class="hidden">이전</span></a>
									<strong>1</strong> 
									<a href="javascript:lectureClassList(2)">2</a> 
									<a href="javascript:lectureClassList(3)">3</a> 
									<a href="javascript:lectureClassList(4)">4</a>
									<a href="javascript:lectureClassList(5)">5</a>
									<a class="next" href="javascript:lectureClassList(5)">
									<span class="hidden">다음</span></a>
									<a class="last" href="javascript:lectureClassList(5)">
									<span class="hidden">맨뒤</span></a>
								</div>
							</div>
							
							<p class="conTitle mt50">
								<span>과정명 - 학생 조회</span> <span class="fr"> 
									<a class="btnType blue"  href="javascript:fPopModalComnDtlCod();" name="modal"></a>
								</span>
							</p>
							
							<div class="divComDtlCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="30%">
									<col width="20%">
									<col width="20%">
									<col width="30%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">학생명</th>
										<th scope="col">평가점수</th>
										<th scope="col">구분</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody id="resumeMgtDtl">
									<tr>
										<td colspan="4">그룹코드를 선택해 주세요.</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging_area"  id="resumeDtlPagination"> </div>
						
						</div>
					</div>
				</li>
			</ul>

		</div>
	</div>
	
	<!----------------------------------------- 모달팝업---------------------------------------------->
	
	<div id="layer1" class="layerPop layerType2" style="width: 800px; height:800px; ">
		<input type="hidden" id="nt_no" name="nt_no"> <!-- 수정시 필요한 num 값을 넘김  -->
		<input type="hidden" id="no" name="no"> <!-- 수정시 필요한 num 값을 넘김  -->
		
		<dl>
			<dt>
				<strong>이력서 조회</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>

					<tbody>
						<tr>
							<td rowspan="5" align="center" width="120" height="150" bgcolor="#BABFCA"><img src="사진" alt="사진"></td>
							<td rowspan="2" align="center" bgcolor="#BABFCA">성 명</td>
							<td align="center" bgcolor="#BABFCA">한 글</td>
							<td width="225"><input type="text" class="inputTxt p30" id="name" name="name"></td>
							<td align="center" width="120" bgcolor="#BABFCA">주 민 번 호</td>
							<td width="225"></td>
						</tr>
						<tr>
							<!--<td></td>-->
							<!--<td></td>-->
							<td align="center" bgcolor="#BABFCA">한 자</td>
							<td></td>
							<td align="center" bgcolor="#BABFCA">생 년 월 일</td>
							<td width="225"><input type="text" class="inputTxt p30" id="birthday" name="birthday"></td>
							</tr>
						<tr>
							<!--<td></td>-->
							<td colspan="2" align="center" width="120" bgcolor="#BABFCA">전 화 번 호</td>
							<!--<td></td>-->
							<td></td>
							<td align="center" bgcolor="#BABFCA">휴 대 폰</td>
							<td width="225"><input type="text" class="inputTxt p30" id="hp" name="hp"></td>
						</tr>
						<tr>
							<!--<td></td>-->
							<td colspan="2"  align="center" bgcolor="#BABFCA">E-Mail</td>
							<!--<td></td>-->
							<td colspan="3"width="225"><input type="text" class="inputTxt p30" id="email" name="email"></td>
							<!--<td></td>-->
							<!--<td></td>-->
						</tr>
						<tr>
							<!--<td></td>-->
							<td colspan="2" align="center" bgcolor="#BABFCA">현 주 소</td>
							<!--<td></td>-->
							<td colspan="3"></td>
							<!--<td></td>-->
							<!--<td></td>-->
						</tr>
					</table>
					
					<table border="1" align="center">
						
						<tr>
							<td rowspan="4" align="center" bgcolor="#BABFCA" width="50">학 력</td>
							<td align="center" width="125"  height="25" bgcolor="#BABFCA">기 간</td>
							<td align="center" width="390" bgcolor="#BABFCA">전 공</td>
							<td align="center" width="130" bgcolor="#BABFCA">소 재 지</td>
							<td align="center" width="130" bgcolor="#BABFCA">졸 업 여 부</td>
							<td align="center" width="130" bgcolor="#BABFCA">비 고</td>
						</tr>
						<!--2줄-->
						<tr>
							<!--<td></td>-->
							<td height="25"></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<!--3줄-->
						<tr>
							<!--<td></td>-->
							<td height="25"></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<!--4줄-->
						<tr>
							<!--<td></td>-->
							<td height="25"></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td rowspan="4" align="center" bgcolor="#BABFCA">경 력</td>
							<td align="center" width="125"  height="25" bgcolor="#BABFCA">기 간</td>
							<td align="center" width="190" bgcolor="#BABFCA">회 사 명</td>
							<td align="center" width="200" bgcolor="#BABFCA">담 당 업 무</td>
							<td align="center" width="130" bgcolor="#BABFCA">직 위</td>
							<td align="center" width="130" bgcolor="#BABFCA">퇴 직 사 유</td>
						</tr>
						<!--2줄-->
						<tr>
							<!--<td></td>-->
							<td height="25"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<!--3줄-->
						<tr>
							<!--<td></td>-->
							<td height="25"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<!--4줄-->
						<tr>
							<!--<td></td>-->
							<td height="25"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td rowspan="4" align="center" bgcolor="#BABFCA">수상  이력</td>
							<td align="center" width="125"  height="25" bgcolor="#BABFCA">수상일자</td>
							<td align="center" width="190" bgcolor="#BABFCA">강 의 명</td>
							<td align="center" width="200" bgcolor="#BABFCA">수 상 날 짜</td>
							<td align="center" width="130" bgcolor="#BABFCA">수 상 명</td>
							<td align="center" width="130" bgcolor="#BABFCA">비 고</td>
						</tr>
						<tr>
							<!--<td></td>-->
							<td height="25"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<!--<td></td>-->
							<td height="25"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<!--<td></td>-->
							<td height="25"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td rowspan="4" align="center" bgcolor="#BABFCA">&nbsp</td>
							<td align="center" width="125"  height="25" bgcolor="#BABFCA">&nbsp</td>
							<td align="center" width="190" bgcolor="#BABFCA">&nbsp</td>
							<td align="center" width="200" bgcolor="#BABFCA">&nbsp</td>
							<td align="center" width="130" bgcolor="#BABFCA">&nbsp</td>
							<td align="center" width="130" bgcolor="#BABFCA">&nbsp</td>
						</tr>
					 <tbody id="detailResumeList">						
								<c:forEach items="${ResumeList}" var="list">
									<tr>										
										<td>${list.no}</td>
										<td>${list.seq}</td>
										<td>${list.certno}</td>
										<td>${list.reg_date}</td>
									</tr>								
								</c:forEach>
						</tbody>

						</tbody> 
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveNotice" name="btn"><span>저장</span></a> 
					<a href="" class="btnType blue" id="btnUpdateNotice" name="btn" style="display:none"><span>수정</span></a> 
					<a href="" class="btnType blue" id="btnDeleteNotice" name="btn"><span>삭제</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>

		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	
	</form>
</body>
</html>