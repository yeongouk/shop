<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge"/>
<title>학생관리</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

     //학생관리 페이지 설정
     var studentPageSize = 5;
     var studentPageBlockSize =5;

     /* onload 이벤트  */
    $(function initdate(){
    	
    //날짜 지정형식 	
    var dateFormat = "mm/dd/yy",
      //시작일
      from = $( "#from" ).datepicker({defaultDate: "+1w", //1개월씩 증가
             changeMonth: true,    numberOfMonths: 3 //최대 보여지는 개월수
        }).on( "change", function(){
          to.datepicker( "option", "minDate", getDate( this ));
        }),
      //끝
      to = $( "#to" ).datepicker({defaultDate: "+1w", //1개월씩 증가
           changeMonth: true,   numberOfMonths: 3 //최대 보여지는 개월수
      }).on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
    
    // 날짜 가져오는 함수
    function getDate(element){
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } 
      catch( error ) {
        date = null;
      }
      return date;
    }
      //학생리스트 조회
	  selectStudentList(); 
    
  });//date 지정 시작일과 끝
    
      /*학생관리 폼 초기화*/
      function initFormStudent(object){
    	 $("#st_name").focus();
    	 //console.log("initFormStudent1 : " + object);
    	 //console.log("initFormStudent2 : " + JSON.stringify(object));
    	 
    	 if( object == "" || object == null || object == undefined){
    	  //alert("new");
          $("#st_name").val("");
    	  $("#loginID").val("");
    	  $("#st_birthday").val("");
    	  $("#st_reg_date").val("");
    	  $("#st_phone_number").val("");
    	  $("#st_password").val("");
    	  $("#st_name").attr("readonly", false);
    	  $("#st_name").css("background","FFFFFF");
    	  $("#st_name").focus();
    	  $("#btnDelete").hide();
    	  $("#st_reg_date").hide();
    	 }
    	 else {
    	  $("#st_name").val(object.st_name);
    	  $("#loginID").val(object.loginID);
    	  $("#st_birthday").val(object.st_birthday);
    	  //$('#st_reg_date').val(object.st_reg_date);
    	  $("#st_phone_number").val(object.st_phone_number);
    	  $("#st_password").val(object.st_password);
    	  $("#loginID").attr("readonly", true);
    	  $("#loginID").css("background","FFFFFF");
    	  $("#st_name").focus();
    	  $("#st_reg_date").hide();
    	  $("#btnDelete").show();
    	 }
    	  
      }//initFormStudent
    	 
      /*학생관리 리스트 불러오기*/	 
      function selectStudentList(currentPage){
    	  
    	  var from = $('#from');//시작일
    	  var to = $('#to');//끝
    	  var st_name1 = $('#st_name1');//학생명
    	  
    	  currentPage = currentPage || 1;
    	  
    	  var param ={
    			  currentPage : currentPage,
    			  pageSize : studentPageSize,
    			  st_name1 : st_name1.val(),
    			  from : from.val(),
    			  to : to.val()
    	  }
    	  
    	  var resultCallback = function(data){
    		  studentListResult(data, currentPage);
    	  }
    	  
    	  callAjax("/peopleA/studentList.do","post","text",true,param,resultCallback);
      }
      
      /*학생관리 리스트 불러오기*/
      function studentListResult(data, currentPage){
    	  
    	// 기존 목록 삭제
    	$('#studentList').empty();
    	
    	var $data = $( $(data).html() );
    	
    	// 신규 목록 생성
		var $studentList = $data.find("#studentList");		
		$("#studentList").append($studentList.children());
		
		//총 개수 추출
  	    var $totalCntStudent = $data.find("#totalCnt");
  	    var totalCntStudent = $totalCntStudent.text();
		
		//페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntStudent, 
				studentPageSize, studentPageBlockSize, 'selectStudentList');
		
		$("#Pagination").empty().append( paginationHtml );
    	
		// 현재 페이지 설정
		$("#currentPageStudent").val(currentPage);
      }//학생관리 리스트 불러오기 
      
      /*학생관리 삭제*/
      function fDelete(){
    	  
    	  var resultCallback = function(data){
    		  fDeleteResult(data);
    	  };
    	  
    	  callAjax("/peopleA/deleteStudent.do", "post", "json", true, $("#myStudent").serialize(), resultCallback);
      }//학생관리 삭제
      
      /*학생관리 삭제 콜백 함수*/
      function fDeleteResult(data){
    	  
    	  var currentPage = $("#currentPageStudent").val();
    	  
    	  if(data.result == "SUCCESS"){
    		  
    		  //응답 메시지 출력
    		  alert(data.resultMsg);
    		  
    		  //모달닫기
    		  gfCloseModal();
    		  
    		  //학생관리 목록 출력
    		  selectStudentList(currentPage);
    		  
    	  }else{
    		  alert(data.resultMsg);
    	  }
      }   
      
      /*학생관리 신규등록*/
      function fRegister(loginID){
    	  
    	  //신규 저장
    	  if(loginID == null || loginID == ""){
    		
    		  // Tranjection type 설정
    		  $('#action').val("I");
    		  
    		  //학생관리 폼 초기화
    		  initFormStudent();
    		  
    		  //모달 팝업
        	  gfModalPop("#layer1");
    		  
    		  
    	  //수정 저장	  
    	  } else {
    		  
    		  // Tranjection type 설정
    		  $("#action").val("U");
    		  
    		  //학생관리 단건 조회
    		  fSelectStudent(loginID);  
    	  }
    	  //학생목록 다시불러오기
    	  selectStudentList(currentPage);
    	  
      }//학생관리 신규등록
      
      /*학생관리 단건조회*/
      function fSelectStudent(loginID){
    	  
    	  var param = { loginID : loginID };
    	  
    	  var resultCallback = function(data){
    		  fSelectStudentResult(data);
    	  }
    	  
    	  callAjax("/peopleA/selectStudent.do","post","json",true,param,resultCallback);  
      }
      
      /*학생관리 단건조회 콜백함수*/
      function fSelectStudentResult(data){
    	  
    	  console.log(JSON.stringify(data));
    	  console.log(JSON.stringify(data.studentJYOModel));
    	  if(data.result == "SUCCESS"){
    		  
    		  //모달 팝업
    		  gfModalPop("#layer1");
    		  
    		  //학생관리 폼 데이터 설정
    		  initFormStudent(data.studentJYOModel);
    	  }
    	  
    	  else{
    		  alert(data.resultMsg);
    	  }	    	  
      }
          
      /*학생관리 저장*/
      function fSaveStudent(){
    	  
    	  var resultCallback = function(data){
    		  fSaveStudentResult(data);
    	  };
    	  
    	  callAjax("/peopleA/saveStudent.do","post","json",true,$("#myStudent").serialize(), resultCallback);
    	  
      }//학생관리 저장
      
      /*학생관리 저장 콜백함수*/
      function fSaveStudentResult(data){
      
         //목록 조뢰 페이지 번호
         var currentPage ="1";
         if($("#action").val() != "I"){
        	 currentPage =$("#currentPageStudent").val();
         }
         
         if(data.result == "SUCCESS"){
        	 
        	 //응답 메시지 출력
        	 alert(data.resultMsg);
        	 
        	 gfCloseModal();
        	 
        	 //목록조회
        	 selectStudentList(currentPage);
        	 
         }
         else{
        	 //오류 응답 메시지 출력
        	 alert(data.resultMsg);
         }
         
           //입력폼 초기화
           initFormStudent();
         
       }//학생관리 저장 콜백함수   
      
      
      
         	 
