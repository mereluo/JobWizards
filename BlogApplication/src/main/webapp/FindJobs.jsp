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
	        background-color: #cce7e8;
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
        <div id="jobSearchContainer">
            <form action="findjobs" method="post" style="display: inline-flex;">
                <input id="jobSearchBar" type="text" name="jobId" value="${fn:escapeXml(param.jobId)}" placeholder="Enter Job ID">
                <button id="searchButton" type="submit">Search</button>
            </form>
        </div>
    </div>


	<div style="display: flex; justify-content: center; margin-top: 20px;">
	    <c:if test="${not empty job}">
	    	<div class="job-card-container" style="margin-bottom: 40px;">
		        <div id="jobCard" class="job-card" style="margin-right: 20px;">
		            <!-- Main Information Section -->
		            <div class="section-title">Info</div>
		            <div class="job-main-info">
		                <div>JobId: <c:out value="${job.jobId}" /></div>
						<div><b><c:out value="${job.title}" /></b></div>
		            </div>
		
		            <!-- Details Section -->
		            <div class="section-title">Job Details</div>
		            <div class="job-details">
		                <div class="job-details-item">
		                    <label>AdvertiserType</label>
		                    <span><c:out value="${job.advertiserType}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>ApplyButtonDisabled</label>
		                    <span><c:out value="${job.applyButtonDisabled}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>EasyApply</label>
		                    <span><c:out value="${job.easyApply}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>PostedDate</label>
		                    <span><c:out value="${job.postedDate}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>Rating</label>
		                    <span><c:out value="${job.rating}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>Source</label>
		                    <span><c:out value="${job.source}" /></span>
		                </div>
		            </div>
		
		            <div class="section-title">Other</div>
		            <div class="job-details">
		                <div class="job-details-item">
		                    <label>Company</label>
		                    <span><c:out value="${job.company.companyName}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>Location</label>
		                    <span><c:out value="${job.location.city}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>Company Id</label>
		                    <span><c:out value="${job.company.companyId}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>Location ID</label>
		                    <span><c:out value="${job.location.locationId}" /></span>
		                </div>
		                
		            </div>
		        </div>
		        
		        
		        <div class="action-menu">
					<a href="#" onclick="downloadPDF()" class="action-item" data-job-id="${job.jobId}">
			            <i class="fas fa-download"></i> Download
			        </a>
							        
					<a href="javascript:void(0);" onclick="promptForTitle('${job.jobId}')" class="action-item">
					    <i class="fas fa-pen"></i> Edit
					</a>
					<!-- Invisible iframe to handle the form submission in the background -->
					<iframe name="hidden_iframe" style="display:none;"></iframe>
					
					<script>
					    function promptForTitle(jobId) {
					        const newTitle = prompt("Please enter the new job title:");
					
					        if (newTitle !== null && newTitle.trim() !== "") {
					            // Create a form dynamically to submit the data
					            const form = document.createElement("form");
					            form.method = "POST";
					            form.action = "jobupdate";
					            form.target = "hidden_iframe"; // Target the hidden iframe
					
					            // Create hidden fields for jobId and title
					            const jobIdField = document.createElement("input");
					            jobIdField.type = "hidden";
					            jobIdField.name = "jobId";
					            jobIdField.value = jobId;
					            form.appendChild(jobIdField);
					
					            const titleField = document.createElement("input");
					            titleField.type = "hidden";
					            titleField.name = "title";
					            titleField.value = newTitle;
					            form.appendChild(titleField);
					
					            // Append form to body and submit
					            document.body.appendChild(form);
					            form.submit();
					
					            // Show success message and update the title in UI
					            alert("Job title updated successfully.");
					            document.querySelector(".job-main-info b").innerText = newTitle;
					
					            // Remove the form after submission to clean up
					            document.body.removeChild(form);
					        } else {
					            alert("Title cannot be empty.");
					        }
					    }
					</script>
					<a href="javascript:void(0);" onclick="confirmDelete(this);" class="action-item delete" data-job-id="${job.jobId}">
					    <i class="fas fa-trash"></i> Delete
					</a>
								
				<div id="deleteModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 300px; background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); z-index: 1000;">
				    <p id="deleteMessage" style="font-size: 18px; margin-bottom: 20px;">Are you sure to delete this job?</p>
				    <div style="display: flex; justify-content: space-between;">
				        <button onclick="performDelete()" style="padding: 10px 20px; background-color: #FF4136; color: white; border: none; border-radius: 5px; cursor: pointer;">Delete</button>
				        <button onclick="closeModal()" style="padding: 10px 20px; background-color: #ccc; color: #333; border: none; border-radius: 5px; cursor: pointer;">Cancel</button>
				    </div>
				</div>
				
				<div id="overlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>

				<script>
				    let jobIdToDelete = null;
				    function confirmDelete(element) {
				        jobIdToDelete = element.getAttribute("data-job-id"); // Retrieve jobId from data attribute
				
				        // Use template literals for dynamic string
				        document.getElementById('deleteMessage').innerText = "Are you sure to delete Job " + jobIdToDelete + "?";
				        document.getElementById('deleteModal').style.display = 'block';
				        document.getElementById('overlay').style.display = 'block';
				    }
				
				    function closeModal() {
				        document.getElementById('deleteModal').style.display = 'none';
				        document.getElementById('overlay').style.display = 'none';
				    }
				
				    function performDelete() {
				    	if (jobIdToDelete) {
				    	    window.location.href = "jobdelete?jobId=" + jobIdToDelete;
				    	}
				    }
				</script>
			</div>
			
			<!-- JavaScript to handle PDF download -->
			<script>
			    function downloadPDF() {
			        const element = document.getElementById('jobCard');
			        const options = {
			            margin: 0.5,
			            filename: 'job-details.pdf',
			            image: { type: 'jpeg', quality: 0.98 },
			            html2canvas: { scale: 2 },
			            jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
			        };
			        html2pdf().set(options).from(element).save();
			    }
			</script>

	    </c:if>
	 </div>

	<!-- Center the message container -->
	<div style="display: flex; justify-content: center; align-items: center; height: 60vh;">
	    <c:if test="${empty job}">
	        <div id="jobCard" class="job-card" style="text-align: center;">
	            <p>No job found with the given ID <c:out value="${param.jobId}" /></p>
	        </div>
	    </c:if>
	</div>	
		

