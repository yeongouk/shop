<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학 생 / 학 습 자 료</title>
<script type="text/javascript">
	//프로젝트 페이징 설정
	var pageSizeDocument = 5;
	var pageBlockSizeDocument = 5;

	$(function() {
		documentList();
		btnClickEvent();
	});

	function btnClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
			case "searchBtn":
				documentList();
				break;
				
			case "btnCancel":
				$("#documentModal").hide();
				break;

			default:
				break;
			}

		})
	}

	function documentList(currentPage) {
		currentPage = currentPage || 1;
		var searchKey = $('input[name=searchKey]').val();
		var from_date = $('#from_date');
		var to_date = $('#to_date');

		var param = {
			nt_title : searchKey,
			from_date : from_date.val(),
			to_date : to_date.val(),
			currentPage : currentPage,
			pageSize : pageSizeDocument
		}

		var resultCallback = function(data) {
			DocumentResult(data, currentPage);
		};

		callAjax("/supportC/SelectDocumentList.do", "post", "text", true,param, resultCallback);
	}

	function DocumentResult(data, currentPage) {

		$("#documentList").empty();
		$("#documentList").append(data);

		var totalCnt = $("#totalCnt").val();

		if (totalCnt == null || totalCnt == 0) {
			alert("데이터가 없습니다.");
			return;
		}

		var list = $("#document_list").val();
		var paginationHtml = getPaginationHtml(currentPage, totalCnt,pageSizeDocument, pageBlockSizeDocument, 'documentList');
		$("#DocumentPagination").empty().append(paginationHtml);
		$('#currentPageDocument').val(currentPage);
	}

	/* 이미혜  */
	function DocumentListDtl(nt_no) {
		var param={
				  nt_no:nt_no
			}

		var resultCallback = function(data) {
			document_readResult(data);
		};
		callAjax("/supportC/selectOnedocument.do", "post", "json", true, param,resultCallback);
	}

	function document_readResult(data) {
		
		if(data.resultMsg == 'READ'){
			gfModalPop("#documentModal");
			dataSetPopModal(data.resultData);
		 }else{
			 alert("조회 할수가 업습니다.");
		 }
	}

	function dataSetPopModal(object) {
		
		if (object == "" || object == null || object == undefined) {
			alert("해당 학습자료는 조회 할수 없습니다.");
		} else {
			var notfileMsg_html="";
			//파일이 없으면 파일div html 치환해줌
			if (object.filename == null || object.filename == undefined || object.filename == "") {
				notfileMsg_html = 	"<span>" + "파일이 없습니다." + " </span>";
				$("#filedownload").empty().append(notfileMsg_html);
				}
			$("#nt_title").val(object.nt_title);
			$("#nt_title").attr("readonly",true);
			$("#nt_note").val(object.nt_note);
			notfileMsg_html="<a href='javascript:downloadFile("+object.nt_no+");'>"+"<span>"+object.filename+"</span>"+"</a>"
			$("#filedownload").empty().append(notfileMsg_html);
		}
	}
	
	function downloadFile(nt_no){
		if(nt_no!=""||nt_no!=undefined){
			
			var param="<input type='hidden' name='nt_no' value="+nt_no+"/>";
			$("<form action='/supportC/download_DocumentFile.do' method='post'>"+param+"</form>").appendTo('body').submit().remove();
		}else {
			alert("파일이 없습니다.")
		}		
		
	}
	
	

	/* 이미혜  */
</script>

</head>
<body>
	<form id="myForm" action=""  method="">
		<input type="hidden" id="currentPageDocument" value="1">		
		<input type="hidden" id="document_list" value="">
		<input type="hidden" id="nt_no" value="">
		<input type="hidden" id="loginId" value="${loginId}">
		<input type="hidden" id="name" value="${name}">
		
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
									<a href="#" class="btn_set home">메인으로</a> 
									<a href="#" 	class="btn_nav">학습지원</a> 
									<span class="btn_nav bold">학습자료</span> 
									<a href="#" class="btn_set refresh">새로고침</a>
							</p>
							
							<p class="conTitle">
								<span>학습자료 </span>
								
							</p>
							
								<table width="100%" cellpadding="5" cellspacing="0" border="1"
								    align="left"
									style="border-collapse: collapse; border: 1px #50bcdf;">
									<tr style="border: 0px; border-color: blue">
										<td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>
	
										<td width="50" height="25" style="font-size: 100%">제목</td>
										<td width="50" height="25" style="font-size: 100%">
										<input type="text" style="width: 120px" id="searchKey" name="searchKey"></td>							
										<td width="50" height="25" style="font-size: 100%">작성일</td>
										<td width="50" height="25" style="font-size: 100%"><input type="date"
											 style="width: 120px" id="from_date" name="from_date">
											 
										</td>
										<td width="50" height="25" style="font-size: 100%"><input type="date"
											 style="width: 120px" id="to_date" name="to_date">
											 
										</td>
										 <td width="50" height="60" style="font-size: 120%">
                           				 <a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a></td> 
									</tr>
									
								</table>							
								
								<div class="divComGrpCodList">
									<table class="col">
										<caption>caption</caption>
										<colgroup>
											<col width="10%">
											<col width="35%">
											<col width="30%">
											<col width="10%">
											<col width="25%">																				
											
										</colgroup>
				
										<thead>
											<tr>
												<th scope="col">글번호</th>
												<th scope="col">제목</th>
												<th scope="col">작성일</th>
												<th scope="col">작성자</th>
												<th scope="col">파일</th>		
											</tr>
										</thead>
										<tbody id="documentList">								
										</tbody>
									</table>								
									
								</div>
							<div class="paging_area" id="DocumentPagination"> </div>															
						</div> <!--// content -->
	
						<h3 class="hidden">풋터 영역</h3>
							<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>
	</form>
	
	<!-- 학습자료 모달 팝업  -->
	<form  name="frmDocumentDIV" action=""  method="" id="frmDocumentDIV">
		<input type="hidden" id="loginID" value="${loginId}">
		<input type="hidden" id="no" value="">
		<!--등록 팝엄창  -->
		<div id="documentModal" class="layerPop layerType2" style="width: 600px;">
			<dl>
				<dt>
					<strong>학 습 자 료</strong>		
				</dt>
				<dd class="content">
					<table class="row">
					<caption>caption</caption>
							<tr>
								<th scope="row">제 목</th>
								<td><input type="text" class="inputTxt p100" name="nt_title" id="nt_title" /></td>
							</tr>
							<tr>
								<th scope="row">내 용</th>
								<td><textarea style="width:100%;" class="inputTxt p100" name="nt_note" id="nt_note"> </textarea></td>
							</tr>
						<tr>
							<th scope="row">파일</th>
							<td>
								<span class="hidden" id="modMsg">파일 명:</span>
						 		<div id="filedownload" name="filedownload"></div>
								</td>
						</tr>
						</tbody>
					</table>
					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnCancel" name="btn"><span>닫 기</span></a> 
					</div>
				</dd>
			</dl>	
		</div>
	</form>
	
</body>
</html>