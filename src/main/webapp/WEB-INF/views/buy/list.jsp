<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
th {
	border-bottom: 1px solid;
	text-align: left;
}
th, td {
	padding: 10px;
}
</style>
<div align="center" style="line-height: 35px">
	<h2>삽니다</h2>
	<table style="width: 95%; background-color:#EAEAEA;" class="table table-bordered" >
		<thead>
			<tr>
				<th style="width: 10%">글번호</th>
				<th style="width: 60%">글제목</th>
				<th style="width: 20%">작성자</th>
				<th style="width: 10%">조회수</th>
			</tr>
		</thead>
	</table>
	<p align="right" style="margin-right: 30px;">
		<a href="/board/add"><button type="button" style="padding: 5px;">글작성</button></a>
	</p>
</div>