</script>

</head>
<body>
<form id="myStudent" action="" method="">
	  <input type="hidden" id="currentPageStudent" value="1">
      <input type="hidden" id="action" name="action" value="">

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
						<h3 class="hidden">contents 영역</h3>
						<div class="content">

							<p class="Location">
								<a href="#" class="btn_set home">메인으로</a> <a href="#"
									class="btn_nav">인원 관리</a> <span class="btn_nav bold">학생
									관리</span> <a href="#" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span>학생관리</span> <span class="fr"><a 
								    class="btnType blue" href="javascript:fRegister();" name="modal">
								  <span>신규등록</span></a>
								  </span>
							</p>

							<span>가입일자: <input type="text" id="from" name="from" height="25"></span> 
								<span> ~ <input type="text" id="to" name="to" height="25"></span> 
								<span style="padding: 100px">학생명:<input type="text"
								id="st_name1" name="st_name1"></span> 
								<span style="font-size: 120%"></span>
							<span width="110" height="60" style="font-size: 120%"> 
							   
							   <a href="javascript:selectStudentList();" class="btnType gray"  id="btnSearch" name="btn"><span>검색</span></a>
							</span>


							<div class="divStudentList">
								<table class="col">
									<caption>caption</caption>

									<colgroup>
										<col width="20px">
										<col width="40px">
										<col width="40px">
										<col width="40px">
										<col width="40px">
										<col width="40px">
										<col width="40px">
										<col width="40px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">순번</th>
											<th scope="col">학생명</th>
											<th scope="col">비밀번호</th>
											<th scope="col">아이디</th>
											<th scope="col">휴대전화</th>
											<th scope="col">생년월일</th>
											<th scope="col">가입일자</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody id="studentList"></tbody>
								</table>
								
								

								<!-- 페이징 처리  -->
								<div class="paging_area"  id="Pagination"> </div> <!-- 페이징 처리  -->
							
					</div>


					</div> <!-- content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>

					</li>
					<!-- content -->
				</ul>
			</div>
			<!-- container -->
		</div>
		<!-- wrap_area -->
		
		<!-- 신규등록 모달팝업 -->
        <div id="layer1" class="layerPop layerType2" style="width:600px;">
           <dl>
             <dt>
                <strong>학생관리</strong>
             </dt>
            <dd class ="content">
                 <table class="row">
                    <caption>안보이지롱</caption>
                    <colgroup>
                        <col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
                    </colgroup>
                    
                    <tbody>
                       <tr>
                           <th scope="row">학생명</th>
                           <td><input type="text" class="inputTxt p100" name="st_name" id="st_name"/></td>
                           <th scope="row">아이디</th> 
                           <td><input type="text" class="inputTxt p100" name="loginID" id="loginID"/></td>               
                       </tr>
                       <tr>
                           <th scope="row">생년월일</th>
                           <td><input type="text" class="inputTxt p100" name="st_birthday" id="st_birthday"/></td>
                           <th scope="row">가입일자</th> 
                           <td><input type="text" class="inputTxt p100" name="st_reg_date" id="st_reg_date"/></td>
                       </tr>
                       <tr>
                           <th scope="row">휴대전화</th>
                           <td colspan="1"><input type="text" class="inputTxt p100" name="st_phone_number" id="st_phone_number"/></td>
                            <th scope="row">비밀번호</th>
                           <td><input type="text" class="inputTxt p100" name="st_password" id="st_password"/></td>
                       </tr>                  
                    </tbody>  
                 </table>    
                 
                 <div class="btn_areaC mt30">
                   <a href="javascript:fSaveStudent();" class="btnType blue" id="btnSave"><span>저장</span></a>
                   <a href="javascript:fDelete();" class="btnType blue" id="btnDelete"><span>삭제</span></a>
                   <a href="" class="btnType" id=""><span>취소</span></a>
                 </div>   
           
            </dd>
           </dl>
         
        
        </div>


	</form>
</body>
</html>