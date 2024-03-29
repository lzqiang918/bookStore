<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="js/jqueryui/css/jquery-ui-1.10.2.css" />
<script src="js/jqueryui/js/jquery-1.9.1.js"></script>
<script src="js/jqueryui/js/jquery-ui-1.10.2.js"></script>
<script src="js/jqueryui/js/datepicker-zh-CN.js"></script>
<script>
$(function() {
	// 初始化日期插件
	$( "#datepicker" ).datepicker({
		//showButtonPanel: true,//显示按钮栏
		//showOtherMonths: true,//显示其他月份
		//changeMonth: true,//显示月份菜单
		//changeYear: true,//显示年份菜单
		//numberOfMonths: 3,//显示月份数量
		//showOn: "button",//显示按钮
		//buttonImage: "jqueryui/css/images/calendar.gif",//图片地址
		//buttonImageOnly: true,//是否按钮只显示为图片
		//minDate: -3,//开始日期(当天为0)
		//maxDate: "+1Y +1M +1D",//今天之后的天数
	});
	$( "#datepicker" ).datepicker("option", "zh-CN");
	$( "#datepicker" ).datepicker('setDate', new Date());	//设置初识日期
});
</script>
</head>
<body>
	
	<form action="bookUpdate" method="post" enctype="multipart/form-data">

		<input type="hidden" name="page" value="${param.page}"/>
		
		<input type="hidden" name="id" value="${book.id}"/>
		<input type="hidden" name="cover" value="${book.cover}"/>

		封面：<img src="../${book.cover}" width="150px" height="150px">
		<br>
		修改: <input type="file" name="file" size="12"/><br>
		书名：<input type="text" name="name" value="${book.name}" required="required"/><br>
		价格：<input type="text" name="price" value="${book.price}" required="required"/><br>
		库存：<input type="text" name="count" value="${book.count}" required="required"/><br>
		介绍：<input type="text" name="intro" value="${book.intro}" required="required"/><br>
		作者：<input type="text" name="auther" value="${book.auther}"/><br>
		出版社：<input type="text" name="press" value="${book.press}"/><br>
		出版日期：<input type="text" id="datepicker" name="pubdate" value="${book.pubdate}"/><br>
		图书分类:  <select name="categoryId">
						<c:forEach var="category" items="${categoryList}">
							<c:if test="${book.category.id==categoryId}">
								<option value="${category.id}" selected="selected">${category.name}</option>
							</c:if>
							<c:if test="${book.category.id!=categoryId}">
								<option value="${category.id}">${category.name}</option>
							</c:if>
						</c:forEach>
				   </select>
		<input type="submit" value="修改"/>
		
	</form>
		
	<p style="color:red;">${msg}</p>
	
</body>
</html>
