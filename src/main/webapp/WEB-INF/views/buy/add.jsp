<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<body>
	<form action="/buy/add" method="post" autocomplete="off">
		<div class="container">
			<h1>삽니다</h1>
			<h3>게시판 글작성</h3>
			<form>
				<h4>카테고리 선택 :</h4>
					<input type="checkbox" id="con" value="1"/>콘솔기기
					<input type="checkbox" id="gametitle" value="2"/>게임 타이틀
					<input type="checkbox" id="peripheral" value="3"/>콘솔 주변기기<br/>
				<div class="form-group">
					<label for="comment">작성자</label> <input type="text"
						style="width: 80%;" class="form-control" id="buy_id"
						value="${auth_id }">
				</div>
				<div class="form-group">
					<label for="comment">글 제목</label> <input type="text"
						class="form-control" style="width: 80%;" id="title">
				</div>
				<div class="form-group">
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" id="detail"
						style="width: 80%;"></textarea>
				</div>
			</form>
			<button type="submit">글등록</button>
			<button type="reset">재작성</button>
		</div>
</body>

