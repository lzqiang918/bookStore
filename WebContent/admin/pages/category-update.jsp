<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<form action="categoryUpdate" method="post" >
	
		<input type="hidden" name="page" value="${param.page}"/>

		<input type="hidden" name="id" value="${category.id}"/>
		
		名称：<input type="text" name="name" value="${category.name}" required="required"/>
		
		<input type="submit" value="修改"/>
		
		<p style="color:red;">${msg}</p>
		
	</form>
	
</body>
</html>
