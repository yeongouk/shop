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

	// 강의목록 페이징 설정
	var pageSizeLecture = 5;
	var pageBlockSizeLecture = 5;
	
	var m_Map = new Map();
	
	
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 그룹코드 조회
		fListLecture();
	});
	
	// 신청, 취소 후 결과값 콜백 함수
	function flistResult() {
		//alert("안돌아가나?");
		fListLecture();
		
		gfCloseModal();
		


		
	}
	
	
	// 수강 취소
	function fLectureDtldele() {
		var title = $("#dtl_title").val();
		var no = $("#DtlNo").val();
		//alert(title + "넘버" + no);
		
		var param = {
					title : title
				,	no : no
		}
		var resultCallback = function(data) {
			flistResult();
			alert("수강 취소 되었습니다.");
		};
		
		callAjax("/supportC/lectureDtldele.do", "post", "text", true, param, resultCallback);
		
	}
	
	
	// 수강 신청
	function fLectureDtlinit() {
		var aply = $("#aply").val();
		var pcnt = $("#pcnt").val();
		
		if(aply <= pcnt) {
			
				var title = $("#dtl_title").val();
				var no = $("#DtlNo").val();
				//alert(title + "넘버" + no);
				
				var param = {
							title : title
						,	no : no
				}
				var resultCallback = function(data) {
					flistResult();
					alert("수강 신청 되었습니다.");
				};
				
				callAjax("/supportC/lectureDtlinit.do", "post", "text", true, param, resultCallback);
			
		} else {
			
			alert("수강인원이 가득 찼습니다.");
			flistResult();
		}
		 $("#aply").val("");
		 $("#pcnt").val("");
		
	}
	

	/** 선택된 강의 상세 */
	function fInitFormLecture(Object) {
	//	alert(Object.count);
		
		$("#dtl_title").val(Object.title);
		$("#dtl_date").val(Object.date);
		$("#dtl_plan").val(Object.plan);
		$("#dtl_title").focus();
		$("#DtlNo").val(Object.no);
		$("#btnDownCod").val(Object.title);
	
		if(Object.filename == "null" || Object.filename == null || Object.filename == "") {
			
			var downhtml = 	"<span>" + "파일이 없습니다." + " </span>";						
			 $("#filedownload").empty().append(downhtml); // 위에꺼를 첨부합니다. 
			 
		} else {
			
			var downhtml = 	"<a href='javascript:fDownloadRoomFile(" + Object.no + " );'> "  
		    						+ "<span>" + Object.filename + " </span>" +
							"</a>";
			 $("#filedownload").empty().append(downhtml); // 위에꺼를 첨부합니다. 
			
		}
		
		
		//alert("downhtml : " + downhtml);
		
		if (Object.count > 0) {
			//alert("있다");
			//$("#btnSaveDtlCod").css(  "visibility", "hidden" );
			$("#btnSaveDtlCod").hide(); 
			$("#btnDeleteDtlCod").show(); 
		} else {
			//alert("없다");
			$("#btnSaveDtlCod").show(); 
			$("#btnDeleteDtlCod").hide(); 
			//$("#btnDeleteDtlCod").css(  "visibility", "hidden" );
		}
	}	
	// 강의계획서 다운로드
	function fDownloadRoomFile(no) {
		
		
		if(no == null || no == "" || no == "null"){
			
			alert("다운로드 할 파일이 없습니다.");
			
		} else {
		   
		   var params = "";
		   params += "<input type='hidden' name='no' value='"+ no +"' />";
		   
		   jQuery("<form action='/supportC/downloadLecturePlanDoc.do' method='post'>"+params+"</form>").appendTo('body').submit().remove();
		   
		}
		   
	}
	
	
	
	/** 강의목록 조회 */
	function fListLecture(currentPage) {
		
		currentPage = currentPage || 1;
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeLecture
		}
		
		var resultCallback = function(data) {
			flistLectureResult(data, currentPage);
		};
		
		callAjax("/supportC/listLecture.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 강의목록 조회 콜백 함수 */
	function flistLectureResult(data, currentPage) {
		
		//alert(data);
		
		// 기존 목록 삭제
		$('#listLecture').empty();
		//$('#listLecture').find("tr").remove() 
		
		var $data = $( $(data).html() );

		// 신규 목록 생성
		var $listLecture = $data.find("#listLecture");		
		$("#listLecture").append($listLecture.children());
		
		// 총 개수 추출
		var $totalCntLecture = $data.find("#totalCntLecture");
		var totalCntLecture = $totalCntLecture.text(); 
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntLecture, pageSizeLecture, pageBlockSizeLecture, 'fListLecture');
		
		//alert(paginationHtml);
		$("#lecturePagination").empty().append(paginationHtml);
		
		// 현재 페이지 설정
		$("#currentPageLecture").val(currentPage);
	}
	
	
	/** 선택 강의 정보 조회 */
	function fPopModalLectureDtl(no, title, name, aply, pcnt) {
		$('#aply').val(aply);
		$('#pcnt').val(pcnt);
		
		
		// 신규 저장
		if (title == null || title=="") {
		
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
			
			// 선택 강의 단건 조회
			fSelectLecture(no, title, name);
		}
	}
	
	/** 선택 강의 단건 조회 */
	function fSelectLecture(no, title, name) {
		
		var param = {
					no : no
				,	title : title
				,	name : name
		};
		
		var resultCallback = function(data) {
			fSelectLectureResult(data);
		};
		
		callAjax("/supportC/selectsLecture.do", "post", "json", true, param, resultCallback);
	}
	/** 선택 강의 단건 조회 콜백 함수*/
	function fSelectLectureResult(data) {

		if (data.result == "SUCCESS") {
			
			console.log("data : " + JSON.stringify(data));
			console.log("data.lectureDtlModel : " + JSON.stringify(data.lectureDtlModel));

			// 모달 팝업
			gfModalPop("#layer2");
			
			// 그룹코드 폼 데이터 설정
			fInitFormLecture(data.lectureDtlModel);
			
		} else {
			alert(data.resultMsg);
		}	
	}
	
	
	
	

