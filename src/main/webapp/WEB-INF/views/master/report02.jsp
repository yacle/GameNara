<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<ul class="nav nav-tabs">
    <li><a href="/master/report?id=${auth_id }">Menu 1</a></li>
    <li><a id="m3">Menu 2</a></li>
  </ul>


<!-- 회원 통계자료 -->
<div align="center" id="mode2" style="display: none">
	<h2>로그인 횟수, 게시글 작성수, 댓글 작성수</h2>
 <table class="table table-striped">
    <thead>
      <tr>
        <th>로그인</th>
        <th col-span="5">게시글</th>
        <th>댓글</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>       
      </tr>
     </tbody>
	</table>
</div>



