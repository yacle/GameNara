<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="navbar navbar-inverse">
		<a class="navbar-brand" href="/index">GAMENARA</a>
		<ul class="nav navbar-nav">
			<li class="active"><a href="/index">HOME</a></li>
			<li><a href="/notice">공지사항</a></li>
			<li><a href="/notice_info">개인정보처리방침</a></li>
			<c:if test="${empty auth_id }">
			<li><a href="/log/login/success">고객센터</a></li>
			</c:if>
			<c:if test="${!empty auth_id }">
			<li><a href="/chat/QnA">고객센터</a></li>
			</c:if>
		</ul>
	</div>
