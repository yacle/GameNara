<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
button {
	font-size: 12px;
	border-radius: 6px;
}

textarea {
	width: 100%;
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
}

input[type=text]:disabled {
	background: #F8F8FF;
	padding: 7px;
	border-style: none;
}

input {
	padding: 7px;
}

td {
	font-size: 16px;
	height: 55px;
	align: center;
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
							<h3>거래중</h3>
						</c:if>
						<c:if test="${one.END == 2 }">
							<del>
								<h2>${one.TITLE }</h2>
							</del>
							<h3>거래완료</h3>
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
					</div>
					<br />
					<div class="row" align="center">
						<input type="hidden" id="id" value="${auth_id}">
						<p>
							<textarea class="update-group" rows="10" width="1000px"
								placeholder="상세내용" id="comment" disabled>${one.DETAIL }</textarea>
						</p>
						<div align="right"> 
						<c:if test="${auth_id eq one.BUY_ID }">
							<button type="button" class="btn btn-default" id="modify">수정</button>
							<button type="button" class="btn btn-default" id="delete">삭제</button>
							<button type="button" class="btn btn-default" id="update" style="display: none">저장</button>
							<button type="reset" class="btn btn-default" id="cancle" style="display: none">취소</button>
						</c:if>
						</div>
					</div>
					<hr />
					
					<%-- Reply input form --%>
					<div class="row">
						<div class="col-md-2" style="padding: 10px;" align="center">
							<span id="auth_id" style="font-size: 16px; font-weight: bold;">${auth_id }</span>
						</div>
						<div class="col-md-9">
							<textarea rows="1" id="content"></textarea>
						</div>
						<div class="col-md-1" style="padding: 10px;">
							<button type="button" id="replysendbtn">등록</button>
						</div>
					</div>
					<hr />
					<!-- Reply List View -->
					
					<a href="/buy/list/1"><button>게시판으로</button></a>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	<script>
	//게시글 수정
		$("#modify").click(function() {
			document.getElementById("comment").disabled = false;
			$("#comment").css("background-color", "#f8f8f8");
			$("#modify").css("display", "none");
			$("#delete").css("display", "none");
			$("#cancle").css("display", "inline");
			$("#update").css("display", "inline");
			$("#update").click(function() {
				$.ajax({
					"type" : "post",
					"async" : false,
					"url" : "/buy/add_rst",
					"data" : {
						"detail" : $("#comment").val(),
						"no" : $("#num").val()
					}
				}).done(function(b) {
					window.alert("수정되었습니다");
					document.getElementById("comment").disabled = true;
					$("#modify").css("display", "inline");
					$("#update").css("display", "none");
				})
			})
			$("#cancle").click(function() {
				window.location.reload();
			})
		})

	//거래완료 버튼
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
	
//게시글 삭제
		$("#delete").click(function(){
			if (window.confirm("삭제하시겠습니까?")) {
				$.ajax({
					"type" : "post",
					"async" : false,
					"url" : "/buy/delete",
					"data" : {
						"no" : $("#num").val()
						}
				});
				location.href = "/buy/list/1";
			}
		})
	</script>
</div>