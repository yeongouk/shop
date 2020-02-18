<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>JobKorea</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
    
   // pc현황 메인 페이징 설정
    var pageSizePcCurrent = 10;
    var pageBlockSizePcCurrent = 5;
    
  // 유저목록 페이징 설정
	var pageSizePcUserList = 10;
	var pageBlockSizePcUserList = 4;

	/** OnLoad event */
	$(function() {
		
	// pc현황 조회
	var currentPage = "1";
	fPcCurrentList(currentPage);

		
		// 버튼 이벤트 등록
		//fRegisterButtonClickEvent();

	});
	
	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSearchUser' :
					fSearchUser();
					break;
				case 'btnSavePcCurrent' :
					fPopModalUserPayment();
					break;
				case 'btnDeletePcCurrent' :
					fDeleteGrpCod();
					break;
				case 'btnClosePcCurrent' :
					gfCloseModal();
					break;
			}
		});
	}

	
	/** pc현황 조회 */
	function fPcCurrentList(currentPage) {
		
      currentPage = currentPage || 1;
      //alert("지금 현재 페이지를 찍어봅시다. " + currentPage);
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizePcCurrent
		}
		
		var resultCallback = function(data) {
			fPcCurrentListResult(data, currentPage);
		};
		
		callAjax("/system/pcCurrentList.do", "post", "text", true, param, resultCallback);
		//alert("에이작스");
	}
	/** pc현황 조회 콜백 함수 */
	function fPcCurrentListResult(data, currentPage) {
		
	     //alert(data);
		// 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
	     $("#pcCurrentList").empty();
		//alert("데이터!!! " + data);
		//console.log("data !!!! " +  data);
	
		var $data = $( $(data).html() );// data의 .html()통해서 html구문을 끌어온다.
		//alert("데이터 찍어보자!!!! " +  $data); // object
		
		// 신규 목록 생성
		var $pcCurrentList = $data.find("#pcCurrentList");
		$("#pcCurrentList").append($pcCurrentList.children());
	
		var totalCnt = $("#totalCnt1").val(); 
	
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCnt, pageSizePcCurrent, pageBlockSizePcCurrent, 'fPcCurrentList');
		
		//alert(paginationHtml);
		$("#pcCurrentPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPagePcCurrent").val(currentPage);

		 //$("#pcCurrentList").append(data);
	
		 // 현재 페이지 설정 
		// $("#currentPage").val(currentPage);
	}
	
	
	/** 자리 배정 , 결제 모달 실행 */
	function fPopModalPcCurrent(pc_no,useYn) {
		
		//결제 팝업
		if ( useYn=="Y") {
			
			//alert("payment 이거 되나??" + pc_no);
			
			var pc_no1 = pc_no

			gfModalPop("#Amt");
			
			pcUserPayment(pc_no1);
			

		// 자리 배정 팝업
		} else {
			
			gfModalPop("#userAllot");
			
			var currentPage = $("#currentPageUserCurrent").val();
	   		
	   		$("#pc_no").val(pc_no);
	   		
	   		fSearchUser(currentPage);
			
		}
		
			
	}
	

	/** 유저 아이디 조회 */
	function fSearchUser(currentPage) {
		
      currentPage = currentPage || 1;
      var pc_no = $("#pc_no").val();
      
      //alert("지금 현재 페이지를 찍어봅시다. " + currentPage);
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizePcUserList
				,	pc_no : pc_no
		}
		
		var resultCallback = function(data) {
			fSearchUserListResult(data, currentPage);
		};
		
		callAjax("/system/searchUserList.do", "post", "json", true, param, resultCallback);
		//alert("에이작스");
	}
	
	/** 유저 아이디 조회 콜백 함수 */
	function fSearchUserListResult(data, currentPage) {
		
	     //alert(data);
		// 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
	     $("#searchUserList").empty();
		
	     var persontext = JSON.stringify(data.searchUserList);
		 var inserthtml = "";
		 var persont = data.searchUserList;
		 
		//alert(persontext);
		
		/* $.each(persont, function(key, value) {
			var item = value;
			//alert(item);
			$.each(item, function(key, value) {
				//alert('key:' + key + ' / ' + 'value:' + value + " : " + JSON.stringify(value));
				inserthtml += "<tr> <td>" + value + "</td> </tr>";
			});
		}); */
		
		 /* 
		  
		 $.each(persont, function(element) {
	         
	            inserthtml += "<tr> <td>" + element.loginID + "</td> </tr>";
	      
	      }); 리스트는 오브젝트 각 항목 선언 
		   */
		   
		   
		   $.each(persont, function(index, item) {
		         inserthtml += 
		        	 	
		        	 
					        	 			"<tr>" + 
					        	 				/*  "<td>" + data.totalCntPcUserInfo + '-' + nRow + "</td>" */
					         					 "<td>" + item.loginID   + "</td>" +
					         					 "<td>" + item.user_type   + "</td>" +
					         					 "<td>" + item.name   + "</td>" +
					         					 "<td>" + item.tel1   + "</td>" +
					         					 "<td>" + item.tel2   + "</td>" +
					         					 "<td>" + item.tel3   + "</td>" +
					         					 "<td>" + 
					         					 	"<a href='javascript:pcInsertFunction(" + item.loginID +','+ data.pc_no + " );'> "  
					         					 	    	+ "<span> 배정 </span>" +
					         					 	"</a>"
					         					 + "</td>" +
			       				     	   "</tr>";
		   });
	      
	   // 신규 목록 생성
	     $("#searchUserList").empty().append(inserthtml); 
	    
		//alert("데이터!!! " + data);
		//console.log("data !!!! " +  data);
		//var $data = $( $(data).html() );// data의 .html()통해서 html구문을 끌어온다.
		//alert("데이터 찍어보자!!!! " +  $data); // object
		
		/* // 신규 목록 생성
		var $pcCurrentList = $data.find("#searchUserList");
		$("#searchUserList").append($pcCurrentList.children()); */
	
		var totalCnt = data.totalCnt;
		//var totalCntPcUserInfo = $totalCntPcUserInfo.text();
		 //alert("totalCntPcUserInfo" + totalCntPcUserInfo);
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCnt, pageSizePcUserList, pageBlockSizePcUserList,'fSearchUser');
		
		//alert(paginationHtml);
		$("#searchUserPagination").empty().append( paginationHtml );
 	   
		// 현재 페이지 설정
		$("#currentPageUserCurrent").val(currentPage);
	
		 //$("#pcCurrentList").append(data);
		 
		 // 현재 페이지 설정 
		// $("#currentPage").val(currentPage);
	}
	
	
	// 자리 배정
	function pcInsertFunction(loginID, pc_no) {
		var currentPage = currentPage || 1;
		
		//alert("asdf" + loginID +"피시넘버ㅓㅓㅓㅓㅓㅓ" +pc_no);
		

		var param = {
				 loginID : loginID
				,pc_no : pc_no
		};
		
		var resultCallback1 = function(data) {
			flistUserInsertSeat(data);
		};

		callAjax("/system/savePcCurrent.do", "post", "json", true, param, resultCallback1);
		//alert("배정 이거 되나??");
		
	}
	function flistUserInsertSeat(data) {
		gfCloseModal();
		//alert("리턴ㄴㄴㄴㄴㄴㄴㄴㄴ"+data);
		fPcCurrentList();
	}
	


	// 결제 정보 가져오기
