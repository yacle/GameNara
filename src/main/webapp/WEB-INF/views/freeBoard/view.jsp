<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div align="center" style="line-height: 35px">
	<h2>자유게시판</h2>
	<div align="left">
		<a href="/freeBoard/list" ><button>게시판으로</button></a>
	</div>
	<c:choose>
		<c:when test="${empty data.one }">
			이미 삭제된 글입니다.
		</c:when>
		<c:otherwise>
			<div
				style="width: 80%; border-radius: 10px; ; padding-left: 20px;"
				align="left">
				<input type="hidden" id="num" value="${data.one.NO }" />
				<h3>${data.one.TITLE }</h3>
				<p style="padding-left: 10px;">
					<div class="row">
				    	<div class="col-sm-10">
				    		<small>작성자 : ${data.one.WRITER } | 작성일 : <fmt:formatDate
								pattern="MM.dd.yyyy" value="${data.one.FB_DATE }" /> 
							</small>
						</div>
					    <div class="col-sm-2">
					    	<small>조회수 : <fmt:formatNumber value="${data.one.VIEW_CNT}" pattern="#,###" /></small>
					    </div>
					</div>							
				</p>
				<c:choose>
					<c:when test="${data.one.ATTACH ne null}">
						<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">
							<img id="pf" src="/freeB_File/${data.one.ATTACH}" style="height:301px; width:300px;float: left;" />
							<br/>${data.one.COMENT }
						</pre>
					</c:when>
					<c:otherwise>
						<pre style="font-family: 맑은 고딕; font-size: 12pt; min-height: 250px; ">${data.one.COMENT }</pre>
					</c:otherwise>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
	<hr />
</div>
<div style="width: 60%">
	<div align="left">
		<input type="text" id="writer" placeholder="작성자" value="${auth_id }"/>
	</div>
	<div align="left" >
		<textarea style="width: 100%" rows="3" id="content"
			placeholder="남길내용"></textarea>
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
				"writer":$("#writer").val(),
				"content":$("#content").val()
			}
		}).done(function(obj){
			document.getElementById("content").value = "";
		});
		window.location.reload();
	});
	
</script>

<div id="reps" align="left" style="width: 70%; margin-top: 20px">
	<c:forEach var="i" items="${data.reply }">
		<table>
			<tr>
				<td><b>작성자 : ${i.WRITER }</b> | 작성날짜 : <fmt:formatDate
					pattern="yyyy-MM-dd" value="${i.RE_DATE }" />
					<c:if test="${auth_id  == i.WRITER}">
						<button type="button" id="update" >수정</button>
						<button type="button" id="delete" onclick="javascript:del(${i.NO })">삭제</button>
	    			</c:if>
					</td>
			</tr>
			<tr>
				<td style="padding-left: 20px;"><span id="upa">》 ${i.CONTENT }</span></td>
				<td style="padding-left: 20px;">
				<c:if test="${i.NO eq no }">
				》<input type="text" value="${i.CONTENT }" disabled/>
				</c:if>
					<c:if test="${auth_id  == i.WRITER}">
				        <button type="button" id="update" onclick="javascript:upr(${i.NO })">수정</button>
				        <button type="button" id="delete" onclick="javascript:del(${i.NO })">삭제</button>
    				</c:if>
				<br/>
    			</td>
			</tr>
		</table>
	</c:forEach>
</div>
	
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
</script>
<script>
	$("#update").click(function(){
		
	})
 
	
</script>