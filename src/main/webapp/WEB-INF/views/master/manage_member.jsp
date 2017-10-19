<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
 <table class="table">
    <thead>
      <tr>
        <th>Name(ID)</th>
        <th>Gender</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Level</th>
        <th>Address</th>
        <th>Birth</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="i" items="${list }">
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
     </c:forEach>
    </tbody>
  </table>

</div>
