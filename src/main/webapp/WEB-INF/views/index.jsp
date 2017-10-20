<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<style>
td{
	font-size: 16px;
	align-items: center;
}
</style>
<div align="center">
<h2>GAMENARA section</h2>
</div>
◯ : 읽기&쓰기&emsp;/&emsp;    
☐: 읽기&emsp; /&emsp;
△ : 게시판 리스트만 볼 수 있읍니다.&emsp;/&emsp;    
X : 권한없음
<table class="table table-bordered" align="center">
	<thead>
		<tr>
			<td width="6%">레벨</td>
			<td width="28%">등업조건</td>
			<td width="8%">공지사항</td>
			<td width="8%">SELL</td>
			<td width="8%">BUY</td>
			<td width="8%">EXCHANGE</td>
			<td width="8%">무료나눔</td>
			<td width="8%">가입인사</td>
			<td width="10%">자유게시판</td>
			<td width="8%">거래후기</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>레벨 1</td>
			<td>가입시</td>
			<td>☐</td>
			<td>X</td>
			<td>△</td>
			<td>△</td>
			<td>△</td>
			<td>◯</td>
			<td>◯</td>
			<td>X</td>
		</tr>
		<tr>
			<td>레벨 2</td>
			<td>가입인사글 & 자유게시판 1회 글쓰기</td>
			<td>☐</td>
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
			<td>◯</td>
		</tr>
	</tbody>
</table>
<h2>prev3</h2>
<span id="prev1" value="prev2">test</span>
<button id="button" value="click">Click me</button>

<span id="demo"></span>

</div>
<script>
$("#button").click(function(){
	console.log($(this).html());
	$(this).prev().css("display", "none");
})
</script>
