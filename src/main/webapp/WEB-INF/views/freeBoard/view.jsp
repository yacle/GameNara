<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
 
<div align="center" style="line-height: 35px">
	<h2>자유게시판</h2>
	<div align="left">
		<a href="/freeBoard/list" ><button>게시판으로</button></a>
	</div>
	<c:choose>
		<c:when test="${empty one }">
			이미 삭제된 글입니다.
		</c:when>
		<c:otherwise>
			<div
				style="width: 80%; border-radius: 10px; ; padding-left: 20px;"
				align="left">
				<input type="hidden" id="num" value="${one.NO }" />
				<h3>${one.TITLE }</h3>
				<p style="padding-left: 10px;">
					<div class="row">
				    	<div class="col-sm-10">
				    		<small>작성자 : ${one.WRITER } | 작성일 : <fmt:formatDate
								pattern="MM.dd.yyyy" value="${one.FB_DATE }" /> 
							</small>
						</div>
					    <div class="col-sm-2">
					    	<small>조회수 : <fmt:formatNumber value="${one.VIEW_CNT}" pattern="#,###" /></small>
					    </div>
					</div>							
				</p>
				<c:choose>
					<c:when test="${one.ATTACH ne null}">
						<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">
							<img id="pf" src="/freeB_File/${one.ATTACH}" style="height:301px; width:300px;float: left;" />
							<br/>${one.COMENT }
						</pre>
					</c:when>
					<c:otherwise>
						<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">${one.COMENT }</pre>
					</c:otherwise>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
	<hr />
</div>
<%-- Reply input part --%>
<div align="center">
	<div style="width: 80%;" align="left">
		<p>작성자 : <span id="writer">${auth_id }</span></p>
		<textarea style="width: 100%" rows="3" id="content" placeholder="남길내용"></textarea>
		<br />
		<button type="button" id="send" style="width: 100%;">댓글남기기</button>
	</div>
</div>
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
<%--Reply List part --%>

<div align="center">
<div style="width: 80%;">
	<c:forEach var="i" items="${reply }">
		<input type="hidden" id="recon" value="${i.RE }" />
		<div class="row" align="left">
			<div class="col-md-2">작성자 : ${i.WRITER } | ${i.RE }</div>
			<div class="col-md-8">작성날짜 : <fmt:formatDate pattern="yyyy-MM-dd" value="${i.RE_DATE }" /></div>
			<div class="col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-md-10" align="left">
				<p id="${i.CONTENT}" style="display: block">${i.CONTENT } 
					<button type="button" onclick="javascript:update(${i.NO},${i.CONTENT})">수정</button>
					<button type="button" onclick="javascript:del(${i.NO})">삭제</button>
				</p>
				<p id="${i.NO}" style="display: none">
					<input type="text"  width="900px" id="modify" value="${i.CONTENT}" >
					<button type="button" id="mobtn">댓글수정</button>
				</p>
			</div>
			<div class="col-md-2">
				<c:if test="${auth_id  == i.WRITER}">
					
				</c:if>
			</div>
		</div>
		<hr/>
	</c:forEach>
</div>
</div>
<<<<<<< HEAD
<style>
.display{
	display: inline;
}
</style>
=======


<span id="re"></span>

>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
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
<<<<<<< HEAD
	var update = function(a, b){
		var m = document.getElementById(a);
		m.style.display="inline";
		b.style.display="none";
	}
		
		
	<%--	
		$("#update").val(obj)
=======
	
	
	
	$("#update").click(function(){
		$("#con01").load("view#con01").fadeIn("slow");
>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
		this.parentNode.previousSibling.previousSibling.firstChild.nextSibling.style.display="none";
		this.parentNode.previousSibling.previousSibling.firstChild.nextSibling.nextSibling.nextSibling.style.display="inline";
		this.parentNode.style.display="none";		--%>
	
	
</script>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/yacle/GameNara.git
