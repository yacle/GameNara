<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
th {
	border-bottom: 1px solid;
	text-align: left;
}

th, td {
	padding: 10px;
}
</style>

<div align="center" style="line-height: 35px">
<ul class="pagination">
	<li><a href="">받은 쪽지함</a></li>
	<li><a href="/chat/sendNoteList?id=${auth_id }">보낸 쪽지함</a></li>
	<li><a href="/chatting/chatList?id=${auth_id }">채팅메세지함</a></li>
</ul>
	<h2>받은 쪽지함</h2>
	<p align="right" style="margin-right: 30px;">
		총 <b>${cnt }</b> 개의 글이 등록되어있습니다.
	</p>
	<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">No</th>
				<th style="width: 15%">보낸사람</th>
				<th style="width: 50%">받은 메세지	</th>
				<th style="width: 15%">받은시간</th>
				<th style="width: 10%">삭제</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach var="obj" items="${list }">
				<tr>
					<td>${obj.NO} </td>
					<td>
						<div class="dropdown">
								<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
									<span id="receiver" value="${obj.SENDER }">${obj.SENDER }</span>
								<span class="caret"></span></button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:openchat('${obj.SENDER }')">쪽지보내기</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:chatting('${obj.SENDER }')">1:1채팅초대</a></li>
								</ul>
							</div>
					
					</td>
					<td><span id="noteView" value="${obj}">${obj.CONTENT }</span></td>
					<td><small>${obj.SENDTIME }</small></td>
					<td><input type="checkbox" id="noteDel" name="noteDel" class="delCheck" value="${obj.NO}"/></td> 
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<button type="button" id="notecall" onclick="javascript:openchat2()">쪽지쓰기</button>
		<button type="button" id="delbtn">삭제</button>
		<input type="hidden" id="id" name="id" value="${auth_id }">
<script>
var arr=[];
	document.getElementById("delbtn").onclick=function(){
		var m = document.getElementsByClassName("delcheck");
		for(var i=0; i<m.length; i++){
			if(m[i].checked==true){
				arr.push(m[i].value);
			}
		}
		$.ajax({
			"type":"post",
			"async":false,
			"url":"/chat/receiveNoteDel",
			"data":{
				"arr": JSON.stringify(arr),
				"id":$("#id").val()
			}
		}).done(function(r){
			window.location.reload();
		})	
		
	}
	
	function openchat(obj){
		var url="/chat/noteSend?id="+obj;
		window.open(url, "noteSend", "width=400, height=550");
	}
	
	function openchat2(){
		var url="/chat/noteSend2";
		window.open(url, "noteSend", "width=400, height=550");
	}

	function chatting(obj){
		$.ajax({
			"type":"post",
			"async":true,
			"url":"/chatting/confirm",
			"data":{
				"chat":"chatting",
				"receiver":obj,
				"sender" : $("#my").val()
			}
		}).done(function (r){
			if(r == "yes"){	
				var url="/chatting/chatPage?id="+obj;
				window.open(url, "", "width=400, height=550");
			}else{
				window.alert("현재 접속하지 않은 사용자입니다.")
			}
		})
		
	}
</script>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
