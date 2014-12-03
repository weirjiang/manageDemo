<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center"><b><i>This is a body</i></b></div>
<form action="${basePath}test/startProcess" method="POST">
	<div class="mixtop clearfix">
		<div class="linfo">
			<input type="text" id="reason" placeholder="请输入请假理由" name="reason" /> 
		</div>
		<div class="linfo">
			<input type="text" placeholder="请输入申请人" name="userName" id="userName"></input>
		</div>
		<div class="linfo">
			<input type="text"  placeholder="请输入请假天数" name="time" id="time"></input>
		</div>
	</div>
	
<input type="submit" value="新建test(请假)流程" />
</form>