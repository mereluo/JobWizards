<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a BenefitsHighlights</title>
</head>
<body>
	<h1>Create BenefitsHighlights</h1>
	<form action="BenefitsHighlightsCreate" method="post">
		<p>
			<label for="benefitsHighlightsId">BenefitsHighlightsId</label>
			<input id="benefitsHighlightsId" name="benefitsHighlightsId" value="">
		</p>
		<p>
			<label for="highlightPhrase">HighlightPhrase</label>
			<input id="highlightPhrase" name="highlightPhrase" value="">
		</p>
		<p>
			<label for="highlightName">HighlightName</label>
			<input id="highlightName" name="highlightName" value="">
		</p>
		<p>
			<label for="commentCount">CommentCount</label>
			<input id="commentCount" name="commentCount" value="">
		</p>
		<p>
			<label for="job">Job</label>
			<input id="job" name="job" value="">
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