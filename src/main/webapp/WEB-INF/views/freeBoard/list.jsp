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
								<td><a href="/freeBoard/view/${obj.NO}">${fn:substring(obj.TITLE, 0, 12)}</a>
								<img id="pf" src="/profiles/board_def.JPG" style="height:10px; width:10px;"/>
								<span class="badge">${obj.C }</span>
							</c:if>
							<c:if test="${obj.ATTACH eq null }">
								<td><a href="/freeBoard/view/${obj.NO}">${fn:substring(obj.TITLE, 0, 12)}</a>
								<span class="badge">${obj.C }</span>
							</c:if>
						</c:when>
						<c:otherwise>
							<td>${fn:substring(obj.TITLE, 0, 12) }</td>
						</c:otherwise>
					</c:choose>
					<td>${obj.WRITER }</td>
					<td><fmt:formatDate value="${obj.FB_DATE }" pattern="yyyy-MM-dd"/></td>
					<td>${obj.VIEW_CNT }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p align="right" style="margin-right: 30px;">
		<c:choose>
			<c:when test="${auth_id ne null}">
				<a href="/freeBoard/add"><button type="button" style="padding: 5px;">글작성</button></a>
			</c:when>
			<c:otherwise>
				<button type="button" style="padding: 5px;">글작성</button></a>
			</c:otherwise>
		</c:choose>
	</p>
</div>