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
	var PageBlock = 10;		// ������ ������ ����¡ó�� ��
	var roomNo=$("#");
		

	/* onload �̺�Ʈ  */
	$(function() {
		lectureRoomList();
		clickEvent();
	});
	
	function ValidateCHK(){
		var CHK=checkNotEmpty(
			[
				["room","���ǽ� ��ȣ�� �Է��ϼ���."],
				["ccount","�����ο��� �Է����ּ���."],
			]		
		);
		if(!CHK){return;}
	 	return true;
	}
	
	function ValidateWare(){
		var CHK=checkNotEmpty(
			[
				["Wname","������ �Է��ϼ���."],
				["Wccount","��񰹼��� �Է����ּ���."],
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
			case "roomSearchBtn":		
				lectureRoomList();
				 
				break;
				
			case "roomInsertBtn":
				gfModalPop("#roomModal");					
				break;
				
			case "btnCancel":
				$("#roomModal").hide();		
				break;
				
			case "btnSave":
				
				var result = confirm("�����ϽðԽ��ϱ�?");
				if(result){
					roomInsert();
				}
				break;
				
			case "btnCancelWare":
				$("#roomWareModal").hide();		
				break;	
				
			case "btnSaveWare":
				
				var result = confirm("�����ϽðԽ��ϱ�?");
				if(result){
					var action="I";
					insertWare(action);
				}else {
					$("#roomWareModal").hide();	
				}
				break;
				
			case "btnUpdateWare":
				var result = confirm("�����ϽðԽ��ϱ�?");
				if(result){
					var action="U";
					insertWare(action);
				}else {
					$("#roomWareModal").hide();	
				}
				break;	
			}
		})
	}
	
	
	//LIST ��ȸ
	function lectureRoomList(currentPage) {
		currentPage = currentPage || 1;
		var room = $('#serchKey').val();
		
		var param = {
				 room : room, 
				currentPage : currentPage,
				pageSize : PageSize
			}

		var resultCallback = function(data) { // ������ �޾ƿ�
			ResultRoomList(data, currentPage);
		}

		callAjax("/manageF/lectureRoomInfo.do", "post", "text", true, param,
				resultCallback);
	}

	//callBack
	function ResultRoomList(data, currentPage) {
		$("#LectureRoomList").empty();
		$("#LectureRoomList").append(data);
		
		var totalCnt = $("#totalCnt").val();
		if (totalCnt == null || totalCnt == 0) {
			alert("�����Ͱ� �����ϴ�.");
			return;
		}

		var list = $("#lectureRoom_list").val();
		var pagingnavi = getPaginationHtml(currentPage, totalCnt, PageSize,
				PageBlock, 'LectureRoomList', [ list ]);
		$("#pagingnavi").empty().append(pagingnavi);

		// ���� ������ ���� 
		$("#currentPage").val(currentPage);
	}
	
	
	//�ű� ���ǽ� ���
	function roomInsert(){
		if(!ValidateCHK()){
			return;
		}
		 var resultCallback1 = function(data){
			 var currentPage = currentPage || 1;
			 if(data.resultMsg=="INSERT"){
				 alert("��� �ǿ����ϴ�.");
				 gfCloseModal();
				 fSaveResult(data);
			 }
		 };
		callAjax("/manageF/InsertRoomInfo.do", "post", "json", true, $("#frmRoomModal").serialize(), resultCallback1);
	}
	
	function fSaveResult(data){
		var currentPage = currentPage || 1; 
		
		switch (data.resultMsg) {
		case "INSERT":
			alert("����ǿ����ϴ�.");
			break;
			
		}
		 gfCloseModal();	// ��� �ݱ�
		 lectureRoomList(currentPage); // �����ȸ �Լ� �ٽ� ��� 
		
	}
	
	
	/*��� ��Ʈ satrt */
	
	//��� ���� ����Ʈ��ȸ
	function roomWareList(room,currentPage){
		currentPage = currentPage || 1;
		
		$("#roomNo").val(room);
		var param = {
				room : room ,
				currentPage : currentPage,
				pageSize : PageSize
			}

		var resultCallback = function(data) { // ������ �޾ƿ�
			resultWareList(data, currentPage);
		}

		callAjax("/manageF/selectWareList.do", "post", "text", true, param,resultCallback); 
	}
	
	//callBack
	function resultWareList(data, currentPage) {
		$("#roomWareList").empty();

		$("#roomWareList").append(data);

		var totalCnt = $("#totalCnt").val();
		if (totalCnt == null || totalCnt == 0) {
			alert("�����Ͱ� �����ϴ�.");
			return;
		}

		var list = $("#roomWare_List").val();
		var pagingnavi = getPaginationHtml(currentPage, totalCnt, PageSize,
				PageBlock, 'roomWareList', [ list ]);
		$("#pagingnavi").empty().append(pagingnavi);

		// ���� ������ ���� 
		$("#currentPage").val(currentPage);
	}
	
		//����� ��� �˾�
	function wareInsertBtn(seq,room){
		//�ű� ���
		if (seq == null || seq == "") {
			$("#btnUpdateWare").hide();
			$("#btnSaveWare").show();
			var roomNo=$("#roomNo").val();
			if(roomNo==""){
				alert("����� ����� ���ǽ��� ���� ���ּ���!");
				return;
			}
			
			$("#wdRoom").val(roomNo);
			gfModalPop("#roomWareModal");
		}else if(seq!=null) {
		 	var param = {
				    seq : seq
				  }; 
				 var resultCallback = function(data){
					 alert(data.resultMsg);
					 detailReadResult(data);
				 };
				callAjax("/manageF/readWareDetail.do", "post", "json", true, param, resultCallback);
		}
	}
		
		
	function detailReadResult(data){
		if(data.resultMsg == "READ"){
			 $("#btnSaveWare").hide();
			 $("#btnUpdateWare").show();
			 $("#btnDeleteWare").show();
			 gfModalPop("#roomWareModal");
			dataSetPopModal(data.resultOneWare);
		 }else{
			 alert("��ȸ �Ҽ��� �����ϴ�.");
		 }
	}
	
	//����Ÿ ����||����
	function dataSetPopModal(object){
		var writer = $("#name").val();
		$("#l_name").val(writer);
		$("#l_name").attr("readonly", true);
		
		 if(object == "" || object == null || object == undefined){
				
				$("#wdRoom").val("");
				$("#Wccount").val("");
				$("#Wname").val("");
				$("#Wetc").val("");
				$("#Wseq").val("");
		 }else{
				$("#wdRoom").val(object.room);
				$("#Wccount").val(object.ccount);
				$("#Wname").val(object.name);
				$("#Wetc").val(object.etc);
				$("#Wseq").val(object.seq);
		 }
	}
	
	//�ű� ��� ���
	function insertWare(action){
		if(action=="I"){
				aelrt("�Է�");
				var roomNo=$("#roomNo").val();
			 	if(!ValidateWare()){
					return;
				} 
				var resultCallback = function(data){
					 var currentPage = currentPage || 1; 
					 if(data.resultMsg=="INSERT"){
						 gfCloseModal();
						 wareResult(data);
					 }
					 
				 };
				callAjax("/manageF/InsertWareInfo.do", "post", "json", true, $("#frmWareModal").serialize(), resultCallback);
			}else if (action="U") {
				alert($("#frmWareModal").serialize());
				var resultCallback = function(data){
					 var currentPage = currentPage || 1; 
					 if(data.resultMsg=="UPDATE"){
						 gfCloseModal();
						 wareResult(data);
					 }
				 };	
				callAjax("/manageF/updateWareInfo.do", "post", "json", true, $("#frmWareModal").serialize(), resultCallback);
			
			}
	}
		
	
	function wareResult(data){
		var currentPage = currentPage || 1; 
		var roomNo=data.room;
		switch (data.resultMsg) {
			case "INSERT":
				alert("���� �ǿ����ϴ�.");
				break;
				
			case "READ":
				alert("��ȸ �ǿ����ϴ�.");
				break;
				
			case "UPDATE":
				alert("���� �ǿ����ϴ�.");
				break;
				

		}
		 gfCloseModal();	// ��� �ݱ�
		 roomWareList(roomNo,currentPage); // �����ȸ �Լ� �ٽ� ��� 
		
	}
	
	
	/*��� ��Ʈ  end*/
 	
 
 
