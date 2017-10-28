<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- ---------------------------------------------------- --%>
<style>
button{
	font-size: 12px;
	border-radius: 6px;
}

textarea {
    width: 100%;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
}
input[type=text]:disabled {
    background: #F8F8FF;
    padding: 7px;
    border-style: none;
}
input{
	 padding: 7px;
}
td{
	font-size: 16px;
	height: 55px;
	align: center;
}
</style>
<h2>NO.<span id="no">${map.NO }</span></h2>
	<div class="row">
		<div class="col-md-4"  align="center">
		
		<c:choose>
			<c:when test="${empty map.PIC }">
			<img src="/profiles/default02.jpg" id="pf" alt="기본이미지" style="height: 300px; width: 300px;"/>
			</c:when>
			<c:otherwise>
			<img src="/sellB_File/${map.PIC}" id="pf" alt="기본이미지" style="height: 300px; width: 300px;"/>
			</c:otherwise>	
		</c:choose>
			<form action="/sell/update" method="post" id="form" enctype="multipart/form-data">
				<input id="pic" class="update-group" type="file" name="pic" style="display: none" disabled/>
				<input type="hidden" name="no" value="${map.NO }"/>
				<input type="hidden" name="writer" value="${map.WRITER }"/>			
		</div>
		<div class="col-md-8">
			<table>
				<tbody>
					<tr>
						<td width="14%">제    목</td>
						<td width="86%"><input type="text" id="title" class="update-group" name="title" value="${map.TITLE }" size="75" disabled></td>
					</tr>
					<tr>
						<td>판매가격</td>
						<td><input type="text" class="update-group" name="price" value="${map.PRICE }" size="75" disabled></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" class="update-group" name="contact" value="${map.CONTACT }" size="75" disabled></td>
					</tr>
					<tr>
						<td>거래방법</td>
						<td><input type="text" class="update-group" name="deal_method" value="${map.DEAL_METHOD }" size="75" disabled></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select class="update-group" name="category" style="padding: 5px; border:none" disabled>
								<option value="1" <c:if test="${map.CATEGORY eq 1 }">selected</c:if> >콘솔기기</option>
								<option value="2" <c:if test="${map.CATEGORY eq 2 }">selected</c:if> >게임타이틀</option>
								<option value="3" <c:if test="${map.CATEGORY eq 3 }">selected</c:if> >주변기기</option>
								<option value="0" <c:if test="${map.CATEGORY eq 0 }">selected</c:if> >기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>판매자</td>
						<td>
							<div class="dropdown">
								<button class="btn dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
									<span id="receiver">${map.WRITER }</span>
								<span class="caret"></span></button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">INFO</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:openchat('${map.WRITER }')">쪽지보내기</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">1:1채팅초대</a></li>
									<li role="presentation" class="divider"></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">About Us</a></li>
								</ul>
								<c:choose>
									<c:when test="${map.STATE==0 }">
										<button class="btn dropdown-toggle" type="button" id="deal">구매신청</button>
									</c:when>
									<c:when test="${map.STATE==1 }">
										<b id="state_02">거래중</b>
										<c:if test="${auth_id eq map.WRITER }">
											<button type="button" class="btn btn-primary" id="deal_cancle"><small>거래취소</small></button>
											<button type="button" class="btn btn-primary" id="deal_end"><small>거래완료</small></button>
										</c:if>
									</c:when>
									<c:otherwise>
										<b>거래완료</b>	
									</c:otherwise>
								</c:choose>
							<small><span id="time"></span></small>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="row" align="center">
		<input type="hidden" id="id" value="${auth_id}">
		<p><textarea class="update-group" rows="10" width="1000px" placeholder="상세내용" name="detail"  disabled>${map.DETAIL }</textarea></p>
		</form>
		<c:if test="${auth_id eq map.WRITER }">
			<button type="button" class="btn btn-default" id="modify">수정</button>
			<button type="button" class="btn btn-default" id="delete">삭제</button>
			<button type="button" class="btn btn-default" id="update" style="display: none">저장</button>
			<button type="reset" class="btn btn-default" id="cancle" style="display: none">취소</button>
		</c:if>
		<a href="/sell/list?category=1&&type=list"><button type="button" class="btn btn-default">목록</button></a>
	</div>
