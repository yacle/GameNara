<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	<h2>자유게시판</h2>
	<p align="right" style="margin-right: 30px;">
		총 <b>${cnt }</b> 개의 글이 등록되어있습니다.
	</p>
	<input type="hidden" id="my" value="${auth_id }"/>
	<table style="width: 95%; background-color: #EAEAEA;" class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">글번호</th>
				<th style="width: 45%">글제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일자</th>
				<th style="width: 15%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="obj" items="${list }">
				<tr>
					<td>${obj.NO }</td>
					<c:choose>
						<c:when test="${auth_id ne null}">
							<c:if test="${obj.ATTACH ne null }">
								<td style="text-align: left; padding-left: 30px;"><a href="/freeBoard/view/${obj.NO}">${fn:substring(obj.TITLE, 0, 12)}</a>
								<img id="pf" src="/profiles/board_def.JPG" style="height:10px; width:10px;"/>
								<span class="badge">${obj.CNT }</span>
							</c:if>
							<c:if test="${obj.ATTACH eq null }">
								<td style="text-align: left; padding-left: 30px;"><a href="/freeBoard/view/${obj.NO}">${fn:substring(obj.TITLE, 0, 12)}</a>
								<span class="badge">${obj.CNT }</span>
							</c:if>
						</c:when>
						<c:otherwise>
							<td style="text-align: left; padding-left: 30px;">${fn:substring(obj.TITLE, 0, 12) }</td>
						</c:otherwise>
					</c:choose>
					<td>
					<c:choose>
						<c:when test="${auth_id ne null}">
					<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
								<span id="receiver" value="${obj.WRITER }">${obj.WRITER }</span>
							<span class="caret"></span></button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">INFO</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:openchat('${obj.WRITER }')">쪽지보내기</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:chatting('${obj.WRITER }')">1:1채팅초대</a></li>
								<li role="presentation" class="divider"></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">About Us</a></li>
							</ul>
					</div>
					</c:when>
					<c:otherwise>
						${obj.WRITER }
					</c:otherwise>
					</c:choose>
					</td>
					<td><fmt:formatDate value="${obj.FB_DATE }" pattern="yyyy-MM-dd"/></td>
					<td>${obj.VIEW_CNT }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p align="right" style="margin-right: 30px;">
			<c:if test="${auth_id ne null}">
				<a href="/freeBoard/add"><button type="button" style="padding: 5px;">글작성</button></a>
			</c:if>
	</p>
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
</script>