<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<form action="/freeBoard/add" method="post" autocomplete="off" enctype="multipart/form-data">
		<div class="container">
			<h1>자유게시판</h1>
			<form>
				<div class="form-group">
					<label for="writer">작성자 : ${auth_id }</label> <input type="hidden"
						style="width: 80%;" class="form-control" name="writer"
						value="${auth_id }">
				</div>
				<div class="form-group">
					<label for="title">글 제목</label> <input type="text"
						class="form-control" style="width: 80%;" name="title" required="required">
				</div>
				<div class="form-group">
					<label for="coment">Comment:</label>
					<textarea class="form-control" rows="5" name="coment"
						style="width: 80%;" required="required"></textarea>
				</div>
				
				<div class="form-group">
					<label for="attach">File:</label>
					<input type="file" name="picdata">
				</div>	
				<input type="hidden" name="lev" value="${auth_level }">
				<button type="submit">글등록</button>
				<button type="reset">재작성</button>
			</form>
		</div>
		</form>
</body>