</body>
</html>






















<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	        background-color: #cce7e8;
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
            <a href="#" onclick="showEmptyCards();">Main</a>
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
        <div id="jobSearchContainer">
            <form action="findjobs" method="post" style="display: inline-flex;">
                <input id="jobSearchBar" type="text" name="jobId" value="${fn:escapeXml(param.jobId)}" placeholder="Enter Job ID">
                <button id="searchButton" type="submit">Search</button>
            </form>
        </div>
    </div>

    <!-- JavaScript to handle displaying empty cards and hiding job card -->
    <script>
        function showEmptyCards() {
            document.getElementById("emptyCardsContainer").style.display = "block";
            const jobCard = document.getElementById("jobCard");
            if (jobCard) {
                jobCard.style.display = "none";
            }
        }
    </script>

    <!-- Container for empty cards (initially hidden) -->
    <div id="emptyCardsContainer" style="display: none;">
        <div class="empty-card">
            <p>Empty Card 1</p>
        </div>
        <div class="empty-card">
            <p>Empty Card 2</p>
        </div>
        <div class="empty-card">
            <p>Empty Card 3</p>
        </div>
        <div class="empty-card">
            <p>Empty Card 4</p>
        </div>
    </div>

	   <!-- Existing code for displaying a job card -->
	<div style="display: flex; justify-content: center; margin-top: 20px;">
	    <!-- Move job card slightly left by adjusting margin-right -->
	    <c:if test="${not empty job}">
	    	<div class="job-card-container">
		        <div id="jobCard" class="job-card" style="margin-right: 20px;">
		            <!-- Main Information Section -->
		            <div class="section-title">Info</div>
		            <div class="job-main-info">
		                <div>JobId: <c:out value="${job.jobId}" /></div>
		                <div><b><c:out value="${job.title}" /></b></div>
		            </div>
		
		            <!-- Details Section -->
		            <div class="section-title">Job Details</div>
		            <div class="job-details">
		                <div class="job-details-item">
		                    <label>AdvertiserType</label>
		                    <span><c:out value="${job.advertiserType}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>ApplyButtonDisabled</label>
		                    <span><c:out value="${job.applyButtonDisabled}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>EasyApply</label>
		                    <span><c:out value="${job.easyApply}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>PostedDate</label>
		                    <span><c:out value="${job.postedDate}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>Rating</label>
		                    <span><c:out value="${job.rating}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>Source</label>
		                    <span><c:out value="${job.source}" /></span>
		                </div>
		            </div>
		
		            <div class="section-title">Other</div>
		            <div class="job-details">
		                <div class="job-details-item">
		                    <label>CompanyId</label>
		                    <span><c:out value="${job.company}" /></span>
		                </div>
		                <div class="job-details-item">
		                    <label>LocationId</label>
		                    <span><c:out value="${job.location}" /></span>
		                </div>
		            </div>
		        </div>
	
		
				<!-- Right options for Update and Delete with icons -->
				<div class="action-menu">
					<a href="#" onclick="downloadPDF()" class="action-item">
			            <i class="fas fa-download"></i> Download
			        </a>
				    <a href="jobupdate?jobId=<c:out value='${job.jobId}'/>" class="action-item">
				        <i class="fas fa-pen"></i> Edit
				    </a>
				    <a href="jobdelete?jobId=<c:out value='${job.jobId}'/>" class="action-item delete">
				        <i class="fas fa-trash"></i> Delete
				    </a>
				</div>
			</div>
			
			<!-- JavaScript to handle PDF download -->
			<script>
			    function downloadPDF() {
			        const element = document.getElementById('jobCard');
			        const options = {
			            margin: 0.5,
			            filename: 'job-details.pdf',
			            image: { type: 'jpeg', quality: 0.98 },
			            html2canvas: { scale: 2 },
			            jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
			        };
			        html2pdf().set(options).from(element).save();
			    }
			</script>

	    </c:if>
	 </div>
    
    
    

    <c:if test="${empty job}">
        <div id="jobCard" class="job-card">
            <p>No job found with the given ID.</p>
        </div>
    </c:if>
	

