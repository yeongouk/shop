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
	var ctmPageSize = 5;    	// 화면에 뿌릴 데이터 수 
	var ctmPageBlock = 5;		// 블럭으로 잡히는 페이징처리 수
 
$(document).ready(function() {
	
	UseCostList();
});
	
	
	
	
	function UseCostList(currentPage) {
		
		currentPage = currentPage || 1;
		
		//alert("currentPage " + currentPage);
		
		var param = {
				currentPage : currentPage,
				pageSize : ctmPageSize
		}
		
		var resultCallback = function(data) {
			fBoardResult(data, currentPage);
		};
		
		callAjax("/stats/UseCostList.do", "post", "text", true, param, resultCallback);
	}
	
	function fBoardResult(data, currentPage) {
		
		
		$('#UseCostList').empty();
		
		var $data = $( $(data).html() );
		
		//console.log(data);
		
		//console.log(JSON.stringify($data));
		
		var $UseCostList = $data.find("#UseCostList");
		$("#UseCostList").append($UseCostList.children());
		
		
		var $totalCnt = $data.find("#totalCnt");
		var totalCnt = $totalCnt.text();
		
		var paginationHtml = getPaginationHtml(currentPage, totalCnt, ctmPageSize, ctmPageBlock, 'UseCostList'); 
	    //alert(paginationHtml);
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
								<span class="btn_nav bold">사용금액대비 음식요금순위</span> 
								<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>사용금액대비 음식요금순위 </span> <span class="fr"></span>
						</p>

						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
	
								<thead>
									<tr>
							           <th scope="col">순서</th>
							           <th scope="col">PC번호</th>
										<th scope="col">아이디</th>
										<th scope="col">번호</th>
										<th scope="col">PC사용금액</th>
										<th scope="col">음식사용금액</th>  
										<th scope="col">판매날짜</th> 
									</tr>
								</thead>
								
								<tbody id="UseCostList">
								
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
