<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a industry</title>
</head>
<body>
	<h1>Create industry</h1>
	<form action="IndustryCreate" method="post">
		<p>
			<label for="industryId">IndustryId</label>
			<input id="industryId" name="industryId" value="">
		</p>
		<p>
			<label for="industry">Industry</label>
			<input id="industry" name="industry" value="">
		</p>
		<p>
			<label for="sector">Sector</label>
			<input id="sector" name="sector" value="">
		</p>
		<p>
			<input type="submit">
		</p>
	</form>
	<br/><br/>
	<p>
		<span id="successMessage"><b>${messages.success}</b></span>
	</p>
</body>
</html>