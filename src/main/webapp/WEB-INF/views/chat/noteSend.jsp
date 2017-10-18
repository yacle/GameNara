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
<h2>쪽지보내기</h2>
<h3>TO : [${id}]</h3>
	<input type="hidden" id="receiver" name="receiver" value="${id}"/>
	<input type="hidden" id="sender" name="sender" value="${auth_id}"/>
	<small><span id="time" name="time"></span></small><br/>
	<textarea rows="15" cols="45" id="content" name="content" placeholder="보낼내용.." required></textarea><br/><br/>
	<button type="button" id="send" name="send">SEND</button>
</form>
</div>

<script>
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
		document.getElementById("time").innerHTML =t;
	}
	setInterval(printTime, 1000);

	$("#send").click(function(){
		$.ajax({
			"type":"post",
			"async":true,
			"url":"/chat/note_send",
			"data":{
				"receiver":$("#receiver").val(),
				"sender":$("#sender").val(),
				"content":$("#content").val(),
				"time":$("#time").html()
			}
		}).done(function(obj){
			window.alert("["+obj.trim()+"]");
			window.close();
		})
	})

</script>