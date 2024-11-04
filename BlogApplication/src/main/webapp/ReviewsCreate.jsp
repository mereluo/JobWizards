<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a Review</title>
</head>
<body>
	<h1>Create Review</h1>
	<form action="ReviewCreate" method="post">
		<p>
			<label for="reviewId">ReviewId</label>
			<input id="reviewId" name="reviewId" value="">
		</p>
		<p>
			<label for="cons">Cons</label>
			<input id="cons" name="cons" value="">
		</p>
		<p>
			<label for="pros">Pros</label>
			<input id="pros" name="pros" value="">
		</p>
		<p>
			<label for="publisher">Publisher</label>
			<input id="publisher" name="publisher" value="">
		</p>
		<p>
			<label for="ratingForCareerOpportunities">RatingForCareerOpportunities</label>
			<input id="ratingForCareerOpportunities" name="ratingForCareerOpportunities" value="">
		</p>
		<p>
			<label for="ratingForCompBenefits">RatingForCompBenefits</label>
			<input id="ratingForCompBenefits" name="ratingForCompBenefits" value="">
		</p>
		<p>
			<label for="ratingForCultureValues">RatingForCultureValues</label>
			<input id="ratingForCultureValues" name="ratingForCultureValues" value="">
		</p>
		<p>
			<label for="ratingOverall">RatingOverall</label>
			<input id="ratingOverall" name="ratingOverall" value="">
		</p>
		<p>
			<label for="ratingForSeniorManagement">RatingForSeniorManagement</label>
			<input id="ratingForSeniorManagement" name="ratingForSeniorManagement" value="">
		</p>
		<p>
			<label for="ratingForWorkLifeBalanace">RatingForWorkLifeBalanace</label>
			<input id="ratingForWorkLifeBalanace" name="ratingForWorkLifeBalanace" value="">
		</p>
		<p>
			<label for="reviewContent">ReviewContent</label>
			<input id="reviewContent" name="reviewContent" value="">
		</p>
		<p>
			<label for="reviewerLocation">ReviewerLocation</label>
			<input id="reviewerLocation" name="reviewerLocation" value="">
		</p>
		<p>
			<label for="reviewerStatus">reviewerStatus</label>
			<input id="reviewerStatus" name="reviewerStatus" value="">
		</p>
		<p>
			<label for="job">job</label>
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