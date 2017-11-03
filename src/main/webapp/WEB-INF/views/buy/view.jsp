<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h2>BUY게시판</a></h2>
	<hr />
	<div style="width: 90%; border-radius: 10px; ; padding-left: 20px;" align="left">
		<input type="hidden" id="num" value="${one.NO }" />
		<div>
		<c:if test="${one.END == 1 }">
			<h2 id="title">${one.TITLE }</h2>
			<h3>거래중</h3>
		</c:if>
		<c:if test="${one.END == 2 }">
			<del><h2>${one.TITLE }</h2></del>
			<h3>거래완료</h3>
		</c:if>
			<c:if test="${auth_id eq one.BUY_ID }">
				<button id="end" style="background-color:white">계약완료</button>
			</c:if>
		</div>
			<div class="row">
		    	<div class="col-sm-10">
		    		<small>작성자 : ${one.BUY_ID } | 작성일 : 
		    			<fmt:formatDate pattern="MM.dd.yyyy HH:mm:ss" value="${one.ADD_DATE }" /> 
					</small>
				</div>
			    <div class="col-sm-2">
			    	<small>조회수 : <fmt:formatNumber value="${one.COUNT}" pattern="#,###" /></small>
			    </div>
			</div>	
			<textarea class="update-group" rows="5" placeholder="상세내용" id="comment" disabled>${one.DETAIL }</textarea>
	</div><br />
	<div class="row" align="center">
		<input type="hidden" id="id" value="${auth_id}">
		
		<div align="right" style="margin-right: 100px"> 
			<c:if test="${auth_id eq one.BUY_ID }">
				<button type="button" class="btn btn-default" id="modify">수정</button>
				<button type="button" class="btn btn-default" id="delete">삭제</button>
				<button type="button" class="btn btn-default" id="update" style="display: none">저장</button>
				<button type="reset" class="btn btn-default" id="cancle" style="display: none">취소</button>
			</c:if>
			<a href="/buy/list/1"><button type="button">목록</button></a>
		</div>
	</div>
</div>

<hr/>

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
<%-- Reply input form --%>
<div class="row" >
	<div class="col-md-2" style="padding: 10px;" align="center"><span id="auth_id" style="font-size: 16px; font-weight: bold;">${auth_id }</span></div>
	<div class="col-md-8"><textarea rows="1" id="content"></textarea></div>
	<div class="col-md-1">비밀번호:<input type="text" id="pwd" size="6" placeholder="4자리 숫자" required></div>
	<div class="col-md-1" style="padding: 10px;"><button type="button" id="replysendbtn">등록</button></div>
</div>
<hr/>
<!-- Reply List View -->
<span id="replies"></span>
<!-- Reply 수정  modal-->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"><span id="replyhead"></span>번 댓글 수정</h4>
			</div>
			<div class="modal-body">
				<textarea rows="2" cols="70" id="replytext"></textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="replyModBtn">Save</button>
				<button type="button" class="btn btn-default" id="replyDelBtn">Delete</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancle</button>
			</div>
		</div>
	</div>
</div>

<script>
var bno = $("#num").val();
// 댓글 목록 불러오기
var list = function(){
	$.getJSON("/replies/list/"+bno, function(data){
		var str="";
		$(data).each(
			function(){
				str += "<div class='row'>"
					+"<div class='col-md-2' align='center'>"+this.replyer+"</div>"
					+"<div class='col-md-9'>"
						+"<div class='row'>"+this.regdate+"</div>"
						+"<div class='row'>"+this.replytext+"</div>"
					+"</div>"
					+"<div class='col-md-1' id='m'>"
						+"<button type='button' class='replyLi'"
						+"date-rno='"+this.rno+"' pw='"+this.pwd+"' value='"+this.replytext+"'>수정</button><br/>"
						+"<input type='text'  id='replypwd' size='5' placeholder='비밀번호' style='display:none;'>"
					+"</div>"
				+"</div><hr/>"
			})
		$("#replies").html(str);
	})
}
list();
// 댓글 등록
$("#replysendbtn").click(function(){
	var replypw = $("#pwd").val();
	if(replypw != null){
		var replyer = $("#auth_id").html();
		var replytext = $("#content").val();
		$.ajax({
			"type": "post",
			"async":false,
			"url":"/replies/add",
			"headers": {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "POST"
			},
			"dataType":"text",
			"data":JSON.stringify({
				"bno":bno,
				"replyer":replyer,
				"replytext":replytext,
				"pwd":replypw
			})
		}).done(function(){
			$("#content").val("");
			$("#pwd").val("");
			list();
		})
	}else{
		window.alert("비밀번호를 입력하세요");
	}
})
// 댓글 수정버튼
$("#replies").on("click", "#m button", function(){
	var reply = $(this);
	var rno = reply.attr("date-rno");
	var pwd = reply.attr("pw");
	var replytext = reply.val();
	var cfm = $(this).next().next();
	cfm.show();
	cfm.change(function(){
		var inputpw = cfm.val();
		if(pwd== inputpw){
			$("#replytext").val(replytext);
			$("#replyhead").html(rno);
			$("#myModal").modal();
		}else{
			cfm.hide();
			window.alert("비밀번호를 확인하세요");
		}
	})
})

// modal form controll
$("#replyModBtn").click(function(){
	$.ajax({
		"type": "post",
		"async":false,
		"url":"/replies/update",
		"headers": {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "POST"
		},
		"dataType":"text",
		"data":JSON.stringify({
			"rno": $("#replyhead").html(),
			"replytext":$("#replytext").val()
		})
	}).done(function(){
		$("#myModal").modal("hide");
		list();
	})
})
$("#replyDelBtn").click(function(){
	var rno = $("#replyhead").html();
	$.get("/replies/delete/"+rno, function(){
		$("#myModal").modal("hide");
		list();
	})
})

</script>

