<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
h2{
	text-align: center;
}
</style>
<div class="row" align="center">
	<div class="col-md-4">
		<h2>SELL</h2>
		<c:forEach var="i" items="${data.sell }">
			<a href="/sell/view?no=${i.NO }">${fn:substring(i.TITLE, 0, 12)}</a><br/>
		</c:forEach>
	</div>
	<div class="col-md-4">
		<h2>BUY</h2>
		<c:forEach var="j" items="${data.buy }">
			<a href="/buy/view?no=${i.NO }">${fn:substring(j.TITLE, 0, 12)}<br/>
		</c:forEach>
	</div>
	<div class="col-md-4">
		<h2>FREE DISTRIBUTE</h2>
		<c:forEach var="k" items="${data.free }">
			<a href="/FreeDistribute/view?no=${i.NO }">${fn:substring(k.TITLE, 0, 12)}<br/>
		</c:forEach>
	</div>
</div>
