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
	text-align:center;
	vertical-align: middle;
}
</style>

<div align="center" style="line-height: 35px">
<ul class="pagination">
	<li><a href="/chat/note_list?id=${auth_id }">받은 쪽지함</a></li>
	<li><a href="/chat/sendNoteList?id=${auth_id }">보낸 쪽지함</a></li>
	<li><a href="">채팅메세지함</a></li>
</ul>
	<h2>채팅 메세지함</h2>
	<p align="right" style="margin-right: 30px;">
		총 <b>${cnt }</b> 개의 글이 저장되어있습니다.
	</p>
	<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">No</th>
				<th style="width: 15%">대화상대</th>
				<th style="width: 50%">대화내용</th>
				<th style="width: 15%">저장일자</th>
				<th style="width: 10%">삭제</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach var="obj" items="${list }">
				<tr>
					<td>${obj.no} </td>
					<td>${obj.receiver }</td>
					<td style="text-align:left"><a href="/chatting/chatView?no=${obj.no}">${fn:substring(obj.content, 0, 12)}</a></td>
					<td><small>${obj.adddate }</small></td>
					<td><input type="checkbox" id="chatDel" name="chatDel" class="chatCheck" value="${obj.no}"/></td> 
				</tr>
			</c:forEach>
		</tbody>
	</table>
			<button type="button" id="delbtn">삭제</button>
		<input type="hidden" id="id" name="id" value="${auth_id }">
<script>
var arr=[];
	document.getElementById("delbtn").onclick=function(){
		var m = document.getElementsByClassName("chatcheck");
		for(var i=0; i<m.length; i++){
			if(m[i].checked==true){
				arr.push(m[i].value);
			}
		}
		$.ajax({
			"type":"post",
			"async":false,
			"url":"/chatting/deleteChat",
			"data":{
				"arr": JSON.stringify(arr),
				"id":$("#id").val()
			}
		}).done(function(r){
			window.alert(r+"개의 채팅메세지가 삭제되었습니다.");
			window.location.reload();
		})	
	}
</script>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
