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
}
</style>
<div align="center" style="line-height: 35px">
	<h2>${title}게시판</h2>
	<p align="right" style="margin-right: 30px;">
		총 <b>${cnt }</b> 개의 글이 등록되어있습니다.
	</p>
	<input type="hidden" id="my" value="${auth_id }"/>
	<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">글번호</th>
				<th style="width: 10%">구분</th>
				<th style="width: 43%">글제목</th>
				<th style="width: 15%">작성자</th>
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
							<td><a href="/buy/view/${obj.NO}">${fn:substring(obj.TITLE, 0, 12) }</a>
								<span class="badge">${obj.C }</span> <c:if
									test="${obj.END == 1 }">
									<span class="label label-info">[거래중]</span>
								</c:if> <c:if test="${obj.END == 2 }">
									<span class="label label-info">[거래완료]</span>
								</c:if></td>
															<td>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
								<span id="receiver" value="${obj.BUY_ID }">${obj.BUY_ID }</span>
							<span class="caret"></span></button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">INFO</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:openchat('${obj.BUY_ID }')">쪽지보내기</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:chatting('${obj.BUY_ID }')">1:1채팅초대</a></li>
								<li role="presentation" class="divider"></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">About Us</a></li>
							</ul>
						</div>
					</td>
							<td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.ADD_DATE }" /></td>
									<td>${obj.COUNT }</td>
						</c:when>
						<c:otherwise>
							<td><a href="/notice">${obj.TITLE }<c:if test="${obj.END == 1 }">
									<span class="label label-info">[거래중]</span>
								</c:if> <c:if test="${obj.END == 2 }">
									<span class="label label-info">[거래완료]</span>
								</c:if></td>
							</td>
							<td>${obj.BUY_ID }</td>

							<td><fmt:formatDate pattern="yyyy.MM.dd"
									value="${obj.ADD_DATE }" /></td>
							<td>${obj.COUNT }</td>
									
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:choose>
		<c:when test="${empty auth_id }">
			<p align="right" style="margin-right: 30px;">
				<a href="/log/login"><button type="button" style="padding: 5px;">글작성</button></a>
			</p>
		</c:when>
		<c:when test="${auth_level >= 3 }">
			<p align="right" style="margin-right: 30px;">
				<a href="/buy/add"><button type="button" style="padding: 5px;">글작성</button></a>
			</p>
		</c:when>
		<c:otherwise>
			<p align="right" style="margin-right: 30px;">
				<a href="/notice"><button type="button" style="padding: 5px;">글작성</button></a>
			</p>
		</c:otherwise>
	</c:choose>
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