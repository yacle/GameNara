<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div align="center">
<h2>쪽지보내기</h2>
<h3>TO : [${data}]</h3>
<form action="/chat/note_send" method="post">
	<input type="hidden" name="receiver" value="${data}"/>
	<input type="hidden" name="sender" value="${auth_id}"/>
	<span id="time" name="time"></span><br/>
	<textarea rows="10" cols="40" name="content" placeholder="보낼내용.." required></textarea><br/>
	<button type="submit" id="send">SEND</button>
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
		case 0: day="일"; break; case 1: day="월"; break; case 2: day="화"; break; case 3: day="수"; break; case 4: day="목"; break; case 5: day="금"; break; case 6: day="토"; break;	
		}
		var t = y+"년 "+(mon+1)+"월 "+date+"일 "+day+"요일 "+h+":"+m+":"+s;
		document.getElementById("time").innerHTML =t;
	}
	setInterval(printTime, 1000);

</script>