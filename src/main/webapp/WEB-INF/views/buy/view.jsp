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
		<c:when test="${empty data.one }">
			이미 삭제된 글입니다.
		</c:when>
		<c:otherwise>
			<div
				style="width: 80%; border-radius: 10px; ; padding-left: 20px;"
				align="left">
				<input type="hidden" id="num" value="${data.one.NO }" />
				<c:if test="${data.one.END == 1 }"><h2>${data.one.TITLE }</h2><h5>거래중</h5>
				</c:if>
				<c:if test="${data.one.END == 2 }"><del><h2>${data.one.TITLE }</h2></del><h4>거래완료</h4>
				</c:if>
				<p style="padding-left: 10px;">
					<small>작성자 : ${data.one.BUY_ID } | 작성일 : <fmt:formatDate
							pattern="yyyy.MM.dd HH:mm" value="${data.one.ADD_DATE }" /> 
							조회수 : <fmt:formatNumber value="${data.one.COUNT}" pattern="#,###" />
							<c:if test="${auth_id eq data.one.BUY_ID }">
							<button id="end">계약완료</button>
				</c:if>
					</small>
				</p>
				<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">${data.one.DETAIL }</pre>
			</div>
		</c:otherwise>
		</c:choose>
		</c:otherwise>
	</c:choose>
	<hr />
</div>
<div align="left">
	<button><a href="/buy/list">게시판으로</button></a>
</div>
<script>
$("#end").click(function(){
	   $.ajax({
	      "type":"post",
	      "async":false,
	      "url":"/buy/end",
	      "data":{
	      "end":'2',
	      "no":'${one.NO}'
	      }
	   })
	   location.reload();
	}); 
	
</script>