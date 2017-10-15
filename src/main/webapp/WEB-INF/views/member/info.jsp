<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2 align="center">${auth_id} Info</h2>
<div class="row" style="align:center">
	<div class="col-md-1"></div>
	<div class="col-md-3">
		<p>
		<c:choose>
			<c:when test="${empty map.PROFILE}">
				<img src="/profiles/default.png" id="pf" alt="기본이미지" />
			</c:when>
			<c:otherwise>
				<img id="pf" src="/profiles/${map.PROFILE}" alt="사용자프로필" style="height:301px; width:300px;"/>
			</c:otherwise>
		</c:choose>
		</p>
		<p>
		<form action="/member/profile" method="post" id="form" enctype="multipart/form-data"  align="center">
			<input id="profile" type="file" name="profile" style="display:none"/>
			<span id="picName"></span><br/>
			<button type="submit" class="btn btn-default" id="sbt">적용</button>
			<button type="submit" class="btn btn-default" onclick="javascript:location.reload()">취소</button>
		</form>
		</p>
	</div>

  		
<form class="form-horizontal" action="/member/info" method="post">
	<div class="col-md-7">
		<div class="form-group">
			<label class="control-label col-sm-3" for="name">Name:</label>
			<div class="col-sm-9">
		    	<input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3" for="gender">Gender:</label>
			<div class="col-sm-9">
				<select class="form-control" id="gender" name="gender">
					<option value="m">Male</option>
					<option value="f">Female</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="email">Email:</label>
			<div class="col-sm-9">
				<input type="email" class="form-control" value="${map.EMAIL}"><button type="button" id="emailChange">변경</button>
				<button type="button" id="emailReg">인증메일보내기</button></span>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="phone">Phone-Number:</label>
			<div class="col-sm-9">          
				<input type="text" class="form-control" id="phone" placeholder="Enter Phone Number" name="phone">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="addr">ADDRESS:</label>
			<div class="col-sm-9">          
				<input type="text" class="form-control" id="addr" placeholder="Enter Address" name="addr">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="birth">BIRTH:</label>
			<div class="col-sm-9">          
				<input type="date" class="form-control" id="birth" placeholder="Enter Birth" name="birth">
			</div>
		</div>
	</div> 
	<div class="col-md-1"></div> 
</div> 
	<div class="form-group">        
		<div class="col-sm-offset-0 col-sm-12" align="center">
			<button type="submit" class="btn btn-default">Submit</button>
		</div>
	</div>
</form>
<script>
	$("#sbt").click(function(){
		if(window.confirm("프로필 변경을 저장하시겠습니까?")) {
			$("#form").submit();
		}
	})
	$("#pf").click(function(){
		$("#profile").click();
	})
	$("#profile").change(function(){
		var reader = new FileReader();
		reader.onload = function(e){
			document.getElementById("pf").src = e.target.result;
		}
		reader.readAsDataURL(this.files[0]);
	})
</script>
