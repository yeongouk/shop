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
	var pageSizeProduct = 7;
	var pageBlockSizeProduct = 10;
	
	
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 상품 조회
		fListProduct();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	

	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSaveProD' :
					fSaveGrpCod();
					break;
				case 'btnDeleteProD' :
					fDeleteProD();
					break;
				case 'btnSaveDtlCod' :
					fSaveDtlCod();
					break;
				case 'btnDeleteDtlCod' :
					fDeleteDtlCod();
					break;
				case 'btnCloseProD' :
				case 'btnCloseDtlCod' :
					gfCloseModal();
					break;
			}
		});
	}
	
	
	/** 상픔 폼 초기화 */
	function fInitFormProduct(object) {
		$("#food_type").focus();
		if( object == "" || object == null || object == undefined) {
			
			$("#food_id").val("");
			$("#food_type").val("");			
			$("#food_name").val("");
			$("#food_price").val("");
			$("#food_count").val("");			
			$("#food_type").attr("readonly", false);			
			$("#food_type").css("background", "#FFFFFF");
			$("#food_type").focus();
		    $("#btnDeleteProD").hide(); 
			
		} else {
			
			$("#food_id").val(object.food_id);
		 	$("#food_type").val(object.typeselect).attr("selected","selected");		 
			$("#food_name").val(object.food_name);
			$("#food_price").val(object.sale_price);
			$("#food_count").val(object.stock_count);
			
			
			$("#food_type").attr("readonly", true);
			$("#food_type").css("background", "#F5F5F5");
			$("#food_name").focus();
			$("#btnDeleteProD").show();
		}
	}
	
	
	/** 상품 저장 validation */
	function fValidateProduct() {

		var chk = checkNotEmpty(
				[
						[ "food_type2", "종류를 입력해 주세요." ]
					,	[ "food_name", "상품 명을 입력해 주세요" ]
					,	[ "pro_price", "상품 가격을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	
	
	
	/** 상품 모달 실행 */
	function fPopModalProduct(food_id) {
		
		console.log(food_id);
		
		// 등록 
		if (food_id == null || food_id=="") {
		
			// Tranjection type 설정
			$("#action").val("I");
			
			// 그룹코드 폼 초기화
			fInitFormProduct();
			
			// 모달 팝업
			gfModalPop("#layer1");

		// 수정 저장
		} else {
			
			// Tranjection type 설정
			$("#action").val("U");
			
			// 그룹코드 단건 조회
			fSelectProduct(food_id);
		}
	}
	
	
	/** 상품 조회 */
	function fListProduct(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeProduct
				,   food_type:$("#type").val()
				,	keyword:$("#keyword").val()
				
		}
		console.log(param);
		console.log(keyword);
		var resultCallback = function(data) {
			flistGrpCodResult(data, currentPage);
		};
		
		console.log(param);
		
		callAjax("/pc/listProduct.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 상품 조회 콜백 함수 */
	function flistGrpCodResult(data, currentPage) {
		
		//alert(data);
		
		// 기존 목록 삭제
		$('#listProduct').empty();
		//$('#listComnGrpCod').find("tr").remove() 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listProduct = $data.find("#listProduct");		
		$("#listProduct").append($listProduct.children());
		
		// 총 개수 추출
		var $totalCntProduct = $data.find("#totalCntProduct");
		var totalCntProduct = $totalCntProduct.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntProduct, pageSizeProduct, pageBlockSizeProduct, 'fListProduct');
		
		//alert(paginationHtml);
		$("#ProductPagination").empty().append( paginationHtml );
		
		// 현재 페이지 설정
		$("#currentPageProduct").val(currentPage);
	}
	
	
/** 상품 단건 조회 */
	function fSelectProduct(food_id) {
		
		var param = { food_id : food_id };
		
		var resultCallback = function(data) {
			fSelectProductResult(data);
		};
		
		callAjax("/pc/selectProduct.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 상품 단건 조회 콜백 함수*/
	function fSelectProductResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer1");
			
			// 그룹코드 폼 데이터 설정
			fInitFormProduct(data.productModel);
			
		} else {
			alert(data.resultMsg);
		}	
	}
	

	/** 상품  저장 */
	function fSaveGrpCod() {
			alert("<<<<<<<<<<<<<<<<<<<<<<<<<<체크<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
		// vaildation 체크
		if ( ! fValidateProduct() ) {
			return;
		}
		
		var param = {
							    food_type : $("#food_type ").val()
						,		food_type2 : $("#food_type option:selected").text()
						,		food_name : $("#food_name").val()
						,		sale_price : $("#food_price").val()
						,		stock_count : $("#food_count").val()
						,		food_id :$("#food_id").val()
						,		action : $("#action").val()
		};	
		console.log(param);
		var resultCallback = function(data) {
			fSaveGrpCodResult(data);
			console.log(data);
		};
		
		callAjax("/pc/saveProduct.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 상품  저장 콜백 함수 */
	function fSaveGrpCodResult(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageProduct").val();
		}
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			alert(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 목록 조회
			fListProduct(currentPage);
			
		} else {
			// 오류 응답 메시지 출력
			alert(data.resultMsg);
		}
		
		// 입력폼 초기화
		fInitFormProduct();
	}

	
	/** 상품 삭제 */
	function fDeleteProD() {
		
		var resultCallback = function(data) {
			fDeleteProDResult(data);
		};
		
		callAjax("/pc/deleteProduct.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	
	
	/** 상품  삭제 콜백 함수 */
	function fDeleteProDResult(data) {
		
		var currentPage = $("#currentPageProduct").val();
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			alert(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 그룹코드 목록 조회
			fListProduct(currentPage);
			
		} else {
			alert(data.resultMsg);
		}	
	}

	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageProduct" value="1">
	
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
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
								class="btn_nav">상품관리</a> <span class="btn_nav bold">상품관리
								</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>상품관리</span> <span class="fr"> <a
								class="btnType blue" href="javascript:fPopModalProduct();" name="modal"><span>등록</span></a>
							</span>						
						</p>
						<table class="col">
							<tr>
							 <th scope="row"> 검색조건 </th>
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
								<a class="btnType blue" href="javascript:fListProduct();" name="modal"><span>검색</span></a>
							</span>
							</th>
							</tr>							
							</table>					
					
						
						<div class="divProductList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="5%">
									<col width="7%">
									<col width="14%">
									<col width="15%">
									<col width="14%">
									<col width="9%">
									<col width="7%">
									
									
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">상품타입</th>
										<th scope="col">상품종류</th>
										<th scope="col">상품 명</th>
										<th scope="col">상품 가격</th>
										<th scope="col">잔여 갯수</th>
										<th scope="col">입고</th>
										
										
									</tr>
								</thead>
								<tbody id="listProduct"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="ProductPagination"> </div>
	
					

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 모달팝업 -->
	<div id="layer1" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>상품관리</strong>
			</dt>
			<dd class="content">
				<input type = "hidden" id="food_id" value="">
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
							<th scope="row">상품종류 <span class="font_red">*</span></th>
							<td>
								<select id="food_type">
										<option value="">선택</option>
										<option value="A">음료</option>
										<option value="B">라면</option>
										<option value="C">간식</option>							
								</select>
							</td>		
						<tr>
							<th scope="row">상품 명 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="food_name" id="food_name" /></td>
						</tr>
						<tr>
							<th scope="row">상품 가격</th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name=food_price id="food_price" /></td>
						</tr>
						<tr>
							<th scope="row">상품수량</th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="food_count" id="food_count" /></td>
						</tr>
						
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveProD" name="btn"><span>저장</span></a> 
					<a href="" class="btnType blue" id="btnDeleteProD" name="btn"><span>삭제</span></a> 
					<a href="" class="btnType gray"  id="btnCloseProD" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
<%-- 
	<div id="layer2" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>상세코드 관리</strong>
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
							<th scope="row">그룹 코드 ID <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="dtl_grp_cod" name="dtl_grp_cod" /></td>
							<th scope="row">그룹 코드 명 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="dtl_grp_cod_nm" name="dtl_grp_cod_nm" /></td>
						</tr>
						<tr>
							<th scope="row">상세 코드 ID <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="dtl_cod" name="dtl_cod" /></td>
							<th scope="row">상세 코드 명 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="dtl_cod_nm" name="dtl_cod_nm" /></td>
						</tr>
						<tr>
							<th scope="row">순서</th>
							<td colspan="3"><input type="text" class="inputTxt" id="dtl_odr" name="dtl_odr" /></td>
						</tr>
						<tr>
							<th scope="row">코드 설명</th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								id="dtl_cod_eplti" name="dtl_cod_eplti" /></td>
						</tr>
						<tr>
							<th scope="row">임시 필드 01</th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								id="dtl_tmp_fld_01" name="dtl_tmp_fld_01" /></td>
						</tr>
						<tr>
							<th scope="row">임시 필드 02</th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								id="dtl_tmp_fld_02" name="dtl_tmp_fld_02" /></td>
						</tr>
						<tr>
							<th scope="row">임시 필드 03</th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								id="dtl_tmp_fld_03" name="dtl_tmp_fld_03" /></td>
						</tr>
						<tr>
							<th scope="row">임시 필드 04</th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								id="dtl_tmp_fld_04" name="dtl_tmp_fld_04" /></td>
						</tr>
						<tr>
							<th scope="row">사용 유무 <span class="font_red">*</span></th>
							<td colspan="3"><input type="radio" id="dtl_use_poa_1"
								name="dtl_use_poa" value="Y" /> <label for="radio1-1">사용</label>
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="dtl_use_poa_2"
								name="dtl_use_poa" value="N" /> <label for="radio1-2">미사용</label></td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveDtlCod" name="btn"><span>저장</span></a>
					<a href="" class="btnType blue" id="btnDeleteDtlCod" name="btn"><span>삭제</span></a>  
					<a href="" class="btnType gray" id="btnCloseDtlCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	--%>
	
	<!--// 모달팝업 -->
</form>
</body>
</html>