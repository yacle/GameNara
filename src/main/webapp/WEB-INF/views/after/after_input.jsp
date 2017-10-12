<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container" style="margin-left:200px">
	<h2>거래후기</h2>
	<form action="/log/login" method="post">
		<div class="form-group">
			<label for="title">TITLE:</label>
			<input type="text" class="form-control" name="title" id="title" placeholder="Enter TITLE" style="width:60%">
		</div>
		<div class="form-group">
			<label for="pwd">Deal No:</label>
			<input type="text" class="form-control" name="deal" id="deal" placeholder="Enter Deal_No" style="width:60%">
		</div>
		<div class="form-group">
			<label for="comment">COMMENT:</label>
			<textarea class="form-control" rows="5" id="comment" placeholder="Enter Comment" style="width:60%"></textarea>
		</div>
		<label class="checkbox-inline">
			<input type="checkbox" value="">콘솔기기
		</label>
		<label class="checkbox-inline">
			<input type="checkbox" value="">게임타이틀
		</label>
		<label class="checkbox-inline">
			<input type="checkbox" value="">주변기기
		</label><br/><br/>
		<button type="submit" class="btn btn-default">Submit</button>
	</form>
</div>