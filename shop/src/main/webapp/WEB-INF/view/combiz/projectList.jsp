<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	
<title>프로젝트 상세정보</title>

<script type="text/javascript">
$(document).ready(function() {

	$('#btn_save').click(function() {
		var project_name = $('#project_name');
		var regId = $('#regId');
		var area = $('#area');
		var work_type = $('#work_type');
		var industry_type = $('#industry_type');
		var LanguageCD = $('#LanguageCD');
	    var WebCD= $('#WebCD');
	    var work_loc= $('#work_loc');
		var OSCD= $('#OSCD');
		var DBCD= $('#DBCD');
		var NTCD= $('#NTCD');
		var FWCD= $('#FWCD');
		var WSCD= $('#WSCD');
		var low= $('#low');
		var middle= $('#middle');
		var high= $('#high');
		var special= $('#special');
		var work_fr_date= $('#work_fr_date');
		var work_to_date= $('#work_to_date');
		var receive_fr_date= $('#receive_fr_date');
		var receive_to_date= $('#receive_to_date');
		var reg_date = $('#reg_date')
		var note= $('#note');
		var option_order= $('#option_order');
		var notice= $('#notice');
		var rdo1= $('#rdo1');
		var rdo2= $('#rdo2');
		var rdo3= $('#rdo3');
		var tel= $('#tel');
		var loc= $('#loc');


		
		alert("저장되었습니다.");
		
		
		
		$.ajax({
			url : '/adm/projectSave.do',
			type : 'POST',
			dataType : 'text',
			data : {
				project_name:project_name.val(),
				area : area.val(),
				work_type : work_type.val(),
				industry_type : industry_type.val(),
				LanguageCD:LanguageCD.val(),
				WebCD:WebCD.val(),
				work_loc:work_loc.val(),
				OSCD:OSCD.val(),
				DBCD:DBCD.val(),
				NTCD:NTCD.val(),
				FWCD:FWCD.val(),
				WSCD:WSCD.val(),
				low:low.val(),
				middle:middle.val(),
				high:high.val(),
				special:special.val(),
				work_fr_date:work_fr_date.val(),
				work_to_date:work_to_date.val(),
				receive_fr_date:receive_fr_date.val(),
				receive_to_date:receive_to_date.val(),
				note:note.val(),
				option_order:option_order.val(),
				notice:notice.val(),
				rdo1:rdo1.val(),
				rdo2:rdo2.val(),
				rdo3:rdo3.val(),
				tel:tel.val(),
				loc:loc.val(),
				reg_date.val()
				
			},
			async : false,
			success : function(data) {
		
				function(){
					self.opener = self;
					window.close();
				}


			

				   
			},
			error : function(xhr, status, e) {
				console.log("error", e);
				console.log("status", status);
			}
		});

	});
	$('#btn_can').click(function() {
		window.close();

	});
	
	$("form").on("submit",function(event){
		if($('#regId').val()==""){
			alert("작성자명을 입력해주세요");
			$('#regId').focus;
			return  false;
		}
	});
});

</script>



</head>
<body align="center">

