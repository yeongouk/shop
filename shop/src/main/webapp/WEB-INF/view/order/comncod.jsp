<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>JobKorea</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 그룹코드 페이징 설정
	var pageSizeComnGrpCod = 5;
	var pageBlockSizeComnGrpCod = 10;
	
	// 상세코드 페이징 설정
	var pageSizeComnDtlCod = 5;
	var pageBlockSizeComnDtlCod = 10;
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 그룹코드 조회
		fListComnGrpCod();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	

	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSaveGrpCod' :
					fSaveGrpCod();
					break;
				case 'btnDeleteGrpCod' :
					fDeleteGrpCod();
					break;
				case 'btnSaveDtlCod' :
					fSaveDtlCod();
					break;
				case 'btnDeleteDtlCod' :
					fDeleteDtlCod();
					break;
				case 'btnCloseGrpCod' :
				case 'btnCloseDtlCod' :
					gfCloseModal();
					break;
			}
		});
	}
	
	//검색  
	 function food_search(currentPage) {
	      
	      currentPage = currentPage || 1;
	         
	         var title1 = $('#title1');
	         var from_date = $('#from_date');
	         var to_date = $('#to_date');
	         
	         var param = {
	                   title1 : title1.val()
	               ,   from_date : from_date.val()
	               ,   to_date : to_date.val()
	               ,   currentPage : currentPage
	               ,   pageSize : freeBoardPageSize
	         }
	         
	         var resultCallback = function(data) {
	        	 freeBoardListResult(data, currentPage); 
	         };
	         
	         callAjax("/commu/freeBoardList.do", "post", "text", true, param, resultCallback);
	   } 
	
	/** 그룹코드 폼 초기화 */
	function fInitFormGrpCod(object) {
		$("#grp_cod").focus();
		if( object == "" || object == null || object == undefined) {
			
			$("#grp_cod").val("");
			$("#grp_cod_nm").val("");
			$("#grp_cod_eplti").val("");
			$("#grp_tmp_fld_01").val("");
			$("#grp_tmp_fld_02").val("");
			$("#grp_tmp_fld_03").val("");
			$("input:radio[name=grp_use_poa]:input[value='Y']").attr("checked", true);
			$("#grp_cod").attr("readonly", false);
			$("#grp_cod").css("background", "#FFFFFF");
			$("#grp_cod").focus();
			$("#btnDeleteGrpCod").hide();
			
		} else {
			
			$("#grp_cod").val(object.grp_cod);
			$("#grp_cod_nm").val(object.grp_cod_nm);
			$("#grp_cod_eplti").val(object.grp_cod_eplti);
			$("#grp_tmp_fld_01").val(object.tmp_fld_01);
			$("#grp_tmp_fld_02").val(object.tmp_fld_02);
			$("#grp_tmp_fld_03").val(object.tmp_fld_03);
			$("input:radio[name=grp_use_poa]:input[value="+object.use_poa+"]").attr("checked", true);
			$("#grp_cod").attr("readonly", true);
			$("#grp_cod").css("background", "#F5F5F5");
			$("#grp_cod_nm").focus();
			$("#btnDeleteGrpCod").show();
		}
	}
	
	
	/** 상세코드 폼 초기화 */
	function fInitFormDtlCod(object) {

		var grpCod = $("#tmpGrpCod").val();
		var grpCodNm = $("#tmpGrpCodNm").val();

		if( object == "" || object == null || object == undefined) {
			
			$("#dtl_grp_cod").val(grpCod);
			$("#dtl_grp_cod_nm").val(grpCodNm);
			$("#dtl_cod").val("");
			$("#dtl_cod_nm").val("");
			$("#dtl_odr").val("");
			$("#dtl_cod_eplti").val("");
			$("#dtl_tmp_fld_01").val("");
			$("#dtl_tmp_fld_02").val("");
			$("#dtl_tmp_fld_03").val("");
			$("#dtl_tmp_fld_04").val("");
			$("input:radio[name=dtl_use_poa]:input[value='Y']").attr("checked", true);
			
			$("#dtl_grp_cod").attr("readonly", true);
			$("#dtl_grp_cod").css("background", "#F5F5F5");
			$("#dtl_grp_cod_nm").attr("readonly", true);
			$("#dtl_grp_cod_nm").css("background", "#F5F5F5");
			$("#dtl_cod").attr("readonly", false);
			$("#dtl_cod").css("background", "#FFFFFF");
			$("#btnDeleteDtlCod").hide();
			$("#dtl_cod").focus();
			
		} else {

			$("#dtl_grp_cod").val(object.grp_cod);
			$("#dtl_grp_cod_nm").val(object.grp_cod_nm);
			$("#dtl_cod").val(object.dtl_cod);
			$("#dtl_cod_nm").val(object.dtl_cod_nm);
			$("#dtl_odr").val(object.odr);
			$("#dtl_cod_eplti").val(object.dtl_cod_eplti);
			$("#dtl_tmp_fld_01").val(object.tmp_fld_01);
			$("#dtl_tmp_fld_02").val(object.tmp_fld_02);
			$("#dtl_tmp_fld_03").val(object.tmp_fld_03);
			$("#dtl_tmp_fld_04").val(object.tmp_fld_04);
			$("input:radio[name=dtl_use_poa]:input[value='"+object.use_poa+"']").attr("checked", true);
			
			$("#dtl_grp_cod").attr("readonly", true);
			$("#dtl_grp_cod").css("background", "#F5F5F5");
			$("#dtl_grp_cod_nm").attr("readonly", true);
			$("#dtl_grp_cod_nm").css("background", "#F5F5F5");
			$("#dtl_cod").attr("readonly", true);
			$("#dtl_cod").css("background", "#F5F5F5");
			$("#btnDeleteDtlCod").show();
			$("#dtl_cod_nm").focus();
		}
	}
	
	
	/** 그룹코드 저장 validation */
	function fValidateGrpCod() {

		var chk = checkNotEmpty(
				[
						[ "grp_cod", "그룹 코드를 입력해 주세요." ]
					,	[ "grp_cod_nm", "그룹 코드 명을 입력해 주세요" ]
					,	[ "grp_cod_eplti", "그룹 코드 설명을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	/** 상세코드 저장 validation */
	function fValidateDtlCod() {

		var chk = checkNotEmpty(
				[
						[ "dtl_grp_cod", "그룹 코드를 선택해 주세요." ]
					,	[ "dtl_cod", "상세 코드를 입력해 주세요." ]
					,	[ "dtl_cod_nm", "상세 코드 명을 입력해 주세요" ]
					,	[ "dtl_cod_eplti", "상세 코드 설명을 입력해 주세요." ]
					,	[ "dtl_odr", "상세 코드 설명을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	/** 그룹코드 모달 실행 */
	function fPopModalComnGrpCod(grp_cod) {
		
		// 신규 저장
		if (grp_cod == null || grp_cod=="") {
		
			// Tranjection type 설정
			$("#action").val("I");
			
			// 그룹코드 폼 초기화
			fInitFormGrpCod();
			
			// 모달 팝업
			gfModalPop("#layer1");

		// 수정 저장
		} else {
			
			// Tranjection type 설정
			$("#action").val("U");
			
			// 그룹코드 단건 조회
			fSelectGrpCod(grp_cod);
		}
	}
	
	
	/** 그룹코드 조회 */
	function fListComnGrpCod(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeComnGrpCod
				,   food_type:$("#type").val()
				,	keyword:$("#keyword").val()
		}
		console.log(param);
		console.log(keyword);
		var resultCallback = function(data) {
			flistGrpCodResult(data, currentPage);
		};
		
		callAjax("/order/listComnGrpCod.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 그룹코드 조회 콜백 함수 */
	function flistGrpCodResult(data, currentPage) {
		
		//alert(data);
		
		// 기존 목록 삭제
		$('#listComnGrpCod').empty();
		//$('#listComnGrpCod').find("tr").remove() 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listComnGrpCod = $data.find("#listComnGrpCod");		
		$("#listComnGrpCod").append($listComnGrpCod.children());
		
		// 총 개수 추출
		var $totalCntComnGrpCod = $data.find("#totalCntComnGrpCod");
		var totalCntComnGrpCod = $totalCntComnGrpCod.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntComnGrpCod, pageSizeComnGrpCod, pageBlockSizeComnGrpCod, 'fListComnGrpCod');
		
		//alert(paginationHtml);
		$("#comnGrpCodPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageComnGrpCod").val(currentPage);
	}
	

	
	/** 상세코드 목록 조회 */
	function fListComnDtlCod(currentPage, food_id, food_name) {
		
		currentPage = currentPage || 1;
		
		// 그룹코드 정보 설정
		$("#tmpGrpCod").val(food_id);
		$("#tmpGrpCodNm").val(food_name);
		
		var param = {
					food_id : food_id
				,	currentPage : currentPage
				,	pageSize : pageSizeComnDtlCod
		}
		
		var resultCallback = function(data) {
			flistDtlCodResult(data, currentPage);
		};
		
		callAjax("/order/listComnDtlCod.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 상세코드 조회 콜백 함수 */
	function flistDtlCodResult(data, currentPage) {
		
		// 기존 목록 삭제
		//$('#listComnDtlCod').empty(); 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listComnDtlCodModel = $data.find("#listComnDtlCod");		
		$("#listComnDtlCodModel").append($listComnDtlCodModel.children());
		
		// 총 개수 추출
		var $totalCntComnDtlCod = $data.find("#totalCntComnDtlCod");
		var totalCntComnDtlCod = $totalCntComnDtlCod.text(); 
		
		// 페이지 네비게이션 생성
		var food_id = $("#tmpGrpCod").val();
		var food_name = $("#tmpGrpCodNm").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCntComnDtlCod, pageSizeComnDtlCod, pageBlockSizeComnDtlCod, 'fListComnDtlCod', [food_id]);
		$("#comnDtlCodPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageComnDtlCod").val(currentPage);
	}
	
	
function Gopay() {
		
		
		alert("결제 ");
		
		var rowCnt = $("#listComnDtlCod").find("tr").length;
	    var param =[];
	    var temp = {};
	    
		for(i=0; i<rowCnt; i++){//0,1
			
			temp ={
				   food_id :   $("#listComnDtlCod").children().eq(i).children().eq(0).text()//children (번호 1번째tr ,eq0)  tr에  -> children (1번째,eq0) td 태그 번호출력
				 , food_type : $("#listComnDtlCod").children().eq(i).children().eq(1).text()// 2번째 td태그의 종류출력 
				 , food_name :  $("#listComnDtlCod").find("input").eq(i).val()//수량   input 태그의 0번째 수량출력
				
	
			}
			param.push(temp);
			
			
		}
		console.log(param);
		
		var test = {
					paramMap : param
		};
		
		var resultCallback = function(data) {
			fSaveDtlCodResult(data);
		};
		
		
		callAjax("/order/saveComnDtlCod.do", "post", "json", true, test, resultCallback);     
	}
	
	
	
	/** 상세코드 단건 조회 콜백 함수*/
	function fSelectDtlCodResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer2");
			
			// 그룹코드 폼 데이터 설정
			fInitFormDtlCod(data.comnDtlCodModel);
			
		} else {
			alert(data.resultMsg);
		}	
	}
	
	
	/** 상세코드 저장 */
	function fSaveDtlCod() {

		// vaildation 체크
		if ( ! fValidateDtlCod() ) {
			return;
		}
		
		var resultCallback = function(data) {
			fSaveDtlCodResult(data);
		};
		
		callAjax("/order/saveComnDtlCod.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	$(function(){

		$('input.num_only').on('keyup',function(){
		          var cnt = $(".exam input.num_sum").length;     
		          console.log(cnt);
		          
		  for( var i=1; i< cnt; i++){
		     var sum = parseInt($(this).val() || 0 );
		     sum++
		    console.log(sum);
		  }
		  
		            var sum1 = parseInt($("#fn_type1_price").val() || 0 ); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
		            var sum2 = parseInt($("#fn_type2_price").val() || 0);
		            

		            var sum = sum1 * sum2 ;
		            console.log(sum);
		            $("#fn_total").val(sum);
		        });


		 
		});
	
	
	
	/** 상세코드 저장 콜백 함수 */
	function fSaveDtlCodResult(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageComnDtlCod").val();
		}
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			alert(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 목록 조회
			var food_id = $("#tmpGrpCod").val();
			var food_name = $("#tmpGrpCodNm").val();
			fListComnDtlCod(currentPage, food_id, food_name);
			
		} else {
			// 오류 응답 메시지 출력
			alert(data.resultMsg);
		}
		
		// 입력폼 초기화
		fInitFormDtlCod();
	}
	
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageComnGrpCod" value="1">
	<input type="hidden" id="currentPageComnDtlCod" value="1">
	<input type="hidden" id="food_id" value="">
	<input type="hidden" id="food_name" value="">
	<input type="hidden" name="action" id="action" value="">
	
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
								class="btn_nav">시스템 관리</a> <span class="btn_nav bold">주문하기
								</span>
						</p>

						<p class="conTitle">
							<span>주문 및 결제</span> <span class="fr">
							</span>
						</p>						
						<table class="col">
							<tr>							 
								 <th scope="row">
							 		<SELECT id= "type"> <!-- 검색 컬럼 -->
							     	   <OPTION value=''>전체 목록</OPTION>
							     	   <OPTION value='food_type2'>상품종류</OPTION>
							    	    <OPTION value='food_name'>상품명</OPTION>    				       
					       			</SELECT>
							 	</th>
								<td><input type='text' class = "inpuTxt p100" name= 'keyword' id="keyword"/> 
								<th scope="row">
								<span class='fr'>
								<a class="btnType blue" href="javascript:fListComnGrpCod();" name="modal"><span>검색</span></a>
							</span>
							</th>
							</tr>							
							</table>	
								
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="6%">
									<col width="7%">
									<col width="10%">
									<col width="14%">
									<col width="14%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">상품타입</th>
										<th scope="col">상품종류</th>									
										<th scope="col">상품명</th>
										<th scope="col">상품 가격</th>
									</tr>
								</thead>
								<tbody id="listComnGrpCod"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="comnGrpCodPagination"> </div>
	
						<p class="conTitle mt50">
							<span>주문리스트</span> <span class="fr"> <a
								class="btnType blue"  href="javascript:Gopay();" name="modal"><span>결제</span></a>
							</span>
						</p>
	
						<div class="divComDtlCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="6%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="7%">
									<col width="7%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">상품타입</th>
										<th scope="col">상품종류</th>									
										<th scope="col">상품명</th>
										<th scope="col">상품 가격</th>
										<th scope="col">수량</th>
									</tr>
								</thead>
								<tbody id="listComnDtlCodModel">									
								</tbody>
							</table>
					<table class="table table-bordered exam" >
						<tr>
							<th class="align-middle bg-light text-center p-2" align="right" >합계</th>
					      
					      	
					        <td class="pl-4" colspan="2">
					          <input type="text" class="form-control text-right font-weight-bold num_only num_comma num_sum" id="fn_total" name="fn_total" value="" >
					          <div id="han_money" class="text-right"></div>
					        </td>
					     </tr>   
			        </table>
						</div>
						
						<div class="paging_area"  id="comnDtlCodPagination"> </div>

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	
</form>
</body>
</html>