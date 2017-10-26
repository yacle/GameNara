<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- ---------------------------------------------------- --%>
<style>
input, button {
	padding: 4px;
	font-family: 맑은고딕;
	font-size: 9pt;
}
textarea {
    width: 100%;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    resize: none;
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
		<a href="/become_member/list">게시판</a>
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
				<p style="padding-left: 10px;">
				<h2>가입인사 게시판</h2><br/>
					<small>작성자 : ${one.ID } | 작성일 : <fmt:formatDate
							pattern="yyyy.MM.dd HH:mm" value="${one.ADD_DATE }" /> 
							조회수 : <fmt:formatNumber value="${one.COUNT}" pattern="#,###" />
					</small>
				<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">${one.DETAIL }</pre>
			</div>
		</c:otherwise>
		</c:choose>
		</c:otherwise>
	</c:choose>
	<hr/>
	<%-- Reply input form --%>
<div class="row" >
	<div class="col-md-2" style="padding: 10px;" align="center"><span id="auth_id" style="font-size: 16px; font-weight: bold;">${auth_id }</span></div>
	<div class="col-md-9"><textarea rows="1" id="content"></textarea></div>
	<div class="col-md-1" style="padding: 10px;"><button type="button" id="replysendbtn">등록</button></div>
</div>
<hr/>
</div>
<div align="left">
	<a href="/become_member/list"><button>게시판으로</button></a>
</div>