<form action="/adm/projectSave.do" name="frm1" method="post">
<% request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html;charset=UTF-8");%>
<br>

	<b style="font-size: 120%">프로젝트 상세정보</b>
	<br>
	<br>

	<a>&nbsp;&nbsp;&nbsp;&nbsp;작성자</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<input style="width: 100px" name="regId" id="regId" >
			
		<a>&nbsp;&nbsp;&nbsp;&nbsp;프로젝트 명</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<input style="width: 600px" name="project_name" id="project_name" placeholder="깂을 입력해 주세요.">
			
		<br>
		<br>
		<table align="center">
			<tr height="80px">
				<td width="100px">&nbsp;&nbsp;&nbsp;&nbsp;지역</td>
				<td width="200px"><select id="area" name="area"
					style="width: 98px">
						<option value="02" id="area1">서울</option>
						<option value="031" id="area2">경기</option>
						<option value="041" id="area3">충남</option>
						<option value="042" id="area4">충븍</option>
						<option value="051" id="area5">전남</option>
						<option value="052" id="area6">전북</option>
						<option value="061" id="area7">경남</option>
						<option value="062" id="area8">경북</option>
						<option value="063" id="area9">강원</option>
						<option value="054" id="area10">부산</option>
						<option value="064" id="area11">제주</option>
				</select></td>
				<td width="100px">직무</td>
				<td width="200px"><select id="work_type" name="work_type"
					style="width: 98px"><option value="1" id="work1">경영사무</option>
											<option value="2" id="work2">마케팅광고</option>
											<option value="3" id="work3">IT인터넷</option>
											<option value="4" id="work4">디자인</option>
											<option value="5" id="work5">무역유통</option>
											<option value="6" id="work6">영업</option>
											<option value="7" id="work7">서비스</option>
											<option value="8" id="work8">연구개발설계</option>
											<option value="9" id="work9">생산제조</option>
											<option value="10" id="work10">교육</option>
											<option value="11" id="work11">건설</option>
											<option value="12" id="work12">의료</option>
											<option value="13" id="work13">미디어</option>
											<option value="14" id="work14">특수직</option></td>
				</select>
				</td>
				<td width="100px">산업</td>
				<td width="200px"><select id="industry_type"
					name="industry_type" style="width: 98px">
					                        <option value="K64" id="K64">금융은행업</option>
											<option value="J62" id="J62">IT정보통신업</option>
											<option value="G45" id="G45">판매유통업</option>
											<option value="C10" id="C10">제조생산화학업</option>
											<option value="P85" id="P85">교육업</option>
											<option value="F41" id="F41">건설업</option>
											<option value="Q86" id="Q86">의료제약업</option>
											<option value="J58" id="J58">미디어광고업</option>
											<option value="M70" id="M70">문화예술디자인업</option>
											<option value="S94" id="S94">기관협회</option></td>
				</select>
				</td>

			</tr>
			<tr height="100px">
				<td width="100px">&nbsp;&nbsp;&nbsp;&nbsp;구분</td>
				<td width="250px"><select id="work_loc" name="work_loc"
					style="width: 98px">
						<option value="si" id="si">si</option>
						<option value="sm" id="sm">sm</option>
						<option value="solution" id="solution">solution</option>

				</select></td>

			</tr>
		</table>

		<table align="center">
			<tr height="15px" align="center">
				<td width="100px" >전문기술</td>
				<td width="200px" style="color: red"align="left">LANGUAGE</td>
				<td width="100px"  style="color: red"align="left">WEB</td>
				<td width="100px"style="color: red"align="left">OS</td>
				<td width="200px"style="color: red"align="left">DB</td>
				<td width="200px"style="color: red"align="left">NETWORK</td>
            </tr>
            <tr height="15px">
				<td width="100px"></td>
				<td width="200px" align="left"><input type="checkbox" name="as400"id="as400" class="LanguageCD">AS400</td>
				<td width="100px" align="left" ><input type="checkbox" name="asp"id="asp" class="WebCD">ASP</td>
				<td width="100px"align="left"><input type="checkbox" name="linix"id="linix" class="OSCD">LINIX</td>
				<td width="200px"align="left"><input type="checkbox" name="access"id="access"class="DBCD">Access</td>
				<td width="200px"align="left"><input type="checkbox" name="cr"id="cr" class="NTCD">Cisco Router</td>
            </tr>
			  <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px" align="left"><input type="checkbox" name="c"id="c"class="LanguageCD">C</td>
				<td width="100px" align="left" ><input type="checkbox" name="jsp"id="jsp"class="WebCD">JSP</td>
				<td width="100px"align="left"><input type="checkbox" name="linux"id="linux"class="OSCD">LINUX</td>
				<td width="200px"align="left"><input type="checkbox" name="db2"id="db2"class="DBCD">DB2</td>
				<td width="200px"align="left"><input type="checkbox" name="cs"id="cs"class="NTCD">Cisco S/W</td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px"align="left" ><input type="checkbox" name="cpp"id="cpp"class="LanguageCD">C++</td>
				<td width="100px" align="left" ><input type="checkbox" name="php"id="php"class="WebCD">PHP</td>
				<td width="100px"align="left"><input type="checkbox" name="mac"id="mac"class="OSCD">MAC</td>
				<td width="200px"align="left"><input type="checkbox" name="informix"id="informix"class="DBCD">Informix</td>
				<td width="200px"align="left"><input type="checkbox" name="corba"id="corba"class="NTCD">CORBA</td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px"align="left" ><input type="checkbox" name="cobol"id="cobol"class="LanguageCD">COBOL</td>
				<td width="100px" align="left" ><input type="checkbox" name="xml"id="xml"class="WebCD">XML</td>
				<td width="100px"align="left"><input type="checkbox" name="mvc"id="mvc"class="OSCD">MVC</td>
				<td width="200px"align="left"><input type="checkbox" name="oracle"id="oracle"class="DBCD">ORACLE</td>
				<td width="200px"align="left"><input type="checkbox" name="lan"id="lan"class="NTCD">LAN</td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px"align="left" ><input type="checkbox" name="dp"id="dp"class="LanguageCD">Delphi</td>
				<td width="100px"align="left"  ><input type="checkbox" name="dhtml"id="dhtml"class="WebCD">DHTML</td>
				<td width="100px"align="left"><input type="checkbox" name="solaris"id="solaris"class="OSCD">SOLARIS</td>
				<td width="200px"align="left"><input type="checkbox" name="mssql"id="mssql"class="DBCD">MSSQL</td>
				<td width="200px"align="left"><input type="checkbox" name="iot"id="iot"class="NTCD">IOT</td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px" align="left"><input type="checkbox" name="pb"id="pb"class="LanguageCD">Power Builder</td>
				<td width="100px"align="left"  ><input type="checkbox" name="mp"id="mp"class="WebCD">miPlatform</td>
				<td width="100px"align="left"><input type="checkbox" name="win"id="win"class="OSCD">WINDOWS</td>
				<td width="200px"align="left"><input type="checkbox" name="mysql"id="mysql"class="DBCD">MYSQL</td>
				<td width="200px"align="left"></td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px"align="left" ><input type="checkbox" name="java"id="java"class="LanguageCD">JAVA</td>
				<td width="100px"align="left"  ><input type="checkbox" name="xp"id="xp"class="WebCD">xPlatform</td>
				<td width="100px"align="left"><input type="checkbox" name="wins"id="wins"class="OSCD">WINDOWS SERVER</td>
				<td width="200px"align="left"><input type="checkbox" name="sybase"id="sybase"class="DBCD">Sybase</td>
				<td width="200px"align="left"></td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px"align="left" ><input type="checkbox" name="vb"id="vb"class="LanguageCD">VB</td>
				<td width="100px"align="left"  ><input type="checkbox" name="nc"id="nc"class="WebCD">Nexacro</td>
				<td width="100px"align="left"></td>
				<td width="200px"align="left"><input type="checkbox" name="mariadb"id="mariadb"class="DBCD">MariaDB</td>
				<td width="200px"align="left"></td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px"align="left" ><input type="checkbox" name="vc"id="vc"class="LanguageCD">VC</td>
				<td width="100px" align="left" ></td>
				<td width="100px"align="left"></td>
				<td width="200px"align="left"><input type="checkbox" name="tibero"id="tibero"class="DBCD">Tibero</td>
				<td width="200px"align="left"></td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px"align="left" ><input type="checkbox" name="cc"id="cc"class="LanguageCD">C#</td>
				<td width="100px"align="left"  style="color: red">FrameWork</td>
				<td width="100px"align="left"></td>
				<td width="200px"align="left"></td>
				<td width="200px"align="left"></td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px" align="left"><input type="checkbox" name="danet"id="danet"class="LanguageCD">.net</td>
				<td width="100px" align="left"><input type="checkbox" name="spring"id="spring"class="FWCD">Spring</td>
				<td width="100px"align="left"><input type="checkbox" name="jquery"id="jquery"class="FWCD">Jquery</td>
				<td width="200px" align="left"style="color: red">Webserver / WAS</td>
				<td width="200px"align="left"></td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px" align="left"><input type="checkbox" name="python"id="python"class="LanguageCD">Python</td>
				<td width="100px" align="left"><input type="checkbox" name="egov"id="egov"class="FWCD">eGov</td>
				<td width="100px"align="left"></td>
				<td width="200px" align="left"><input type="checkbox" name="tomcat"id="tomcat"class="WSCD">Tomcat</td>
				<td width="200px"align="left"><input type="checkbox" name="iis"id="iis"class="WSCD">IIS</td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px" align="left"><input type="checkbox" name="r"id="r"class="LanguageCD">R</td>
				<td width="100px" align="left"><input type="checkbox" name="struts"id="struts"class="FWCD">Struts</td>
				<td width="100px"align="left"></td>
				<td width="200px" align="left"><input type="checkbox" name="websphere"id="websphere"class="WSCD">WebSphere</td>
				<td width="200px"align="left"><input type="checkbox" name="jboss"id="jboss"class="WSCD">JBoss</td>
            </tr>
            <tr height="15px">
				<td width="100px"align="left"></td>
				<td width="200px" align="left"></td>
				<td width="100px" align="left"></td>
				<td width="100px"align="left"></td>
				<td width="200px" align="left"><input type="checkbox" name="weblogic"id="weblogic"class="WSCD">WebLogic</td>
				<td width="200px"align="left"></td>
            </tr>
		</table>
		<table align="center">
			<tr height="80px">
				<td width="100px">&nbsp;&nbsp;&nbsp;&nbsp;기술등급</td>
				<td width="150px">초급&nbsp;<input type="text" style="width: 50px" name="low"id="low"><a>&nbsp;명</a></td>
				<td width="150px">중급&nbsp;<input type="text" style="width: 50px"name="middle"id="middle"><a>&nbsp;명</a></td>
				<td width="150px">고급&nbsp;<input type="text" style="width: 50px"name="high"id="high"><a>&nbsp;명</a></td>
				<td width="150px">특급&nbsp;<input type="text" style="width: 50px"name="special"id="special"><a>&nbsp;명</a></td>
				<td width="200px"></td>
 
			</tr>
		
		</table>
		<table align="center">
			<tr height="80px">
				<td width="100px">&nbsp;&nbsp;&nbsp;&nbsp;근무기간</td>
				<td width="160px"><input type="date" style="width: 130px" name="work_fr_date"id="work_fr_date"><a>&nbsp;~</a></td>
				<td width="160px"><input type="date" style="width: 130px"name="work_to_date"id="work_to_date"></td>
				<td width="160px">접수기간</td>
				<td width="160px"><input type="date" style="width: 130px" name="receive_fr_date"id="receive_fr_date"><a>&nbsp;~</a></a></td>
				<td width="160px"><input type="date" style="width: 130px"name="receive_to_date"id="receive_to_date"></td>
 
			</tr>
		
		</table>
		
		
		<textarea style="width: 1000px;height: 150px" placeholder="상세설명" id="note" name="note"></textarea> 
		<br>
		<textarea style="width: 1000px;height: 150px" placeholder="필수/우대사항" id="option_order" name="option_order"></textarea> 
		<br>
		<textarea style="width: 1000px;height: 150px" placeholder="특이사항" id="notice" name="notice"></textarea> 
		<br>
		<table align="center">
			<tr height="80px">
				<td width="100px">&nbsp;&nbsp;&nbsp;&nbsp;근무장소</td>
				<td width="160px"><select id="area2" name="area"
					style="width: 98px">
						<option value="02" id="area1">서울</option>
						<option value="031" id="area2">경기</option>
						<option value="041" id="area3">충남</option>
						<option value="042" id="area4">충븍</option>
						<option value="061" id="area5">전남</option>
						<option value="063" id="area6">전북</option>
						<option value="055" id="area7">경남</option>
						<option value="054" id="area8">경북</option>
						<option value="033" id="area9">강원</option>
						<option value="051" id="area10">부산</option>
						<option value="064" id="area11">제주</option>
				</select></td>
				<td width="160px"><input type="text" style="width: 130px"name="area"id="area3"></td>
				<td width="160px">구/읍/면</td>
				<td width="160px"></td>
				<td width="160px"></td>
 
			</tr>
		
		</table>
		<table align="center">
			<tr height="80px">
				<td width="100px">&nbsp;&nbsp;&nbsp;&nbsp;장비지원</td>
				<td width="110px"><input type="radio"  name="rdo1"id="rdo1"class="rdo1"value="yes">지원</td>
				<td width="100px"><input type="radio" name="rdo1"id="rdo1"class="rdo1" value="no">미지원</td>
				<td width="100px"><input type="radio" name="rdo1"id="rdo1"class="rdo1" value="etc">추후협의</td>
				<td width="100px">식사제공</td>
				<td width="120px"><input type="radio"  name="rdo2"id="rdo2"class="rdo2"value="yes">지원</td>
				<td width="100px"><input type="radio" name="rdo2"id="rdo2"class="rdo2"value="no">미지원</td>
				<td width="100px"><input type="radio" name="rdo2"id="rdo2"class="rdo2"value="etc">추후협의</td>
			</tr>
		<tr>
		<td width="100px">&nbsp;&nbsp;&nbsp;&nbsp;숙박제공</td>
				<td width="110px"><input type="radio"  name="rdo3"id="rdo3"class="rdo3"value="yes">지원</td>
				<td width="100px"><input type="radio" name="rdo3"id="rdo3"class="rdo3"value="no">미지원</td>
				<td width="100px"><input type="radio" name="rdo3"id="rdo3"class="rdo3"value="etc">추후협의</td>
				<td width="100px"></td>
				<td width="120px"></td>
				<td width="100px"></td>
				<td width="100px"></td>
		</tr>
		<tr height="80px" align="center">
		<td width="100px">&nbsp;&nbsp;&nbsp;&nbsp;면접형태</td>
				<td width="110px" align="left"><input type="checkbox"  name="tel"id="tel"class="tel">전화면접</td>
				<td width="100px"><input type="checkbox" name="loc"id="loc"class="loc">직접면접</td>
				<td width="70px"></td>
				<td width="230px" >작성일&nbsp;<input type="date" id="reg_date" name="reg_date"></td>

		</tr>
		</table>
		<br>
		<br>
		<div align="center">
		<button type="submit" id="btn_save" style="background-color: white;border-color: gray;border: 1px solid gray;font-size: 120%;width: 70px"
		onclick="window.close()">저 장</button>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" style="background-color: white;border-color: gray;border: 1px solid gray;font-size: 120%;width:70px " id="btn_can" onclick="window.close()">취 소</button>
		</div>
		<br>
		<br>
	

	</form>
</body>
</html>