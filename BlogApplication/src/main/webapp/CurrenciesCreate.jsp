<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a Currency</title>
</head>
<body>
	<h1>Create Currency</h1>
	<form action="CurrenciesCreate" method="post">
		<p>
			<label for="currency">CurrencyCode</label>
			<input id="currency" name="currency" value="">
		</p>
		<p>
			<label for="currencyName ">CurrencyName </label>
			<input id="currencyName " name="currencyName " value="">
		</p>
		<p>
			<label for="exchangeRate">ExchangeRate</label>
			<input id="exchangeRate" name="exchangeRate" value="">
		</p>
	</form>
	<br/><br/>
	<p>
		<span id="successMessage"><b>${messages.success}</b></span>
	</p>
</body>
</html>