<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="/sell/add" method="post" enctype="multipart/form-data">
	<div class="row">
		<div class="col-md-4">
		<img src="/profiles/default02.jpg" id="pf" alt="기본이미지" style="height: 300px; width: 300px;" />
			<input id="pic" type="file" name="picdata" style="display: none" />
			<span id="picName"></span><br />
		</div>
		<div class="col-md-8">
			<h4>제목 : </h4> <input type="text" class="form-control" name="title" id="title">
			<h4>판매가격 :</h4> <input type="text" class="form-control" name="price" id="price">
			<h4>연락처 :</h4> <input type="text" class="form-control" name="contact" id="contact">
			<h4>거래방법 :</h4> <input type="text" class="form-control" name="deal_method" id="deal_method">
			<h4>카테고리:</h4>
			<select class="form-control" name="category" id="category">
				<option value="1">콘솔기기</option>
				<option value="2">게임타이틀</option>
				<option value="3">주변기기</option>
				<option value="0">기타</option>
			</select>
		</div>
	</div><hr/>
	
	<div class="row" align="center">
		<input type="hidden" name="writer" value="${auth_id}" id="writer">
		<p><textarea rows="10" cols="170" placeholder="상세내용" name="detail" id="detail"></textarea></p>
		<button type="submit" class="btn btn-default" id="submit">등록</button>
		<a href="/sell/list"><button type="button" class="btn btn-default">취소</button></a>
	</div>
</form>

<script>
$("#pf").click(function(){
	$("#pic").click();
})
$("#pic").change(function(){
	var reader = new FileReader();
	reader.onload = function(e){
		document.getElementById("pf").src = e.target.result;
	}
	reader.readAsDataURL(this.files[0]);
})
</script>

