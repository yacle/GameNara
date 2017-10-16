<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- ---------------------------------------------------- --%>
<style>
input, textarea, button {
	padding: 4px;
	font-family: 맑은고딕;
	font-size: 9pt;
}
</style>
<div align="center" style="line-height: 35px">
	<h2>
		<a href="/freeBoard/list">게시판</a>
	</h2>
	<hr />
	<c:choose>
		<c:when test="${empty one }">
			이미 삭제된 글입니다.
		</c:when>
		<c:otherwise>
			<div
				style="width: 80%; border-radius: 10px; ; padding-left: 20px;"
				align="left">
				<input type="hidden" id="num" value="${one.NO }" />
				<h3>${one.TITLE }</h3>
				<p style="padding-left: 10px;">
					<small>작성자 : ${one.WRITER } | 작성일 : <fmt:formatDate
							pattern="MM.dd.yyyy HH:mm:ss" value="${one.FB_DATE }" /> 
						
					</small>
				</p>
				<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">${one.COMENT }</pre>
			</div>
		</c:otherwise>
	</c:choose>
	<hr />
</div>
<div align="left">
	<a href="/freeBoard/list"><button>게시판으로</button></a>
	
</div>
