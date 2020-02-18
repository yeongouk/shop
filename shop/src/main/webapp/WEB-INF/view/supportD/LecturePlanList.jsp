<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��ȹ��</title>
<script type="text/javascript">
	// ����¡ ���� 
	var PageSize = 5;    	// ȭ�鿡 �Ѹ� ������ �� 
	var PageBlock = 5;		// ������ ������ ����¡ó�� ��
	var m_Map = new Map();	// �̹��� ������ �����ϱ� ���� map

	/* onload �̺�Ʈ  */
	$(function() {
		lecturePlanList();
		clickEvent();
	});
	
	function ValidateCHK(){
		var CHK=checkNotEmpty(
			[
				["l_title","����� ���� ���� �Է��ϼ���."],
				["pcnt","����� ������ �ο����� �Է��ϼ���."],
				["room_no","���ǽ� ��ȣ�� �Է��ϼ���."],
				["l_startdate","�������� �Է��ϼ���."],
				["l_enddate","�������� �Է��ϼ���."],
			]		
		);
		if(!CHK){return;}
	 	return true;
	}
		
	
	function clickEvent(){
		$('a[name=btn]').click(function(e){
 		e.preventDefault();
			
		var btnId=$(this).attr('id');
	
		//alert(btnId);
			switch (btnId) {
			case "lectureSearchBtn":			
				lecturePlanList();
				 
				break;
				
			case "lectureInsertBtn":
				lectureModal();	 					
				break;
				
			case "btnCancel":
				$("#LectureModal").hide();		
				break;
				
			case "btnSave":
				lectureInsert();
				break;
				
			case "btnUpdate":
				lectureUpdate();

				break;	
				
			}
		})
	}
	
	
	//���� ��� ����
	function lectureUpdate(){
		
		if(!ValidateCHK()){
			return;
		}
		
		var resultCallback1 = function(data){
		 alert("update");
			 fSaveResult(data);
		};
		
		// ÷������ ���� ������ ���� �б�
		if( $("#file_name").val() != null && $("#file_name").val() != "" ) {
			
			console.log("withFile1");
			var frm1 = document.getElementById("frmLectureModal");
			frm1.enctype = 'multipart/form-data';
			var fileData1 = new FormData(frm1);
			
			$.each(m_Map, function(idx) {
				var file1 = m_Map.get(idx);
				if(file1 != null && file1 != "" && file1 != undefined) {
					
				}
			});
			
			var tmp_filename1 = $("#tmp_filename").val();
			var tmp_no1 = $("#tmp_no").val();
			
			fileData1.append("empty", "empty");
			fileData1.append("tmp_filename", tmp_filename1);
			fileData1.append("no", tmp_no1);
			
			callAjaxFileUploadSetFormData("/supportD/UpdatelectureWithFile.do", "post", "json", true, fileData1, resultCallback1);
			
		}else {
			
			if( $("#tmpDeleteFile").val() != null && $("#tmpDeleteFile").val() != "") {
				
				console.log("withFile2");
				var frm2 = document.getElementById("frmLectureModal");
				frm2.enctype = 'multipart/form-data';
				var fileData2 = new FormData(frm2);
				
				$.each(m_Map, function(idx) {
					var file2 = m_Map.get(idx);
					if(file2 != null && file2 != "" && file2 != undefined) {
						
					}
				});
				
				var tmp_filename2 = $("#tmp_filename").val();
				var tmp_no2 = $("#tmp_no").val();
				
				fileData2.append("empty", "empty");
				fileData2.append("tmp_filename", tmp_filename2);
				fileData2.append("no", tmp_no2);
				
				callAjaxFileUploadSetFormData("/supportD/UpdatelectureWithFile.do", "post", "json", true, fileData2, resultCallback1);
				
			} else {
				
				console.log("withoutFile");
				callAjax("/supportD/Updatelecture.do", "post", "json", true, $("#frmLectureModal").serialize(), resultCallback1);
				
			}
			
		}
		
	}
	
	
	//�ű� ���� ���
	function lectureInsert(){
		
		if(!ValidateCHK()){
			return;
		}
		
		// ���Ͼ��ε�
		var frm = document.getElementById("frmLectureModal");
		frm.enctype = 'multipart/form-data';
		var fileData = new FormData(frm);
		
		$.each(m_Map, function(idx) {
			var file = m_Map.get(idx);
			if(file != null && file != "" && file != undefined) {
				
			}
		});
		
		fileData.append("empty", "empty");
		
		var resultCallback1 = function(data){
			 fSaveResult(data);
		};
		callAjaxFileUploadSetFormData("/supportD/Insertlecture.do", "post", "json", true, fileData, resultCallback1);
	}
	
	function fSaveResult(data){
		var currentPage = currentPage || 1; 
		
		switch (data.resultMsg) {
		case "INSERT":
			alert("����ǿ����ϴ�.");
			break;
			
		case "UPDATE":
			alert("�����ǿ����ϴ�.");
			break;
			
		}
		gfCloseModal();	// ��� �ݱ�
		lecturePlanList(currentPage); // �����ȸ �Լ� �ٽ� ��� 
		
	}
	

	//��� �˾� â open
	function lectureModal(no) {
		
		var writer = $("#name").val();
		$("#l_name").val(writer);
		$("#l_name").attr("readonly", true);
		//�ű� ���
		if (no == null || no == "") {
			
			dataSetPopModal();
			
			$("#btnUpdate").hide();
			$("#btnSave").show();
			gfModalPop("#LectureModal");

		} else {
		//������ȸ Transaction
			var param = {
				    no : no
				  };
				 var resultCallback = function(data){
					 detailReadResult(data);
				 };
				callAjax("/supportD/selectOnelectureDetail.do", "post", "json", true, param, resultCallback);
		}

	}
	
	
	function detailReadResult(data){
		if(data.resultMsg == "READ"){
			 $("#btnSave").hide();
			 $("#btnUpdate").show();
			 gfModalPop("#LectureModal");
			dataSetPopModal(data.resultData);
		 }else{
			 alert("��ȸ �Ҽ��� �����ϴ�.");
		 }
	}
	
	function dataSetPopModal(object){
		
		/* $("#teacherContact").hide(); */
		$("#tmp_filename").val("");
		$("#tmp_filepath").val("");
		$("#tmp_filesize").val("");
		$("#tmpDeleteFile").val("");
		$("#tmp_no").val("");
		$("#modMsg").removeClass("hidden");
		$("#l_hp").attr("readonly", false);
			
		if(object == "" || object == null || object == undefined){
			
			$("#teacherContact").show();
			$("#modMsg").addClass("hidden");
			
			var writer = $("#name").val();
		
			$("#l_name").val(writer);
			$("#l_name").attr("readonly", true);
			
			$("#l_title").val("");
			$("#category").val("");
			$("#room_no").val("");
			$("#l_startdate").val("");
			$("#l_enddate").val("");
			$("#l_hp").val("");
			$("#l_email").val("");
			$("#l_goal").val("");
			$("#l_plan").val("");
			$("#pcnt").val("");
			$("#file_name").val("");
			
			$("#filedit").empty();
			
			$("#tmp_filename").val("");
			$("#tmp_filepath").val("");
			$("#tmp_filesize").val("");
			
		}else{
			
			$("#l_title").val(object.title);
			$("#category").val(object.category);
			$("#l_name").val(object.name);
			$("#l_name").attr("readonly", true);
			$("#room_no").val(object.room);
			$("#l_startdate").val(object.startdate);
			$("#l_enddate").val(object.enddate);
			$("#l_hp").val(object.hp);
			$("#l_hp").attr("readonly", true);
			$("#l_email").val(object.email);
			$("#l_goal").val(object.goal);
			$("#l_plan").val(object.plan);
			$("#l_no").val(object.no);
			$("#pcnt").val(object.pcnt);
			$("#file_name").val("");
			
			var beforeFileMsg = "<span>���Ϻ��� : </span>"; 
			var filelink = "<p>�������� : <a href=\"javascript:download('" + object.no + "')\">" + object.filename + "</a> &nbsp;&nbsp;&nbsp;&nbsp;";
			filelink += "<a href='javascript:tempDeleteFile()'>[���ϻ���]</p>" ;
			console.log(filelink);
			
			$("#filedit").empty().append(filelink).show();
			
			$("#tmp_filename").val(object.filename);
			$("#tmp_no").val(object.no);
		 
		}
	}
	
	function tempDeleteFile() {
		$("#tmpDeleteFile").val("Y");
		$("#filedit").hide();
	}
	
	// ���ϴٿ�ε�
	function download(no) {
		
		var reqParam = "";
		reqParam += "<input type='hidden' name='no' value='"+no+"' />";
		
		console.log(reqParam);
		
		jQuery("<form action='/supportD/downloadLecturePlanAtmtFil.do' method='post'>"+reqParam+"</form>").appendTo('body').submit().remove();
		
	}
	
	
	//LIST ��ȸ
	function lecturePlanList(currentPage) {
		currentPage = currentPage || 1;

		//alert("lecturePlanList"); 
		var all = $('#all').val();
		var keyword = $('#keyword');
		var from_date = $('#from_date');
		var to_date = $('#to_date');
		var searchType = $('#searchType option:selected').val();

		var param = {
			searchType : searchType,
			keyword : keyword.val(),
			from_date : from_date.val(),
			to_date : to_date.val(),
			currentPage : currentPage,
			pageSize : PageSize,
			all : all

		}

		var resultCallback = function(data) { // �����͸� �� �Լ��� �ѱ�ô�. 
			lectureListResult(data, currentPage);
		}

		callAjax("/supportD/lecturePlanList.do", "post", "text", true, param,
				resultCallback);
	}

	//callBack
	function lectureListResult(data, currentPage) {
		$("#LecturePlanList").empty();

		$("#LecturePlanList").append(data);

		var totalCnt = $("#totalCnt").val();

		if (totalCnt == null || totalCnt == 0) {
			alert("�����Ͱ� �����ϴ�.");
			return;
		}

		var list = $("#lecture_list").val();
		var pagingnavi = getPaginationHtml(currentPage, totalCnt, PageSize,
				PageBlock, 'lecturePlanList');
		$("#pagingnavi").empty().append(pagingnavi);

		// ���� ������ ���� 
		$("#currentPage").val(currentPage);
	}
	
	
