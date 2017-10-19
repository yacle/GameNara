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
		<li><a href="/chat/note_list?id=${auth_id }">받은 쪽지함</a></li>
		<li><a href="">보낸 쪽지함</a></li>
	</ul>
	<h2>보낸 쪽지함</h2>
	<p align="right" style="margin-right: 30px;">
		총 <b>${cnt }</b> 개의 글이 등록되어있습니다.
	</p>
	<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">No</th>
				<th style="width: 15%">받을사람</th>
				<th style="width: 50%">보낸 메세지</th>
				<th style="width: 15%">보낸시간</th>
				<th style="width: 10%">삭제</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach var="obj" items="${list }">
				<tr>
					<td>${obj.NO} </td>
					<td>${obj.RECEIVER }</td>
					<td><span id="noteView">${fn:substring(obj.CONTENT, 0, 30) }</span></td>
					<td><small>${obj.SENDTIME }</small></td>
<<<<<<< HEAD
					<td><input type="checkbox" name="noteDel" class="delcheck" value="${obj.NO}"></td> 
					<input type="hidden" id="id" name="id" value="${auth_id }">
=======
					<td><input type="checkbox" name="noteDel" class="delcheck" value="${obj.NO}"></td>
					<input type="hidden" id="id" name="id" value="${auth_id }"> 
>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
				</tr>
			</c:forEach>
		</tbody>
	</table>
<<<<<<< HEAD
				<button type="button" id="delbtn">삭제</button>
=======
	<button type="button" id="delbtn">삭제</button>
>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
<script>
var arr=[];
<<<<<<< HEAD
document.getElementById("delbtn").onclick=function(){
	var m = document.getElementsByClassName("delcheck");
	for(var i=0; i<m.length; i++){
		if(m[i].checked==true){
			arr.push(m[i].value);
		}
=======
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
			"url":"/chat/sendNoteDel",
			"data":{
				"arr": JSON.stringify(arr),
				"id":$("#id").val()
			}
		}).done(function(r){
			window.location.reload();
		})	
		
>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
	}
	$.ajax({
		"type":"post",
		"async":false,
		"url":"/chat/sendNoteDel",
		"data":{
			"arr": JSON.stringify(arr),
			"id":$("#id").val()
		}
	}).done(function(r){
		window.location.reload();
	})	
	
}
</script>
	
