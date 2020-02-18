<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>비회원회원가입</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript">

$(document).ready(function() {
	

	
//아이디 중복체크
var idck = 0;
$(function() {
    //idck 버튼을 클릭했을 때 
    $("#idck").click(function() {
        
        //userid 를 param.
        var loginId =  $("#loginId").val(); 
        
        $.ajax({
            async: true,
            type : 'POST',
            data : loginId,
            url : "idcheck.do",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-error")
                    $("#divInputId").removeClass("has-success")
                    $("#userid").focus();
                    
                
                } else {
                    alert("사용가능한 아이디입니다.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-success")
                    $("#divInputId").removeClass("has-error")
                    $("#userpwd").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});
//이메일 중복체크
var idck = 0;
$(function () {
   
    $("#emailck").click(function() {
        
       
        var email =  $("#email").val(); 
        
        $.ajax({
            async: true,
            type : 'POST',
            data : email,
            url : "emailcheck.do",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-error")
                    $("#divInputId").removeClass("has-success")
                    $("#userid").focus();
                    
                
                } else {
                    alert("사용가능한 아이디입니다.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#divInputId").addClass("has-success")
                    $("#divInputId").removeClass("has-error")
                    $("#userpwd").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});
	
$('#btn_save').click(function() {
	
	var loginId = $('#loginId');
	var password = $('#password');
	var name = $('#name');
	var email = $('#email');
	var email_cop = $('#email_cop');
	var tel1 = $('#tel1');
	var tel2 = $('#tel2');
	var tel3 = $('#tel3');
/* 	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/)
    var id= RegExp(/^[a-zA-Z0-9]{4,12}$/)
    var pass= RegExp(/^[a-zA-Z0-9]{4,12}$/)
    var named= RegExp(/^[가-힣]+$/)
    var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정
    var buf = new Array(13); */
	
	/* for (var i = 0; i < document.f.id.value.length; i++) {
        ch = document.f.id.value.charAt(i)
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
            alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
            document.f.id.focus();
            document.f.id.select();
            return false;
        }
	} */

	 if($("#password").val() != ($("#password1").val())){ 
	    alert("비밀번호가 일치하지 않습니다.");
	    $("#password").val("");
	    $("#password1").val("");
	    $("#password").focus();
	    return false;
	   }
	   
	 /*   if(id.test($('#loginId').val())!=true){	 
		$('#id_check').text('사용가능한 아이디 입니다.');
		$('#id_check').css('color', 'blue');
		$("#usercheck").attr("disabled", false);
		}
	else{
		$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
		$('#id_check').css('color', 'red');
		$("#usercheck").attr("disabled", true);
		} */

	
 	/* if(regex.test($("#loginId").val()) !=""){
        alert("아이디에 특수문자사용불가");
        $("#loginId").focus();
        return false;
      }  */
	
	if($("#loginId").val() == ""){
        alert("아이디 입력하세요");
        $("#loginId").focus();
        return false;
      }
	//비밀번호
	if($("#password").val() =='') {
        alert("비밀번호를 입력하세요!");
        $("#password").focus();
        return false;
    }
	
	 //이름의 유효성 검사
    if($("#name").val()==""){
      alert("이름을 입력하세요");
      $("#name").focus();
      return false;
    }
	 
/*   //이메일 유효성 검사
  	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
  	if(regex.test(email.val()) === false){
        memberEmailAddressComment.text('이메일이 유효성에 맞지 않습니다.');
        eMailCheck.val('1');
    }else{
        memberEmailAddressComment.text('올바른 이메일 입니다.');
        $("#email").val("");
        $("#email").focus();
        return false;
    } */
    	
	 
	$.ajax({
		url : '/cop/officeSave.do', //전송URL
		type : 'POST',
		dataType : 'text',
		data : {
			loginId : loginId.val(),
			password : password.val(),
			name : name.val(),
			email : email.val(),
			email_cop : email_cop.val(),
			tel1 : tel1.val(),
			tel2 : tel2.val(),
			tel3 : tel3.val()			
		},
		async : false,//동기화여부
		success : function(data) {				
			//alert("저장되었습니다.");		   
		},
		error : function(xhr, status, e) {
			console.log("error", e);
			console.log("status", status);
		}

	});
	alert("가입완료");

});
	
	
	
});

</script>

 <title>회원가입 화면</title>

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

						<div id="wrap">
					        <br><br>
					        <b><font size="6" color="gray">회원가입</font></b>
					        <br><br><br>
					        
					        <form>
				<table class="row" >
					<caption>caption</caption>
					<colgroup>
						<col width="5%px">
						<col width="15%px">
					
						
					</colgroup>

					
					<tbody>
						<tr>
							<th scope="row">아이디 <span class="font_red">*</span></th>
							<td><input type="text" name="loginId" id="loginId"style="height:28px;"/>
							<input type="button" name="idck" id="idck" value="중복확인"/></td>
						</tr>
						<tr>	
							<th style="width:35px" scope="row">비밀번호<span class="font_red">*</span></th>
							<td><input type="password" name="password" id="password" style="height:28px;"/></td>
						</tr>
						<tr>	
							<th style="width:35px" scope="row">비밀번호확인<span class="font_red">*</span></th>
							<td><input type="password" name="password1" id="password1" style="height:28px;" /></td>
						</tr>
						<tr>
							<th scope="row">성명 <span class="font_red">*</span></th>
							<td><input type="text" name="name" id="name" style="height:28px;"/></td>
						</tr>
						<tr>		
							<th scope="row">이메일</th>
							<td colspan="3" style='width:30%'>
								<input type="text"  name="email" id="email" >
								@								
								<select style="width:140px" id="email_cop" style="height:28px;">
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
								</select>
								<input type="button"class="btnType blue" name="emailck" id="emailck" value="중복확인"/></td>							
						</tr>
						</tbody>
						<tbody>
													
						<tr>
							
							<th scope="row">연락처</th>
							<td colspan="3"><select style="width:50px" id="tel1" name="tel1">
									<option>선택하세요</option>
									<option value="02">02</option>
									<option value="031">010</option>
									<option value="031">031</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="061">061</option>
									<option value="063">063</option>
									<option value="055">055</option>
									<option value="054">054</option>
									<option value="033">033</option>
									<option value="051">051</option>
									<option value="064">064</option>
								</select>
								-
								<input style="width:60px" type="text" id="tel2" name="tel2" style="height:28px;"/>
								-
								<input style="width:60px" type="text" id="tel3" name="tel3" style="height:28px;"/>									
							</td>
								
						</tr>		
						
					</tbody>
					
				</table>
				<div class="btn_areaC mt30">
					<a href="../login.do" class="btnType blue" id="btn_save" ><span>가입하기</span></a>					
					<a href="../dashboard/dashboard.do"	class="btnType gray"  id="btnCloseGrpCod" ><span>취소</span></a>
				</div>
					        </form>
					    </div>
              					
					</div>
				</li>
			</ul>

		</div>
	</div>

		
		
</body>
</html>