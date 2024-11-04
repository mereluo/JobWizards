<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a Location</title>
</head>
<body>
	<h1>Create Location</h1>
	<form action="LocationsCreate" method="post">
		<p>
			<label for="locationId">LocationId</label>
			<input id="locationId" name="locationId" value="">
		</p>
		<p>
			<label for="city">City</label>
			<input id="city" name="city" value="">
		</p>
		<p>
			<label for="country">Country</label>
			<input id="country" name="country" value="">
		</p>
		<p>
			<label for="lat">Latitude</label>
			<input id="lat" name="lat" value="">
		</p>
		<p>
			<label for="lng">Longitude</label>
			<input id="lng" name="lng" value="">
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