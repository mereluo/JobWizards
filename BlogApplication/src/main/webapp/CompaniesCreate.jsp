<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a Company</title>
</head>
<body>
	<h1>Create Company</h1>
	<form action="CompaniesCreate" method="post">
		<p>
			<label for="companyId">CompanyId</label>
			<input id="companyId" name="companyId" value="">
		</p>
		<p>
			<label for="companyName">CompanyName</label>
			<input id="companyName" name="companyName" value="">
		</p>
		<p>
			<label for="isExpired">IsExpired</label>
			<input id="isExpired" name="isExpired" value="">
		</p>
		<p>
			<label for="foundedYear">FoundedYear</label>
			<input id="foundedYear" name="foundedYear" value="">
		</p>
		<p>
			<label for="headquarters">Headquarters</label>
			<input id="headquarters" name="headquarters" value="">
		</p>
		<p>
			<label for="companyType">CompanyType</label>
			<input id="companyType" name="companyType" value="">
		</p>
		<p>
			<label for="companySize">CompanySize</label>
			<input id="companySize" name="companySize" value="">
		</p>
		<p>
			<label for="hideCEOInfo">HideCEOInfo</label>
			<input id="hideCEOInfo" name="hideCEOInfo" value="">
		</p>
		<p>
			<label for="isSponsored">IsSponsored</label>
			<input id="isSponsored" name="isSponsored" value="">
		</p>
		<p>
			<label for="revenue">Revenue</label>
			<input id="revenue" name="revenue" value="">
		</p>
		<p>
			<label for="industry">Industry</label>
			<input id="industry" name="industry" value="">
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