</script>


</head>
<body>


<form id="roomform" action="">
	<input type="hidden" id="currentPage" value="1">
	<input type="hidden" id="lectureRoom_list" value="">
	<input type="hidden" id="roomNo" value="">
	
	
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
								<a href="#" class="btn_nav">��ǰ����</a> 
								<span class="btn_nav bold">���ǽ� ����</span> 
								<a href="#" class="btn_set refresh">���ΰ�ħ</a>
							</p>

							<p class="conTitle">
								<span style="margin-right:70%">���ǽ� ����</span>
		                        <a href="" class="btnType blue" id="roomInsertBtn" name="btn"><span >��&emsp;��</span></a> 
							</p>
							
						<!--�˻�â  -->
						<table width="100%" cellpadding="5" cellspacing="0" border="1" style="border-collapse: collapse; border: 1px #50bcdf;">
	                        <tr style="border: 0px; border-color: blue; align-content: center; " >
	                        <td style="width: 80px; margin-left: 50px">���ǽ�&nbsp;
	                         <input type="text" style="width: 150px; height: 30px;" id="serchKey" name="serchKey"></td>                     
	                           <td width="50" height="60" style="font-size: 120%; margin-right:90px;">
	                           <a href="" class="btnType blue" id="roomSearchBtn" name="btn"><span>��  ��</span></a></td> 
	                        </tr>
	                     </table>    
							
							<div class="divComGrpCodList">
								<table class="col">
									<thead>
										<tr>
											<th width="15%">���ǽ� ��ȣ</th>
											<th width="20%">���ǽ� ��</th>
											<th width="25%">�����ο�/�� �ο�</th>
											<th width="30%">���</th>
										</tr>
									</thead>
									<tbody id="LectureRoomList"></tbody>
								</table>
								
								<!-- ����¡ ó��  -->
								<div class="paging_area" id="pagingnavi">
									<div class="paging">
										<a class="first" href="javascript:LectureRoomList(1)">
										<span class="hidden">�Ǿ�</span></a>
										<a class="pre" href="javascript:LectureRoomList(1)">
										<span class="hidden">����</span></a>
										<strong>1</strong> 
										<a href="javascript:LectureRoomList(2)">2</a> 
										<a href="javascript:LectureRoomList(3)">3</a> 
										<a href="javascript:LectureRoomList(4)">4</a>
										<a href="javascript:LectureRoomList(5)">5</a>
										<a class="next" href="javascript:LectureRoomList(5)">
										<span class="hidden">����</span></a>
										<a class="last" href="javascript:LectureRoomList(5)">
										<span class="hidden">�ǵ�</span></a>
									</div>
								</div>
								
								
								<!--***********��� ����*************  -->
								<p class="conTitle mt50">
									<span style="margin-right:70%">��� ����</span>
			                        <a href="javascript:wareInsertBtn();" class="btnType blue" id="roomWareInsertBtn" name="modal"><span >�� �� �� ��</span></a> 
								</p>
								
								<div class="roomWareListDIV">
									<table class="col">
										<thead>
											<tr>
												<th width="15%">���ǽ� ��ȣ</th>
												<th width="35%">����</th>
												<th width="20%">PCS</th>
												<th width="40%">���</th>
											</tr>
										</thead>
										<tbody id="roomWareList">
											<tr>
												<td colspan="4">�׷��ڵ带 ������ �ּ���.</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!--***********��� ����*************  -->
								
							</div>
						</div> <!--// content -->
					</li>
				</ul>
			</div>
		</div>
	</form>
	
	
