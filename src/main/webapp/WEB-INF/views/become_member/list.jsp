<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<h2>가입인사 게시판</h2>
	<p align="right" style="margin-right: 30px;">
		총 <b>${cnt }</b> 개의 글이 등록되어있습니다.
	</p>
	<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">글번호</th>
				<th style="width: 43%">글제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일자</th>
				<th style="width: 10%">조회수</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach var="obj" items="${list }">
				<tr>
					<td>${obj.NO }</td>
					<td><a href="/buy/view/${obj.NO}">${fn:substring(obj.TITLE, 0, 12) }</a>
					<td>${obj.ID }</td>
					<td><fmt:formatDate pattern="yyyy.MM.dd"value="${obj.ADD_DATE }" /></td>
					<td>${obj.COUNT }</td>
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
		<c:otherwise>
			<p align="right" style="margin-right: 30px;">
				<a href="/buy/add"><button type="button" style="padding: 5px;">글작성</button></a>
			</p>
		</c:otherwise>
	</c:choose>
</div>