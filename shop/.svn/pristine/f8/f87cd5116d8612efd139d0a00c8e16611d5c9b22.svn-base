<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>관리자_설문조사</title>

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
		selectNoticeList();
		
		// 버튼 이벤트 등록 (저장, 수정, 삭제, 모달창 닫기)
		fButtonClickEvent();
	});
	
	function fButtonClickEvent(){
		$('a[name=btn]').click(function(e){
			e.preventDefault();
			
			var btnId = $(this).attr('id');
			
			if(btnId == 'SearchBtn'){
				selectNoticeList();
			}
		});
	}
	
	/* 설문조사 리스트 불러오기  */
	function selectNoticeList(currentPage){
		
		currentPage = currentPage || 1;   // or		
		
		var searchBox = $('#searchBox');
		var searchType = $('#searchType option:selected').val();
		
		var param = {
				currentPage : currentPage 
			   ,pageSize : pageSize
			   ,searchBox : searchBox.val()
			   ,searchType : searchType
		}
		
		var resultCallback = function(data){  // 데이터를 이 함수로 넘깁시다. 
			surveyMgtListResult(data, currentPage); 
		}
		
		callAjax("/manageA/surveyMgtList.do","post","text", true, param, resultCallback);
		
	}
	
	/* callAjax 공통 common.js 에서 퍼옴  -> 이렇게 생긴 함수입니다.  
	
	function fOnloadImg(param){
		var resultCallback = function(data) {
			fOnloadImgResult(data);
		};
		callAjax("/image/selectImgSize.do", "post", "json", false, param, resultCallback);
	 } */
	
	
	 /* 공지사항 리스트 data를 콜백함수를 통해 뿌려봅시당   */
	 function surveyMgtListResult(data, currentPage){
		  
		// 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
 		$("#surveyMgtList").empty();
		 
		var $data = $( $(data).html() ); // data의 .html()통해서 html구문을 끌어온다.
		 
	  	var $surveyMgtList = $data.find("#surveyMgtList");	 	
		$("#surveyMgtList").append($surveyMgtList.children());
	
		 // 리스트의 총 개수를 추출합니다. 
		 var totalCnt = $data.find("#totalCnt").text();
		 var $totalCnt = $("#totalCnt").val();  // qnaRealList() 에서보낸값 
		 
		 // * 페이지 네비게이션 생성 (만들어져있는 함수를 사용한다 -common.js)
		 //function getPaginationHtml(currentPage, totalCount, pageRow, blockPage, pageFunc, exParams)
		 // 파라미터를 참조합시다. 
	     var list = $("#tmpList").val();
		 //var listnum = $("#tmpListNum").val();
	     var pagingnavi = getPaginationHtml(currentPage, totalCnt, pageSize, noticePageBlock, 'selectNoticeList',[list]);
		 
	     //console.log("pagingnavi : " + pagingnavi);
		 // 비운다음에 다시 append 
	     $("#pagingnavi").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 
		 
		 // 현재 페이지 설정 
	    $("#currentPage").val(currentPage);
		 
	 }
	 
	  
	 //공지사항 상세 조회
	 function fdetailModal(no,currentPage){ //재직자,강사
		 
		 currentPage = currentPage || 1;
		 
		 var param = {
			 currentPage : currentPage
			 ,no     : no
			 ,pageSize : pageSizeDtl
		 };
		 
		 var resultCallback2 = function(data){
			 flistDtlResult(data, currentPage);
		 };
		 
		 callAjax("/manageA/surveyMgtDtl.do", "post", "text", true, param, resultCallback2);
		 //alert("공지사항 상세 조회  22"); detailSurveyList.do
	 }
	 
	 
		/** 상세코드 조회 콜백 함수 */
	function flistDtlResult(data, currentPage) {
			
			// 기존 목록 삭제
			$('#surveyMgtDtl').empty(); 
			
			var $data = $( $(data).html() );

			// 신규 목록 생성
			var $surveyMgtDtl = $data.find("#surveyMgtDtl");		
			$("#surveyMgtDtl").append($surveyMgtDtl.children());
			
			// 총 개수 추출
			var $totalCntComnDtlCod = $data.find("#totalCntDtl");
			var totalCntComnDtlCod = $totalCntComnDtlCod.text(); 
			
			// 페이지 네비게이션 생성
			var grp_cod = $("#tmpGrpCod").val();
			var grp_cod_nm = $("#tmpGrpCodNm").val();
			var list = $("#tmpListDtl").val();
			
			var paginationHtml = getPaginationHtml(currentPage, totalCntComnDtlCod, pageSizeDtl, pageBlockSizeDtl, 'fdetailModal');
			
			$("#surveyDtlPagination").empty().append( paginationHtml );
			
			// 현재 페이지 설정
			$("#currentPage").val(currentPage);
		}
	 
