<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<h2 align="center">${title}게시판</h2>
<div align="right" style="margin-bottom: 10px;">
	총 <b>${cnt }</b> 개의 글이 등록되어있습니다.
	<a><span class="glyphicon glyphicon-th"></span>앨범형</button></a> | 
	<a href="/sell/list?category=0&&type=list"><span class="glyphicon glyphicon-list-alt"></span>게시판형</a>
	<a><button type="button" id="write" class="btn btn-primary btn-sm">글작성</button></a><br/>
		
	<input type="hidden" id="id" value="${auth_id }">
</div>
<div class="row text-center">
	<c:forEach var="i" begin="0" end="${cnt}" step="1">
		<c:if test="${empty list[i].NO }">
			<c:if test="${auth_level >1 }">
				<a href="/sell/view/${list[i].NO}">
			</c:if>
				<div class="col-sm-3">
					<div class="thumbnail">
					<c:choose>
						<c:when test="${empty list[i].PIC }">
							<img src="/profiles/default02.jpg" class="img-thumbnail" alt="Article Photo" width="200px" height="200px"><br/>
						</c:when>
						<c:otherwise>
							<img src="/sellB_File/${list[i].PIC}" class="img-thumbnail" alt="Article Photo" width="200px" height="200px"><br/>
						</c:otherwise>
					</c:choose>
					<p>
					<c:choose>
						<c:when test="${list[i].CATEGORY eq 0}">
							<strong>기타</strong>
						</c:when>
						<c:when test="${list[i].CATEGORY eq 1}">
							<strong>콘솔</strong>
						</c:when>
						<c:when test="${list[i].CATEGORY eq 2}">
							<strong>게임타이틀</strong>
						</c:when>
						<c:otherwise>
							<strong>주변기기</strong>
						</c:otherwise>
					</c:choose>
					<c:if test="${list[i].STATE == '1' }">
						<span class="label label-info">[거래중]</span>
					</c:if> 
					<c:if test="${list[i].STATE == '2' }">
						<span class="label label-info">[거래완료]</span>
					</c:if>
					</p>
					<p>${list[i].TITLE}  <span class="badge">${list[i].CNT }</span></p>
					</div>
				</div>
		<c:if test="${auth_level >1 }">
			</a>
		</c:if>
		</c:if>
		<c:if test="${i%4 eq 3}">
			<div class="row"></div>
		</c:if>
	</c:forEach>   
</div> 
<script>
//포인트체크 & 레벨 
$("#write").click(function() {
	$.ajax({
		"type" : "POST",
		"async" : false,
		"url" : "/sell/checkpoint",
		"data" : {
			"id" : $("#id").val()
		}
	}).done(function(obj){
		if(obj=="ok"){
			window.alert("보유 포인트와 레벨을 확인하세요");
		}else{
			location.href = "/sell/sellForm";
		}
	})
});

</script>  