<hr/>
<script>
// 게시글 삭제
$("#delete").click(function(){
	if(window.confirm("게시글을 삭제하시겠읍니까?")){
		var no = $("#no").html();
		var uri = "/sell/delete/"+no;
		location.href = uri;
	}
})
// 거래취소
$("#deal_cancle").click(function(){
	$("#deal_cancle, #deal_end").hide();
	$("#state_02").html("취소신청중");
	$.ajax({
		"type" : "post",
		"async" : false,
		"url" : "/sell/state",
		"data" : {
			"no" : $("#no").html(),
			"state" : 0
		}
	}).done(function(obj){
		window.alert(obj);
	})
})
// 거래완료
$("#deal_end").click(function(){
	$("#deal_cancle, #deal_end").hide();
	$("#state_02").html("거래완료");
	$.ajax({
		"type" : "post",
		"async" : false,
		"url" : "/sell/state",
		"data" : {
			"no" : $("#no").html(),
			"state" : 2
		}
	}).done(function(obj){
		window.alert(obj);
	})
})
// 내용 수정버튼
$("#modify").click(function(){
	var a = document.getElementsByClassName("update-group");
	for(var i=0; i<a.length; i++){
		a[i].disabled=false;
	}
	$("#modify, #delete").hide();
	$("#update, #cancle").show();
})
// 수정한 내용 저장하기
$("#update").click(function(){
	$("#form").submit();
})

// 수정 취소하기
$("#cancle").click(function(){
	var a = document.getElementsByClassName("update-group");
	for(var i=0; i<a.length; i++){
		a[i].disabled=true;
	}
	$("#modify, #delete").show();
	$("#update, #cancle").hide();
})
// 사진 선택
$("#pf").click(function(){
	$("#pic").click();
})
$("#pic").change(function(){
	var reader = new FileReader();
	reader.onload = function(e){
		document.getElementById("pf").src = e.target.result;
	}
	reader.readAsDataURL(this.files[0]);
})
// 쪽지보내기
function openchat(obj){
	var url="/chat/noteSend?id="+obj;
	window.open(url, "noteSend", "width=400, height=550");
}
// 구매신청
$("#deal").click(function(){
	$("#deal").html("거래신청중");
	var location = document.location.href;
	$.ajax({
		"type":"post",
		"async":true,
		"url":"/chat/deal/",
		"data":{
			"receiver":$("#receiver").html(),
			"sender":$("#id").val(),
			"content": "<a href="+location+">"+$("#id").val()+"님으로부터 거래의뢰가 들어왔읍니다.</a>",
			"time":$("#time").html(),
			"no": $("#no").html(),
			"state": 1
		}
	}).done(function(obj){
		window.alert("[거래신청 쪽지를 보냈읍니다.]");
		
	})
})
// time view
function num(a){
		if(a<10){
			a = "0"+a;
		}
		return a;
	}
	function printTime(){
		var d = new Date();
		var y = d.getFullYear();
		var mon = d.getMonth();
		var date = d.getDate();
		var day = d.getDay();
		var h = num(d.getHours());
		var m = num(d.getMinutes());
		var s = num(d.getSeconds());
		switch(day){
		case 0: day="일"; break; 
		case 1: day="월"; break; 
		case 2: day="화"; break; 
		case 3: day="수"; break;
		case 4: day="목"; break;
		case 5: day="금"; break;
		case 6: day="토"; break;	
		}
		var t = y+"년 "+(mon+1)+"월 "+date+"일 "+day+"요일 "+h+":"+m+":"+s;
		document.getElementById("time").innerHTML=t;
	}
	setInterval(printTime, 1000);
