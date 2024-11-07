<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Recommendations</title>
</head>
<body>
    <form action="jobrecommendation" method="post">
        <h2>Select Your Preferences:</h2>
        <input type="checkbox" name="ratingCriteria" value="RatingForOverall"> Overall Rating<br>
        <input type="checkbox" name="ratingCriteria" value="RatingForCareerOpportunities"> Career Opportunities<br>
        <input type="checkbox" name="ratingCriteria" value="RatingForCompBenefits"> Company Benefits<br>
        <input type="checkbox" name="ratingCriteria" value="RatingForCultureValues"> Culture and Values<br>
        <input type="checkbox" name="ratingCriteria" value="RatingForSeniorManagement"> Senior Management<br>
        <input type="checkbox" name="ratingCriteria" value="RatingForWorkLifeBalanace"> Work-Life Balance<br>
        
        <input type="submit" value="Get Recommendations">
    </form>

    <!-- Section to display recommended jobs -->
    <div>
        <h2>Recommended Jobs:</h2>
        <c:forEach var="job" items="${jobList}">
            <p>Job Title: ${job.title}</p>
            <p>Company: ${job.company.companyName}</p>
            <hr>
        </c:forEach>
    </div>
</body>
</html>