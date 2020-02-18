<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
<title>기업회원가입</title>

<script type="text/javascript">
$(document).ready(function() {
$('#emailSelect').change(function(){
	   $("#emailSelect option:selected").each(function () {
			
			if($(this).val()== '1'){ //직접입력일 경우
				 $("#email_cop").val('');                        //값 초기화
				 $("#email_cop").attr("disabled",false); //활성화
			}else{ //직접입력이 아닐경우
				 $("#email_cop").val($(this).text());      //선택값 입력
				 $("#email_cop").attr("disabled",true); //비활성화
			}
	   });
	});
	
$('#btn_save').click(function() {
	var loginId = $('#loginId');
	var password = $('#password');
	var work_name = $('#work_name');
	var email = $('#email');
	var email_cop = $('#email_cop');
	var birthday = $('#birthday');
	var tel1 = $('#tel1');
	var tel2 = $('#tel2');
	var tel3 = $('#tel3');

	


	
	
	$.ajax({
		url : '/cop/officeSave.do',
		type : 'POST',
		dataType : 'text',
		data : {
			loginId : loginId.val(),
			password : password.val(),
			work_name : work_name.val(),
			email : email.val(),
			email_cop : email_cop.val(),
			birthday : birthday.val(),
			tel1 : tel1.val(),
			tel2 : tel2.val(),
			tel3 : tel3.val()
			
		},
		async : false,
		success : function(data) {
	
			
			alert("저장되었습니다.");


		

			   
		},
		error : function(xhr, status, e) {
			console.log("error", e);
			console.log("status", status);
		}
	});

});
	
	
	
});

</script>



</head>
<body>

<table align="center">
			<tr height="80px" style="font-size: 70%">
				<td width="200px">ID</td>
				<td width="100px"><input type="text" id="loginId" name="loginId"style="width: 150px" > </td>
				<td width="200px"><a>PW</a></td>
				<td width="100px"><input type="password"id="password" name="password" style="width: 150px"></td>
				<td width="100px"></td>
				<td width="200px">
				</td>
			</tr>
			<tr height="80px" style="font-size: 70%">
				<td width="100px">회사명</td>
				<td width="200px"><input type="text" id="work_name" name="work_name"style="width: 150px"> </td>
				<td width="100px">이메일</td>
				<td width="150px"><input type="text"id="email" name="email" style="width: 120px"><a>&nbsp;&nbsp;&nbsp;@</a></td>
				<td width="150px"><input type="text"id="email_cop" name="email_cop" style="width: 150px"></td>
				<td width="200px"><select id=emailSelect
					name="emailSelect" style="width: 98px">
					                        <option value="naver.com" id="naver.com">naver.com</option>
											<option value="daum.net" id="daum.net">daum.net</option>
											<option value="gmail.com" id="gmail.com">gmail.com</option>
											</td>
				</select>
				</td>
			</tr>
			<tr height="80px" style="font-size: 70%"> 
				<td width="150px"><a style="width: 100">생년월일</a></td>
				<td width="150px"><input type="date" id="birthday" name="birthday"> </td>
				<td width="100px"></td>
				<td width="200px">연락처&nbsp;&nbsp;&nbsp;<select id="tel1"
					name="tel1" style="width: 98px">
					                        <option value="010" id="010">010</option>
											<option value="011" id="011">011</option>
											<option value="019" id="019">019</option>
											</td></td> 
				<td width="100px"><input type="tel"id="tel2" name="tel2" style="width: 120px"></td>
				<td width="200px"><input type="tel"id="tel3" name="tel3"style="width: 120px"></td>
				</select>
				</td>
			</tr>
		
		
		</table>
		<textarea rows="10" cols="100" id="singular_facts" name="singular_facts" placeholder="특이사항"></textarea>
		<div align="center">
		<button type="submit" id="btn_save" style="background-color: white;border-color: gray;border: 1px solid gray;font-size: 120%;width: 70px"
		onclick="window.close()">저 장</button>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" style="background-color: white;border-color: gray;border: 1px solid gray;font-size: 120%;width:70px " id="btn_can" onclick="window.close()">취 소</button>
		</div>
		
		
</body>
</html> --%>