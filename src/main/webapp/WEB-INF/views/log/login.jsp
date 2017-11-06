<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result eq 'fail'}">
<script>
	window.alert("로그인에 실패하였습니다!")
</script>
</c:if>

<div class="container" style="margin-left:270px">
	<h2>LOGIN</h2>
	<form action="/log/login" method="post">
		<div class="form-group">
			<label for="id">ID:</label>
			<input type="text" class="form-control" name="id" id="id" placeholder="Enter ID" style="width:50%">
		</div>
		<div class="form-group">
			<label for="pwd">Password:</label>
			<input type="password" class="form-control" name="password" id="password" placeholder="Enter password" style="width:50%">
		</div>
		<div class="checkbox">
			<label><input type="checkbox" name="keep"> Remember me</label>
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
	</form>
</div>