</script>


</head>
<body>
<form id="lectureform" action="">
	<input type="hidden" id="currentPage" value="1">
	<input type="hidden" id="lecture_list">
	<input type="hidden" id="tmp_filename" value="">
	<input type="hidden" id="tmp_filepath" value="">
	<input type="hidden" id="tmp_filesize" value="">
	<input type="hidden" id="tmpDeleteFile" value="">
	<input type="hidden" id="tmp_no" value="">
</form>

		<div id="wrap_area">

		<h2 class="hidden">header ����</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">������ ����</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb ���� --> 
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb ���� -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents ����</h3> <!-- content -->
					<div class="content">

						<p class="Location">
							<a href="#" class="btn_set home">��������</a> 
							<a href="#" class="btn_nav">�н�����</a> 
							<span class="btn_nav bold">���� ��ȹ��</span> 
							<a href="#" class="btn_set refresh">���ΰ�ħ</a>
						</p>

						<p class="conTitle">
							<span style="margin-right:78%">���� ���</span>
	                        <a href="" class="btnType blue" id="lectureInsertBtn" name="btn"><span >��    ��</span></a> 
						</p>
						
					<!--�˻�â  -->
					<table width="100%" cellpadding="5" cellspacing="0" border="1"
                        align="left"
                        style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                        <td style="width: 80px; margin-left: 20px">
							<select id="searchType" name="searchType">
								<option value="all">��ü</option>
								<option value="title">�����</option>
								<option value="name">�����</option>
							</select>
                         <input type="text" style="width: 150px; height: 30px;" id="keyword" name="keyword"></td>                     
                           <td width="20" height="25" style="font-size: 100%">����&nbsp;
                            <input type="date" style="width: 120px" id="from_date" name="from_date"></td>
                           <td width="20" height="25" style="font-size: 100%">����&nbsp;&nbsp;
                            <input type="date" style="width: 120px" id="to_date" name="to_date"></td>
                           <td width="50" height="60" style="font-size: 120%">
                           <a href="" class="btnType blue" id="lectureSearchBtn" name="btn"><span>��  ��</span></a></td> 
                        </tr>
                     </table>    
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="15%"><!--�з�  -->
									<col width="25%"><!--����  -->
									<col width="10%"><!--�����  -->
									<col width="15%"><!--����  -->
									<col width="15%"><!--����  -->
									<col width="10%"><!--��û�ο� -->
									<col width="10%"><!--����  -->
								</colgroup>
								<thead>
									<tr>
										<th scope="col">�з�</th>
										<th scope="col">����</th>
										<th scope="col">�����</th>
										<th scope="col">����</th>
										<th scope="col">����</th>
										<th scope="col">��û�ο�</th>
										<th scope="col">����</th>
									</tr>
								</thead>
								<tbody id="LecturePlanList"></tbody>
							</table>
							
							<!-- ����¡ ó��  -->
							<div class="paging_area" id="pagingnavi">
								<div class="paging">
									<a class="first" href="javascript:lecturePlanList(1)">
									<span class="hidden">�Ǿ�</span></a>
									<a class="pre" href="javascript:lecturePlanList(1)">
									<span class="hidden">����</span></a>
									<strong>1</strong> 
									<a href="javascript:lecturePlanList(2)">2</a> 
									<a href="javascript:lecturePlanList(3)">3</a> 
									<a href="javascript:lecturePlanList(4)">4</a>
									<a href="javascript:lecturePlanList(5)">5</a>
									<a class="next" href="javascript:lecturePlanList(5)">
									<span class="hidden">����</span></a>
									<a class="last" href="javascript:lecturePlanList(5)">
									<span class="hidden">�ǵ�</span></a>
								</div>
							</div>
						</div>
					</div> <!--// content -->

					<h3 class="hidden">ǲ�� ����</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
		</div>
	</div>
	
	
	
	<form  name="frmLectureModal" action=""  method="" id="frmLectureModal">
		<input type="hidden" id="loginID" value="${loginId}">
		<input type="hidden" id="name" value="${writer}">
		<input type="hidden" id="no" value="">
		<!--��� �˾�â  -->
		<div id="LectureModal" class="layerPop layerType2" style="width: 800px;">
			
			<dl>
				<dt>
					<strong>�� �� �� ȹ ��</strong>		
				</dt>
				<dd class="content">
					<table class="row">
					<caption>caption</caption>
							<tr>
								<th scope="row">���Ǹ�</th>

									<td><input type="text" class="inputTxt p100" name="l_title" id="l_title" />
										<input type="hidden" class="inputTxt p100" name="l_no" id="l_no" />
									</td>
									
								<th scope="row">�з�</th>
								<td width="80px">
									<select id="category" name="category">
										<option value="">����</option>
										<option value="������">������</option>
										<option value="�ٷ���">�ٷ���</option>
										<option value="����">����</option>
									</select>
								</td>
								<th scope="row">����</th>
									<td><input type="text" class="inputTxt p100" name="pcnt" id="pcnt" /></td>
							</tr>
							<tr>
							 	<th scope="col">�����</th>
								<td colspan="2"><input type="text" class="inputTxt p100" value="l_name" id="l_name" /></td>
								<th scope="row">���ǽ�</th>
								<td colspan="2"><input type="text" class="inputTxt p100" name="room_no" id="room_no" /></td>
							</tr>
							<tr>
								<th scope="row">������</th>
								<td colspan="2"><input type="date" class="inputTxt p100" name="l_startdate" id="l_startdate" /></td>
								<th scope="row">������</th>
								<td colspan="2"><input type="date" class="inputTxt p100" name="l_enddate" id="l_enddate" /></td>
							</tr>
							<tr id="teacherContact">
								<th scope="row">����ó</th>
								<td colspan="2"><input type="text" class="inputTxt p100" name="l_hp" id="l_hp" /></td>
								<th scope="row">�̸���</th>
								<td colspan="2"><input type="text" class="inputTxt p100" name="l_email" id="l_email" /></td>
							</tr>
							<tr>
								<th scope="row">������ǥ</th>
								<td colspan="5"><textarea class="inputTxt p100" name="l_goal" id="l_goal"> </textarea></td>
							</tr>
							<tr>
								<th scope="row">���ǰ�ȹ</th>
								<td colspan="5"><textarea class="inputTxt p100" name="l_plan" id="l_plan"> </textarea></td>
							</tr>
							<tr>
								<th scope="row">÷������ </th>
								<td colspan="5">
									<span class="hidden" id="modMsg">���� ����: </span><input type="file" class="inputTxt p100" name="file_name" id="file_name" />
									<div id="filedit" name="filedit" />
								</td>
							</tr>
						</tbody>
					</table>
						
		
				
				
				<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSave" name="btn"><span>�� ��</span></a> 
						<a href="" class="btnType blue" id="btnUpdate" name="btn"><span>�� ��</span></a> 
						<a href="" class="btnType blue" id="btnCancel" name="btn"><span>�� ��</span></a> 
				</div>
				
				</dd>
			</dl>	
		</div>
	</form>
	<!--��� �˾�â  -->
	
	
	
</body>
</html>