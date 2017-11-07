<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 CSS - JQuery-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<div align="center">
<h3>[${id}]님 과의 채팅방</h3>
	<input type="hidden" id="receiver" name="receiver" value="${id}"/>
	<input type="hidden" id="sender" name="sender" value="${auth_id}"/>
	<small><span id="time" name="time"></span></small><br/>
	<div style="width: 80%; height: 60%; background-color: #D5D5D5; font-size: 10pt;" align="left" id="content"></div><br/>
		<input  type="text" id="msg" style="width: 80%;">
	</div>

<script>
	//메시지 전송
	document.getElementById("msg").onchange = function() {
		$.ajax({
			"type":"post",
			"async":false,
			"url":"/chatting/chatPage",
			"data":{
				"receiver" : $("#receiver").val(),
				"sender" : $("#sender").val(),
				"msg" : $("#msg").val()
			}
		})
		this.value = "";
	}
	// 받은 메시지 내용 확인
	var cws = new WebSocket("ws://192.168.10.73/ws/chat");
	cws.onmessage = function(e) {
		var obj =JSON.parse(e.data);
		var m = "<p><b>"+ obj.sender+"</b> : " +obj.msg +"</p>";
		var n = "<p align='right'><b>"+ obj.sender+"</b> : " +obj.msg +"</p>";
			document.getElementById("content").innerHTML += m;	
	}
	//채팅 접속
	cws.onopen = function(e) {
		document.getElementById("content").innerHTML += "<p><b>[서버 접속 성공]</b></p>";
		document.getElementById("content").innerHTML += "<p>즐거운채팅되십시요.</p>";
	}
	//채팅 접속 오류
	cws.onerror = function(e) {
		if (window.confirm("채팅서버 접속 실패\n다시 접속하시겠습니까?")) {
			cws = new WebSocket("ws://192.168.10.73/ws/chat");
		}
	}
</script>
