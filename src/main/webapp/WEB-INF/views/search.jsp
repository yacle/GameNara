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
		<a href="/sell/list?category=0&&type=map"><h3>팝니다</h3></a><br/>
			<c:forEach var="obj" items="${total.sell }">
				<a href="/sell/view/${obj.NO}">${obj.TITLE }</a><hr/>
			</c:forEach>
	</div>	
	<div class="col-md-3">		
		<a href="/buy/list/1"><h3>삽니다</h3></a><br/>
		<c:forEach var="i" items="${total.buy }">
			<a href="/buy/view/${i.NO}">${i.TITLE }</a><hr/>
		</c:forEach>
	</div>	
	<div class="col-md-3">	
		<a href="/freeBoard/list"><h3>자유게시판</h3></a><br/>
		<c:forEach var="j" items="${total.free }">
			<a href="/freeBoard/view/${j.NO}">${j.TITLE }</a><hr/>
		</c:forEach>
	</div>	
	<div class="col-md-3">	
		<a href="/after/list"><h3>거래후기</h3></a><br/>
		<c:forEach var="k" items="${total.after }">
			<a href="/after/view/${k.NO}">${k.TITLE }</a><hr/>
		</c:forEach>
	</div>
</div>
