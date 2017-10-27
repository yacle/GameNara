<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<style>
body {
    background-image: url("/profiles/game_bg1.jpg");
    background-repeat: no-repeat;
}
</style>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 CSS - JQuery-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- angularjs -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	
	<title><tiles:getAsString name="title" />-${auth_id }</title> 
	</head>
<body>
<div class="container">
	<header >
		<tiles:insertAttribute name="header" />
	</header>
	<c:choose>
		<c:when test="${empty auth_id}">
			<nav class="navbar navbar-default">
				<tiles:insertAttribute name="nav" />
			</nav>
		</c:when>
		<c:otherwise>
			<nav class="navbar navbar-default">
				<tiles:insertAttribute name="nav_user" />
			</nav>
		</c:otherwise>
	</c:choose>
	<section style="min-height: 70%;">
		<tiles:insertAttribute name="section" />
	</section>
	<footer class="container-fluid text-center">
		<tiles:insertAttribute name="footer" />
	</footer>
	</div>
</body>
</html>
