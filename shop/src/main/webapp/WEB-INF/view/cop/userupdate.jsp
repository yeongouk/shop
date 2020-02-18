<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript">

$(document).ready(function() {
	
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
		
	
	$('#btnUpdateInfo').click(function() {
		var resultUpdateCallback = function(data) {
			fUpdateInfoResult(data);
			
		};
		
		var loginId = $('#loginId').val();
		var password = $('#password').val();
		var name = $('#name').val();
		var email = $('#email').val();
		var email_cop = $('#email_cop').val();
		var tel1 = $('#tel1').val();
		var tel2 = $('#tel2').val();
		var tel3 = $('#tel3').val();

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
		
		$.ajax({
			url : '/cop/UserUpdate2.do',
			type : 'POST',
			dataType : 'text',
			data : {
				loginId : loginId,
				password : password,
				name : name,
				email : email,
				email_cop : email_cop,
				tel1 : tel1,
				tel2 : tel2,
				tel3 : tel3,

			},
			
			async : false,
			success : function(data) {
				resultUpdateCallback();
			},
			error : function(xhr, status, e) {
				console.log("error", e);
				console.log("status", status);
			}
		});
		alert("수정완료!이전 페이지로 돌아갑니다");
	});
	
});

/* onlodad  */
$(function() {
noticeList();

});


	function noticeList(loginId) {
		//alert(loginId);
		var param = {
				loginId : loginId
		}
		
		var resultCallback = function(data) {
			myInfoResult(data,loginId);
		};
		
		callAjax("/cop/Personinfo.do", "post", "json", true, param, resultCallback);
	}	
	
	function myInfoResult(data) {
		
		//console.log(data);
		
		var loginId = $('#loginId').val();
		
		var user = data.user;
		
		$('#loginId').val(user.loginId);
		$('#password').val(user.password);
		$('#name').val(user.name);
		$('#email').val(user.email);
		$('#email_cop').val(user.email_cop);
		$('#tel1').val(user.tel1);
		$('#tel2').val(user.tel2);
		$('#tel3').val(user.tel3);
					
	
		
	}

</script>
</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageNoCod" value="1">
	<input type="hidden" id="currentPageProCod" value="1">	
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
	<input type="hidden" name="action" id="action" value="">
	<%-- <input type="hidden" name="loginId" id="loginId" value="${loginId}"> --%>
	
	<!-- 모달 배경 -->
	<!-- <div id="mask"></div> -->

	<div id="wrap_area">

		<!-- <h2 class="hidden">header 영역</h2> -->
		<%-- <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include> --%>

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
								<a href="#" class="btn_set home">메인으로</a> <span
									class="btn_nav bold">MyInfo</span> <a href="#"
									class="btn_set refresh">새로고침</a>
						</p>
						
																		
						
						<%-- <p class="conTitle mt50">
							<span>회원정보</span> <span class="fr">
							<a class="btnType blue" href="javascript:fMyInfodev('${loginId}');" name="modal">
							<span>상세보기</span></a>
						</p>	 --%>
						
						

				 <!--// content -->

					<%-- <h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
	 --%>

	<!-- <div id="layer1" class="layerPop layerType2" style="width: 1300px;"> -->
		
		<!-- <br><br><br><br><br><br><br><br><br><br> -->
		
		<dl id="noticeList">
			<dt>
				<strong>회원정보</strong>
			</dt>
			<dd class="content">
				<b style="font-size: 120%">회원정보수정</b>
				<br>
				<br>
				<!-- s : 여기에 내용입력 -->
				<table class="row" >
					<caption>caption</caption>
					<colgroup>
						<col width="5%px">
						<col width="15%px">
					
						
					</colgroup>

					
					<tbody>
						<tr>
							<th scope="row">아이디 <span class="font_red">*</span></th>
							<td><input type="text" name="loginId" id="loginId" disabled  style="height:28px;"/></td>
						</tr>
						<tr>	
							<th style="width:35px" scope="row">비밀번호<span class="font_red">*</span></th>
							<td><input type="password" name="password" id="password" style="height:28px;"/></td>
						</tr>
						<tr>	
							<th style="width:35px" scope="row">비밀번호확인<span class="font_red">*</span></th>
							<td><input type="password" name="password1" id="password1"style="height:28px;" /></td>
						</tr>
						<tr>
							<th scope="row">성명 <span class="font_red">*</span></th>
							<td><input type="text" name="name" id="name" style="height:28px;"/></td>
						</tr>
						<tr>		
							<th scope="row">이메일</th>
							<td colspan="3" style='width:30%'>
								<input type="text"  name="email" id="email"style="height:28px;" >
								@								
								<select style="width:140px" id="email_cop">
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
								</select>
								<input type="button" name="emailck" id="emailck" value="중복확인"/></td>
															
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
								<input style="width:60px" type="text" id="tel2" name="tel2">
								-
								<input style="width:60px" type="text" id="tel3" name="tel3" >									
							</td>
								
						</tr>		
						
					</tbody>
					
				</table>
				
				<div class="btn_areaC mt30">
					<a href="../dashboard/dashboard.do" class="btnType blue" id="btnUpdateInfo" ><span>수정</span></a>					
					<a href="../dashboard/dashboard.do"	class="btnType gray"  id="btnCloseGrpCod" ><span>취소</span></a>
				</div>

			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
			</div>
				</div>
				
			
		</div>
	
</form>
</body>

</html>
