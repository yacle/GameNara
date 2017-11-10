<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
textarea {
	width: 500%;
	height: 600px;
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px;
}
</style>
<body>
		<div class="container">
			<h1>Q&A</h1>
			<p><h4>문의사항이나 건의사항을 보내주시면 빠른시간내에 확인후 조취를 취하겠습니다.</h4></p>
			<hr/>
				<br/><div class="form-group">
				<input type="hidden" id="receiver" name="receiver" value="qnamanager" />
					<label for="comment" for="writer">작성  자</label> <input type="text"
						style="width: 80%;" class="form-control" name="sender" id="sender"
						value="${auth_id }" disabled>
				</div>
				<div class="form-group">
					<label for="comment">보낼 내용</label> 
					<textarea class="form-control" rows="5" name="content" id="content" style="width: 80%; height : 300px;" placeholder="[문의사항 & 건의 사항]"></textarea>
				</div>
			</form>
			<br/>
			<button type="button" id="send" name="send">보내기</button>
			<button type="reset">재작성</button>
		</div>
</body>
<script >
$("#send").click(function(){
	$.ajax({
		"type":"post",
		"async":true,
		"url":"/chat/note_send",
		"data":{
			"receiver":$("#receiver").val(),
			"sender":$("#sender").val(),
			"content":"[문의사항 & 건의 사항]"+"<br/>"+$("#content").val(),
		}
	}).done(function(obj){
		window.alert("[성공적으로 보냈습니다. 감사합니다.]");
	})
	location.href = "/index/1";
})
</script>


