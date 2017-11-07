<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
h2{
	text-align: center;
	padding: 20px;
}

</style>
<h2 class="bg-primary"><strong>ALL of The GAME</strong></h2>
<hr/>
<div class="row" align="center" style="font-size: 18px">
	<div class="col-md-4">
		<h2>[팝니다]</h2>
		<br/>
		<c:choose>
			<c:when test="${auth_id eq null }">
				<div class="row">
					<div class="col-sm-1">
						<c:forEach var="i"  begin="1" end="${data.sellCnt }" >
							<div align="left" style="padding-left: 100px;">
								${i } <br/><br/>
							</div>
						</c:forEach>
					</div>
					<div class="col-sm-11">
						<c:forEach var="i"  items="${data.sell }" >
							<div align="left" style="padding-left: 100px;">
								${fn:substring(i.TITLE, 0, 12)} <br/><br/>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col-sm-1">
						<c:forEach var="i"  begin="1" end="${data.sellCnt }" >
							<div align="left" style="padding-left: 100px;">
								${i } <br/><br/>
							</div>
						</c:forEach>
					</div>
					<div class="col-sm-11">
						<c:forEach var="i"  items="${data.sell }" >
							<div align="left" style="padding-left: 100px;">
								<c:choose>
									<c:when test="${auth_level > 1 }">
										<a href="/sell/view/${i.NO }">${fn:substring(i.TITLE, 0, 12)}</a>
									</c:when>
									<c:otherwise>
										<a href="/notice">${fn:substring(i.TITLE, 0, 12)}</a>
									</c:otherwise>
								</c:choose>
								<br/><br/>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="col-md-4">
		<h2>[삽니다]</h2>
		<br/>
		<c:choose>
			<c:when test="${auth_id eq null }">
				<div class="row">
					<div class="col-sm-1">
						<c:forEach var="i"  begin="1" end="${data.buyCnt }" >
							<div align="left" style="padding-left: 100px;">
								${i } <br/><br/>
							</div>
						</c:forEach>
					</div>
					<div class="col-sm-11">
						<c:forEach var="i"  items="${data.buy }" >
							<div align="left" style="padding-left: 100px;">
								${fn:substring(i.TITLE, 0, 12)} <br/><br/>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col-sm-1">
						<c:forEach var="i"  begin="1" end="${data.buyCnt }" >
							<div align="left" style="padding-left: 100px;">
								${i } <br/><br/>
							</div>
						</c:forEach>
					</div>
					<div class="col-sm-11">
						<c:forEach var="i"  items="${data.buy }" >
							<div align="left" style="padding-left: 100px;">
							<c:choose>
								<c:when test="${auth_level > 1 }">
									<a href="/buy/view/${i.NO }">${fn:substring(i.TITLE, 0, 12)}</a>
								</c:when>
								<c:otherwise>
									<a href="/notice">${fn:substring(i.TITLE, 0, 12)}</a>
								</c:otherwise>
							</c:choose>
							<br/><br/>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="col-md-4">
		<h2>[무료나눔]</h2>
		<br/>
		<c:choose>
			<c:when test="${auth_id eq null }">
				<div class="row">
					<div class="col-sm-1">
						<c:forEach var="i"  begin="1" end="${data.freeCnt }" >
							<div align="left" style="padding-left: 100px;">
								${i } <br/><br/>
							</div>
						</c:forEach>
					</div>
					<div class="col-sm-11">
						<c:forEach var="i"  items="${data.free }" >
							<div align="left" style="padding-left: 100px;">
								${fn:substring(i.TITLE, 0, 12)} <br/><br/>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col-sm-1">
						<c:forEach var="i"  begin="1" end="${data.freeCnt }" >
							<div align="left" style="padding-left: 100px;">
								${i } <br/><br/>
							</div>
						</c:forEach>
					</div>
					<div class="col-sm-11">
						<c:forEach var="i"  items="${data.free }" >
							<div align="left" style="padding-left: 100px;">
							<c:choose>
								<c:when test="${auth_level > 1 }">
									<a href="/FreeDistribute/view/${i.NO }">${fn:substring(i.TITLE, 0, 12)}</a>
								</c:when>
								<c:otherwise>
									<a href="/notice">${fn:substring(i.TITLE, 0, 12)}</a>
								</c:otherwise>
							</c:choose>
							<br/><br/>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div><br/><br/>
<div align="center"><h4>최근 5개 리스트만 보여집니다!!</h4></div><br/>
<script>
$("#sell").click(function(){
	location.href="/notice";
})
</script>