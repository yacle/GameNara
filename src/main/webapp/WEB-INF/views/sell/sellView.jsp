<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- ---------------------------------------------------- --%>
<style>
button{
	font-size: 12px;
	border-radius: 6px;
}

textarea {
    width: 100%;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    resize: none;
}
input[type=text]:disabled {
    background: #dddddd;
}
</style>
<form action="/sell/add" method="post" enctype="multipart/form-data">
<h2>NO.<span id="no">${map.NO }</span></h2>
	<div class="row">
		<div class="col-md-4">
		<c:choose>
			<c:when test="${empty map.PIC }">
			<img src="/profiles/default02.jpg" id="pf" alt="기본이미지" style="height: 300px; width: 300px;" />
			</c:when>
			<c:otherwise>
			<img src="/sellB_File/${map.PIC}" id="pf" alt="기본이미지" style="height: 300px; width: 300px;" />
			</c:otherwise>	
		</c:choose>
			<input id="pic" type="file" name="pic" style="display: none" />
			<span id="picName"></span><br />
		</div>
		<div class="col-md-8">
			<h4>제목 : </h4> <input type="text" id="title" class="form-control" name="title" value="${map.TITLE }" disabled>
			<h4>판매가격 :</h4> <input type="text" class="form-control" name="price" value="${map.PRICE }" disabled>
			<h4>연락처 :</h4> <input type="text" class="form-control" name="contact" value="${map.CONTACT }" disabled>
			<h4>거래방법 :</h4> <input type="text" class="form-control" name="deal_method" value="${map.DEAL_METHOD }" disabled>
			<h4>카테고리:</h4>
			<select class="form-control" name="category" value="${map.CATEGORY}" disabled>
				<option value="1">콘솔기기</option>
				<option value="2">게임타이틀</option>
				<option value="3">주변기기</option>
				<option value="0">기타</option>
			</select>
		</div>
	</div><hr/>
	
	<div class="row" align="center">
		<input type="hidden" name="writer" value="${auth_id}">
		<p><textarea class="form-control" rows="10" cols="170" placeholder="상세내용" name="detail" disabled>${map.DETAIL }</textarea></p>
		<c:if test="${auth_id eq map.WRITER }">
			<button type="button" class="btn btn-default" id="modify">수정</button>
			<button type="button" class="btn btn-default" id="delete">삭제</button>
			<button type="button" class="btn btn-default" id="update" style="display: none">저장</button>
			<button type="button" class="btn btn-default" id="cancle" style="display: none">취소</button>
		</c:if>
		<a href="/sell/list/1"><button type="button" class="btn btn-default">목록</button></a>
	</div>
</form>
<script>
$("#modify").click(function(){
	var a = document.getElementsByClassName("form-control");
	for(var i=0; i<a.length; i++){
		a[i].disabled=false;
	}
	$("#modify, #delete").hide();
	$("#update, #cancle").show();
})
$("#update").click(function(){
	$.ajax({
		"type" : "post",
		"async" : false,
		"url" : "/sell/update",
		"data" : {
			"no" : $("#no"),
			"title" : $("#title").val(),
			"price" : $("#price").val(),
			"contact" : $("#contact").val(),
			"deal_method" : $("#deal_method").val(),
			"detail" : $("#detail").val()
		}
	}).done(function(obj) {
		var a = document.getElementsByClassName("form-control");
		for(var i=0; i<a.length; i++){
			a[i].disabled=true;
		}
		$("#modify, #delete").show();
		$("#update, #cancle").hide();
	});
})
</script>

<%-- Reply input form --%>
<div class="row" >
	<div class="col-md-2" style="padding: 10px;" align="center"><span id="auth_id" style="font-size: 16px; font-weight: bold;">${auth_id }</span></div>
	<div class="col-md-9"><textarea rows="1" id="content"></textarea></div>
	<div class="col-md-1" style="padding: 10px;"><button type="button" id="replysendbtn">등록</button></div>
</div>
<hr/>
<!-- Reply List View -->

<script>
$("#mod").click(function(){
	
})
$("#replysendbtn").click(function(){
	var bno = $("#num").val();
	var replyer = $("#auth_id").html();
	var replytext = $("#content").val();
	$.ajax({
		type: 'post',
		url: '/reply',
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "POST"
		},
		dataType:'text',
		data: JSON.stringiFy({bno:bno, replyer:replyer, replytext:replytext}),
		success:function(result){
			alert(result);
		}
	})
})
<%--
	var modify = function(no){
		var n = document.getElementById(no);
		var c = n.firstChild.nextSibling.value;
		var com = document.getElementById(c);
		n.style.display="inline";
		com.style.display="none";
	}

	var del = function(obj) {
		if(window.confirm("삭제하시겠습니까?")){
			$.ajax({
				"type":"post",
				"async": false,
				"url":"/after/reply_delete",
				"data":{
					"num":obj
				}
			}).done(function(o){
				window.location.reload();
			});	
		}
	}
	--%>
</script>
	


