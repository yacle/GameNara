<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<style>
td{
	font-size: 16px;
	text-align: center;
	padding: 5px;
	border: 2px solid navy;
}
</style>
<div align="center">
<h2>공지사항 - <small>회원등급 / 포인트</small> -</h2>
</div><hr/>
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
			<td colspan="10" style="height: 100px; padding-left: 20px; text-align: left;">
			&#9734; 포인트 지급 : 회원가입시 1000포인트, 자유게시판 글쓰기시 200포인트 지급<br/><br/>
			&#9734; 포인트 차감 : SELL, BUY 게시판 글쓰기시 500포인트 차감</td>
		</tr>
	</tbody>
</table>
