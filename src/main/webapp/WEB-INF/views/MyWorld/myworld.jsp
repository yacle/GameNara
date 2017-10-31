<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- �������� �ּ�ȭ�� �ֽ� CSS - JQuery-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- �ΰ����� �׸� -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<html>
<head>
  <style>
  body {
      position: relative;
      background-color:Gainsboro; 
  }
  
  #section1 {padding-top:50px;height:1000px;color: black; }
  #section2 {padding-top:50px;height:1000px;color: black; }
  #section3 {padding-top:50px;height:1000px;color: black; }
  #section41 {padding-top:50px;height:1000px;color: black;}
  #section42 {padding-top:50px;height:1000px;color: black;}
  
  #info {
	position: absolute;
	width: 170px;
	height: 200px;
	left: 50px;
	top: 10px;

}
  </style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top" id="nav">
  <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">������</a>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li><a href="#section1">buy</a></li>
          <li><a href="#section2">sell </a></li>
          <li><a href="#section3">after</a></li>
          <li><a href="#section41">free</a></li>
          <li><a href="#section42">freedis</a></li>
        </ul>
      </div>
      </div>
    </div>
</nav>

<br/><br/><h1 align="center">MY WORLD</h1>
 <div class="row">
<div class="col-sm-3">
  <c:forEach var="obj" items="${total.member }">
  <div id="info">
 <h2>info</h2> 
<p>���̵� : ${auth_id}</p>
<p>�̸��� : ${obj.EMAIL}</p>
<p>���� : ${obj.LEV} Lv</p>
<p>����Ʈ : ${obj.POINT } point</p>
    </c:forEach>
 </div>
</div>

<div class="col-sm-8">
<div id="section1" class="container-fluid">
<h2><a href="/buy/list/1">BUY</a>���� ����</h2><br/>
<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">�۹�ȣ</th>
				<th style="width: 43%">������</th>
				<th style="width: 15%">�ۼ�����</th>
				<th style="width: 10%">��ȸ��</th>
			</tr>
		</thead>
			<tbody>
        <c:forEach var="obj" items="${total.buy }">
				<tr>
					<td>${obj.NO }</td>
					<td><a href="/buy/view/${obj.NO}">${obj.TITLE }</a></td>
					<td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.ADD_DATE }" /></td>
					<td>${obj.COUNT }</td>
					</tr>
		</c:forEach>
			</tbody>
</table>
</div>
<div id="section2" class="container-fluid">
<h2>sell���� ����</h2><br/>
<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">�۹�ȣ</th>
				<th style="width: 43%">������</th>
				<th style="width: 15%">�ۼ�����</th>
				<th style="width: 10%">��ȸ��</th>
			</tr>
		</thead>
			<tbody>
        <c:forEach var="obj" items="${total.sell }">
				<tr>
					<td>${obj.NO }</td>
					<td><a href="/sell/view/${obj.NO}">${obj.TITLE }</a></td>
					<td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.REGDATE }" /></td>
					<td>${obj.COUNT }</td>
					</tr>
		</c:forEach>
			</tbody>
</table>
</div>
<div id="section3" class="container-fluid">
<h2>after���� ����</h2><br/>
<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">�۹�ȣ</th>
				<th style="width: 43%">������</th>
				<th style="width: 15%">�ۼ�����</th>
				<th style="width: 10%">��ȸ��</th>
			</tr>
		</thead>
			<tbody>
        <c:forEach var="obj" items="${total.after }">
				<tr>
					<td>${obj.NO }</td>
					<td><a href="/after/view/${obj.NO}">${obj.TITLE }</a></td>
					<td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.ADD_DATE }" /></td>
					<td>${obj.COUNT }</td>
					</tr>
		</c:forEach>
			</tbody>
</table>
</div>
<div id="section41" class="container-fluid">
<h2>free���� ����</h2><br/>
<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">�۹�ȣ</th>
				<th style="width: 43%">������</th>
				<th style="width: 15%">�ۼ�����</th>
				<th style="width: 10%">��ȸ��</th>
			</tr>
		</thead>
			<tbody>
        <c:forEach var="obj" items="${total.free }">
				<tr>
					<td>${obj.NO }</td>
					<td><a href="/freeBoard/view/${obj.NO}">${obj.TITLE }</a><span class="badge">${obj.C }</span></td>
					<td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.FB_DATE }" /></td>
					<td>${obj.VIEW_CNT }</td>
					</tr>
		</c:forEach>
			</tbody>
</table>
</div> 
<div id="section42" class="container-fluid">
<h2>freedis���� ����</h2><br/>
<table style="width: 95%; background-color: #EAEAEA;"
		class="table table-bordered">
		<thead>
			<tr>
				<th style="width: 10%">�۹�ȣ</th>
				<th style="width: 43%">������</th>
				<th style="width: 15%">�ۼ�����</th>
				<th style="width: 10%">��ȸ��</th>
			</tr>
		</thead>
			<tbody>
        <c:forEach var="obj" items="${total.freedis }">
				<tr>
					<td>${obj.NO }</td>
					<td><a href="/FreeDistribute/view/${obj.NO}">${obj.TITLE }</a></td>
					<td><fmt:formatDate pattern="yyyy.MM.dd" value="${obj.FD_DATE }" /></td>
					<td>${obj.VIEW_CNT }</td>
					</tr>
		</c:forEach>
			</tbody>
</table>

</div>
</div>
</div>
<script>
$(document).ready(function(){
    $('body').scrollspy({target: ".navbar", offset: 50});   
});

$(document).ready(function() {

	// ���� css���� �÷��� ��� ��ġ(top)���� ������ �����Ѵ�.
	var floatPosition = parseInt($("#info").css('top'));
	// 250px �̷������� �������Ƿ� ���⼭ ���ڸ� �����´�. parseInt( �� );

	$(window).scroll(function() {
		// ���� ��ũ�� ��ġ�� �����´�.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

	
		 $("#info").css('top', newPosition);
		 
		/*
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
*/
	}).scroll();

});
</script>
</body>
</html>
