<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
	<li><a href="/master/manage_member">Total</a></li>
    <li><a>회원정보</a></li>
    <li><a href="/master/report02?id=${map.ID}">게시판 Report</a></li>
    <li><a style="color: black;">[회원ID : <span id="id">${map.ID}</span>]</a></li>
  </ul>
<!-- 회원정보 mode1 -->
<div align="center">
 <table class="table">
    <thead>
      <tr>
        <th>ID(Name)</th>
        <th>Gender</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Level</th>
        <th>Address</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>${map.ID }(${map.NAME })</td>
        <td>${map.GENDER }</td>
        <td>${map.PHONE_NUM }</td>
        <td>${map.EMAIL }</td>
        <td><input type="text" id="level" value="${map.LEV }" size="1" style="padding-left:30px; padding-right:0px"></td>
        <td>${map.ADDRESS }</td>
      </tr>
    </tbody>
  </table>
  <button type="button" id="levbtn">레벨 저장</button>
</div>
<script>
	$("#levbtn").click(function(){
		var lev = $("#level").val();
		var id = $("#id").html();
		$.ajax({
			"type" : "post",
			"async" : false,
			"url" : "/master/chgLevel",
			"data" : {
				"lev" : lev,
				"id" : id
			}
		}).done(function(b) {
			window.alert("수정되었습니다");
	})
</script>
