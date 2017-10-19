<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<form action="/buy/add_rst" method="post" autocomplete="off">
		<div class="container">
			<h1>삽니다</h1>
			<h3>게시판 글수정</h3>
			<form>
			<c:forEach var="obj" items="${one }">
				<input type="hidden" id="num" value="${obj.NO }" />
				<div class="form-group">
					<label for="comment">작성자</label> <input type="text"
						style="width: 80%;" class="form-control" name="buy_id"
						value="${obj.BUY_ID }">
				</div>
				<div class="form-group">
					<label for="comment">글 제목</label> <input type="text"
						class="form-control" style="width: 80%;" name="title" values="${obj.TITLE }">
				</div>
				<div class="form-group">
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" name="detail" id="con1"
						style="width: 80%;" value="${one.DETAIL }"></textarea>
				</div>
			</c:forEach>
			</form>
			<br />
			<a href="/buy/list"><button type="submit" name="end">글등록</button></a>
			<button type="reset">재작성</button>
		</div>
</body>

<script>
	function doOpenCheck(asd) {
		var obj = document.getElementsByName("category");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != asd) {
				obj[i].checked = false;
			}
		}
	}
</script>
<script>

$("#end").click(function(){ 
	$.ajax({
		"type":"post",
		"async": false,
		"url":"/buy/adjust",
		"data":{
			"no":$("#num").val(),
			"title" : $("#title").val(),
			"detail" :$("#con1").val()
		}
	})
})
</script>


