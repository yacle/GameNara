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
    width: 95%;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    resize: none;
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
<h2>NO.<span id="no">${map.no }</span></h2>
	<div class="row">
		<div class="col-md-4"  align="center">
		
		<c:choose>
			<c:when test="${empty map.pic }">
			<img src="/profiles/default02.jpg" id="pf" alt="기본이미지" style="height: 300px; width: 300px;"/>
			</c:when>
			<c:otherwise>
			<img src="/sellB_File/${map.pic}" id="pf" alt="기본이미지" style="height: 300px; width: 300px;"/>
			</c:otherwise>	
		</c:choose>
			<form action="/sell/update" method="post" id="form" enctype="multipart/form-data">
				<input id="pic" class="update-group" type="file" name="picdata" style="display: none" disabled/>
				<input type="hidden" name="no" value="${map.no }"/>
				<input type="hidden" name="writer" value="${map.writer }"/>			
		</div>
		<div class="col-md-8">
			<table>
				<tbody>
					<tr>
						<td width="14%">제    목</td>
						<td width="86%"><input type="text" id="title" class="update-group" name="title" value="${map.title }" size="75" disabled></td>
					</tr>
					<tr>
						<td>판매가격</td>
						<td><input type="text" class="update-group" name="price" value="${map.price }" size="75" disabled></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" class="update-group" name="contact" value="${map.contact }" size="75" disabled></td>
					</tr>
					<tr>
						<td>거래방법</td>
						<td><input type="text" class="update-group" name="deal_method" value="${map.deal_method }" size="75" disabled></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select class="update-group" name="category" style="padding: 5px; border:none" disabled>
								<option value="1" <c:if test="${map.category eq 1 }"> selected </c:if> > 콘솔기기</option>
								<option value="2" <c:if test="${map.category eq 2 }"> selected </c:if> > 게임타이틀</option>
								<option value="3" <c:if test="${map.category eq 3 }"> selected </c:if> > 주변기기</option>
								<option value="0" <c:if test="${map.category eq 0 }"> selected </c:if> > 기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>판매자</td>
						<td>
							<div class="dropdown">
								<button class="btn dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
									<span id="receiver">${map.writer }</span>
								<span class="caret"></span></button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:openchat('${map.writer }')">쪽지보내기</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">1:1채팅초대</a></li>
								</ul>
								<c:choose>
									<c:when test="${map.state==0 }">
										<button class="btn dropdown-toggle" type="button" id="deal">구매신청</button>
									</c:when>
									<c:when test="${map.state==1 }">
										<b id="state_02">거래중</b>
										<c:if test="${auth_id eq map.writer }">
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
		<p><textarea class="update-group" rows="10" width="800px" placeholder="상세내용" name="detail"  disabled>${map.detail }</textarea></p>
		<c:if test="${auth_id eq map.writer }">
			<c:if test="${map.state ne 2 }">
				<button type="button" class="btn btn-default" id="modify">수정</button>
				<button type="button" class="btn btn-default" id="delete">삭제</button>
				<button type="button" class="btn btn-default" id="update" style="display: none">저장</button>
				<button type="reset" class="btn btn-default" id="cancle" style="display: none">취소</button>
			</c:if>
		</c:if>
		</form>
		<a href="/sell/list?category=0&&type=map"><button type="button" class="btn btn-default">목록</button></a>
	</div>
<hr/>
<script>
// 게시글 삭제
$("#delete").click(function(){
	if(window.confirm("게시글을 삭제하시겠습니까?")){
		$.ajax({
			"type" : "post",
			"async" : true,
			"url" : "/sell/delete",
			"data" : {
				"no" : $("#no").html(),
				"pic" : '${map.pic}'
			}
		}).done(function(){
			location.href="/sell/list?category=0&&type=map";
		})
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
		if(window.confirm("거래후기를 남기시겠습니까?")){
			location.href="/after/add/"+$("#no").html();
		}
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
			"content": "<a href="+location+">"+$("#id").val()+"님으로부터 거래의뢰가 들어왔습니다.</a>",
			"time":$("#time").html(),
			"no": $("#no").html(),
			"state": 1
		}
	}).done(function(obj){
		window.alert("[거래신청 쪽지를 보냈습니다.]");
		document.getElementById("deal").disabled=true;
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
	<div class="col-md-1">비밀번호:<input type="number" id="pwd" size="6" placeholder="4자리 숫자"  min="1" max="9999" required></div>
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
			cfm.val("");
		}else{
			cfm.val("");
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
