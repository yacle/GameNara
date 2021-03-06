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
	<h2>가입인사게시판</h2>
		<div align="left">
		
	</div>
	<hr/>
	<div style="width: 90%; border-radius: 10px; ; padding-left: 20px;" align="left">
		<input type="hidden" id="num" value="${one.NO }" />
		<h3>${one.TITLE }</h3>
		<div class="row">
	    	<div class="col-sm-10">
	    		<small>작성자 : ${one.ID } | 작성일 : 
	    			<fmt:formatDate pattern="MM.dd.yyyy HH:mm:ss" value="${one.ADD_DATE }" /> 
				</small>
			</div>
		    <div class="col-sm-2">
		    	<small>조회수 : <fmt:formatNumber value="${one.COUNT}" pattern="#,###" /></small>
		    </div>
		</div>							
			<textarea rows="5" id="comment" disabled>${one.DETAIL }</textarea>
		</div><br/>
	<div style="margin-right:100px" align="right">
		<c:if test="${one.WRITER eq auth_id}">
			<button type="button" class="btn btn-default" id="modify">수정</button>
			<button type="button" class="btn btn-default" id="update" style="display: none;">저장</button>
			<button type="button" class="btn btn-default" id="cancle" style="display: none;">취소</button>
			<button type="button" class="btn btn-default" id="delete">삭제</button>
		</c:if>
		<a href="#" onClick="history.back()" ><button type="button" class="btn btn-default" style="color:black">목록</button></a>
	</div>
	<hr/>
</div>
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
			"url" : "/become_member/add_rst",
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

	
//게시글 삭제
$("#delete").click(function(){
	if (window.confirm("삭제하시겠습니까?")) {
		$.ajax({
			"type" : "post",
			"async" : false,
			"url" : "/become_member/delete",
			"data" : {
				"no" : $("#num").val()
				}
		});
		location.href = "/become_member/list";
	}
})
</script>

<%-- Reply input form --%>
<div class="row" >
	<div class="col-md-2" style="padding: 10px;" align="center"><span id="auth_id" style="font-size: 16px; font-weight: bold;">${auth_id }</span></div>
	<div class="col-md-8"><textarea rows="1" id="content"></textarea></div>
	<div class="col-md-1">비밀번호:<input type="number" id="pwd" size="6" placeholder="4자리 숫자"  min="1" max="9999" required></div>
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
	if($("#content").val()!=null){
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
	}else{
		window.alert("댓글내용을 입력하세요");
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
			cfm.val("");
		}else{
			cfm.val("");
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








	
	
	
	
	
	
	
	
	
	
	
	


