<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a Salary </title>
</head>
<body>
	<h1>Create Salary </h1>
	<form action="SalariesCreate" method="post">
		<p>
			<label for="salaryId">SalaryId</label>
			<input id="salaryId" name="salaryId" value="">
		</p>
		<p>
			<label for="jobTitle">JobTitle</label>
			<input id="jobTitle" name="jobTitle" value="">
		</p>
		<p>
			<label for="payPeriod">PayPeriod</label>
			<input id="payPeriod" name="payPeriod" value="">
		</p>
		<p>
			<label for="payPercentile10">PayPercentile10</label>
			<input id="payPercentile10" name="payPercentile10" value="">
		</p>
		<p>
			<label for="payPercentile50">PayPercentile50</label>
			<input id="payPercentile50" name="payPercentile50" value="">
		</p>
		<p>
			<label for="payPercentile90">PayPercentile90</label>
			<input id="payPercentile90" name="payPercentile90" value="">
		</p>
		<p>
			<label for="salaryType">SalaryType</label>
			<input id="salaryType" name="salaryType" value="">
		</p>
		<p>
			<label for="job">Job</label>
			<input id="job" name="job" value="">
		</p>
		<p>
			<label for="currencyCode">CurrencyCode</label>
			<input id="currencyCode" name="currencyCode" value="">
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