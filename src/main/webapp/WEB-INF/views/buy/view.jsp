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
<c:choose>
<c:when test="${empty auth_id }">
<h2>로그인 필요</h2><br/>
<a href="/log/login"><button>로그인</button></a>
</c:when>
<c:otherwise>
	<h2>
		<a href="/buy/list">게시판</a>
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
					<small>작성자 : ${one.BUY_ID } | 작성일 : <fmt:formatDate
							pattern="yyyy.MM.dd HH:mm" value="${one.ADD_DATE }" /> 
						
					</small>
				</p>
				<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">${one.DETAIL }</pre>
			</div>
		</c:otherwise>
		</c:choose>
		</c:otherwise>
	</c:choose>
	<hr />
</div>
<div align="left">
	<a href="/buy/list"><button>게시판으로</button></a>
	
</div>
