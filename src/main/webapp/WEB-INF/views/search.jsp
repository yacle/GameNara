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
<h2 align="center">검색 내용</h2><hr/>
<div class="row">
	<div class="col-md-3">
		<h3>팝니다 게시판</h3>
			<c:forEach var="obj" items="${total.sell }">
				<a href="/sell/view/${obj.NO}">${obj.TITLE }</a><br/>
			</c:forEach>	
	</div>	
	<div class="col-md-3">		
		<h3>삽니다 게시판</h3>
		<c:forEach var="i" items="${total.buy }">
			<a href="/buy/view/${i.NO}">${i.TITLE }</a><br/>
		</c:forEach>
	</div>	
	<div class="col-md-3">	
		<h3>자유게시판 게시판</h3>
		<c:forEach var="j" items="${total.free }">
			<a href="/freeBoard/view/${j.NO}">${j.TITLE }</a><br/>
		</c:forEach>
	</div>	
	<div class="col-md-3">	
		<h3>거래후기 게시판</h3>
		<c:forEach var="k" items="${total.after }">
			<a href="/after/view/${k.NO}">${k.TITLE }</a><br/>
		</c:forEach>
	</div>
</div>
