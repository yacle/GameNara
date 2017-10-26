<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="nav nav-tabs">
	<li><a href="/master/manage_member">Total</a></li>
    <li><a>Menu 1</a></li>
    <li><a href="/master/report02?id=${map.ID}">Menu 2</a></li>
    <li><a style="color: black;">[회원ID : ${map.ID}]</a></li>
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
        <td>${map.LEV }</td>
        <td>${map.ADDRESS }</td>
      </tr>
    </tbody>
  </table>
</div>