function pcUserPayment(pc_no1) {
		
		//alert(pc_no1);
		var param = {
					pc_no : pc_no1
				
		}
		
		var resultCallback = function(data) {
			fPaymentResult(data);
		};

		callAjax("/system/userAmt.do", "post", "json", true, param, resultCallback);
		//alert("1결제 이거 되나??");
}
	
function fPaymentResult(data) {
	
	$('#paymentamt').empty(); 
	
	//var $data = $( $(data).html() );
	//var $paymentamt = $data.find("#paymentamt");	
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
		
	//$("#paymentamt").append($paymentamt.children());
		 $("#paymentamt").empty().append(inserthtml7); 
}


//결제 저장
function fPopModalUserPayment(loginID, pc_no, seq) {
	
	alert("결제"+pc_no + "아이디" + loginID + "일련번호" + seq);
	
	var param = {
			loginID : loginID
		   ,pc_no : pc_no
		   ,seq : seq
	}
	
	var resultCallback = function(data) {
		fUserPaymentResult(data);
	};

	callAjax("/system/userPayment.do", "post", "text", true, param,
			resultCallback);
	
} 


function fUserPaymentResult(data) {

	//alert("찐 결제"+pc_no);
	alert(data.pc_no+"번 pc 결제 되었습니다.");
	
	gfCloseModal();
	fPcCurrentList();


}


