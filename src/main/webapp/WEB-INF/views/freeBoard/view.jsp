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
	<h2>자유게시판</h2>
	<div align="left">
		<a href="/freeBoard/list" ><button>게시판으로</button></a>
	</div>
	<c:choose>
		<c:when test="${empty data.one }">
			이미 삭제된 글입니다.
		</c:when>
		<c:otherwise>
			<div
				style="width: 80%; border-radius: 10px; ; padding-left: 20px;"
				align="left">
				<input type="hidden" id="num" value="${data.one.NO }" />
				<h3>${data.one.TITLE }</h3>
				<p style="padding-left: 10px;">
					<div class="row">
				    	<div class="col-sm-10">
				    		<small>작성자 : ${one.WRITER } | 작성일 : <fmt:formatDate
								pattern="MM.dd.yyyy" value="${one.FB_DATE }" /> 
							</small>
						</div>
					    <div class="col-sm-2">
					    	<small>조회수 : <fmt:formatNumber value="${one.VIEW_CNT}" pattern="#,###" /></small>
					    </div>
					</div>							
				</p>
				<c:choose>
					<c:when test="${one.ATTACH ne null}">
						<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">
							<img id="pf" src="/freeB_File/${one.ATTACH}" style="height:301px; width:300px;float: left;" />
							<br/>${one.COMENT }
						</pre>
					</c:when>
					<c:otherwise>
						<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">${one.COMENT }</pre>
					</c:otherwise>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
	<hr />
</div>
<div style="width: 60%">
	<div align="left">
		<input type="text" id="writer" placeholder="작성자" value="${auth_id }"/>
	</div>
	<div align="left" >
		<textarea style="width: 100%" rows="3" id="content"
			placeholder="남길내용"></textarea>
		<br />
		<button type="button" id="send" style="width: 100%;">댓글남기기</button>
	</div>
</div>
<script>
	$("#send").click(function() {
		$.ajax({
			"type":"post",
			"async": false,
			"url":"/reply/add",
			"data":{
				"parent":$("#num").val(),
				"writer":$("#writer").val(),
				"content":$("#content").val()
			}
		}).done(function(obj){
			var html="";
			for(idx in obj) {
				html += "* " +obj[idx].WRITER+"<br/>"+"   "+obj[idx].CONTENT +"<hr/>";
			}
			document.getElementById("reps").innerHTML = html;
		});
	});
</script>

<div id="reps" align="left" style="width: 70%; margin-top: 20px">
	<c:forEach var="i" items="${data.reply }">
	<table>
		<tr>
			<td>${i.WRITER }</td>
			<td>${i.CONTENT }</td>
			<td><fmt:formatDate
				pattern="MM.dd.yyyy" value="${i.RE_DATE }" /> </td>
		</tr>
	</table>
	
	</c:forEach>
</div>
	
