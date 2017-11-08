<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<br/><br/>
<div class="row">
	<div class="col-sm-2" ></div>
	<div class="col-sm-6">
		<div class="row">
			<div class="col-sm-12">
				<h4>대화상대 : ${vo.receiver }<small>(${vo.adddate })</small></h4>
			</div>	
		</div><hr/>
		<div class="row">
			<div class="col-sm-12">
				<h5>${vo.content }</h5>
			</div>	
		</div>
	</div>
	<div class="col-sm-4"><button type="button" class="btn btn-default" onClick="history.back()">목록</button></div>
</div>
