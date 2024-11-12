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
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
	<style>
	    /* Apply Inter font */
	    body {
	        font-family: 'Inter', sans-serif;
	        margin: 0;
	        padding: 0;
	        background-color: #f9f9f9; /* Set page background to a slightly greyer color */
	    }
	    #header {
	        background-color: #ffffff; /* Set header background to white */
	        padding: 20px;
	        text-align: center;
	    }
	    #navbar {
	        background-color: #ffffff; /* Set navbar background to white */
	        display: flex;
	        align-items: center;
	        padding: 20px;
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow under navbar for distinction */
	        border-bottom: 1px solid #ddd;
	    }
	    #navbar #logo {
	        margin-right: 20px;
	    }
	    .nav-item {
	        position: relative;
	        cursor: pointer;
	        padding: 10px;
	        font-size: 14px; /* Slightly smaller font size for label */
	        color: #555; /* Gray color for label text */
	        margin-bottom: 5px; /* Space between label and value */
	    }
	    .nav-item a {
	        text-decoration: none;
	        color: #000;
	        padding: 10px 20px;
	    }
	    .nav-item:hover {
	        background-color: #e0f4e0; /* Light green background on hover */
	        border-radius: 10px;
	    }
	    .nav-item.active {
	        background-color: #e0f4e0;
	        border-radius: 10px;
	    }
	    .dropdown-content {
	        display: none;
	        position: absolute;
	        top: 100%;
	        left: 0;
	        background-color: #ffffff;
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	        z-index: 1;
	        min-width: 150px;
	        border-radius: 10px;
	        overflow: hidden;
	    }
	    .dropdown-content a {
	        padding: 10px 20px;
	        display: block;
	        text-decoration: none;
	        color: #000;
	        border-bottom: 1px solid #ddd;
	    }
	    .dropdown-content a:hover {
	        background-color: #e0f4e0; /* Light green background on hover for dropdown items */
	    }
	    .nav-item:hover .dropdown-content {
	        display: block;
	    }
	    #jobSearchContainer {
	        margin-left: auto;
	    }
	    #jobSearchBar {
	        width: 300px;
	        padding: 10px;
	        font-size: 16px;
	        border: 1px solid #ccc;
	        border-radius: 0;
	    }
	    #searchButton {
	        padding: 10px 20px;
	        font-size: 16px;
	        border: 1px solid #ccc;
	        border-left: none;
	        border-radius: 0 25px 25px 0;
	        background-color: #4CAF50;
	        color: white;
	        cursor: pointer;
	    }
	    #searchButton:hover {
	        background-color: #45a049;
	        transform: scale(1.05);
	        transition: transform 0.3s, background-color 0.3s;
	    }

	/* Styles for the preference cards */
	    .preferences-container {
	        display: flex;
	        flex-direction: column;
	        align-items: center;
	        margin-top: 30px;
	        width: 100%;
	        max-width: 900px;
	        margin: 0 auto;
	    }
	    .preferences-container h2 {
	        color: #333;
	        text-align: center;
	    }
	    .card-grid {
	        display: grid;
	        grid-template-columns: repeat(3, 1fr); /* Three fixed columns */
	        gap: 20px; /* Consistent spacing between cards */
	        width: 100%;
	    }
	    .preference-card {
	        border: 1px solid #ddd;
	        border-radius: 10px;
	        padding: 20px;
	        text-align: center;
	        cursor: pointer;
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	        transition: transform 0.2s, background-color 0.2s;
	    }
	    .preference-card:hover {
	        transform: scale(1.05);
	        background-color: #f0f9f0;
	    }
	    .preference-card.selected {
	        background-color: #e0f4e0;
	        border: 2px solid #4CAF50;
	    }
	    .preference-checkbox {
	        display: none;
	    }
	
	    /* Styling the submit button */
	    .submit-button-container {
	        text-align: center;
	        margin-top: 30px;
	    }
	    .submit-button {
	        padding: 12px 30px;
	        font-size: 18px;
	        font-weight: bold;
	        color: white;
	        background-color: #4CAF50;
	        border: none;
	        border-radius: 8px;
	        cursor: pointer;
	        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	        transition: background-color 0.3s, transform 0.3s;
	    }
	    .submit-button:hover {
	        background-color: #45a049;
	        transform: scale(1.1);
	    }
    
    		/* Center the job card and add margin for slight left positioning */
		.job-card-container {
		    display: flex;
		    justify-content: center;
		    margin-top: 30px;
		}
		
		.job-card {
		    max-width: 800px;
		    margin-right: 20px; /* Shift the card slightly to the left */
		    background-color: #ffffff;
		    border: 1px solid #ddd;
		    border-radius: 10px;
		    padding: 40px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		}
	
	    .section-title {
	        background-color: #f7f7f7; /* Light gray background */
	        padding: 10px 15px; /* Padding for the title section */
	        border-radius: 5px; /* Rounded corners */
	        margin-bottom: 20px; /* Space below the section title */
	        text-align: left; /* Left align the section title */
	    }
	    .job-main-info {
	        font-size: 22px; /* Increased font size for main information */
	        margin-bottom: 20px; /* Space below each element */
	        text-align: center; /* Center the JobId and Title */
	    }
	    .job-details {
	        display: flex;
	        flex-wrap: wrap; /* Wrap elements to fit within the card */
	        justify-content: flex-start; /* Align key-value pairs to the left */
	        gap: 50px; /* Space between items for better readability */
	        margin-bottom: 20px; /* Space at the bottom of job details section */
	    }
	    .job-details-item {
	        display: flex;
	        flex-direction: column; /* Stack label above value */
	        width: 300px; /* Fixed width for consistent alignment */
	        text-align: left; /* Align label and value to the left */
	    }
	    .job-details-item label {
	        font-size: 14px; /* Slightly smaller font size for label */
	        color: #555; /* Gray color for label text */
	        margin-bottom: 5px; /* Space between label and value */
	    }
	    .job-details-item span {
	        font-size: 18px; /* Larger font size for the value */
	    }
	    .job-actions {
	        display: flex; /* Use flexbox for the action buttons */
	        justify-content: space-between; /* Position buttons at opposite ends */
	        margin-top: 30px; /* Increased space above actions */
	    }
	    .job-actions a {
	        text-decoration: none;
	        color: white;
	        background-color: #007BFF; /* Blue color for action buttons */
	        padding: 10px 20px;
	        border-radius: 5px;
	    }
	    .job-actions a.delete-button {
	        background-color: #FF4136; /* Red color for Delete button */
	    }
	    .job-actions a:hover {
	        background-color: #0056b3; /* Darker blue on hover for Update button */
	    }
	    .job-actions a.delete-button:hover {
	        background-color: #e60000; /* Darker red on hover for Delete button */
	    }
	    
	    /* Styles for empty cards */
	     .empty-card {
	         border: 1px solid #ddd;
	         border-radius: 10px;
	         padding: 20px;
	         margin: 10px;
	         background-color: #fafafa;
	         width: calc(45% - 20px); /* Two cards per row with some margin */
	         display: inline-block;
	         text-align: center;
	         vertical-align: top; /* Align cards to the top */
	     }
	
	     #emptyCardsContainer {
	         text-align: center;
	         margin-top: 20px;
	     }
	     
	     
		/* Action menu styles */
		.action-menu {
		    display: flex;
		    flex-direction: column;
		    align-items: flex-start;
		    margin-left: 120px; /* Bring the action menu closer to the card */
		    margin-top: 20px;
		    font-size: 16px;
		}
		
		.action-item {
		    display: flex;
		    align-items: center;
		    padding: 8px 0;
		    cursor: pointer;
		    color: #333;
		    text-decoration: none;
		}
		
		.action-item:hover {
		    color: #0056b3;
		}
		
		.action-item.delete {
		    color: #FF4136;
		}
		
		.action-item.delete:hover {
		    color: #e60000;
		}
		
		/* Icon styling */
		.action-item i {
		    margin-right: 8px;
		    font-size: 18px;
		}
		
	    /* Hover effect for the job card */
	    .random-job-card:hover {
	        transform: scale(1.05); /* Slightly increase the card size */
	        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Stronger shadow on hover */
	    }
	
	    /* Truncate long titles with ellipsis */
	    .random-job-title {
	        white-space: nowrap;
	        overflow: hidden;
	        text-overflow: ellipsis;
	    }
	    
		
		/* Styling for the selected criteria section */
		.selected-criteria-container {
		    text-align: center;
		    margin: 20px auto;
		    font-size: 16px;
		    font-family: 'Inter', sans-serif;
		}
		
		.selected-criteria-container p {
		    display: inline; /* Keep "Selected Criteria:" inline with items */
		    color: #000; /* Black color for the label */
		    margin-right: 10px;
		}
		
		.selected-criteria-list {
		    display: inline-block; /* Align criteria items in a row */
		    font-weight: normal;
		    color: #555;
		    background-color: #f0f9f0; /* Light green background for each criteria */
		    padding: 4px 8px;
		    border-radius: 5px;
		    margin-right: 5px;
		}
		
		.styled-dropdown {
		    border: 1px solid #ccc;
		    border-radius: 25px 0 0 25px;
		    padding: 10px 15px;
		    font-size: 16px;
		    color: #555;
		    background-color: #e0f4e0; /* Light green background */
		    cursor: pointer;
		    outline: none;
		    appearance: none; /* Remove default dropdown arrow */
		    margin-right: -1px; /* Ensures smooth transition between dropdown and input */
		}
		
		.styled-dropdown:hover {
		    background-color: #d0e7d0; /* Slightly darker green on hover */
		}
		
		.styled-dropdown:focus {
		    border-color: #4CAF50;
		}
		
		/* Custom arrow for the dropdown */
		.styled-dropdown::after {
		    content: '\25BC';
		    position: absolute;
		    right: 15px;
		    color: #777;
		}


