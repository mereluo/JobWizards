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
            <img src="/BlobApplication2/pic/logo.PNG" alt="Jobwizard Logo" height="50px">
        </div>
        <div class="nav-item ${currentPage == 'jobwizards' ? 'active' : ''}">
            <a href="jobwizards">Main</a>
        </div>
        <div class="nav-item">
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
    
	<!-- Container for "What's Trending" and "Feeling Lucky?" on the Same Line -->
	<div style="display: flex; justify-content: space-between; align-items: center; max-width: 90%; width: 100%; margin: 30px auto 0; padding: 0px 5%;">
	
	    <!-- "What's Trending" Heading on the Left -->
	    <h2 style="font-size: 24px; font-weight: bold; color: #333; margin: 0; margin-left: 100px;">What's Trending</h2>
	
	    <!-- Feeling Lucky Action Item on the Right -->
	    <a href="javascript:void(0);" onclick="feelingLucky()" class="action-item" 
	       style="display: flex; align-items: center; font-size: 18px; color: #93C572; text-decoration: none; cursor: pointer; margin-right: 100px;">
	        <i class="fas fa-magic" style="margin-right: 8px;"></i> Feeling lucky?
	    </a>
	</div>
    
	<div style="display: flex; justify-content: center; margin-top: 20px;">
	    <c:if test="${empty jobList}">
	        <!-- Display the empty card by default if no job is found -->
	        <div id="emptyCardsContainer">
	            <div class="empty-card">
	                <p>Updating Job Card...</p>
	            </div>
	            <div class="empty-card">
	                <p>Updating Job Card...</p>
	            </div>
	            <div class="empty-card">
	                <p>Updating Job Card...</p>
	            </div>
	            <div class="empty-card">
	                <p>Updating Job Card...</p>
	            </div>
	        </div>
	    </c:if>
	    
		<div id="recommendedJobsContainer" style="display: flex; flex-wrap: wrap; gap: 15px; justify-content: center; margin: 20px auto; max-width: 90%;">
		    <c:forEach var="job" items="${jobList}">
		        <div class="random-job-card" 
		             onclick="window.location.href='findjobs?searchQuery=${job.jobId}'" 
		             style="background-color: #ffffff; border: 1px solid #ddd; border-radius: 10px; padding: 15px; width: 25%; height: 250px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); transition: transform 0.3s, box-shadow 0.3s; display: flex; flex-direction: column; justify-content: space-between; cursor: pointer;">
		
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
					    <!-- Display full stars -->
					    <c:forEach var="star" begin="1" end="${job.rating >= 5 ? 5 : job.rating.intValue()}">
					        <i class="fas fa-star" style="color: #ffd700;"></i>
					    </c:forEach>
					
					    <!-- Display half star if there is a fractional part, but only if it keeps total stars at 5 -->
					    <c:if test="${job.rating < 5 && job.rating % 1 != 0}">
					        <i class="fas fa-star-half-alt" style="color: #ffd700;"></i>
					    </c:if>
					
					    <!-- Display empty stars to complete a total of 5 stars -->
					    <c:forEach var="emptyStar" begin="1" end="${5 - job.rating.intValue() - (job.rating % 1 != 0 && job.rating < 5 ? 1 : 0)}">
					        <i class="far fa-star" style="color: #ffd700;"></i>
					    </c:forEach>
					</p>


		            
		            <!-- Share Icons Row -->
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
		    </c:forEach>
		</div>
		
		<script>
		    // JavaScript function to handle "Feeling lucky?" action
		    function feelingLucky() {
		        const jobCards = document.querySelectorAll('.random-job-card');
		        if (jobCards.length > 0) {
		            // Select a random job card and navigate to its link
		            const randomIndex = Math.floor(Math.random() * jobCards.length);
		            const randomJobCard = jobCards[randomIndex];
		            window.location.href = randomJobCard.getAttribute('onclick').replace('window.location.href=', '').replace(/'/g, '');
		        }
		    }
		</script>

	</div>
	
	<a href="javascript:void(0);" onclick="openHelp()" class="action-item"
	   style="position: fixed; bottom: 20px; right: 20px; display: flex; align-items: center; font-size: 18px; color: #007BFF; background-color: #ffffff; padding: 10px 15px; border-radius: 50%; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-decoration: none; cursor: pointer; z-index: 1000;">
	    <i class="fas fa-lightbulb" style="font-size: 20px;"></i>
	</a>
	
	<script>
	    function openHelp() {
	        alert("What's trending: Displays the current high rating jobs. Feeling lucky: Displays one of the job detail randomly selected.");
	    }
	</script> 

</body>
</html>


