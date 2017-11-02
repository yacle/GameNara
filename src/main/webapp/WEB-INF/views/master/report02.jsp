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
				<td><a id="sell" value="${map.ID}">${map.sellcnt}</a></td>
				<td><a id="buy" value="${map.ID}">${map.buycnt}</a></td>
				<td><a id="freedist" value="${map.ID}">${map.free_distributecnt}</a></td>
				<td><a id="free" value="${map.ID}">${map.freeboardcnt}</a></td>
				<td><a id="after" value="${map.ID}">${map.aftercnt}</a></td>
				<td>${map.logcnt}</td>
				<td>${map.replycnt}</td>
			</tr>
		</tbody>
	</table><br/>
</div>
<div id="div1"></div>
<script>
$("#sell").click(function(){
	$.getJSON("/master/board?id=${map.ID}&&board=sell", function(data){
		var title="<br/><div align=\center\'><h2>SELL Board</h2><br/>";
		var str="";
		$(data).each(
			function(){
				str += "<div class='row'>"
						+"<div class='col-md-1' align='center'>"+this.NO+"</div>"
						+"<div class='col-md-2' align='center'>"+this.WRITER+"</div>"
						+"<div class='col-md-8'>"
							+"<div class='row'>"+this.TITLE+"</div>"
						+"</div>"
					  +"</div><hr/>"
				})
		$("#div1").html(title+str);
	})	
})
$("#buy").click(function(){
	$.getJSON("/master/board?id=${map.ID}&&board=buy", function(data){
		var title="<br/><div align=\center\'><h2>BUY Board</h2><br/>";
		var str="";
		$(data).each(
			function(){
				str += "<div class='row'>"
						+"<div class='col-md-1' align='center'>"+this.NO+"</div>"
						+"<div class='col-md-2' align='center'>"+this.BUY_ID+"</div>"
						+"<div class='col-md-8'>"
							+"<div class='row'>"+this.TITLE+"</div>"
						+"</div>"
					  +"</div><hr/>"
				})
		$("#div1").html(title+str);
	})	
})
$("#freedist").click(function(){
	$.getJSON("/master/board?id=${map.ID}&&board=freedist", function(data){
		var title="<br/><div align=\center\'><h2>FREE DISTRIBUTE Board</h2><br/>";
		var str="";
		$(data).each(
			function(){
				str += "<div class='row'>"
						+"<div class='col-md-1' align='center'>"+this.NO+"</div>"
						+"<div class='col-md-2' align='center'>"+this.WRITER+"</div>"
						+"<div class='col-md-8'>"
							+"<div class='row'>"+this.TITLE+"</div>"
						+"</div>"
					  +"</div><hr/>"
				})
		$("#div1").html(title+str);
	})	
})
$("#free").click(function(){
	$.getJSON("/master/board?id=${map.ID}&&board=free", function(data){
		var title="<br/><div align=\center\'><h2>FREEBOARD Board</h2><br/>";
		var str="";
		$(data).each(
			function(){
				str += "<div class='row'>"
						+"<div class='col-md-1' align='center'>"+this.NO+"</div>"
						+"<div class='col-md-2' align='center'>"+this.WRITER+"</div>"
						+"<div class='col-md-8'>"
							+"<div class='row'>"+this.TITLE+"</div>"
						+"</div>"
					  +"</div><hr/>"
				})
		$("#div1").html(title+str);
	})	
})
$("#after").click(function(){
	$.getJSON("/master/board?id=${map.ID}&&board=sell", function(data){
		var title="<br/><div align=\center\'><h2>AFTER DEAL Board</h2><br/>";
		var str="";
		$(data).each(
			function(){
				str += "<div class='row'>"
						+"<div class='col-md-1' align='center'>"+this.NO+"</div>"
						+"<div class='col-md-2' align='center'>"+this.WRITER+"</div>"
						+"<div class='col-md-8'>"
							+"<div class='row'>"+this.TITLE+"</div>"
						+"</div>"
					  +"</div><hr/>"
				})
		$("#div1").html(title+str);
	})	
})
</script>





