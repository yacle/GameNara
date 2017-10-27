<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
h2{
	text-align: center;
}
</style>
<h2><strong>콘솔게임관련 중고물품 거래게시판</strong></h2>
<hr/>
<div class="row" align="center" style="font-size: 18px">
	<div class="col-md-4">
		<h2>팝니다</h2>
		<c:forEach var="i" items="${data.sell }">
			<a href="/sell/view/${i.NO }">${fn:substring(i.TITLE, 0, 12)}</a><br/>
		</c:forEach>
	</div>
	<div class="col-md-4">
		<h2>삽니다</h2>
		<c:forEach var="j" items="${data.buy }">
			<a href="/buy/view/${i.NO }">${fn:substring(j.TITLE, 0, 12)}</a><br/>
		</c:forEach>
	</div>
	<div class="col-md-4">
		<h2>무료나눔</h2>
		<c:forEach var="k" items="${data.free }">
			<a href="/FreeDistribute/view/${i.NO }">${fn:substring(k.TITLE, 0, 12)}</a><br/>
		</c:forEach>
	</div>
</div>
<script>
$("#sell").click(function(){
	location.href="/notice";
})
</script>