<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>잡코리아 dashboard</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- D3 -->

<script type="text/javascript">

// 페이징 설정 
var noticePageSize = 10;    	// 화면에 뿌릴 데이터 수 
var noticePageBlock = 10;		// 블럭으로 잡히는 페이징처리 수

/* onload 이벤트  */
$(function(){
	// 자유게시판 리스트 뿌리기 함수 
	selectNoticeList();
	
});


/* 공지사항 리스트 불러오기  */
function selectNoticeList(currentPage){
	
	currentPage = currentPage || 1;   // or		
	
//alert("지금 현재 페이지를 찍어봅시다. " + currentPage);
	
	var param = {
			currentPage : currentPage ,
			pageSize : noticePageSize 
	}
	
	var resultCallback = function(data){  // 데이터를 이 함수로 넘깁시다. 
		noticeListResult(data, currentPage); 
	}
	
	callAjax("/supportD/noticeList.do","post","text", true, param, resultCallback);
	
}

/* callAjax 공통 common.js 에서 퍼옴  -> 이렇게 생긴 함수입니다.  

function fOnloadImg(param){
	var resultCallback = function(data) {
		fOnloadImgResult(data);
	};
	callAjax("/image/selectImgSize.do", "post", "json", false, param, resultCallback);
 } */


 /* 공지사항 리스트 data를 콜백함수를 통해 뿌려봅시당   */
 function noticeListResult(data, currentPage){
	 
	 // 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
	 $("#noticeList").empty();
	 //alert("데이터!!! " + data);
	 //console.log("data !!!! " +  data);
	 
	 //var $data = $( $(data).html() ); // data의 .html()통해서 html구문을 끌어온다.
	 //alert("데이터 찍어보자!!!! " +  $data); // object
	 
	 $("#noticeList").append(data);

	 
	 // 리스트의 총 개수를 추출합니다. 
	 //var totalCnt = $data.find("#totalCnt").text();
	 var totalCnt = $("#totalCnt").val();  // qnaRealList() 에서보낸값 
     //alert("totalCnt 찍어봄!! " + totalCnt);
	 
	 // * 페이지 네비게이션 생성 (만들어져있는 함수를 사용한다 -common.js)
	 // function getPaginationHtml(currentPage, totalCount, pageRow, blockPage, pageFunc, exParams)
	 // 파라미터를 참조합시다. 
     var list = $("#tmpList").val();
	 //var listnum = $("#tmpListNum").val();
     var pagingnavi = getPaginationHtml(currentPage, totalCnt, noticePageSize,noticePageBlock, 'selectNoticeList',[list]);
	 
     console.log("pagingnavi : " + pagingnavi);
	 // 비운다음에 다시 append 
     $("#pagingnavi").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 
	 
	 // 현재 페이지 설정 
    $("#currentPage").val(currentPage);
	 
 }
 
 
 /* 공지사항 모달창(팝업) 실행  */
 function fNoticeModal(nt_no) {
	 
	 // 신규저장 하기 버튼 클릭시 (값이 null)
	 if(nt_no == null || nt_no==""){
		// Tranjection type 설정
		//alert("넘을 찍어보자!!!!!!" + nt_no);
		
		$("#action").val("I"); // insert 
		frealPopModal(nt_no); // 공지사항 초기화 
		
		//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
		gfModalPop("#notice");
		
	 }else{
		// Tranjection type 설정
		$("#action").val("U");  // update
		fdetailModal(nt_no); //번호로 -> 공지사항 상세 조회 팝업 띄우기
	 }

 }
 
 
 /*공지사항 상세 조회*/
 function fdetailModal(nt_no){
	 //alert("공지사항 상세 조회  ");
	 
	 var param = {nt_no : nt_no};
	 var resultCallback2 = function(data){
		 fdetailResult(data);
	 };
	 
	 callAjax("/supportD/detailNoticeList.do", "post", "json", true, param, resultCallback2);
	 //alert("공지사항 상세 조회  22");
 }
 
 /*  공지사항 상세 조회 -> 콜백함수   */
 function fdetailResult(data){

	 //alert("공지사항 상세 조회  33");
	 if(data.resultMsg == "SUCCESS"){
		 //모달 띄우기 
		 gfModalPop("#notice");
		 
		// 모달에 정보 넣기 
		frealPopModal(data.result);
	 
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
		 
		 $("#write_date").val();
		 
		 $("#nt_title").val("");
		 $("#nt_note").val("");
		 
		 $("#btnDeleteNotice").hide(); // 삭제버튼 숨기기
		 $("#btnUpdateNotice").hide();
		 $("#btnSaveNotice").show();
		
		 
	 }else{
		 
		 //alert("숫자찍어보세 : " + object.wno);// 페이징 처리가 제대로 안되서 
		 $("#loginID").val(object.loginID);
		 $("#loginID").attr("readonly", true); // 작성자 수정불가 
		 
		 $("#write_date").val(object.write_date);
		 $("#write_date").attr("readonly", true); // 처음 작성된 날짜 수정불가 
		 
		 $("#nt_title").val(object.nt_title);
		 $("#nt_title").attr("readonly", true);
		 
		 $("#nt_note").val(object.nt_note);
		 $("#nt_note").attr("readonly", true);

		 
		 $("#nt_no").val(object.nt_no); // 중요한 num 값도 숨겨서 받아온다. 
		 
		 $("#btnDeleteNotice").show(); // 삭제버튼 보이기 
		 $("#btnSaveNotice").hide();
		 $("#btnUpdateNotice").css("display","");
		 //if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
		 //$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정
		
		 
	 }
 }
 


	 
