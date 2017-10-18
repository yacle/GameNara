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
				<th style="width: 50%">받은 메세지</th>
				<th style="width: 15%">받은시간</th>
				<th style="width: 10%">삭제</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach var="obj" items="${list }">
				<tr>
					<td>${obj.NO} </td>
					<td>${obj.SENDER }</td>
					<td><span id="noteView" value="${obj}">${fn:substring(obj.CONTENT, 0, 30) }</span></td>
					<td><small>${obj.SENDTIME }</small></td>
					<td><input type="checkbox" name="noteDel"></td> 
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<span id="re"></span>
	
<script>
$("#noteView").click(function(obj){
	var m = $("#noteView").val();
	$("#re").html(m);
	
})
</script>