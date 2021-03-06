<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h2 align="center"><span id="id">${auth_id}</span>Info</h2>
<div class="row" style="align: center">
	<div class="col-md-1"></div>
	<div class="col-md-3">
		<p>
			<c:choose>
				<c:when test="${empty map.profile}">
					<img src="/profiles/default.png" id="pf" alt="기본이미지" style="height: 301px; width: 300px;" />
				</c:when>
				<c:otherwise>
					<img id="pf" src="/profiles/${map.profile}" alt="사용자프로필" style="height: 301px; width: 300px;" />
				</c:otherwise>
			</c:choose>
		</p>
		<p>
		<form id="file" align="center">
			<input id="profile" type="file" name="profile" style="display: none" />
			<span id="picName"></span><br />
			<button type="button" class="btn btn-default" id="sbt">적용</button>
			<button type="button" class="btn btn-default" onclick="javascript:location.reload()">취소</button>
			<input type="hidden" name="id" value="${auth_id }">
		</form>
		</p>
	</div>

	<form class="form-horizontal">
		<div class="col-md-7">
			<div class="form-group">
				<label class="control-label col-sm-3" for="name">Name:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="name" value="${map.name }" placeholder="Enter Name" name="name">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="nick">NickName:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="nick" value="${map.nickname }" placeholder="Enter NickName" name="nick">
					<span id="nickcheck"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="gender">Gender:</label>
				<div class="col-sm-9">
					<select class="form-control" id="gender" name="gender" value="${map.gender eq m ? Male:Female }">
						<option value="m">Male</option>
						<option value="f">Female</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="email">Email:</label>
				<div class="col-sm-9">
					<input type="email" class="form-control" id="email" value="${map.email}">
					<c:choose>
						<c:when test="${map.email_reg eq 'unauthorized'}">
							<button type="button" id="emailReg">
								<small>인증메일보내기</small>
							</button>
							<span id="codeInput"><input type="text" id="regCode" placeholder="Entet Code"></span>
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
						value="${map.phone_num }" placeholder="Enter Phone Number"
						name="phone">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="addr">ADDRESS:</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="addr" value="${map.address }" placeholder="Enter Address" name="addr">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="birth">BIRTH:</label>
				<div class="col-sm-9">
					<fmt:formatDate var="date" value="${map.birth }" pattern="yyyy-MM-dd" />
					<input type="date" class="form-control" id="birth" value="${date }" placeholder="Enter Birth" name="birth">
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
<div class="form-group">
	<div class="col-sm-offset-0 col-sm-12" align="center">
		<button type="button" class="btn btn-default" id="info">Submit</button>
		<a href="#" onClick="history.back()" class="btn btn-default">뒤로</button></a>
	</div>
</div>
</form>
<script>
// 개인정보 저장
$("#info").click(function(){
	console.log("submit");
	$.ajax({
		"type":"post",
		"async":false,
		"url":"/member/info",
		"data":{
			"phone":$("#phone").val(),
			"addr":$("#addr").val(),
			"gender":$("#gender").val(),
			"nick":$("#nick").val(),
			"name":$("#name").val(),
			"birth":$("#birth").val(),
			"id":$("#id").html(),
			"email":$("#email").val()
		}
	}).done(function(obj){
		window.alert(obj);
	})
})
// profile 사진 저장
$("#sbt").click(function(){
	if(window.confirm("프로필 변경을 저장하시겠습니까?")) {
		var file = $("#file")[0];
		var data = new FormData(file);
		$.ajax({
			type:"post",
			enctype:"multipart/form-data",
			url:"/member/profile",
			data:data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			success: function(obj){
				window.alert(obj);
			}
		})
	}
})
// profile 사진 선택하기
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
// 이메일 인증 코드 전송
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
// 인증코드 확인
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
// 닉네임 중복 검사
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

