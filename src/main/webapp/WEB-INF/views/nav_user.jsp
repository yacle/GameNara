<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="/index">GAMENARA</a>
	</div>
	<ul class="nav navbar-nav">
		<li class="active"><a href="#">NOTICE</a></li>
		<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">SELL<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">TOTAL</a></li>
				<li><a href="#">CONSOLE</a></li>
				<li><a href="#">GAME TITLE</a></li>
				<li><a href="#">ACCESSORY</a></li>
				<li><a href="#">ETC</a></li>
			</ul>
		</li>
		<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">BUY<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">TOTAL</a></li>
				<li><a href="#">CONSOLE</a></li>
				<li><a href="#">GAME TITLE</a></li>
				<li><a href="#">ACCESSORY</a></li>
				<li><a href="#">ETC</a></li>
			</ul>
		</li>
		<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">EXCHANGE<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">TOTAL</a></li>
				<li><a href="#">CONSOLE</a></li>
				<li><a href="#">GAME TITLE</a></li>
				<li><a href="#">ACCESSORY</a></li>
				<li><a href="#">ETC</a></li>
			</ul>
		</li>
		<li><a href="#">FREE PRESENT</a></li>
		<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">COMMUNITY<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#">가입인사</a></li>
				<li><a href="#">자유게시판</a></li>
				<li><a href="#">거래후기</a></li>
			</ul>
		</li>
		    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown" style="margin-left:280px; margin-top:9px;">${auth_id}
		    <span class="caret"></span></button>
		    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1" style="right:0; left:970px">
		      <li role="presentation"><a role="menuitem" tabindex="-1" href="/member/info">PROFILE</a></li>
		      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">MyWorld</a></li>
		      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Message <span class="badge" style="background-color:DodgerBlue">5</span></a></li>
		      <li role="presentation" class="divider"></li>
		      <li role="presentation"><a role="menuitem" tabindex="-1" href="/log/logout">LOGOUT</a></li>
		    </ul>
	</ul>
</div>