</script>

</head>
<body>
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
										<p class="tit">
											<em>공 지 사 항</em>
										</p>
										<table class="col2 mb10" style="width:1000px;">
										
										<colgroup>
						                   <col width="50px">
						                   <col width="200px">
						                    <col width="60px">
						                   <col width="50px">
					                 </colgroup>
					                 
											<thead>
												<tr>
													<th>공지 번호</th>
													<th >공지 사항</th>
													<th >작성일</th>
													<th>관리자</th>
													
												</tr>
											</thead>
											<tbody id="noticeList"></tbody>
		
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
							
						</div>
				

                        <div class="dashboard2 mt30 mb20">
                        
							<ul>
								<li>
									<div class="col">
										<p class="tit">
											<em>외부 사이트 링크</em>
										</p>
										<table class="col2 mb10" style="width:1020px;">
																					
												<tr>
													<td><a href="https://www.naver.com"><img align="top" src="/images/site/naver.PNG" /></a></td>
													<td><a href="https://www.daum.net"><img src="/images/site/daum.PNG" /></a></td>
													<td><a href="https://www.google.com"><img src="/images/site/google.PNG" /></a></td>
													<td><a href="http://www.netmarble.net"><img src="/images/site/netmable.PNG" /></a></td>
												</tr>
												<tr>
												<td><a href="https://www.naver.com">네이버</a></td>
												<td><a href="https://www.daum.net">다음</a></td>
												<td><a href="https://www.google.com">구글</a></td>
												<td><a href="http://www.netmarble.net">넷마블</a></td>
												</tr>
												<tr>
													<td><a href="https://www.pmang.com"><img src="/images/site/pmang.PNG" /></a></td>
													<td><a href="http://pubg.game.daum.net"><img src="/images/site/bg.PNG" /></a></td>
													<td><a href="https://kr.leagueoflegends.com/ko"><img src="/images/site/lol.PNG" /></a></td>
													<td><a href="https://www.nexon.com/Home/Game"><img src="/images/site/nexon.PNG" /></a></td>
												</tr>
													<tr>
												<td><a href="https://www.pmang.com">피망</a></td>
												<td><a href="http://pubg.game.daum.net">배틀그라운드</a></td>
												<td><a href="https://kr.leagueoflegends.com/ko">리그오브레전드</a></td>
												<td><a href="https://www.nexon.com/Home/Game">넥슨</a></td>
												</tr>
											
										</table>
									</div>
								</li>						
							</ul>
						</div>						
					</div>
				</li>
			</ul>

		</div>
	</div>
	
		<!-- 모달팝업 -->
	<div id="notice" class="layerPop layerType2" style="width: 600px;">
		<input type="hidden" id="nt_no" name="nt_no"> <!-- 수정시 필요한 num 값을 넘김  -->
		
		<dl>
			<dt>
				<strong>공지사항 상세보기 </strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>

					<tbody>
						<tr>
							<th scope="row">작성자 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="loginID" id="loginID" /></td>
							<!-- <th scope="row">작성일<span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="write_date" id="write_date" /></td> -->
						</tr>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="nt_title" id="nt_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="3">
								<textarea class="inputTxt p100" name="nt_note" id="nt_note">
								</textarea>
							</td>
						</tr>
						
					</tbody>
				</table>

				<div class="btn_areaC mt30">
			
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>

		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
</body>
</html>