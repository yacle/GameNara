<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
 <table class="table">
    <thead>
      <tr>
        <th>ID(ID)</Name>
        <th>Gender</th>
        <th>Phone</th>
        <th>Email(인증)</th>
        <th>Level</th>
        <th>Address</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="i" items="${list }">
      <tr>
        <td><a href="/master/report?id=${i.ID}">${i.ID }(${i.NAME })</a></td>
        <td>${i.GENDER }</td>
        <td>${i.PHONE_NUM }</td>
        <td>${i.EMAIL }(${i.EMAIL_REG})</td>
        <td>${i.LEV }</td>
        <td>${i.ADDRESS }</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
</div>
<div align="right">
	<button type="button" 
		class="btn btn-default dropdown-toggle-right btn-sm" id="allSend" name="allSend">전체쪽지전송</button>
</div>

<script>
	$("#allSend").click(function(){
		var url="/chat/note_sendAll";
		window.open(url, "noteSend", "width=400, height=550");
	});		

	
	
</script>







