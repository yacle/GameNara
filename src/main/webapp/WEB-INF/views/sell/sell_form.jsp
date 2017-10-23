<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-md-4">
		<img alt="image" id="img">
		<input id="profile" type="file" name="profile" id="file">
		
	</div>
	<div class="col-md-8">
		<h4>제목 : </h4> <input type="text" class="form-control" id="title">
		<h4>판매가격 :</h4> <input type="text" class="form-control" id="price">
		<h4>전화번호 :</h4> <input type="text" class="form-control" id="phone">
		<h4>거래방법 :</h4> <input type="text" class="form-control" id="deal">
	</div>
</div><hr/>
<div class="row" align="center">
<textarea rows="10" cols="170" placeholder="상세내용"></textarea>
</div>

<script>
	$("#file").change(function(){
		var pic = $("#file").val();
		$("#img").val(pic);
	})
</script>