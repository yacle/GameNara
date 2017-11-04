<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div align="center">
	<h1>거래후기게시판</h1>
	<h3>게시판 글작성</h3>
</div>
<div>
	<form class="form-horizontal" action="/after/add" method="post" autocomplete="off" enctype="multipart/form-data">
		<div class="form-group">
			<label class="control-label col-sm-3" for="writer">작성자</label> 
			<div class="col-sm-9">
				<input type="text" style="width: 80%;" class="form-control" name="writer" value="${auth_id }" disabled>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="title">글 제목</label> 
			<div class="col-sm-9">
				<input type="text"class="form-control" style="width: 80%;" name="title">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="content">Comment:</label>
			<div class="col-sm-9">
				<textarea class="form-control" rows="5" name="content" style="width: 80%;"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="parent_no">거래글 번호</label>
			<div class="col-sm-9">
				<input type="text"class="form-control" style="width: 80%;" name="parent_no">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="picdata">사진:</label>
			<div class="col-sm-9">
				<input type="file" name="picdata">
			</div>
		</div>
		<div align="center">
			<button type="submit">글등록</button>
			<button type="reset">재작성</button>
		</div>
	</form>
</div>