</script>

</head>
<body>
	<form id="myForm" action="" method="">
	    <input type="hidden" id="currentPage" value="1">
		<input type="hidden" id="tmpPcSeat" value=""> 
		<input type="hidden" id="tmpPcSeatNm" value="">
	    <input type="hidden" name="action"id="action" value="">
	    <input type="hidden" name="currentPageUserCurrent" id="currentPageUserCurrent" value="">
		<input type="hidden" name="currentPagePcCurrent" id="currentPagePcCurrent" value="">
		<input type="hidden" name="pc_no" id="pc_no" value="">

		<!-- 모달 배경 -->
		<div id="mask"></div>

		<div id="wrap_area">

			<h2 class="hidden">header 영역</h2>
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

			<h2 class="hidden">메뉴바 영역</h2>
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
								<a href="#" class="btn_nav">시스템 관리</a> 
								<span class="btn_nav bold">pc 현황</span>
								<a href="#" class="btn_set refresh">새로고침</a>
							 </p>

							<p class="conTitle">
								<span>pc 현황</span> 
							</p>

							<div class="divPcCurrentList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="6%">
										<col width="12%">
										<col width="5%">
										<col width="14%">
										<col width="14%">
										<col width="11%">
										<col width="11%">
										<col width="14%">
									</colgroup>

									<thead>
										<tr>
											<th scope="col">pc 번호</th>
											<th scope="col">사용자 ID</th>
											<th scope="col">사용 여부</th>
											<th scope="col">로그인 시간</th>
											<th scope="col">로그아웃 시간</th>
											<th scope="col">사용 시간</th>
											<th scope="col">이용 금액</th>
											<th scope="col">배정 / 결제</th>
										</tr>
									</thead>
									<tbody id=pcCurrentList></tbody>
								</table>
							</div>
							<div  class="paging_area"  id="pcCurrentPagination"> </div>

							<h3 class="hidden">풋터 영역</h3>
							<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>
		
<!-- 자리 배정 모달팝업 -->
		<div id="userAllot" class="layerPop layerType2" style="width: 650px;">
	        <dl>
				<dd class="content">
					<div class="dashboard2 mt30 mb20">
						<ul>
							<li>
								<div class="col">
									<p class="tit">
										<em> PC 자리 배정</em>
									</p>
											<div class="hiddenData">
												<span id="totalCnt">${totalCnt}</span>
											</div>
											<table class="col2 mb10" style="overflow:scroll; width: 600px;">
												<thead>
													<tr>
														<td align="center">로그인 아이디</td>
														<td align="center">유저타입</td>
														<td align="center">이름</td>
														<td align="center">tel1</td>
														<td align="center">tel2</td>
														<td align="center">tel3</td>
														<td align="center">배정</td>
													</tr>
												</thead>
												<tbody id="searchUserList">
										</tbody>
									</table>

								</div>
								<div class="paging_area" id="searchUserPagination"></div>
							</li>
						</ul>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>	
			
		
	<!-- 결제 모달팝업 -->
		<div id="Amt" class="layerPop layerType2" style="width: 600px;">
			<dl>
				<dt>
					<strong>결제 정보</strong>
				</dt>
				<dd class="content">
					<!-- s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>
						<colgroup>
							  <col width="120px">
                                 <col width="120px">
                                 <col width="120px">
                                 <col width="120px">
                                 <col width="120px">
                                 <col width="120px">
                                 <col width="120px">
						</colgroup>
                               <thead>
										<tr>
											<th scope="col">pc 번호</th>
											<th scope="col">사용자 ID</th>
											<th scope="col">일련번호</th>
											<th scope="col">PC 총 사용금액</th>
		                                    <th scope="col">음식 주문 금액</th>
		                                    <th scope="col">합계금액</th>
		                                    <th scope="col">완납 여부</th>
											
										</tr>
									</thead>
						<tbody id=paymentamt>
						</tbody>
					</table>
					<div class="btn_areaC mt30">
					<!-- <a href="" class="btnType blue" id="btnSavePcCurrent" name="btn"><span>결제</span></a>  -->
					<a href=""	class="btnType gray"  id="btnClosePcCurrent" name="btn"><span>취소</span></a>
				</div>
				 </dd>
			   </dl>
			</div>	
	</form>
</body>
</html>