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
	<h2>거래후기게시판</h2>
		<div align="left">
		
	</div>
	<hr/>
	<div style="width: 90%; border-radius: 10px; ; padding-left: 20px;" align="left">
		<input type="hidden" id="num" value="${one.NO }" />
		<h3>${one.TITLE }</h3>
		<div class="row">
	    	<div class="col-sm-10">
	    		<small>작성자 : ${one.WRITER } | 작성일 : <fmt:formatDate
					pattern="MM.dd.yyyy HH:mm:ss" value="${one.ADD_DATE }" /> 
				</small>
			</div>
		    <div class="col-sm-2">
		    	<small>조회수 : <fmt:formatNumber value="${one.COUNT}" pattern="#,###" /></small>
		    </div>
		</div>							
		<c:choose>
			<c:when test="${one.ATTACH ne null}">
				<textarea rows="5" id="comment" disabled>${one.COMMENTS }</textarea>
				<img id="pf" class="img-responsive" src="/afterB_File/${one.ATTACH}" />
			</c:when>
			<c:otherwise>
				<textarea rows="5" id="comment" disabled>${one.COMMENTS }</textarea>
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
			}).done(function(r){
				window.location.reload();
			})
		})
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
<c:forEach var="i" items="${list}">
<div align="center">
<table width="90%">
	<tbody>
		<tr>
			<td col-span="2"><b>${i.WRITER}</b><small style="color: gray;">  [${i.RE_DATE}]</small></td>
		</tr>
		<tr>
			<td width="90%"><span id="${i.CONTENT}" style="display: inline; font-size:16px;">${i.CONTENT}</span>
				<form id="${i.NO}" style="display: none;">
					<input class="form-control" type="text" id="txt" value="${i.CONTENT }">
					<button type="button" id="mod">수정</button>
					<button type="button" id="cc">취소</button>
				</form>
			</td>
			<td width="10%" align="center">
				<button type="button" class="${i.CONTENT}" onclick="javascript:modify(${i.NO})">수정</button>
				<button type="button" class="${i.CONTENT}" onclick="javascript:del(${i.NO})">삭제</button>
			</td>
		</tr>
	</tbody>
</table><hr/>
</div>
</c:forEach>	
<script>
$("#mod").click(function(){
	
})
$("#replysendbtn").click(function(){
	$.ajax({
		"type":"post",
		"async":false,
		"url":"/after/reply_save",
		"data":{
			"id" : $("#auth_id").html(),
			"content" : $("#content").val(),
			"parent" : $("#num").val()
		}
	}).done(function(r){
		window.location.reload();
	})
})

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
</script>
	


