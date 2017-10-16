<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
	<h2>자유게시판</h2>
	<p align="right" style="margin-right: 30px;">
		총 <b>${cnt }</b> 개의 글이 등록되어있습니다.
	</p>
	<table style="width: 95%; background-color:#EAEAEA;" class="table table-bordered" >
		<thead>
			<tr>
				<th style="width: 10%">글번호</th>
				<th style="width: 45%">글제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="obj" items="${list }">
				<tr>
					<td>${obj.NO }</td>
					<c:choose>
						<c:when test="${auth_id ne null}">
							<td><a href="/after/view/${obj.NO}">${fn:substring(obj.TITLE, 0, 12)}</a>
						</c:when>
						<c:otherwise>
							<td>${fn:substring(obj.TITLE, 0, 12) }</td>
						</c:otherwise>
					</c:choose>
					
					<td>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">${obj.WRITER }
							<span class="caret"></span></button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">INFO</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">쪽지보내기</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">1:1채팅초대</a></li>
								<li role="presentation" class="divider"></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#">About Us</a></li>
							</ul>
						</div>
					</td>
					<td pattern="yyyy.MM.dd">${obj.FB_DATE }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p align="right" style="margin-right: 30px;">
		<c:choose>
			<c:when test="${auth_id ne null}">
				<a href="/after/add"><button type="button" style="padding: 5px;">글작성</button></a>
			</c:when>
			<c:otherwise>
				<button type="button" style="padding: 5px;">글작성</button></a>
			</c:otherwise>
		</c:choose>
	</p>
</div>