<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h2>거래후기게시판</h2>
	<hr/>
	<div style="width: 80%; border-radius: 10px; ; padding-left: 20px;" align="left">
		<input type="hidden" id="num" value="${one.NO }" />
		<h3>${one.TITLE }</h3>
		<p style="padding-left: 10px;">
			<div class="row">
		    	<div class="col-sm-10">
		    		<small>작성자 : ${one.WRITER } | 작성일 : <fmt:formatDate
						pattern="MM.dd.yyyy HH:mm:ss" value="${one.ADD_DATE }" /> 
					</small>
				</div>
			    <div class="col-sm-2">
			    	<small>조회수 : <fmt:formatNumber value="${one.COUNT}" pattern="#,###" /></small>
			    </div>
			</div>							
		</p>
		<c:choose>
			<c:when test="${one.ATTACH ne null}">
			<div class="row">
				<div class="col-md-4">
					<img id="pf" src="/afterB_File/${one.ATTACH}" style="height:301px; width:300px;" />
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-7">
					${one.COMMENTS }
				</div>
			</div>	
			</c:when>
			<c:otherwise>
				<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">${one.COMMENTS }</pre>
			</c:otherwise>
		</c:choose>
	</div>
	<hr/>
</div>
<div align="left">
	<a href="/after/list"><button>게시판으로</button></a>
	
</div>
