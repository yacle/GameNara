<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
td{
	font-size: 16px;
	text-align: center;
	padding: 5px;
	border: 2px solid navy;
}
</style>

<div align="center">
	<h2>등업신청 게시판</h2>
</div><hr/>
<div  style="background-color: #EAEAEA;" >
◯ : 읽기&쓰기&emsp;/&emsp;    
☐: 읽기&emsp; /&emsp;
△ : 게시판 리스트만 볼 수 있읍니다.&emsp;/&emsp;    
X : 권한없음
<table border="1" align="center" style="background-color: #EAEAEA;">
	<thead>
		<tr>
			<td width="6%">구분</td>
			<td width="28%">등업조건</td>
			<td width="8%">공지사항</td>
			<td width="8%">SELL</td>
			<td width="8%">BUY</td>
			<td width="8%">무료나눔</td>
			<td width="8%">가입인사</td>
			<td width="10%">자유게시판</td>
			<td width="8%">거래후기</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>GUEST</td>
			<td>GUEST 방문시</td>
			<td>☐</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>△</td>
			<td>△</td>
		</tr>
		<tr>
			<td>레벨 1</td>
			<td>회원 가입시</td>
			<td>☐</td>
			<td>X</td>
			<td>△</td>
			<td>△</td>
			<td>◯</td>
			<td>◯</td>
			<td>△</td>
		</tr>
		<tr>
			<td>레벨 2</td>
			<td>가입인사글 & 자유게시판 1회 글쓰기</td>
			<td>☐</td>
			<td>☐</td>
			<td>☐</td>
			<td>◯</td>
			<td>◯</td>
			<td>◯</td>
			<td>△</td>
		</tr>
		<tr>
			<td>레벨 3</td>
			<td>개인정보 작성/이메일 인증</td>
			<td>☐</td>
			<td>◯</td>
			<td>◯</td>
			<td>◯</td>
			<td>◯</td>
			<td>◯</td>
			<td>◯</td>
		</tr>
		<tr>
			<td>레벨 4</td>
			<td>스탭</td>
			<td>◯</td>
			<td>◯</td>
			<td>◯</td>
			<td>◯</td>
			<td>◯</td>
			<td>◯</td>
			<td>◯</td>
		</tr>
		<tr>
			<td colspan="10" style="height: 70px; padding-left: 20px; text-align: left;">
			&#9734; 포인트 지급 : 회원가입시 1000포인트, 자유게시판 글쓰기시 200포인트 지급<br/>
			&#9734; 포인트 차감 : SELL, BUY 게시판 글쓰기시 500포인트 차감<br/>
			&#9734; 게시판 글 확인후 Level up </td>
		</tr>
	</tbody>
</table><br/>
<%-- 등업신청 input form --%>

<div class="row">
	<div class="col-md-2" style="padding: 10px;" align="center"><span id="auth_id" style="font-size: 16px; font-weight: bold;">${auth_id }</span></div>
	<div class="col-md-7"><textarea rows="2" cols="100%" id="content"></textarea></div>
	<div class="col-md-2" align="right">비밀번호:<br/><input type="text" id="pwd" size="5" placeholder="4자리 숫자" required></div>
	<div class="col-md-1" style="padding: 10px;"><button type="button" id="sendbtn">등록</button></div>
	<input type="hidden" id="level" value="${auth_level }">
</div>
<hr/>
<!-- 등업신청 List View -->
<span id="levelReqList" ></span>
</div>
<script>
// 댓글 목록 불러오기
var level=$("#level").val();
var list = function(){
	$.getJSON("/become_member/levelReqList", function(data){
		var str="";
		$(data).each(
			function(){
				if(level>4){
					str += "<div class='row'>"
						+"<div class='col-md-2' align='center'><a href='/master/report?id="+this.id+"'>"+this.id+"</a></div>"
						+"<div class='col-md-7'>"+this.contents+"</div>"
						+"<div class='col-md-2' align='right'><input type='text'  id='inputpwd' size='5' placeholder='비밀번호' style='display:none;'></div>"
						+"<div class='col-md-1' id='m'>"
						+"<button type='button' id='delBtn' data-no='"+this.no+"' pw='"+this.pwd+"' >삭제</button><br/>"
						+"</div>"
						+"</div><hr/>"
				}else{
					str += "<div class='row'>"
						+"<div class='col-md-2' align='center'>"+this.id+"</div>"
						+"<div class='col-md-7'>"+this.contents+"</div>"
						+"<div class='col-md-2' align='right'><input type='text'  id='inputpwd' size='5' placeholder='비밀번호' style='display:none;'></div>"
						+"<div class='col-md-1' id='m'>"
						+"<button type='button' id='delBtn' data-no='"+this.no+"' pw='"+this.pwd+"' >삭제</button><br/>"
						+"</div>"
						+"</div><hr/>"
				}
			})
		$("#levelReqList").html(str);
	})
}
list();
// 등업신청 등록
$("#sendbtn").click(function(){
	var pwd = $("#pwd").val();
	if(pwd != null){
		var id = $("#auth_id").html();
		var contents = $("#content").val();
		$.ajax({
			"type": "post",
			"async":false,
			"url":"/become_member/levelReqAdd",
			"headers": {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "POST"
			},
			"dataType":"text",
			"data":JSON.stringify({
				"id":id,
				"contents":contents,
				"pwd":pwd
			})
		}).done(function(){
			$("#content").val("");
			$("#pwd").val("");
			list();
		})
	}else{
		window.alert("비밀번호를 입력하세요");
	}
})
// 삭제
$("#levelReqList").on("click", "#m button", function(){
	var levelReq = $(this);
	var no = levelReq.attr("data-no");
	var pwd = levelReq.attr("pw");
	var inputpw = $(this).parent().prev().children();
	inputpw.show();
	inputpw.change(function(){
		var pw = inputpw.val();
		console.log("pw:"+pw+"/pwd:"+pwd);
		if(pwd== pw){
			$.ajax({
				"type": "post",
				"async":false,
				"url":"/become_member/levelReqDel",
				"data":{
					"no":no
				}
			}).done(function(){
				list();
			})
		}else{
			inputpw.hide();
			window.alert("비밀번호를 확인하세요");
		}
	})
})
</script>