</style>


	
	<script>
	    // JavaScript to toggle the 'selected' class on preference cards when clicked
		function toggleCard(card) {
		    const checkbox = card.querySelector('.preference-checkbox');
		    checkbox.checked = !checkbox.checked;
		    card.classList.toggle('selected', checkbox.checked);
		}
	</script>
</head>

<body>
    <!-- Header Section -->
    <div id="header">
        <div id="logo">
            <img src="/BlobApplication2/pic/jwLogo2.PNG" alt="Logo" height="150px">
            <img src="/BlobApplication2/pic/jwLogo.PNG" alt="Logo" height="150px">
        </div>
    </div>

    <!-- Navigation Bar -->
    <div id="navbar">
        <div id="logo">
            <img src="/BlobApplication2/pic/jwLogo.PNG" alt="Jobwizard Logo" height="50px">
        </div>
        <div class="nav-item">
            <a href="jobwizards">Main</a>
        </div>
		<div class="nav-item ${currentPage == 'jobcreate' ? 'active' : ''}">
		    <a href="#">Create New <i class="fas fa-chevron-down"></i></a>
		    <div class="dropdown-content">
		        <a href="jobcreate">Job</a>
		        <a href="#">Company</a>
		        <a href="#">Review</a>
		    </div>
		</div>
        <div class="nav-item">
            <a href="jobrecommendation">Job Recommendation</a>
        </div>
        <div class="nav-item">
            <a href="#">About Us  <i class="fas fa-chevron-down"></i></a>
            <div class="dropdown-content">
                <a href="#">Team</a>
                <a href="#">Git Repo</a>
            </div>
        </div>
        <!-- Job Search Bar -->
        
        <!-- Job Search Bar -->
		<div id="jobSearchContainer">
		    <form action="" method="post" style="display: inline-flex;">
		        <!-- Styled Dropdown to select search type -->
		        <select id="searchType" name="searchType" onchange="updateFormAction()" class="styled-dropdown">
		            <option value="id">Search by ID</option>
		            <option value="name">Search by Name</option>
		        </select>
		        
		        <!-- Search input -->
		        <input id="jobSearchBar" type="text" name="searchQuery" value="${fn:escapeXml(param.searchQuery)}" placeholder="Enter Job ID or Name" style="width: 300px; padding: 10px; font-size: 16px; border: 1px solid #ccc; border-left: none;">
		        
		        <!-- Submit button -->
		        <button id="searchButton" type="submit" class="search-button">
		            <i class="fas fa-search"></i> <!-- Magnifying glass icon -->
		        </button>
		      
		    </form>
		    
		    
		    
		</div>

		
		<script>
		    function updateFormAction() {
		        const form = document.querySelector("form");
		        const searchType = document.getElementById("searchType").value;
		        
		        if (searchType === "id") {
		            form.action = "findjobs"; // Servlet for searching by ID
		        } else if (searchType === "name") {
		            form.action = "findjobsbyname"; // Servlet for searching by Name
		        }
		    }
		
		    // Set initial form action on page load
		    window.onload = updateFormAction;
		</script>
    </div>
    <br></br>

	<div class="preferences-container">
	    <h2>Select Your Preferences:</h2>
	    <form action="jobrecommendation" method="post">
	        <div class="card-grid">
	            <div class="preference-card" onclick="toggleCard(this)">
	                <input type="checkbox" class="preference-checkbox" name="ratingCriteria" value="RatingForOverall"
	                    <c:if test="${ratingCriteria != null && fn:contains(ratingCriteria, 'RatingForOverall')}">checked</c:if>>
	                Overall Rating
	            </div>
	            <div class="preference-card" onclick="toggleCard(this)">
	                <input type="checkbox" class="preference-checkbox" name="ratingCriteria" value="RatingForCareerOpportunities"
	                    <c:if test="${ratingCriteria != null && fn:contains(ratingCriteria, 'RatingForCareerOpportunities')}">checked</c:if>>
	                Career Opportunities
	            </div>
	            <div class="preference-card" onclick="toggleCard(this)">
	                <input type="checkbox" class="preference-checkbox" name="ratingCriteria" value="RatingForCompBenefits"
	                    <c:if test="${ratingCriteria != null && fn:contains(ratingCriteria, 'RatingForCompBenefits')}">checked</c:if>>
	                Company Benefits
	            </div>
	            <div class="preference-card" onclick="toggleCard(this)">
	                <input type="checkbox" class="preference-checkbox" name="ratingCriteria" value="RatingForCultureValues"
	                    <c:if test="${ratingCriteria != null && fn:contains(ratingCriteria, 'RatingForCultureValues')}">checked</c:if>>
	                Culture and Values
	            </div>
	            <div class="preference-card" onclick="toggleCard(this)">
	                <input type="checkbox" class="preference-checkbox" name="ratingCriteria" value="RatingForSeniorManagement"
	                    <c:if test="${ratingCriteria != null && fn:contains(ratingCriteria, 'RatingForSeniorManagement')}">checked</c:if>>
	                Senior Management
	            </div>
	            <div class="preference-card" onclick="toggleCard(this)">
	                <input type="checkbox" class="preference-checkbox" name="ratingCriteria" value="RatingForWorkLifeBalance"
	                    <c:if test="${ratingCriteria != null && fn:contains(ratingCriteria, 'RatingForWorkLifeBalance')}">checked</c:if>>
	                Work-Life Balance
	            </div>
	        </div>
	        <div class="submit-button-container">
	            <input type="submit" class="submit-button" value="Get Recommendations">
	        </div>
	    </form>
	</div>

	
	<c:if test="${not empty ratingCriteria}">
	    <div class="selected-criteria-container">
	        <p>Selected Criteria:</p>
	        <c:forEach var="criteria" items="${ratingCriteria}">
	            <span class="selected-criteria-list">
	                <c:choose>
	                    <c:when test="${criteria == 'RatingForOverall'}">Overall Rating</c:when>
	                    <c:when test="${criteria == 'RatingForCareerOpportunities'}">Career Opportunities</c:when>
	                    <c:when test="${criteria == 'RatingForCompBenefits'}">Company Benefits</c:when>
	                    <c:when test="${criteria == 'RatingForCultureValues'}">Culture and Values</c:when>
	                    <c:when test="${criteria == 'RatingForSeniorManagement'}">Senior Management</c:when>
	                    <c:when test="${criteria == 'RatingForWorkLifeBalance'}">Work-Life Balance</c:when>
	                    <c:otherwise>${criteria}</c:otherwise>
	                </c:choose>
	            </span>
	        </c:forEach>
	    </div>
	</c:if>


   
   <!-- Section to display recommended jobs as clickable cards -->
	<div>
	    <div id="recommendedJobsContainer" style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center;">
	       <c:forEach var="job" items="${jobList}">
	           <div class="random-job-card" 
	                onclick="window.location.href='findjobs?searchQuery=${job.jobId}'" 
	                style="background-color: #ffffff; border: 1px solid #ddd; border-radius: 10px; padding: 20px; width: 280px; height: 250px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); transition: transform 0.3s, box-shadow 0.3s; display: flex; flex-direction: column; justify-content: space-between; cursor: pointer;">
	                
	            <!-- Title and Heart Icon Row -->
	            <div style="display: flex; justify-content: space-between; align-items: center;">
	                <h3 class="job-title" style="font-size: 18px; margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 260px;">
	                    ${job.title}
	                </h3>
	                <a href="javascript:void(0);" title="Mark as Interested" onclick="toggleHeart(this); event.stopPropagation();" style="color: #ff6b6b;">
	                    <i class="fa-regular fa-heart" style="font-size: 18px;" id="heartIcon-${job.jobId}"></i>
	                </a>
	            </div>
	
	            <!-- Company and Location Info -->
	            <p style="margin: 5px 0;">JobID: ${job.jobId}</p>
	            <p style="margin: 5px 0;">Company: ${job.company.companyName}</p>
	            <p style="margin: 5px 0;">Location: ${job.location.city}</p>
	              
	            <!-- Rating with Stars -->
	            <p style="margin: 5px 0;">Rating:
	                <c:forEach var="star" begin="1" end="${job.rating}">
	                    <i class="fas fa-star" style="color: #ffd700;"></i>
	                </c:forEach>
	            </p>
	               
	               <!-- Share Icons -->
	               <div style="display: flex; gap: 10px; justify-content: center; margin-top: 10px;">
	                   <a href="https://www.linkedin.com/shareArticle?mini=true&url=${pageUrl}&title=${job.title}" target="_blank" title="Share on LinkedIn" onclick="event.stopPropagation();">
	                       <i class="fab fa-linkedin" style="font-size: 18px; color: #0e76a8;"></i>
	                   </a>
	                   <a href="https://twitter.com/intent/tweet?text=Check out this job at ${job.company.companyName}: ${pageUrl}" target="_blank" title="Share on Twitter" onclick="event.stopPropagation();">
	                       <i class="fab fa-twitter" style="font-size: 18px; color: #1da1f2;"></i>
	                   </a>
	                   <a href="mailto:?subject=Job Opportunity at ${job.company.companyName}&body=Check out this job: ${pageUrl}" title="Share via Email" onclick="event.stopPropagation();">
	                       <i class="fas fa-envelope" style="font-size: 18px; color: #888;"></i>
	                   </a>
	               </div>
	           </div>
	       </c:forEach>
	    </div>
	    
	    <!-- Toggle Heart Script -->
        <script>
            function toggleHeart(element) {
                const heartIcon = element.querySelector("i");
                if (heartIcon.classList.contains("fa-regular")) {
                    heartIcon.classList.remove("fa-regular");
                    heartIcon.classList.add("fa-solid"); // switch to filled heart
                } else {
                    heartIcon.classList.remove("fa-solid");
                    heartIcon.classList.add("fa-regular"); // switch back to empty heart
                }
            }
        </script>
	</div>
    
</body>
</html>
