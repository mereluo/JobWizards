<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a Job</title>
</head>
<body>
	<h1>Create a Job</h1>
	<form action="jobcreate" method="post">
		<p>
			<label for="jobId">jobId</label>
			<input id="jobId" name="jobId" value="">
		</p>
		<p>
			<label for="title">title</label>
			<input id="title" name="title" value="">
		</p>
		<p>
			<label for="advertiserType">advertiserType</label>
			<input id="advertiserType" name="advertiserType" value="">
		</p>
		<p>
			<label for="applyButtonDisabled">applyButtonDisabled</label>
			<input id="applyButtonDisabled" name="applyButtonDisabled" value="">
		</p>
		<p>
			<label for="easyApply">easyApply</label>
			<input id="easyApply" name="easyApply" value="">
		</p>
		<p>
			<label for="postedDate">postedDate</label>
			<input id="postedDate" name="postedDate" value="">
		</p>
		<p>
			<label for="rating">rating</label>
			<input id="rating" name="rating" value="">
		</p>
		<p>
			<label for="source">source</label>
			<input id="source" name="source" value="">
		</p>
		<p>
			<label for="company">company</label>
			<input id="company" name="company" value="">
		</p>
		<p>
			<label for="location">location</label>
			<input id="location" name="location" value="">
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