<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- ---------------------------------------------------- --%>
<style>
button{
	font-size: 12px;
	border-radius: 6px;
}
p{
	display: none;
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
	<h2>자유게시판</h2>
		<div align="left">
		
	</div>
	<hr/>
	<div style="width: 90%; border-radius: 10px; ; padding-left: 20px;" align="left">
		<input type="hidden" id="num" value="${one.NO }" />
		<h3>${one.TITLE }</h3>
		<div class="row">
	    	<div class="col-sm-10">
	    		<small>작성자 : ${one.WRITER } | 작성일 : 
	    			<fmt:formatDate pattern="MM.dd.yyyy HH:mm:ss" value="${one.FB_DATE }" /> 
				</small>
			</div>
		    <div class="col-sm-2">
		    	<small>조회수 : <fmt:formatNumber value="${one.VIEW_CNT}" pattern="#,###" /></small>
		    </div>
		</div>							
		<c:choose>
			<c:when test="${one.ATTACH ne null}">
				<div class="row">
					<div class="col-md-3">
						<img id="pf" class="img-responsive" src="/freeB_File/${one.ATTACH}" style="width: 300; height: 300;"/>
					</div>
					<div class="col-md-9">
						<textarea rows="5" id="comment" disabled>${one.COMENT }</textarea>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<textarea rows="5" id="comment" disabled>${one.COMENT }</textarea>
			</c:otherwise>
		</c:choose>
	</div><br/>
	<div style="margin-right:100px" align="right">
		<c:if test="${one.WRITER eq auth_id}">
			<button type="button" id="m">수정</button>
			<button type="button" id="s" style="display: none;">저장</button>
			<button type="button" id="c" style="display: none;">취소</button>
			<button type="button" id="d">삭제</button>
		</c:if>
		<a href="/after/list" ><button>BACK</button></a>
	</div>
	<hr/>
</div>
<script>
	//글 수정 버튼	
	$("#m").click(function(){
		document.getElementById("comment").disabled=false;
		$("#comment").css("background-color","#f8f8f8");
		$("#m").css("display","none");
		$("#d").css("display","none");
		$("#c").css("display","inline");
		$("#s").css("display","inline");
		$("#s").click(function(){
			$.ajax({
				"type":"post",
				"async":false,
				"url":"/after/modify",
				"data":{
					"comment" : $("#comment").val(),
					"no" : $("#num").val()
				}
			}).done(function(r) {
				document.getElementById("comment").disabled = true;
				$("#m").css("display", "inline");
				$("#s").css("display", "none");
			})
		})
		//글 수정 취소 버튼
		$("#c").click(function(){
			window.location.reload();
		})
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
//댓글 등록 버튼
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
	


