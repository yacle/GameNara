<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="right" class="container-fluid">
	<a href="/sell/sellForm"><button type="button" class="btn btn-primary btn-sm">글작성</button></a><br/>
</div>
<div class="row text-center">
	<c:forEach var="i" begin="0" end="${cnt}" step="1">
		<c:choose>
			<c:when test="${empty list[i].NO }">
			</c:when>
			<c:otherwise>
				<a href="/sell/view/${list[i].NO}">
					<div class="col-sm-3">
						<div class="thumbnail">
						<c:choose>
							<c:when test="${empty list[i].PIC }">
								<img src="/profiles/default.png" alt="Article Photo" width="220" height="220">
							</c:when>
							<c:otherwise>
								<img src="/sellB_File/${list[i].PIC}" alt="Article Photo" width="220" height="220">
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${list[i].CATEGORY eq 0}">
							<p><strong>기타</strong></p>
							</c:when>
							<c:when test="${list[i].CATEGORY eq 1}">
							<p><strong>콘솔</strong></p>
							</c:when>
							<c:when test="${list[i].CATEGORY eq 2}">
							<p><strong>게임타이틀</strong></p>
							</c:when>
							<c:otherwise>
							<p><strong>주변기기</strong></p>
							</c:otherwise>
						</c:choose>
						<p>${list[i].TITLE}</p>
					</div>
				</div>
			</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>   
</div> 
<script>
$("#view").click(function(){
	var no = $("#view").val();
	var str="/sell/view/no"+no;
	location.href=str;
})
</script>  