</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageLecture" value="1">
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" name="DtlNo" id="DtlNo" value="">
	<input type="hidden" name="pcnt" id="pcnt" value="">
	<input type="hidden" name="aply" id="aply" value="">
	<input type="hidden" id="loginId" value="${loginId}">
	<input type="hidden" id="name" value="${name}">
	
	
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
								class="btn_nav">학습지원</a> <span class="btn_nav bold">수강신청 - 과정공지 - 일정</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>강의목록</span>
						</p>
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="39%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="9%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">순번</th>
										<th scope="col">강좌명</th>
										<th scope="col">수강인원(정원)</th>
										<th scope="col">강의 시작 일</th>
										<th scope="col">강의 종강 일</th>
										<th scope="col">교수님 성함</th>
									</tr>
								</thead>
								<tbody id="listLecture"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="lecturePagination"> </div>
	

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>


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
							<th scope="row">강의 명 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="dtl_title" name="dtl_title" /></td>
							<th scope="row">기간 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" id="dtl_date" name="dtl_date" /></td>
						</tr>
						<tr>
							<th scope="row">강의 계획</th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								id="dtl_plan" name="dtl_plan" /></td>
						</tr>
						
						<tr>
							<th scope="row">파일명</th>
							<td>
							     <div id="filedownload" name="filedownload">
							     	
							     </div>
							</td>							
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="javascript:fLectureDtlinit()" class="btnType blue" id="btnSaveDtlCod" name="btn"><span>수강 신청</span></a>
					<a href="javascript:fLectureDtldele()" class="btnType blue" id="btnDeleteDtlCod" name="btn"><span>수강 취소</span></a>  
					<a href="" class="btnType gray" id="btnCloseDtlCod" name="btn"><span>닫기</span></a>
				</div>
			</dd>
		</dl>
	</div>
	<!--// 모달팝업 -->
</form>
</body>
</html>