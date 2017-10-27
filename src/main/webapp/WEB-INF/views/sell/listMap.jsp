<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="right" style="margin-bottom: 10px;">
	<a><span class="glyphicon glyphicon-th"></span>앨범형</button></a> | 
	<a href="/sell/list?category=1&&type=list"><span class="glyphicon glyphicon-list-alt"></span>게시판형</a>
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
								<img src="/profiles/default02.jpg" class="img-thumbnail" alt="Article Photo" width="200px" height="200px">
							</c:when>
							<c:otherwise>
								<img src="/sellB_File/${list[i].PIC}" class="img-thumbnail" alt="Article Photo" width="200px" height="200px">
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
		<c:if test="${i%4 eq 3}">
			<div class="row"></div>
		</c:if>
	</c:forEach>   
</div> 
<script>
$("#view").click(function(){
	var no = $("#view").val();
	var str="/sell/view/no"+no;
	location.href=str;
})
</script>  