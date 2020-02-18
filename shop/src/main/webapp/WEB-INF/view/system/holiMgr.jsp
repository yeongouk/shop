<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>JobKorea</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript">

/** OnLoad event */ 
$(function() {
	// 조회
	fShowList();
	// 셀렉트 이벤트 등록
	//fRegisterOnchangeEvent();

});

/** change 이벤트 등록 */
function fRegisterOnchangeEvent() {
	$("input[name='sltDt']").onclick(function(){
		alert(this.value);
	});
}

/** 조회 */
function fShowList() {
	var date = new Date(); //날짜 선언
	var cnt = Number($('#cnt').val()); //페이징할 값 가져오기
	var quarter = Math.ceil( (date.getMonth()) / 3 ); //분기 구하기
	var month = (quarter-1) * 3 + cnt; //세팅된 분기의 첫번째월 구하기
	
	date.setMonth(month); //달 세팅
	date.setDate(1);
	var today = fConverDateString(date,'');
	date.setMonth(date.getMonth() + 1 ); //달 +1
	date.setDate(1);
	today +=','+fConverDateString(date,'');
	date.setMonth(date.getMonth() + 1 ); //달 +2
	date.setDate(1);
	today +=','+fConverDateString(date,'');
	//파라미터에 담기 끝
	
	var param = {
			month : today
	};
	var resultCallback = function(data) {
		fShowListResult(data);
	};
	
	callAjax("/system/holiMgrList.do", "post", "text", true, param, resultCallback);
}


/** 조회 콜백 함수 */
function fShowListResult(data) {
	// 기존 목록 삭제
	$('#showList').empty();
	
	var $data = $( $(data).html() );
	// 신규 목록 생성	
	$("#showList").append($data);
}

/** 폼 초기화 */
function fInitForm(data) {
	
}

/** 데이터 저장 */
function fSaveData(cal_dt) {
	param =	{
		cal_dt : cal_dt
		, holi_nm : $('#'+cal_dt).val()
	};
	
	var resultCallback = function(data) {
		fSaveDataResult(data);
	};
	
	callAjax("/system/saveHoliMgr.do", "post", "json", true, param, resultCallback);
}

/** 데이터 저장 콜백 함수 */
function fSaveDataResult(data) {
	if (data.result == "SUCCESS") {
		// 응답 메시지 출력
		alert(data.resultMsg);
		// 목록 조회
		//fShowList();
	} else {
		// 오류 응답 메시지 출력
		alert(data.resultMsg);
	}
}

/** 다음 분기 클릭 */
function fSelectPrevMonth(){
	$('#cnt').val(Number($('#cnt').val()) -3);
	fShowList();
}

/** 이전 분기 클릭 */
function fSelectNextMonth(){
	$('#cnt').val(Number($('#cnt').val()) +3);
	fShowList();
}
</script>
</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" name="cal_dt" id="cal_dt" value="">
	<input type="hidden" name="cnt" id="cnt" value="0">
<!-- 모달 배경 -->
<div id="mask"></div>

<div id="wrap_area">
	<h2 class="hidden">header 영역</h2>
	<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

	<h2 class="hidden">컨텐츠 영역</h2>
	<div id="container">
    	<ul>
    		<li class="lnb">
				<!-- lnb 영역 --> <jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
			</li>
    		<li class="contents">
				<!-- contents -->
				<h3 class="hidden">contents 영역</h3>
		        <!-- content -->
		        <div class="content" style="min-height:1450px;">
		            <p class="Location">
		            	<a href="#" class="btn_set home">메인으로</a>
						<a href="#" class="btn_nav">시스템 관리</a>
		            	<span class="btn_nav bold">공휴일 관리</span>
		            	
		            	<a href="#" class="btn_set refresh">새로고침</a>
		            </p>
					<p class="conTitle"><span>공휴일 관리</span></p>
					<div>
						<a href="#" id="prev" name="ofcBtn" onclick="javascript:fSelectPrevMonth();" style="float:left;padding-top: 250px;">
							<img src="/images/admin/comm/btn_prev.png">
						</a>
						<div id="showList" style="float:left;width:950px;padding-left: 11px;">
							
						</div>
						<a href="#" id="next" name="ofcBtn" onclick="javascript:fSelectNextMonth();" style="float:left;padding-top: 250px;">
							<img src="/images/admin/comm/btn_next.png" >
						</a>
					</div>
		        </div>
		        <!--// content -->
		        
		        <h3 class="hidden">풋터 영역</h3>
		        <jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
		        <!--// contents --> 
    		</li>
    	</ul>
    </div>
</div>
</form>
</body>
</html>