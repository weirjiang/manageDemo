<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div align="center"><b><i>This is a body</i></b></div>
<form action="${basePath}test/manager1Approve" method="POST">
	<div class="mixtop clearfix">
		<div class="linfo">
			<input type="text" id="reason" placeholder="请输入请假理由" name="reason" value="${reason}"/> 
		</div>
		<div class="linfo">
			<input type="text" placeholder="请输入申请人" name="userName" id="userName" value="${userName}"></input>
		</div>
		<div class="linfo">
			<input type="text"  placeholder="请输入请假天数" name="time" id="time" value="${time}"></input>
		</div>
		<div class="linfo">
			<input type="text"  placeholder="请输入审核意见" name="manager1option" id="manager1option" ></input>
		</div>
	</div>
	
<input type="submit" value="同意" />
</form>