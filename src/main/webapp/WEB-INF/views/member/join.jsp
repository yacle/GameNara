<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result eq 'fail'}">
<script>
	window.alert("회원가입에 실패하였습니다!")
</script>
</c:if>

<div class="container" style="margin-left:270px">
  <h2>JOIN</h2>
  <form action="/member/join" method="post">
    <div class="form-group">
      <label for="id">ID:</label>
      <input type="text" class="form-control" name="id" id="id" placeholder="Enter ID" style="width:50%">
    </div>
    <div class="form-group">
      <label for="email">EMAIL:</label>
      <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email" style="width:50%">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter password" style="width:50%">
    </div>

    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>