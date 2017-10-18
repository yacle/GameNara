<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div align="center">
<h3>보낸사람 : [${sender}]</h3>
보낸시간 : <small><span id="time" name="time"></span></small><br/>
	<textarea rows="15" cols="45" id="content" name="content" value="${content}"/><br/><br/>
	<button type="button" id="del" name="send">삭제</button>
</form>
</div>

