<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<textarea row="5" id="comment" disabled>${one.DETAIL }</textarea>
					</div>
					<br/>
					<div align="left">
						<c:if test="${auth_id eq one.BUY_ID }">
							<div style="margin-right: 100px" align="right">				
									<button type="button" id="m">수정</button>
									<button type="button" id="s" style="display: none;">저장</button>
									<button type="button" id="c" style="display: none;">취소</button>
									<button type="button" id="d">삭제</button>
								<a href="/buy/list/1"><button>BACK</button></a>
							</div>
						</c:if>
						
					</div>
					
					<hr/>
<%-- Reply input form --%>
<div class="row" >
	<div class="col-md-2" style="padding: 10px;" align="center"><span id="auth_id" style="font-size: 16px; font-weight: bold;">${auth_id }</span></div>
	<div class="col-md-9"><textarea rows="1" id="content"></textarea></div>
	<div class="col-md-1" style="padding: 10px;"><button type="button" id="replysendbtn">등록</button></div>
</div>
<hr/>
<!-- Reply List View -->
<a href="/buy/list/1"><button>게시판으로</button></a>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	<script>
		$("#m").click(function() {
			document.getElementById("comment").disabled = false;
			$("#comment").css("background-color", "#f8f8f8");
			$("#m").css("display", "none");
			$("#d").css("display", "none");
			$("#c").css("display", "inline");
			$("#s").css("display", "inline");
			$("#s").click(function() {
				$.ajax({
					"type" : "post",
					"async" : false,
					"url" : "/buy/add_rst",
					"data" : {
						"detail" : $("#comment").val(),
						"no" : $("#num").val()
					}
				}).done(function(b) {
					document.getElementById("comment").disabled = true;
					$("#m").css("display", "inline");
					$("#s").css("display", "none");
				})
			})
			$("#c").click(function() {
				window.location.reload();
			})
		})

		$("#send").click(function() {
			$.ajax({
				"type" : "post",
				"async" : false,
				"url" : "/reply/add",
				"data" : {
					"parent" : $("#num").val(),
					"writer" : $("#writer").html(),
					"content" : $("#content").val()
				}
			}).done(function(obj) {
				document.getElementById("content").value = "";
			});
			window.location.reload();
		});

		$("#end").click(function() {
			$.ajax({
				"type" : "post",
				"async" : false,
				"url" : "/buy/end",
				"data" : {
					"end" : '2',
					"no" : '${one.NO}'
				}
			})
			location.reload();
		});

		var del = function(obj) {
			if (window.confirm("삭제하시겠습니까?")) {
				$.ajax({
					"type" : "post",
					"async" : false,
					"url" : "/buy/delete",
					"data" : {
						"num" : obj
					}
				});
				location.href = "/buy/list/1";
			}
		}
	</script>
</div>