</script>


<%-- Reply input form --%>
<div class="row" >
	<div class="col-md-2" style="padding: 10px;" align="center"><span id="auth_id" style="font-size: 16px; font-weight: bold;">${auth_id }</span></div>
	<div class="col-md-8"><textarea rows="1" id="content"></textarea></div>
	<div class="col-md-1">비밀번호:<input type="text" id="pwd" size="6" placeholder="4자리 숫자" required></div>
	<div class="col-md-1" style="padding: 10px;"><button type="button" id="replysendbtn">등록</button></div>
</div>
<hr/>
<!-- Reply List View -->
<span id="replies"></span>
<!-- Reply 수정  modal-->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"><span id="replyhead"></span>번 댓글 수정</h4>
			</div>
			<div class="modal-body">
				<textarea rows="2" cols="70" id="replytext"></textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="replyModBtn">Save</button>
				<button type="button" class="btn btn-default" id="replyDelBtn">Delete</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancle</button>
			</div>
		</div>
	</div>
</div>
	 
<script>
var bno = $("#no").html();
// 댓글 목록 불러오기
var list = function(){
	$.getJSON("/replies/list/"+bno, function(data){
		var str="";
		$(data).each(
			function(){
				str += "<div class='row'>"
					+"<div class='col-md-2' align='center'>"+this.replyer+"</div>"
					+"<div class='col-md-9'>"
						+"<div class='row'>"+this.regdate+"</div>"
						+"<div class='row'>"+this.replytext+"</div>"
					+"</div>"
					+"<div class='col-md-1' id='m'>"
						+"<button type='button' class='replyLi'"
						+"date-rno='"+this.rno+"' pw='"+this.pwd+"' value='"+this.replytext+"'>수정</button><br/>"
						+"<input type='text'  id='replypwd' size='5' placeholder='비밀번호' style='display:none;'>"
					+"</div>"
				+"</div><hr/>"
			})
		$("#replies").html(str);
	})
}
list();
// 댓글 등록
$("#replysendbtn").click(function(){
	var replypw = $("#pwd").val();
	if(replypw != null){
		var replyer = $("#auth_id").html();
		var replytext = $("#content").val();
		$.ajax({
			"type": "post",
			"async":false,
			"url":"/replies/add",
			"headers": {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "POST"
			},
			"dataType":"text",
			"data":JSON.stringify({
				"bno":bno,
				"replyer":replyer,
				"replytext":replytext,
				"pwd":replypw
			})
		}).done(function(){
			$("#content").val("");
			$("#pwd").val("");
			list();
		})
	}else{
		window.alert("비밀번호를 입력하세요");
	}
})
// 댓글 수정버튼
$("#replies").on("click", "#m button", function(){
	var reply = $(this);
	var rno = reply.attr("date-rno");
	var pwd = reply.attr("pw");
	var replytext = reply.val();
	var cfm = $(this).next().next();
	cfm.show();
	cfm.change(function(){
		var inputpw = cfm.val();
		if(pwd== inputpw){
			$("#replytext").val(replytext);
			$("#replyhead").html(rno);
			$("#myModal").modal();
		}else{
			cfm.hide();
			window.alert("비밀번호를 확인하세요");
		}
	})
})

// modal form controll
$("#replyModBtn").click(function(){
	$.ajax({
		"type": "post",
		"async":false,
		"url":"/replies/update",
		"headers": {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "POST"
		},
		"dataType":"text",
		"data":JSON.stringify({
			"rno": $("#replyhead").html(),
			"replytext":$("#replytext").val()
		})
	}).done(function(){
		$("#myModal").modal("hide");
		list();
	})
})
$("#replyDelBtn").click(function(){
	var rno = $("#replyhead").html();
	$.get("/replies/delete/"+rno, function(){
		$("#myModal").modal("hide");
		list();
	})
})

</script>