</body>
</html> --%>








































<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<style>
	    /* Apply Inter font */
	    body {
	        font-family: 'Inter', sans-serif; /* Update to use Inter font */
	        margin: 0;
	        padding: 0;
	        background-color: #f5f5dc; /* Cream color */
	    }
	    #header {
	        background-color: #d3d3d3; /* Light grey color */
	        padding: 20px;
	        text-align: center;
	    }
	    #logo {
	        margin-bottom: 20px;
	    }
	    #jobSearchBar {
	        width: 70%; /* Adjust the width as needed */
	        padding: 15px; /* Add padding for larger size */
	        font-size: 16px; /* Improve readability */
	        border: 1px solid #ccc; /* Border styling */
	        border-radius: 25px 0 0 25px; /* Rounded corners on the left side */
	    }
	    #jobSearchContainer {
	        text-align: center; /* Center align the entire search bar section */
	        margin: 20px 0; /* Add some vertical spacing */
	    }
	    #searchButton {
	        padding: 15px 25px; /* Make the button similar in height to the search bar */
	        font-size: 16px; /* Match the font size with the search bar */
	        border: 1px solid #ccc; /* Border styling matching the input */
	        border-left: none; /* Remove the left border to connect seamlessly with input */
	        border-radius: 0 5px 5px 0; /* Rounded corners on the right side */
	        background-color: #4CAF50; /* Green background color */
	        color: white; /* White text */
	        cursor: pointer; /* Pointer cursor for button */
	    }
	    #jobSearchDescription {
	        font-size: 18px; /* Slightly larger font size for the text below */
	        color: #333; /* Set color to dark gray for good readability */
	        margin-top: 10px; /* Add spacing between the input and the description text */
	    }
	    #searchButton:hover {
		    background-color: #45a049; /* Darker shade of green */
		    transform: scale(1.05); /* Slightly increase the size for emphasis */
		    transition: transform 0.3s, background-color 0.3s; /* Smooth transition effect */
		}
	    
	    
	    
	    body {
	        font-family: Arial, sans-serif;
	        margin: 0;
	        padding: 0;
	    }
	    #navbar {
	        background-color: #ADD8E6; /* Baby blue background */
	        display: flex;
	        justify-content: space-around;
	        padding: 20px;
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	        border-bottom: 1px solid #ddd;
	    }
	    .nav-item {
	        position: relative; /* Relative for dropdown positioning */
	        cursor: pointer;
	        padding: 10px;
	    }
	    .nav-item a {
	        text-decoration: none;
	        color: #000; /* Black text for buttons */
	        font-weight: bold;
	        padding: 10px 20px; /* Add padding to ensure clickable area is clear */
	    }
	    .nav-item:hover {
	        background-color: #f1f1f1; /* Light gray background on hover */
	        border-radius: 10px; /* Rounded corners for hover effect */
	    }
	    .nav-item.active {
	        background-color: #cce7e8; /* Highlighted color for the active page */
	        border-radius: 10px; /* Rounded corners for active state */
	    }
	    .nav-item a.active {
	        color: #000; /* Keep text color consistent for active page */
	    }
	    /* Styling for the dropdown menu */
		.dropdown-content {
		    display: none;
		    position: absolute;
		    top: 100%;
		    left: 0;
		    background-color: #fff;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    z-index: 1;
		    min-width: 150px;
		    border-radius: 10px; /* Add rounded corners */
		    overflow: hidden; /* Prevent content from overflowing rounded corners */
		}
		.dropdown-content a {
		    padding: 10px 20px;
		    display: block;
		    text-decoration: none;
		    color: #000;
		    border-bottom: 1px solid #ddd; /* Border between dropdown items */
		}
		.dropdown-content a:hover {
		    background-color: #f1f1f1; /* Light gray background on hover */
		}
		
		/* Show the dropdown when hovering over the nav item */
		.nav-item:hover .dropdown-content {
		    display: block;
		}
	    
	    
	    .job-card {
	        border: 1px solid #ddd; /* Light border around the card */
	        border-radius: 10px; /* Rounded corners */
	        padding: 30px; /* Increased padding for more space inside the card */
	        margin: 20px; /* Margin between cards */
	        background-color: #f9f9f9; /* Light gray background for cards */
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add some shadow for depth */
	        max-width: 800px; /* Larger card width */
	        margin-left: auto; /* Center horizontally */
	        margin-right: auto;
	    }
	
	    .section-title {
	        background-color: #f0f0f0; /* Light gray background */
	        padding: 10px 15px; /* Padding for the title section */
	        font-weight: bold; /* Bold text for title */
	        border-radius: 5px; /* Rounded corners */
	        margin-bottom: 20px; /* Space below the section title */
	        text-align: left; /* Left align the section title */
	    }
	    .job-main-info {
	        font-size: 22px; /* Increased font size for main information */
	        font-weight: bold; /* Bold text for emphasis */
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
	        font-weight: bold; /* Bold to emphasize the value */
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
	    
	    
	   
	</style>
</head>







<body>
    <div id="header">
        <div id="logo">
            <img src="/BlobApplication2/pic/jwLogo2.PNG" alt="Logo" height="150px">
            <img src="/BlobApplication2/pic/jwLogo.PNG" alt="Logo" height="150px">
        </div>
    </div>
    
	<!-- Navigation Bar -->
	<div id="navbar">
        <div class="nav-item">
            <a href="#" onclick="showEmptyCards();">Main</a>
        </div>
	    <div class="nav-item">
	        <a href="#">Create New</a>
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
	        <a href="#">About Us</a>
	        <div class="dropdown-content">
	            <a href="#">Team</a>
	            <a href="#">Git Repo</a>
	        </div>
	    </div>
	</div>
	
	
    <!-- JavaScript to handle displaying empty cards and hiding job card -->
    <script>
        function showEmptyCards() {
            document.getElementById("emptyCardsContainer").style.display = "block";
            // Hide the job card if it exists
            const jobCard = document.getElementById("jobCard");
            if (jobCard) {
                jobCard.style.display = "none";
            }
        }
    </script>

    <!-- Job search form and job cards (existing code) -->
    <form action="findjobs" method="post">
        <div id="jobSearchContainer">
            <br />
            <form action="findjobs" method="post" style="display: inline-flex;">
                <input id="jobSearchBar" type="text" name="jobId" value="${fn:escapeXml(param.jobId)}" placeholder="Enter Job ID">
                <button id="searchButton" type="submit">Search</button>
            </form>
        </div>
    </form>

    <!-- Container for empty cards (initially hidden) -->
    <div id="emptyCardsContainer" style="display: none;">
        <div class="empty-card">
            <p>Empty Card 1</p>
        </div>
        <div class="empty-card">
            <p>Empty Card 2</p>
        </div>
        <div class="empty-card">
            <p>Empty Card 3</p>
        </div>
        <div class="empty-card">
            <p>Empty Card 4</p>
        </div>
    </div>

    <!-- Existing code for displaying a job card -->
    <c:if test="${not empty job}">
        <div id="jobCard" class="job-card">
            <!-- Main Information Section -->
            <div class="section-title">Info</div>
            <div class="job-main-info">
                <div><b>JobId:</b> <c:out value="${job.jobId}" /></div>
                <div><c:out value="${job.title}" /></div>
            </div>

            <!-- Details Section -->
            <div class="section-title">Job Details</div>
            <div class="job-details">
                <div class="job-details-item">
                    <label>AdvertiserType</label>
                    <span><c:out value="${job.advertiserType}" /></span>
                </div>
                <div class="job-details-item">
                    <label>ApplyButtonDisabled</label>
                    <span><c:out value="${job.applyButtonDisabled}" /></span>
                </div>
                <div class="job-details-item">
                    <label>EasyApply</label>
                    <span><c:out value="${job.easyApply}" /></span>
                </div>
                <div class="job-details-item">
                    <label>PostedDate</label>
                    <span><c:out value="${job.postedDate}" /></span>
                </div>
                <div class="job-details-item">
                    <label>Rating</label>
                    <span><c:out value="${job.rating}" /></span>
                </div>
                <div class="job-details-item">
                    <label>Source</label>
                    <span><c:out value="${job.source}" /></span>
                </div>
            </div>

            <div class="section-title">Other</div>
            <div class="job-details">
                <div class="job-details-item">
                    <label>CompanyId</label>
                    <span><c:out value="${job.company}" /></span>
                </div>
                <div class="job-details-item">
                    <label>LocationId</label>
                    <span><c:out value="${job.location}" /></span>
                </div>
            </div>

            <!-- Actions Section -->
            <div class="job-actions">
                <a href="jobdelete?jobId=<c:out value='${job.jobId}'/>" class="delete-button">Delete</a>
                <a href="jobupdate?jobId=<c:out value='${job.jobId}'/>">Update</a>
            </div>
        </div>
    </c:if>

    <c:if test="${empty job}">
        <div id="jobCard" class="job-card">
            <p>No job found with the given ID.</p>
        </div>
    </c:if>
	

</body>
</html> --%>



