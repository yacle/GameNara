<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<h1 align="center">검색 내용</h1>
<h3 align="center">최근 7개 항목만 검색 됩니다</h3><hr/>
<div class="row">
	<div class="col-md-3" >
		<h3>팝니다 게시판</h3><br/>
		<c:choose>
			<c:when test="${auth_level >= 2 }">
				<c:forEach var="obj" items="${total.sell }">
					<a href="/sell/view/${obj.NO}">${obj.TITLE }</a><hr/>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<c:forEach var="obj" items="${total.sell }">
					<a href="/notice">${obj.TITLE }</a><hr/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>	
	<div class="col-md-3">		
		<h3>삽니다 게시판</h3><br/>
		<c:choose>
			<c:when test="${auth_level >= 2 }">
				<c:forEach var="obj" items="${total.buy }">
					<a href="/buy/view/${obj.NO}">${obj.TITLE }</a><hr/>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<c:forEach var="obj" items="${total.buy }">
					<a href="/notice">${obj.TITLE }</a><hr/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>	
	<div class="col-md-3">	
		<h3>자유게시판</h3><br/>
		<c:choose>
			<c:when test="${auth_level >= 2 }">
				<c:forEach var="obj" items="${total.free }">
					<a href="/freeBoard/view/${obj.NO}">${obj.TITLE }</a><hr/>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<c:forEach var="obj" items="${total.free }">
					<a href="/notice">${obj.TITLE }</a><hr/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>	
	<div class="col-md-3">	
		<h3>거래후기 게시판</h3><br/>
	<c:choose>
			<c:when test="${auth_level >= 2 }">
				<c:forEach var="obj" items="${total.after }">
					<a href="/after/view/${obj.NO}">${obj.TITLE }</a><hr/>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<c:forEach var="obj" items="${total.after }">
					<a href="/notice">${obj.TITLE }</a><hr/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
