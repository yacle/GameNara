<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>페이징</title>
<script type="text/javascript">
	function goPage(pageNo){
		document.listForm.pageNo.value = pageNo;
		document.listForm.submit();
		console.log("pageNo : " + pageNo);
	}

</script>

<style type="text/css">
	.selected {font-weight: bold;}
</style>

</head>
<body>
	나오나?<br/><br/>
	<form name="listForm" action="/paging" method="post">
		<input type="hidden" name="bno" value="30206">
		<input type="text" name="pageNo" value="" /><br/><br/>
 		<table style="width: 100%;" class="table_02"> 
 			<colgroup> 
 				<col width="5%" /> 
 				<col width="5%" /> 
 				<col width="70%" /> 
 				<col width="10%" /> 
 				<col width="10%" /> 
 			</colgroup> 
 			<thead> 
 				<tr> 
 					<th>BNO</th> 
 					<th>RNO</th> 
 					<th>내용</th> 
 					<th>작성자</th> 
 					<th>입력일자</th> 
 				</tr> 
 			</thead> 
 			<tbody> 
 				<c:if test="${!empty replyList }"> 
 					<c:forEach var="data" items="${replyList }"> 
 						<tr> 
 							<td>${data.rno }</td> 
 							<td>${data.bno }</td> 
 							<td>${data.replytext }</td> 
 							<td>${data.replyer }</td> 
 							<td>${data.regdate }</td> 
 						</tr> 
 					</c:forEach> 
 				</c:if> 
 			</tbody> 
 		</table> 
		
		<jsp:include page="paging.jsp" flush="true">
			<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
			<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
			<jsp:param name="startPageNo" value="${paging.startPageNo}" />
			<jsp:param name="pageNo" value="${paging.pageNo}" />
			<jsp:param name="endPageNo" value="${paging.endPageNo}" />
			<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
			<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
		</jsp:include>
	</form>
</body>