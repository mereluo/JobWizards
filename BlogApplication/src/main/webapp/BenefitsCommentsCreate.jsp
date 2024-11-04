<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a BenefitsComments</title>
</head>
<body>
	<h1>Create BenefitsComments</h1>
	<form action="BenefitsCommentsCreate" method="post">
		<p>
			<label for="benefitsCommentsId">BenefitsCommentsId</label>
			<input id="benefitsCommentsId" name="benefitsCommentsId" value="">
		</p>
		<p>
			<label for="commentCity">CommentCity</label>
			<input id="commentCity" name="commentCity" value="">
		</p>
		<p>
			<label for="commentState">CommentState</label>
			<input id="commentState" name="commentState" value="">
		</p>
		<p>
			<label for="commentContent">CommentContent</label>
			<input id="commentContent" name="commentContent" value="">
		</p>
		<p>
			<label for="createdTime">CreatedTime (yyyy-mm-dd)</label>
			<input id="createdTime" name="createdTime" value="">
		</p>
		<p>
			<label for="commentRating">CommentRating</label>
			<input id="commentRating" name="commentRating" value="">
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