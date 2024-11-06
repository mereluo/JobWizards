<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Find a Job</title>
</head>
<body>
	<form action="findjobs" method="post">
		<h1>Search for a Job by Jobid</h1>
		<p>
			<label for="jobId">JobId</label>
			<input id="jobId" name="jobId" value="${fn:escapeXml(param.jobId)}">
		</p>
		<p>
			<input type="submit">
			<br/><br/><br/>
			<span id="successMessage"><b>${messages.success}</b></span>
		</p>
	</form>
	<br/>
	<div id="jobCreate"><a href="jobcreate">Create Job</a></div>
	<br/>
	<h1>Matching Jobs</h1>
        <table border="1">
            <tr>
                <th>JobId</th>
                <th>Title</th>
                <th>AdvertiserType</th>
                <th>ApplyButtonDisabled</th>
                <th>EasyApply</th>
                <th>PostedDate</th>
                <th>Rating</th>
                <th>Source</th>
                <th>CompanyId</th>
                <th>LocationId</th>
            </tr>
		    <c:if test="${not empty job}">
		        <tr>
		            <td><c:out value="${job.jobId}" /></td>
		            <td><c:out value="${job.title}" /></td>
		            <td><c:out value="${job.advertiserType}" /></td>
		            <td><c:out value="${job.applyButtonDisabled}" /></td>
		            <td><c:out value="${job.easyApply}" /></td>
		            <td><c:out value="${job.postedDate}" /></td>
		            <td><c:out value="${job.rating}" /></td>
		            <td><c:out value="${job.source}" /></td>
		            <td><c:out value="${job.company}" /></td>
		            <td><c:out value="${job.location}" /></td>
		            <td><a href="jobdelete?jobId=<c:out value="${job.getJobId()}"/>">Delete</a></td>
                    <td><a href="jobupdate?jobId=<c:out value="${job.getJobId()}"/>">Update</a></td>
		        </tr>
		    </c:if>
		    <c:if test="${empty job}">
		        <tr>
		            <td colspan="2">No job found with the given ID.</td>
		        </tr>
		    </c:if>
       </table> 
</body>
</html>