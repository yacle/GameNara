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
								<div class="row" align="center">
						<input type="hidden" id="id" value="${auth_id}">
						<p>
							<textarea class="update-group" rows="10" width="1000px"
								placeholder="상세내용" id="comment" disabled>${one.DETAIL }</textarea>
						</p>
						<div align="right">
						<c:if test="${auth_id eq one.ID }">
							<button type="button" class="btn btn-default" id="modify">수정</button>
							<button type="button" class="btn btn-default" id="delete">삭제</button>
							<button type="button" class="btn btn-default" id="update" style="display: none">저장</button>
							<button type="reset" class="btn btn-default" id="cancle" style="display: none">취소</button>
						</c:if>
						</div>
					</div>
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
<div align="right">
	<a href="/become_member/list"><button>게시판으로</button></a>
</div>
<script>
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
</script>
