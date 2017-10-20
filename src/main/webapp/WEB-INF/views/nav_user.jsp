<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="/index">GAMENARA</a>
	</div>
	<ul class="nav navbar-nav">
		<li class="active"><a href="#">NOTICE</a></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">SELL<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">TOTAL</a></li>
				<li><a href="#">CONSOLE</a></li>
				<li><a href="#">GAME TITLE</a></li>
				<li><a href="#">ACCESSORY</a></li>
				<li><a href="#">ETC</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">BUY<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/buy/list">TOTAL</a></li>
				<li><a href="/buy/console_list">CONSOLE</a></li>
				<li><a href="/buy/title_list">GAME TITLE</a></li>
				<li><a href="/buy/accessory_list">ACCESSORY</a></li>
				<li><a href="/buy/others_list">ETC</a></li>
			</ul></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">EXCHANGE<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/exchange/list">TOTAL</a></li>
				<li><a href="/exchange/console_list">CONSOLE</a></li>
				<li><a href="/exchange/title_list">GAME TITLE</a></li>
				<li><a href="/exchange/accessory_list">ACCESSORY</a></li>
				<li><a href="/exchange/others_list">ETC</a></li>
			</ul></li>
		<li><a href="/FreeDistribute/list">FREE PRESENT</a></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">COMMUNITY<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/become_member/list">가입인사</a></li>
				<li><a href="/freeBoard/list">자유게시판</a></li>
				<li><a href="/after/list">거래후기</a></li>
			</ul></li>
		<button class="btn btn-default dropdown-toggle-right" type="button" id="menu1" data-toggle="dropdown" style="margin-left: 280px; margin-top: 9px;">
			<span data-toggle="tooltip" id="tool" onclick="javascript:cnt()">${auth_id}</span>
			<span class="caret"></span>
		</button>
		<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
			<li role="presentation"><a role="menuitem" tabindex="-1" href="/member/info?id=${auth_id}">PROFILE</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">MyWorld</a></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="/chat/note_list?id=${auth_id }">Message 
				<span class="badge" style="background-color: DodgerBlue" id="note_cnt"></span></a></li>
			<li role="presentation" class="divider"></li>
			<li role="presentation"><a role="menuitem" tabindex="-1" href="/log/logout">LOGOUT</a></li>
		</ul>
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
			$("#note_cnt").html(r);
		})
	}
	nws.onmessage =function(e){
		window.alert("새로운 쪽지가 도착하였습니다.");
	}
	</script>



