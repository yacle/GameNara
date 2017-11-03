<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

   <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/index">GAMENARA</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="/notice">NOTICE</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" onclick="javascript:log()">SELL<span class="caret"></span></a>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" onclick="javascript:log()">BUY<span class="caret"></span></a>
      </li>
      <li><a href="#" onclick="javascript:log()">FREE PRESENT</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">COMMUNITY<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" onclick="javascript:log()">가입인사</a></li>
          <li><a href="/freeBoard/list">자유게시판</a></li>
          <li><a href="/after/list">거래후기</a></li>
        </ul>
      </li>
    </ul>
	 <ul class="nav navbar-nav navbar-right">
      <li><a href="/member/join"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="/log/login/success"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>

<script>

var log = function(){
	window.alert("로그인후 사용하세요");
}
</script>

