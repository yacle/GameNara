<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
th {
	border-bottom: 1px solid;
	text-align: left;
}

th, td {
	padding: 10px;
}
</style>
<div align="center" style="line-height: 35px">
	<h2>${title}</h2>
	<p align="right" style="margin-right: 30px;">
		총 <b>${cnt }</b> 개의 글이 등록되어있습니다.
	</p>
	<input type="hidden" id="my" value="${auth_id }"/>
	<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">글번호</th>
				<th style="width: 10%">구분</th>
				<th style="width: 43%">글제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일자</th>
				<th style="width: 10%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="obj" items="${list }">
				<tr>
					<td>${obj.no }</td>
					<c:choose>
						<c:when test="${obj.category == '1' }">
							<td>콘솔기기</td>
						</c:when>
						<c:when test="${obj.category == '2' }">
							<td>게임타이틀</td>
						</c:when>
						<c:when test="${obj.category == '3' }">
							<td>주변기기</td>
						</c:when>
						<c:when test="${obj.category == '0' }">
							<td>기타</td>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${auth_level >= 2 }">
							<td>
								<a href="/buy/view/${obj.no}">${fn:substring(obj.title, 0, 12) }</a><span class="badge">${obj.c }</span> 
								<c:if test="${obj.end == 1 }">
									<span class="label label-info">[거래중]</span>
								</c:if> <c:if test="${obj.end == 2 }">
									<span class="label label-info">[거래완료]</span>
								</c:if>
							</td>
					<td>
						<div class="dropdown">
							<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
								<span id="receiver" value="${obj.buy_id }">${obj.buy_id }</span>
							<span class="caret"></span></button>
							<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:openchat('${obj.buy_id }')">쪽지보내기</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:chatting('${obj.buy_id }')">1:1채팅초대</a></li>
							</ul>
						</div>
					</td>
							<td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.add_date }" /></td>
									<td>${obj.count }</td>
						</c:when>
						<c:otherwise>
							<td><a href="/notice">${obj.title }<c:if test="${obj.end == 1 }">
									<span class="label label-info">[거래중]</span>
								</c:if> <c:if test="${obj.end == 2 }">
									<span class="label label-info">[거래완료]</span>
								</c:if></td>
							</td>
							<td>${obj.buy_id }</td>

							<td><fmt:formatDate pattern="yyyy.MM.dd"
									value="${obj.add_date }" /></td>
							<td>${obj.count }</td>	
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			<p align="right" style="margin-right: 30px;">
			<button type="button" style="padding: 5px;" id="check">글작성</button></a>
			</p>
</div>

<script>
//쪽지보내기
	function openchat(obj){
		var url="/chat/noteSend?id="+obj;
		window.open(url, "noteSend", "width=400, height=550");
	}
	

</script>

<script>

//포인트체크
$("#check").click(function() {
	$.ajax({
		"type" : "POST",
		"async" : false,
		"url" : "/buy/checkpoint",
		"data" : {
			"id" : '${auth_id}'
		}
	}).done(function(obj){
		if(obj=="ok"){
			window.alert("포인트및 레벨이 맞지않습니다!");
			location.href="/notice"
		}else{
			location.href = "/buy/add";
		}
	})
});
//1:1채팅
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