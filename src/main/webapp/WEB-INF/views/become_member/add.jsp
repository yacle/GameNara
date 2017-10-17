<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<form action="/become_member/add" method="post" autocomplete="off">
		<div class="container">
			<h1>가입인사 남기기</h1>
			<form>
				<div class="form-group">
					<label for="comment">작성자</label> <input type="text"
						style="width: 80%;" class="form-control" name="id"
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
			<button type="submit" name="end" value="1">글등록</button>
			<button type="reset">재작성</button>
		</div>
</body>