</script>
</head>
<body>

	<form id="form" action="" method="">
		<input type="hidden" id="name" value="">
		<input type="hidden" id="point" value="">
		<input type="hidden" id="tmpList" value="">
		<input type="hidden" id="currentPage" value="1">
		<input type="hidden" id="tmpListNum" value=""> <!-- 스크립트에서 값을 설정해서 넘길거임 / 임시 리스트 넘버 -->
		<input type="hidden" name="action" id="action" value=""> 
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
							<span class="btn_nav bold">메인</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<div class="dashboard2 mt30 mb20" >
							<ul>
								<li>
									<div class="col">
										
									
										<p class="conTitle">
											<span>강의 목록</span> <span class="fr"> 
										</p>

											<table>
												<tr>
													<td><select id="searchType" name="searchType">
															<option value="">선택</option>
															<option value="title">과목명</option>
															<option value="name">강사명</option>
													</select> <input type="text" style="width: 150px; height: 30px;"
														id="searchBox" name="searchBox"></td>
													<td width="50" height="60" style="margin-left:800px; font-size: 120;"><a
														href="" class="btnType blue" id="SearchBtn" name="btn" ><span>검 색</span></a></td>
												</tr>
											</table>

											<table class="col2 mb10" style="width:1000px;">
										
										
										<colgroup>
						                   <col width="30px">
						                   <col width="70px">
						                   <col width="30px">
						                   <col width="40px">
						                   <col width="40px">
						                   <col width="30px">
						                   <col width="30px">
					                 </colgroup>
					                 
											<thead>
												<tr>
													<th>분류</th>
													<th>과목</th>
													<th>강사</th>
													<th>강의시작일</th>
													<th>강의종료일</th>
													<th>총평점</th>
													<th>참여인원</th>
												</tr>
											</thead>
											<tbody id="surveyMgtList"></tbody>
		
										</table>
									</div>
								</li>						
							</ul>
							
												<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingnavi" align="center" style="width:990px;">
								<div class="paging">
									<a class="first" href="javascript:selectNoticeList(1)">
									<span class="hidden">맨앞</span></a>
									<a class="pre" href="javascript:selectNoticeList(1)">
									<span class="hidden">이전</span></a>
									<strong>1</strong> 
									<a href="javascript:selectNoticeList(2)">2</a> 
									<a href="javascript:selectNoticeList(3)">3</a> 
									<a href="javascript:selectNoticeList(4)">4</a>
									<a href="javascript:selectNoticeList(5)">5</a>
									<a class="next" href="javascript:selectNoticeList(5)">
									<span class="hidden">다음</span></a>
									<a class="last" href="javascript:selectNoticeList(5)">
									<span class="hidden">맨뒤</span></a>
								</div>
							</div>
							
							<p class="conTitle mt50">
								<span>학생 설문조사</span> <span class="fr"> 
									<a class="btnType blue"  href="javascript:fPopModalComnDtlCod();" name="modal"></a>
								</span>
							</p>
							
							<div class="divComDtlCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="40%">
									<col width="60%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">학생명</th>
										<th scope="col">평가점수</th>
									</tr>
								</thead>
								<tbody id="surveyMgtDtl">
									<tr>
										<td colspan="2">그룹코드를 선택해 주세요.</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="paging_area"  id="surveyDtlPagination"> </div>
						
						</div>
					</div>
				</li>
			</ul>

		</div>
	</div>
	
	</form>
</body>
</html>