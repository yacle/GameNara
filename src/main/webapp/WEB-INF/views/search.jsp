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
<h2>검색 내용</h2>
<div>
<h3>팝니다 게시판</h3>
		<c:forEach var="obj" items="${total.sell }">
		<a href="/sell/view/${obj.NO}">${obj.TITLE }</a><br/>
		</c:forEach>
</div>
<div>
<h3>삽니다 게시판</h3>
<c:forEach var="obj" items="${total.buy }">
		<a href="/buy/view/${obj.NO}">${obj.TITLE }</a><br/>
</c:forEach>
</div>
<div>
<h3>자유게시판 게시판</h3>
<c:forEach var="obj" items="${total.free }">
		<a href="/freeBoard/view/${obj.NO}">${obj.TITLE }</a><br/>
</c:forEach>
</div>
<div>
<h3>거래후기 게시판</h3>
<c:forEach var="obj" items="${total.after }">
		<a href="/after/view/${obj.NO}">${obj.TITLE }</a><br/>
</c:forEach>
</div>