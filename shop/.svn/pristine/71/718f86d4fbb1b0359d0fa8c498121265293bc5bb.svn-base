<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>JobKorea</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

 
 // 페이징 설정 
	var unpaidPageSize = 10;    	// 화면에 뿌릴 데이터 수 
	var unpaidPageBlock = 5;		// 블럭으로 잡히는 페이징처리 수
 
$(document).ready(function() {
	
	$('#searchBtn').click(function() {
		board_search();
	});
	
	
	board_search();
});
	
	
	function board_search(currentPage) {
		
		currentPage = currentPage || 1;
			
			var from_date = $('#from_date');
			var to_date = $('#to_date');
			
			var param = {
						from_date : from_date.val()
					,	to_date : to_date.val()
					,	currentPage : currentPage
					,	pageSize : unpaidPageSize
			}
			
			var resultCallback = function(data) {
				fBoardResult(data, currentPage);
			};
			
			callAjax("/stats/unpaidList.do", "post", "text", true, param, resultCallback);
	}
	
	function unpaidList(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
				currentPage : currentPage,
				pageSize : unpaidPageSize
		}
		
		var resultCallback = function(data) {
			fBoardResult(data, currentPage);
		};
		
		callAjax("/stats/unpaidList.do", "post", "text", true, param, resultCallback);
	}
	
	function fBoardResult(data, currentPage) {
		
		$('#unpaidList').empty();
		
		var $data = $( $(data).html() );
		
		//console.log(data);
		
		//console.log(JSON.stringify($data));
		
		var $unpaidList = $data.find("#unpaidList");
		$("#unpaidList").append($unpaidList.children());
		
		var $totalCntUnpaid = $data.find("#totalCntUnpaid");
		var totalCntUnpaid = $totalCntUnpaid.text();
		
		var paginationHtml = getPaginationHtml(currentPage, totalCntUnpaid, unpaidPageSize, unpaidPageBlock, 'unpaidList'); 
		$("#pagingnavi").empty().append(paginationHtml);
		
		$("#currentPageBoard").val(currentPage);
	}
</script>


</head>
<body>
	<!-- ///////////////////// html 페이지  ///////////////////////////// -->

<form id=myForm action="" method="">
	
	<input type="hidden" id="currentPageBoard" value="1">  <!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
	<input type="hidden" name="action" id="action" value=""> 
	<input type="hidden" id="loginId" value="">
	<input type="hidden" id="rwno" value="">
	

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
							<a href="#" class="btn_nav">통계</a> 
								<span class="btn_nav bold">미납요금 조회</span> 
								<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>미납요금 조회 </span> <span class="fr"></span>
						</p>
						
					<!--검색창  -->
					<table width="100%" cellpadding="5" cellspacing="0" border="1"
                        align="left"
                        style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>              
                           <td width="50" height="25" style="font-size: 100%">미납일</td>
                           <td width="50" height="25" style="font-size: 100%">
                            <input type="date" style="width: 120px" id="from_date" name="from_date"></td>
                           <td width="50" height="25" style="font-size: 100%">
                            <input type="date" style="width: 120px" id="to_date" name="to_date"></td>
                           <td width="110" height="60" style="font-size: 120%">
                           <a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a></td> 
                         
                        </tr>
                     </table>    
						
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
	
								<thead>
									<tr>
							            <th scope="col">번호</th>
										<th scope="col">미납 일자</th>
										<th scope="col">pc 번호</th>
										<th scope="col">아이디</th>
										<th scope="col">pc 사용번호</th>
										<th scope="col">음식 주문 금액</th>
										<th scope="col">PC방 이용 금액</th>									
										<th scope="col">총 이용 금액</th>
										<th scope="col">완납 여부</th>	  
									</tr>
								</thead>
								
								<tbody id="unpaidList">
								
								</tbody>
							
							</table>
							</div>	
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingnavi"></div>
							</div>
								

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
</form>
</body>
</html>
