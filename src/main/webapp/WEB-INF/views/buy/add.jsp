<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>
	<form action="/buy/add" method="post" autocomplete="off">
		<div class="container">
			<h1>��ϴ�</h1>
			<h3>�Խ��� ���ۼ�</h3>
			<form>
				<h4>ī�װ� ���� :</h4>
					<input type="checkbox" id="con" value="1"/>�ֱܼ��
					<input type="checkbox" id="gametitle" value="2"/>���� Ÿ��Ʋ
					<input type="checkbox" id="peripheral" value="3"/>�ܼ� �ֺ����<br/>
				<div class="form-group">
					<label for="comment">�ۼ���</label> <input type="text"
						style="width: 80%;" class="form-control" id="buy_id"
						value="${auth_id }">
				</div>
				<div class="form-group">
					<label for="comment">�� ����</label> <input type="text"
						class="form-control" style="width: 80%;" id="title">
				</div>
				<div class="form-group">
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" id="detail"
						style="width: 80%;"></textarea>
				</div>
			</form>
			<button type="submit">�۵��</button>
			<button type="reset">���ۼ�</button>
		</div>
</body>
</html>
