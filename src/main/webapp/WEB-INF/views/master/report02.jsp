<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
	<li><a href="/master/manage_member">Total</a></li>
    <li><a href="/master/report?id=${map.ID}">Menu 1</a></li>
    <li><a id="m3">Menu 2</a></li>
    <li><a style="color: black;">[회원ID : ${map.ID}]</a></li>
  </ul>


<!-- 회원 통계자료 -->
<style>  
table { 
	border-collapse:collapse; 
		
}  
th, td { 
	border:1px solid black; 
	text-align: center;
	font-size: 18px;
	padding: 5px;
}
</style>
<div align="center">
<table width="100%">
	<thead>
		<tr>
			<th colspan="5">게시글</th>
			<th rowspan="2">로그인</th>
			<th rowspan="2">댓글</th>
		</tr>
		<tr>
			<th>SELL</th>
			<th>BUY</th>
			<th>FREE_Dist</th>
			<th>Freeboard</th>
			<th>After_Deal</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${map.sell}</td>
			<td>${map.buy}</td>
			<td>${map.free_distribute}</td>
			<td>${map.freeboard}</td>
			<td>${map.after}</td>
			<td>${map.logcnt}</td>
			<td></td>
		</tr>
	</tbody>
    

	</table>
</div>



