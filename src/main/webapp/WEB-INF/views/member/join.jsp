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
      <input type="text" class="form-control" name="id" id="id" placeholder="Enter ID (5자 이상)" style="width:50%" autocomplete="off">
      <span id="idcheck"></span>
    </div>
    <div class="form-group">
      <label for="email">EMAIL:</label>
      <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email" style="width:50%" required>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter password (8자 이상 영문 대소문자, 숫자가 포함되어야 합니다)" style="width:50%">
      <span id="pwdcheck"></span>
    </div>

    <button type="submit" class="btn btn-default" id="submitbtn" disabled>Submit</button>
  </form>
</div>

<script>
var id=false;
var pw=false;
$("#id").keyup(function(){
	var i = $("#id").val();
	if(i.length>4){
		$.ajax({
			"type":"post",
			"async":false,
			"url":"/member/idcheck",
			"data":{
				"id":$("#id").val()
			}
		}).done(function(r){
			if(r!=0){
				$("#idcheck").html("사용중인 아이디입니다. 다른 아이디를 입력하십시오");
			}else{
				$("#idcheck").html("사용가능한 아이디입니다.");
				id=true;
			}
		})
	}else{
		$("#idcheck").html("아이디는 5자이상 입력하십시오.");
	}
})
$("#pwd").keyup(function(){
	var pwd=$("#pwd").val();
	var a = /[a-z]/.test(pwd);
	var b = /[A-Z]/.test(pwd);
	var c = /[0-9]/.test(pwd);
	var d = pwd.length;
	if(a==true && b==true && c==true && d>7){
		pw=true;
		$("#pwdcheck").html("");
	}else{
		$("#pwdcheck").html("8자 이상 영문 대소문자, 숫자가 포함되어야 합니다");
	}
})
$("#pwd").change(function(){
	if(id==true && pw==true){
		document.getElementById("submitbtn").disabled=false;
	}
})
</script>


