<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<form action="/buy/add" method="post" autocomplete="off">
		<div class="container">
			<h1>삽니다</h1>
			<h3>게시판 글작성</h3><br/>
			<small>※글작성시 500point차감</small>
			<hr/>
			<form>
				<div>
					<h4>카테고리 선택 </h4>
					<input type="checkbox" name="category" value="1" checked="checked"
						onclick="doOpenCheck(this);" />콘솔기기 <input type="checkbox"
						name="category" value="2" onclick="doOpenCheck(this);" />게임 타이틀 <input
						type="checkbox" name="category" value="3"
						onclick="doOpenCheck(this);" />콘솔 주변기기<input type="checkbox"
						name="category" value="0" onclick="doOpenCheck(this);" />기타
				</div>
				<br/><div class="form-group">
					<label for="comment">작성자</label> <input type="text"
						style="width: 80%;" class="form-control" name="buy_id"
						value="${auth_id }">
				</div>
				<div class="form-group">
					<label for="comment">글 제목</label> <input type="text"
						class="form-control" style="width: 80%;" name="title">
				</div>
				<div class="form-group">
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" name="detail"
						style="width: 80%;"></textarea>
				</div>
			</form>
			<br />
			<button type="submit" name="end" value="1">글등록</button>
			<button type="reset">재작성</button>
		</div>
</body>

<script>
//카테고리 1개만 선택
	function doOpenCheck(asd) {
		var obj = document.getElementsByName("category");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != asd) {
				obj[i].checked = false;
			}
		}
	}
</script>


