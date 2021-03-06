<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
th {
	border-bottom: 1px solid;
}

th, td {
	padding: 10px;
	text-align: center;
	vertical-align: middle;
}
</style>
<h2 align="center">${title}게시판</h2>
<div align="right" style="margin-bottom: 10px;">
		총 <b>${cnt }</b> 개의 글이 등록되어있습니다.
	<a href="/sell/list?category=0&&type=map"><span class="glyphicon glyphicon-th"></span>앨범형</button></a> | 
	<a><span class="glyphicon glyphicon-list-alt"></span>게시판형</a>
	<button type="button" id="write" class="btn btn-primary btn-sm">글작성</button><br/>
	<input type="hidden" id="id" value="${auth_id }">
</div>
<div align="center" style="line-height: 35px">
	<input type="hidden" id="my" value="${auth_id }"/>
	<table style="background-color: #EAEAEA;" class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">글번호</th>
				<th style="width: 15%">구분</th>
				<th style="width: 40%">글제목</th>
				<th style="width: 10%">작성자</th>
				<th style="width: 15%">작성일자</th>
				<th style="width: 10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="obj" items="${list }">
			<tr>
				<td>${obj.NO }</td>
				<c:choose>
					<c:when test="${obj.CATEGORY == '1' }">
						<td>콘솔기기</td>
					</c:when>
					<c:when test="${obj.CATEGORY == '2' }">
						<td>게임타이틀</td>
					</c:when>
					<c:when test="${obj.CATEGORY == '3' }">
						<td>주변기기</td>
					</c:when>
					<c:when test="${obj.CATEGORY == '0' }">
						<td>기타</td>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${auth_level >= 2 }">
						<td style="text-align: left"><a href="/sell/view/${obj.NO}">${fn:substring(obj.TITLE, 0, 12) }</a>
					</c:when>
					<c:otherwise>
						<td style="text-align: left">${fn:substring(obj.TITLE, 0, 12) }
					</c:otherwise>	
				</c:choose>
				<span class="badge">${obj.CNT }</span>
				<c:if test="${obj.STATE == '1' }">
					<span class="label label-info">[거래중]</span>
				</c:if> 
				<c:if test="${obj.STATE == '2' }">
					<span class="label label-info">[거래완료]</span>
				</c:if>
				</td>
				<td>
					<div class="dropdown">
						<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
							<span id="receiver" value="${obj.WRITER }">${obj.WRITER }</span>
						<span class="caret"></span></button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
							<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:openchat('${obj.WRITER }')">쪽지보내기</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1" href="#">1:1채팅초대</a></li>
						</ul>
					</div>
				</td>
				<td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.REGDATE }" /></td>
				<td>${obj.COUNT}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
function openchat(obj){
	var url="/chat/noteSend?id="+obj;
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
	})
	var url="/chatting/chatPage?id="+obj;
	window.open(url, "", "width=400, height=550");
}

//포인트체크 & 레벨 
$("#write").click(function() {
	$.ajax({
		"type" : "POST",
		"async" : false,
		"url" : "/sell/checkpoint",
		"data" : {
			"id" : $("#id").val()
		}
	}).done(function(obj){
		if(obj=="ok"){
			window.alert("공지사항에서 레벨과 포인트를 확인하세요.");
		}else{
			location.href = "/sell/sellForm";
		}
	})
});

</script>