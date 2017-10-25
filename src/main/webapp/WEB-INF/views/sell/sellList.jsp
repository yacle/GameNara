<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
						<td><a href="/sell/view/${obj.NO}">${fn:substring(obj.TITLE, 0, 12) }</a>
					</c:when>
					<c:otherwise>
						<td><a href="/notice">${fn:substring(obj.TITLE, 0, 12) }</a>
					</c:otherwise>	
				</c:choose>
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
							<li role="presentation"><a role="menuitem" tabindex="-1" href="#">INFO</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:openchat('${obj.WRITER }')">쪽지보내기</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1" href="#">1:1채팅초대</a></li>
							<li role="presentation" class="divider"></li>
							<li role="presentation"><a role="menuitem" tabindex="-1" href="#">About Us</a></li>
						</ul>
					</div>
				</td>
				<td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.REGDATE }" /></td>
				<td>${obj.COUNT}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<p align="right" style="margin-right: 30px;">
	<c:choose>
		<c:when test="${empty auth_id }">
			<a href="/log/login">
		</c:when>
		<c:when test="${auth_level >= 3 }">
			<a href="/sell/sellForm">
		</c:when>
		<c:otherwise>
			<a href="/notice">
		</c:otherwise>
	</c:choose>
		<button type="button" style="padding: 5px;">글작성</button></a>
	</p>
</div>

<script>

	function openchat(obj){
		var url="/chat/noteSend?id="+obj;
		window.open(url, "noteSend", "width=400, height=550");
	}

</script>