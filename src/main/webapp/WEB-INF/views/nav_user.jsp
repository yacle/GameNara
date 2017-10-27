<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="/index">GAMENARA</a>
	</div>
	<ul class="nav navbar-nav">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">SELL<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/sell/list?category=1&&type=map">TOTAL</a></li>
				<li><a href="/sell/list?category=2&&type=map">CONSOLE</a></li>
				<li><a href="/sell/list?category=3&&type=map">GAME TITLE</a></li>
				<li><a href="/sell/list?category=4&&type=map">ACCESSORY</a></li>
				<li><a href="/sell/list?category=5&&type=map">ETC</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">BUY<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/buy/list/1">TOTAL</a></li>
				<li><a href="/buy/list/2">CONSOLE</a></li>
				<li><a href="/buy/list/3">GAME TITLE</a></li>
				<li><a href="/buy/list/4">ACCESSORY</a></li>
				<li><a href="/buy/list/0">ETC</a></li>
			</ul></li>
		<li><a href="/FreeDistribute/list">FREE PRESENT</a></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">COMMUNITY<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/become_member/list">가입인사</a></li>
				<li><a href="/freeBoard/list">자유게시판</a></li>
				<li><a href="/after/list">거래후기</a></li>
			</ul>
		</li>
		<li><a>[${auth_id} Level] : ${auth_level}</a></li>
		<li><div class="form-group">
	 		<form class="navbar-form navbar-left" action="/search" method="post">
				<input type="text" name="search" class="form-control" placeholder="Search" >
				<button type="submit" class="btn btn-default btn-sm" id="submit">Submit</button>
			</form>	
		</div></li>
		<li class="dropdown">
			<ul class="nav navbar-nav navbar-right">
				<button class="btn btn-default dropdown-toggle-right btn-sm" type="button" id="menu1" data-toggle="dropdown" style="margin-top: 10px" >
					<span data-toggle="tooltip" id="tool" onclick="javascript:cnt()">${auth_id}</span>
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="/member/info?id=${auth_id}">PROFILE</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">MyWorld</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="/chat/note_list?id=${auth_id }">Message 
						<span class="badge" style="background-color: DodgerBlue" id="note_cnt"></span></a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">POINT : <span id="point"></span></a></li>
					<li role="presentation" class="divider"></li>
					<c:if test="${auth_level eq 9 }">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="/master/manage_member">ManagePage</a></li>
					</c:if>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="/log/logout">LOGOUT</a></li>
				</ul>
			</ul>
		</li>
	</ul>
</div>
<script>
	var nws = new WebSocket("ws://192.168.10.74/ws/note");
	var cnt = function(){
		$.ajax({
			"type":"post",
			"async":false,
			"url":"/chat/note_cnt",
			"data":{
				"id" : $("#tool").html()
			}
		}).done(function(r){
			var d = JSON.parse(r);
			$("#note_cnt").html(d.cnt);
			$("#point").html(d.point);
		})
	}
	nws.onmessage =function(e){
		window.alert("새로운 쪽지가 도착하였습니다.");

	}  
	cnt();
	var cws = new WebSocket("ws://192.168.10.74/ws/chat");
	cws.onmessage =function(e){
		var obj =JSON.parse(e.data);
		if(obj.chat =="chatting"){
			if(window.confirm(obj.sender+"님으로 부터 1대1 채팅 신청이 왔습니다.")){
				var url="/chatting/chatPage?id="+obj.sender;
				window.open(url, "", "width=400, height=550");
			}
		}
	} 
$("#submit").click(function() {
	$.ajax({
		"type" : "post",
		"async" : false,
		"url" : "/search",
		"data" : {
			"search" : $("#search").val()
		}
	})
})

</script>