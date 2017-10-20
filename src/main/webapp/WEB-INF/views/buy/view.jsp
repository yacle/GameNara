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
				<a href="/buy/list/1">게시판</a>
			</h2>
			<hr />
			<c:choose>
				<c:when test="${empty one }">
			이미 삭제된 글입니다.
		</c:when>
				<c:otherwise>
					<div style="width: 80%; border-radius: 10px;; padding-left: 20px;"
						align="left">
						<input type="hidden" id="num" value="${one.NO }" />
						<c:if test="${one.END == 1 }">
							<h2 id="title">${one.TITLE }</h2>
							<h5>거래중</h5>
						</c:if>
						<c:if test="${one.END == 2 }">
							<del>
								<h2>${one.TITLE }</h2>
							</del>
							<h4>거래완료</h4>
						</c:if>
						<p style="padding-left: 10px;">
							<small id="buyid">작성자 : ${one.BUY_ID } | 작성일 : <fmt:formatDate
									pattern="yyyy.MM.dd HH:mm" value="${one.ADD_DATE }" /> 조회수 : <fmt:formatNumber
									value="${one.COUNT}" pattern="#,###" /> <c:if
									test="${auth_id eq one.BUY_ID }">
									<button id="end">계약완료</button>
								</c:if>
							</small>
						</p>
						<pre id="con1"
							style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px;">${one.DETAIL }</pre>
					</div>
					<div align="center">
						<div style="width: 80%;" align="left">
							<p>
								작성자 : <span id="writer">${auth_id }</span>
							</p>
							<textarea style="width: 100%" rows="3" id="content"
								placeholder="남길내용"></textarea>
							<br />
							<button type="button" id="send" style="width: 100%;">댓글남기기</button>
						</div>
					</div>
					<hr />
					<div align="left">
						<a href="/buy/add_rst?no=${one.NO }"><button>수정</button></a>
						<button type="button" id="delete"
							onclick="javascript:del(${one.NO })">삭제</button>
						<a href="/buy/list/1"><button>게시판으로</button></a>
					</div>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	<script>	
	$("#send").click(function() {
		$.ajax({
			"type":"post",
			"async": false,
			"url":"/reply/add",
			"data":{
				"parent":$("#num").val(),
				"writer":$("#writer").html(),
				"content":$("#content").val()
			}
		}).done(function(obj){
			document.getElementById("content").value = "";
		});
		window.location.reload();
	});
	
</script>
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
</script>
	<script>
var del = function(obj) {
	if(window.confirm("삭제하시겠습니까?")){
		$.ajax({
			"type":"post",
			"async": false,
			"url":"/buy/delete",
			"data":{
				"num":obj
			}
		});
		location.href="/buy/list/1";

	
	}
}
</script>
</div>