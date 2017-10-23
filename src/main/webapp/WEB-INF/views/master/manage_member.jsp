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
        <td>${i.EMAIL }(
        <c:choose>
        	<c:when test="${i.EMAIL_REG ne null }">OK</c:when>
	        <c:otherwise>NO</c:otherwise>
	    </c:choose>
        )</td>
        <td><input type="text" id="level" size="1" value="${i.LEV }"></td>
        <td>${i.ADDRESS }</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>

</div>
