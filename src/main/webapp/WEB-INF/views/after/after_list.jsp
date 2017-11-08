<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
th {
	border-bottom: 1px solid;
}
.view{
	color: black;
}
th, td {
	padding: 10px;
	text-align:center;
	vertical-align: middle;
}
</style>
<div class="view" align="center" style="line-height: 35px">
	<h2>거래후기게시판</h2>
	<p align="right" style="margin-right: 30px;">
		총 <b>${cnt }</b> 개의 글이 등록되어있습니다.
	</p>
	<input type="hidden" id="my" value="${auth_id }"/>
	<table style="width: 95%; background-color: #EAEAEA;" class="table table-bordered">
		<thead>
			<tr>
				<th width="10%">글번호</th>
				<th width="50%" >글제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일자</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="obj" items="${list }">
				<tr>
					<td>${obj.NO }</td>
					<c:choose>
						<c:when test="${auth_id ne null}">
							<c:if test="${obj.ATTACH ne null }">
								<td style="text-align: left; padding-left: 30px;">
								<c:if test="${auth_level >1 }">
									<a href="/after/view/${obj.NO}">
								</c:if>
									${fn:substring(obj.TITLE, 0, 12)}
								<c:if test="${auth_level >1 }">
									</a>
								</c:if>
								<img id="pf" src="/profiles/board_def.JPG" style="height:10px; width:10px;"/>
								<span class="badge">${obj.CNT }</span>
							</c:if>
							<c:if test="${obj.ATTACH eq null }">
								<td style="text-align: left; padding-left: 30px;">
								<c:if test="${auth_level >1 }">
									<a href="/after/view/${obj.NO}">
								</c:if>
									${fn:substring(obj.TITLE, 0, 12)}
								<c:if test="${auth_level >1 }">
									</a>
								</c:if>
								<span class="badge">${obj.CNT }</span>
							</c:if>
						</c:when>
						<c:otherwise>
							<td style="text-align: left; padding-left: 30px;">${fn:substring(obj.TITLE, 0, 12) }
							<span class="badge">${obj.CNT }</span></td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${auth_id eq null }">
							<td>${obj.WRITER }</td>
						</c:when>
						<c:otherwise>
						<td>
							<div class="dropdown">
								<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
									<span id="receiver" value="${obj.WRITER }">${obj.WRITER }</span>
								<span class="caret"></span></button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:openchat('${obj.WRITER }')">쪽지보내기</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:chatting('${obj.WRITER }')">1:1채팅초대</a></li>
								</ul>
							</div>
						</td>
						</c:otherwise>
					</c:choose>
					<td><fmt:formatDate value="${obj.ADD_DATE }" pattern="yyyy-MM-dd"/></td>
					<td>${obj.COUNT }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p align="right" style="margin-right: 30px;">
		<c:choose>
			<c:when test="${auth_level > 2}">
				<a href="/after/add/0"><button type="button" style="padding: 5px;">글작성</button></a>
			</c:when>
			<c:otherwise>
				<button type="button" style="padding: 5px;" onclick="javascript:notice()">글작성</button>
			</c:otherwise>
		</c:choose>
	</p>
</div>

<script>
	function notice(){
		window.alert("레벨 3부터 작성 가능합니다.");
	}
	function openchat(obj){
		var url="/chat/noteSend?id="+obj;
		window.open(url, "noteSend", "width=400, height=550");
	}

	function chatting(obj){
		$.ajax({
			"type":"post",
			"async":true,
			"url":"/chatting/confirm",
			"data":{
				"chat":"chatting",
				"receiver":obj,
				"sender" : $("#my").val()
			}
		}).done(function (r){
			if(r == "yes"){	
				var url="/chatting/chatPage?id="+obj;
				window.open(url, "", "width=400, height=550");
			}else{
				window.alert("현재 접속하지 않은 사용자입니다.")
			}
		})
		
	}
</script>

