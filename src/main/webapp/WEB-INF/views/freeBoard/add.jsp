<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<form action="/freeBoard/add" method="post" autocomplete="off" enctype="multipart/form-data">
		<div class="container">
			<h1>자유게시판</h1>
			<h3>게시판 글작성</h3>
			<form>
				<div class="form-group">
					<label for="comment">작성자</label> <input type="text"
						style="width: 80%;" class="form-control" name="writer"
						value="${auth_id }">
				</div>
				<div class="form-group">
					<label for="comment">글 제목</label> <input type="text"
						class="form-control" style="width: 80%;" name="title">
				</div>
				<div class="form-group">
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" name="coment"
						style="width: 80%;"></textarea>
				</div>
				
				<div class="form-group">
					<label for="comment">File:</label>
					<input type="file" name="attach">
				</div>
				

			</form>
			<button type="submit">글등록</button>
			<button type="reset">재작성</button>
		</div>
		</form>
</body>