<!--���ǽ� �����  Start-->
	<form name="frmRoomWare" action="" method="" id="frmRoomModal">
		<input type="hidden" id="loginID" value="${loginId}"> 
		<input type="hidden" id="name" value="${writer}">
		<!--��� �˾�â  -->
		<div id="roomModal" class="layerPop layerType2" style="width: 600px;">
			<dl>
				<dt>
					<strong style="font-size:15px;">�� �� �� �� ��</strong>
				</dt>
				<dd class="content">
					<table class="row">
						<caption>caption</caption>
						<tr>
							<th scope="row">���ǽ� ��ȣ</th>
							<td ><input type="text" class="inputTxt p100" name="room" id="room" /></td>
						</tr>
						<tr>
							<th scope="row">���ǽ� ��</th>
							<td ><input type="text" class="inputTxt p100" name="name" id="name" /></td>
						</tr>
						<tr>
							<th scope="row">����</th>
							<td ><input type="text" class="inputTxt p100" name="ccount" id="ccount" /></td>
						</tr>
						<tr>
							<th scope="row">���</th>
							<td ><input type="text" class="inputTxt p100" name="etc" id="etc" /></td>
						</tr>
						</tbody>
					</table>

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSave" name="btn"><span>��	��</span></a> 
						<a href="" class="btnType blue" id="btnCancel" name="btn"><span>�� ��</span></a>
					</div>

				</dd>
			</dl>
		</div>
	</form>
	<!--���ǽ� ����� END -->
	
	<!--���ǽ���� �����START  -->
	<form name="frmWareModal" action="" method="" id="frmWareModal">
		<input type="text" id="loginID" value="${loginId}"> 
		<input type="hidden" id="roomWare_List" value="">
		<input type="hidden" id="wRoom" value="${room}">
		<input type="hidden" id="seq" value="">
		<!--��� �˾�â  -->
		<div id="roomWareModal" class="layerPop layerType2" style="width: 800px;">
			<dl>
				<dt>
					<strong style="font-size:15px;">�� �� �� ��</strong>
				</dt>
				<dd class="content">
					<table class="row">
						<caption>caption</caption>
						<tr>
							<th scope="row">���ǽ� ��ȣ</th>
							<td colspan="3">
								<input type="text" class="inputTxt p100" name="wdRoom" id="wdRoom" readonly/>
								<input type="text" class="inputTxt p100" name="Wseq" id="Wseq" readonly/>
							</td>
						</tr>
						<tr>
							<th scope="col">����</th>
							<td ><input type="text" class="inputTxt p100" name="Wname" id="Wname" /></td>
							<th scope="row">����</th>
							<td ><input type="text" class="inputTxt p100" name="Wccount" id="Wccount" /></td>
						</tr>
						<tr>
							<th scope="row">���</th>
							<td colspan="3"><textarea class="inputTxt p100" name="Wetc" id="Wetc"> </textarea></td>
						</tr>
					</table>

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSaveWare" name="btn"><span>��	��</span></a> 
						<a href="" class="btnType blue" id="btnUpdateWare" name="btn"><span>�� ��</span></a> 
						<a href="" class="btnType blue" id="btnDeleteWare" name="btn"><span>�� ��</span></a> 
						<a href="" class="btnType blue" id="btnCancelWare" name="btn"><span>�� ��</span></a>
					</div>

				</dd>
			</dl>
		</div>
	</form>
	<!--���ǽ���� �����END  -->
	
	<!--��� �˾�â  -->
	
	
</body>
</html>