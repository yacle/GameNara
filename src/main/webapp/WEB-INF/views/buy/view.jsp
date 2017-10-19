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
			<h2>로그인 필요</h2>
			<br />
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
					<div style="width: 80%; border-radius: 10px;; padding-left: 20px;"align="left">
						<input type="hidden" id="num" value="${data.one.NO }" />
						<c:if test="${data.one.END == 1 }">
							<h2 id="title">${data.one.TITLE }</h2>
							<h5>거래중</h5>
						</c:if>
						<c:if test="${data.one.END == 2 }">
							<del>
								<h2>${data.one.TITLE }</h2>
							</del>
							<h4>거래완료</h4>
						</c:if>
						<p style="padding-left: 10px;">
							<small id="buyid">작성자 : ${data.one.BUY_ID } | 작성일 : <fmt:formatDate
									pattern="yyyy.MM.dd HH:mm" value="${data.one.ADD_DATE }" />
								조회수 : <fmt:formatNumber value="${data.one.COUNT}"
									pattern="#,###" /> <c:if test="${auth_id eq data.one.BUY_ID }">
									<button id="end">계약완료</button>
								</c:if>
							</small>
						</p>
						<pre id="con1" style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px;">${data.one.DETAIL }</pre>
						
					</div>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
<div style="width: 60%">
	<div align="left">
		<input type="text" id="writer" placeholder="작성자" value="${auth_id }" />
	</div>
	<div align="left">
		<textarea style="width: 100%" rows="3" id="content" placeholder="남길내용"></textarea>
		<br />
		<button type="button" id="send" style="width: 100%;">댓글남기기</button>
	</div>
</div>
<div id="reps" align="left" style="width: 70%; margin-top: 20px">
	<c:forEach var="i" items="${data.reply }">
		<table class="reply">
			<tr>
				<td><b>작성자 : ${i.WRITER }</b> | 작성날짜 : <fmt:formatDate
						pattern="yyyy-MM-dd" value="${i.RE_DATE }" />
			</tr>
			<tr>
				<td style="padding-left: 20px;">》 ${i.CONTENT } <c:if
						test="${auth_id  == i.WRITER}">
						<button type="button" id="update" value="">수정</button>
						<button type="button" id="delete"
							onclick="javascript:del(${i.NO })">삭제</button>
					</c:if></td>
				<br />
			</tr>
		</table>
	</c:forEach>
</div>
<script>
$("#end").click(function(){
	   $.ajax({
	      "type":"post",
	      "async":false,
	      "url":"/buy/end",
	      "data":{
	      "end":'2',
	      "no":'${data.one.NO}'
	      }
	   })
	   location.reload();
	}); 
	
</script>

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
			document.getElementById("content").value = "";
		});
		  location.reload();
	});
	
</script>


<script>
	var del = function(obj) {
		if(window.confirm("삭제하시겠습니까?")){
			$.ajax({
				"type":"post",
				"async": false,
				"url":"/reply/delete",
				"data":{
					"num":obj
				}
			});	
			window.location.reload();
		}
	}
	$("#adjust").click(function(){ 
		$.ajax({
			"type":"post",
			"async": false,
			"url":"/buy/adjust",
			"data":{
				"no":$("#num").val(),
				"title" : $("#title").val(),
				"detail" :$("#con1").val()
			}
		})
	})
</script>
	<hr />
<div align="left">
	<button>
		<a href="/buy/list">게시판으로 </a>
	</button>
	<button id="adjust">
		<a href="/buy/add_rst">수정</a>
		</button>
</div>
</div>