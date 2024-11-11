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
	        border-radius: 25px 0 0 25px;
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
		    max-width: 100%; /* Allow the card to expand to the container's width */
		    width: 800px; /* Set a fixed width for larger screens */
		    margin-right: 20px;
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
		
		.form-section {
		    display: grid;
		    grid-template-columns: 1fr 1fr; /* Set both columns to equal width */
		    gap: 20px;
		    margin-bottom: 20px;
		}
		
		.form-group {
		    display: flex;
		    flex-direction: column;
		    font-size: 14px;
		    color: #555;
		}
		
		.form-group label {
		    margin-bottom: 5px;
		    font-weight: bold;
		}
		
		.form-group input {
		    padding: 8px;
		    font-size: 16px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}

	    .submit-button {
	        text-align: center;
	        margin-top: 30px;
	    }
	    .submit-button input[type="submit"] {
	        padding: 10px 20px;
	        font-size: 16px;
	        color: white;
	        background-color: #4CAF50;
	        border: none;
	        border-radius: 5px;
	        cursor: pointer;
	    }
	    .submit-button input[type="submit"]:hover {
	        background-color: #45a049;
	    }
	    #successMessage {
	        color: green;
	        text-align: center;
	        margin-top: 20px;
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
        <div id="jobSearchContainer">
            <form action="findjobs" method="post" style="display: inline-flex;">
                <input id="jobSearchBar" type="text" name="jobId" value="${fn:escapeXml(param.jobId)}" placeholder="Enter Job ID">
                <button id="searchButton" type="submit">Search</button>
            </form>
        </div>
    </div>
    
    	<div style="display: flex; justify-content: center; margin-top: 20px;">
			<div class="job-card-container" style="margin-bottom: 40px;">
			    <div id="jobCard" class="job-card" style="margin-right: 20px;">
			        <form action="jobcreate" method="post">
			            <div class="section-title">Info</div>
			            <div class="form-section">
			                <div class="form-group">
			                    <label for="jobId">Job ID</label>
			                    <input id="jobId" name="jobId" value="" required>
			                </div>
			                <div class="form-group">
			                    <label for="title">Title</label>
			                    <input id="title" name="title" value="" required>
			                </div>
			            </div>
			
			            <!-- Details Section -->
			            <div class="section-title">Job Details</div>
			            <div class="form-section">
			                <div class="form-group">
			                    <label for="advertiserType">Advertiser Type</label>
			                    <input id="advertiserType" name="advertiserType" value="">
			                </div>
			                <div class="form-group">
			                    <label for="applyButtonDisabled">Apply Button Disabled</label>
			                    <input id="applyButtonDisabled" name="applyButtonDisabled" value="">
			                </div>
			                <div class="form-group">
			                    <label for="easyApply">Easy Apply</label>
			                    <input id="easyApply" name="easyApply" value="">
			                </div>
			                <div class="form-group">
			                    <label for="postedDate">Posted Date</label>
			                    <input id="postedDate" name="postedDate" value="">
			                </div>
			                <div class="form-group">
			                    <label for="rating">Rating (0-5)</label>
			                    <input id="rating" name="rating" type="number" step="0.001" min="0.000" max="5.000" required>
			                </div>
			                <div class="form-group">
			                    <label for="source">Source</label>
			                    <input id="source" name="source" value="">
			                </div>
			            </div>
			
			            <div class="section-title">Other</div>
			            <div class="form-section">
			                <div class="form-group">
			                    <label for="companyName">Company</label>
			                    <input id="companyName" name="companyName" value="">
			                </div>
			                <div class="form-group">
			                    <label for="locationName">Location</label>
			                    <input id="locationName" name="locationName" value="">
			                </div>
			            </div>
			
			            <div class="submit-button">
			                <input type="submit" value="Create Job">
			            </div>
			        </form>
					<div id="overlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>
					
					<!-- Custom success pop-up message box, centered and enlarged -->
					<div id="successPopup" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 400px; background-color: #ffffff; border: 1px solid #ddd; padding: 30px; border-radius: 10px; box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); z-index: 1000; text-align: center;">
					    <span id="popupMessage">${messages.success}</span>
					    <div style="margin-top: 20px;">
					        <button onclick="closePopup('successPopup')" style="padding: 10px 20px; font-size: 16px; color: white; background-color: #4CAF50; border: none; border-radius: 5px; cursor: pointer;">
					            OK
					        </button>
					    </div>
					</div>
					
					<!-- Custom error pop-up message box, centered and enlarged -->
					<div id="errorPopup" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 400px; background-color: #ffffff; border: 1px solid #ddd; padding: 30px; border-radius: 10px; box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); z-index: 1000; text-align: center;">
					    <span id="errorMessage">${messages.error}</span>
					    <div style="margin-top: 20px;">
					        <button onclick="closePopup('errorPopup')" style="padding: 10px 20px; font-size: 16px; color: white; background-color: #E53935; border: none; border-radius: 5px; cursor: pointer;">
					            Close
					        </button>
					    </div>
					</div>
					
					<script>
					    window.onload = function() {
					        const successMessage = "${messages.success}";
					        const errorMessage = "${messages.error}";
					        
					        // Show the appropriate pop-up if there's a success or error message
					        if (successMessage) {
					            document.getElementById("overlay").style.display = "block";
					            document.getElementById("successPopup").style.display = "block";
					        } else if (errorMessage) {
					            document.getElementById("overlay").style.display = "block";
					            document.getElementById("errorPopup").style.display = "block";
					        }
					    };
					
					    function closePopup(popupId) {
					        // Hide the overlay and the specified pop-up
					        document.getElementById("overlay").style.display = "none";
					        document.getElementById(popupId).style.display = "none";
					    }
					</script>



			    </div>
			</div>
	 </div>
</body>
</html>

