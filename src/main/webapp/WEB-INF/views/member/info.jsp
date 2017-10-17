<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h2 align="center">${auth_id}Info</h2>
<div class="row" style="align: center">
	<div class="col-md-1"></div>
	<div class="col-md-3">
		<p>
			<c:choose>
				<c:when test="${empty map.PROFILE}">
					<img src="/profiles/default.png" id="pf" alt="기본이미지"
						style="height: 301px; width: 300px;" />
				</c:when>
				<c:otherwise>
					<img id="pf" src="/profiles/${map.PROFILE}" alt="사용자프로필"
						style="height: 301px; width: 300px;" />
				</c:otherwise>
			</c:choose>
		</p>
		<p>
		<form action="/member/profile" method="post" id="form"
			enctype="multipart/form-data" align="center">
			<input id="profile" type="file" name="profile" style="display: none" />
			<span id="picName"></span><br />
			<button type="submit" class="btn btn-default" id="sbt">적용</button>
			<button type="submit" class="btn btn-default"
				onclick="javascript:location.reload()">취소</button>
		</form>
		</p>
	</div>


	<form class="form-horizontal" action="/member/info" method="post">
		<div class="col-md-7">
			<div class="form-group">
				<label class="control-label col-sm-3" for="name">Name:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="name"
						value="${map.NAME }" placeholder="Enter Name" name="name">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="nick">NickName:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="nick"
						value="${map.NICKNAME }" placeholder="Enter NickName" name="nick"><span
						id="nickcheck"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="gender">Gender:</label>
				<div class="col-sm-9">
					<select class="form-control" id="gender" name="gender"
						value="${map.GENDER eq m ? Male:Female }">
						<option value="m">Male</option>
						<option value="f">Female</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="email">Email:</label>
				<div class="col-sm-9">
					<input type="email" class="form-control" id="email"
						value="${map.EMAIL}">
					<c:choose>
						<c:when test="${empty map.EMAIL_REG }">
							<button type="button" id="emailReg">
								<small>인증메일보내기</small>
							</button>
							<span id="codeInput"><input type="text" id="regCode"
								placeholder="Entet Code"></span>
						</c:when>
						<c:otherwise>
						인증완료
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="phone">Phone-Number:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="phone"
						value="${map.PHONE_NUM }" placeholder="Enter Phone Number"
						name="phone">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="addr">ADDRESS:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="addr"
						value="${map.ADDRESS }" placeholder="Enter Address" name="addr">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="birth">BIRTH:</label>
				<div class="col-sm-9">
					<fmt:formatDate var="date" value="${map.BIRTH }"
						pattern="yyyy-MM-dd" />
					<input type="date" class="form-control" id="birth" value="${date }"
						placeholder="Enter Birth" name="birth">
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
</div>
<div class="form-group">
	<div class="col-sm-offset-0 col-sm-12" align="center">
		<button type="button" class="btn btn-default"
			onclick="javascript:submit()">Submit</button>
	</div>
</div>
</form>
<script>
if(${data eq 1}){
	window.alert("info가 저장되었읍니다.")
}
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

$("#emailReg").click(function(){
	$.ajax({
		"type":"post",
		"async":false,
		"url":"/member/emailReg",
		"data":{
			"email":$("#email").val()
		}
	}).done(function(){
		window.alert("인증코드를 발송하였습니다.")
	})
})

$("#regCode").change(function(){
	$.ajax({
		"type":"post",
		"async":false,
		"url":"/member/regCode",
		"data":{
			"regCode":$("#regCode").val(),
			"email":$("#email").val()
		}
	}).done(function(obj){
		if(obj == "true"){
			$("#codeInput").html("인증완료");
			$("#emailReg").hide();
		}else{
			$("#codeInput").html("인증실패");
			window.alert("email 주소를 확인해주십시요")
		}
	})
})	
$("#nick").keyup(function(){
	var i = $("#nick").val();
	if(i.length>1){
		$.ajax({
			"type":"post",
			"async":false,
			"url":"/member/nickcheck",
			"data":{
				"nick":$("#nick").val()
			}
		}).done(function(obj){
			if(obj!=0){
				$("#nickcheck").html("사용중인 별명입니다. 다른 별명를 입력하십시오");
			}else{
				$("#nickcheck").html("사용가능한 별명입니다.");
			}
		})
	}else{
		$("#nickcheck").html("별명은 2자이상 입력하십시오.");
	}
})	

</script>

