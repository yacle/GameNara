<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<ul class="nav navbar-nav">
					<li><a href="/master/board?board=sell&&id=${id}">SELL</a></li>
					<li><a href="/master/board?board=buy&&id=${id }">BUY</a></li>
					<li><a href="/master/board?board=free_dist&&id=${id }">FREE_Dist</a></li>
					<li><a href="/master/board?board=freeboard&&id=${id }">FREEBOARD</a></li>
					<li><a href="/master/board?board=after&&id=${id }">AFTER_DEAL</a></li>
					<li><a href="/master/board?board=reply&&id=${id }">REPLY</a></li>
				</ul>
			</div>
		</nav><br/><br/>
		  
		<div class="container">
		<br/>
		<h2>${title }</h2>
		<br/>
		<table class="table table-striped" width="80%">
			<tr>
				<th width="10%">번호</th>
				<th width="90%">제목</th>
			</tr>
			<c:forEach var="i" items="${data}">
			<tr>	
				<td>${i.NO }</td>
				<td><a href="${path}${i.NO}" onclick="javascript:window.close();">${i.TITLE }</a></td>
			</tr>
			</c:forEach>
		</table>
		</div>
	</body>
</html>
<script>
	$("#href", parent.document).action=""
		
	});
</script>