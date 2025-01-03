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
		
		
		 .edit-icon {
		   cursor: pointer;
		   margin-left: 5px;
		   color: #66cdaa; /* Light green color for the icon */
		 }
		
		 .edit-icon:hover {
		   color: #2ea62e; /* Slightly darker green for hover effect */
		 }
		
		  .input-container {
		    display: flex;
		    align-items: center;
		  }
		
		  .confirm-icon {
		    cursor: pointer;
		    margin-left: 5px;
		    color: #28a745; /* Green color for the confirm icon */
		  }
		
		  .confirm-icon:hover {
		    color: #218838; /* Darker green for hover */
		  }
		
		  label {
		    margin-right: 10px;
		    display: flex;
		    align-items: center;
		  }
		
	</style>
</head>

<body>
    <!-- Navigation Bar -->
    <div id="navbar">
        <div id="logo">
            <img src="https://photos.hebo.life/application/thumb.php?img=/i/2024/11/13/6wcu7z.jpg" alt="Logo" height="70px">
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
                <a href="https://github.com/mereluo/JobWizards" target="_blank">Git Repo</a>
            </div>
        </div>
        
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
						<input type="hidden" id="jobIdValue" value="${job.jobId}" /> <!-- Hidden field for job ID -->
					
					    <div class="job-details-item">
					        <label>AdvertiserType <i class="fas fa-edit edit-icon" onclick="editJobDetail('advertiserTypeValue')"></i></label>
					        <span id="advertiserTypeValue"><c:out value="${job.advertiserType}" /></span>
					    </div>
					    <div class="job-details-item">
						    <label>ApplyButtonDisabled <i class="fas fa-edit edit-icon" onclick="editJobDetail('applyButtonDisabledValue')"></i></label>
						    <span id="applyButtonDisabledValue"><c:out value="${job.applyButtonDisabled}" /></span>
						</div>
						<div class="job-details-item">
						    <label>EasyApply <i class="fas fa-edit edit-icon" onclick="editJobDetail('easyApplyValue')"></i></label>
						    <span id="easyApplyValue"><c:out value="${job.easyApply}" /></span>
						</div>
					    <div class="job-details-item">
					        <label>PostedDate <i class="fas fa-edit edit-icon" onclick="editJobDetail('postedDateValue')"></i></label>
					        <span id="postedDateValue"><c:out value="${job.postedDate}" /></span>
					    </div>
					    <div class="job-details-item">
						    <label>Rating <i class="fas fa-edit edit-icon" onclick="editJobDetail('ratingValue')"></i></label>
						    <span id="ratingValue"><c:out value="${job.rating}" /></span>
						</div>
					    <div class="job-details-item">
					        <label>Source <i class="fas fa-edit edit-icon" onclick="editJobDetail('sourceValue')"></i></label>
					        <span id="sourceValue"><c:out value="${job.source}" /></span>
					    </div>
					</div>
					
					

					<script>
					function editJobDetail(elementId) {
					    const valueElement = document.getElementById(elementId);
					    const currentValue = valueElement.textContent.trim();

					    let inputField;

					    if (elementId === "applyButtonDisabledValue" || elementId === "easyApplyValue") {
					        // Create a dropdown select field for boolean values
					        inputField = document.createElement("select");
					        inputField.id = elementId + "Input";

					        const trueOption = document.createElement("option");
					        trueOption.value = "true";
					        trueOption.textContent = "true";
					        inputField.appendChild(trueOption);

					        const falseOption = document.createElement("option");
					        falseOption.value = "false";
					        falseOption.textContent = "false";
					        inputField.appendChild(falseOption);

					        // Set current value as selected
					        inputField.value = currentValue.toLowerCase();
					    } else if (elementId === "ratingValue") {
					        // Create an input field for rating, which should be a decimal value
					        inputField = document.createElement("input");
					        inputField.type = "number";
					        inputField.step = "0.01"; // Allow decimals to 2 places
					        inputField.min = "0"; // Minimum rating
					        inputField.max = "5"; // Maximum rating
					        inputField.value = currentValue;
					        inputField.id = elementId + "Input";
					        
					        // Adding event listener to restrict input programmatically if the field allows typing more than the max value
					        inputField.addEventListener("input", function() {
					            if (parseFloat(inputField.value) > 5) {
					                inputField.value = "5";
					            } else if (parseFloat(inputField.value) < 0) {
					                inputField.value = "0";
					            }
					        });
					    } else {
					        // Create an input field for text values
					        inputField = document.createElement("input");
					        inputField.type = "text";
					        inputField.value = currentValue;
					        inputField.id = elementId + "Input";
					    }

					    // Create a confirm button (checkmark icon)
					    const confirmButton = document.createElement("i");
					    confirmButton.className = "fas fa-check confirm-icon";
					    confirmButton.onclick = function () {
					      saveJobDetail(elementId, inputField.value);
					    };

					    // Create a container for input and confirm button
					    const inputContainer = document.createElement("div");
					    inputContainer.className = "input-container";
					    inputContainer.appendChild(inputField);
					    inputContainer.appendChild(confirmButton);

					    // Replace the value element with the input container
					    valueElement.parentNode.replaceChild(inputContainer, valueElement);

					    // Set focus on the input field for quick editing
					    inputField.focus();
					  }
					
					  function saveJobDetail(elementId, newValue) {
						  try {
						      const inputContainer = document.getElementById(elementId + "Input").parentNode;

						      // Create a new span element with the updated value
						      const newValueElement = document.createElement("span");
						      newValueElement.id = elementId;
						      newValueElement.textContent = newValue;

						      // Replace the input field with the updated value element in the UI
						      inputContainer.parentNode.replaceChild(newValueElement, inputContainer);

						      // Create a form dynamically to submit the data (similar to the title update)
						      const form = document.createElement("form");
						      form.method = "POST";
						      form.action = "jobupdate";
						      form.target = "hidden_iframe"; // Target the hidden iframe for seamless submission

						      // Extract the jobId from a data attribute or another source (assuming there's a jobId element or field)
						      const jobId = document.getElementById("jobIdValue").value;

						      if (!jobId) {
						          throw new Error("Job ID is not available. Cannot update the job detail.");
						      }

						      // Create hidden fields for jobId and the updated detail
						      const jobIdField = document.createElement("input");
						      jobIdField.type = "hidden";
						      jobIdField.name = "jobId";
						      jobIdField.value = jobId;
						      form.appendChild(jobIdField);

						      // Create a hidden field for the updated detail
						      const fieldName = elementId.replace('Value', ''); // Extract the field name (e.g., advertiserType)
						      const fieldValueField = document.createElement("input");
						      fieldValueField.type = "hidden";
						      fieldValueField.name = fieldName; // The name should match what the server expects (e.g., "advertiserType")
						      fieldValueField.value = newValue;
						      form.appendChild(fieldValueField);

						      // Append the form to the body and submit it
						      document.body.appendChild(form);
						      form.submit();

						      // Show success message after submission
						      alert(fieldName + " updated successfully.");

						      // Remove the form after submission to clean up
						      document.body.removeChild(form);
						  } catch (error) {
						      console.error("Error updating job detail:", error.message);
						      alert("Failed to update job detail. Please try again.");
						  }
						}

					</script>
					
					
					
					
							
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


		            
	                <!-- Reviews Section -->
					<div class="section-title">Reviews</div>
					<c:if test="${empty reviewsList}">
					    <p>No reviews available for this job.</p>
					</c:if>
					<c:forEach var="review" items="${reviewsList}">
					    <div class="review-card" style="border-top: 1px solid #ddd; padding-top: 15px; margin-top: 15px;">
					        <!-- Reviewer Information -->
					        <div style="display: flex; align-items: center; gap: 10px;">
					            <!-- Default human icon -->
					            <i class="fas fa-user-circle" style="font-size: 40px; color: #ccc;"></i>
					            
					            <!-- Publisher and Location -->
					            <div>
					                <p style="margin: 0; font-weight: bold;"><c:out value="${review.publisher}" /></p>
					                <p style="margin: 0; color: #777;"><c:out value="${review.reviewerLocation}" /></p>
					            </div>
					        </div>
					        
					        <!-- Overall Rating with Stars -->
					        <div style="margin-top: 10px;">
					            <p>Overall : 
					                <c:forEach var="star" begin="1" end="${review.ratingForOverall.intValue()}">
					                    <i class="fas fa-star" style="color: #ffd700;"></i>
					                </c:forEach>
					                <c:if test="${review.ratingForOverall % 1 != 0}">
					                    <i class="fas fa-star-half-alt" style="color: #ffd700;"></i>
					                </c:if>
					                <c:forEach var="emptyStar" begin="${review.ratingForOverall.intValue() + 1}" end="5">
					                    <i class="far fa-star" style="color: #ffd700;"></i>
					                </c:forEach>
					            </p>
					        </div>
					
					        <!-- Culture Rating with Stars -->
					        <div>
					            <p>Culture : 
					                <c:forEach var="star" begin="1" end="${review.ratingForCultureValues.intValue()}">
					                    <i class="fas fa-star" style="color: #ffd700;"></i>
					                </c:forEach>
					                <c:if test="${review.ratingForCultureValues % 1 != 0}">
					                    <i class="fas fa-star-half-alt" style="color: #ffd700;"></i>
					                </c:if>
					                <c:forEach var="emptyStar" begin="${review.ratingForCultureValues.intValue() + 1}" end="5">
					                    <i class="far fa-star" style="color: #ffd700;"></i>
					                </c:forEach>
					            </p>
					        </div>
					
					        <!-- Work-Life Balance Rating with Stars -->
					        <div>
					            <p>Work-Life Balance :
					                <c:forEach var="star" begin="1" end="${review.ratingForWorkLifeBalanace.intValue()}">
					                    <i class="fas fa-star" style="color: #ffd700;"></i>
					                </c:forEach>
					                <c:if test="${review.ratingForWorkLifeBalanace % 1 != 0}">
					                    <i class="fas fa-star-half-alt" style="color: #ffd700;"></i>
					                </c:if>
					                <c:forEach var="emptyStar" begin="${review.ratingForWorkLifeBalanace.intValue() + 1}" end="5">
					                    <i class="far fa-star" style="color: #ffd700;"></i>
					                </c:forEach>
					            </p>
					        </div>
					
					        <!-- Pros, Cons, and Content -->
					        <div style="margin-top: 10px;">
					            <p><b>Pros:</b> <c:out value="${review.pros}" /></p>
					            <p><b>Cons:</b> <c:out value="${review.cons}" /></p>
					            <p><b>Review from </b> <c:out value="${review.reviewContent}" /></p>
					        </div>
					    </div>
					</c:forEach>

		        </div>
		        
		        
		        <div class="action-menu">
					<a href="#" onclick="downloadPDF()" class="action-item" data-job-id="${job.jobId}">
			            <i class="fas fa-download"></i> Download
			        </a>
							        
					<a href="javascript:void(0);" onclick="promptForTitle('${job.jobId}')" class="action-item">
					    <i class="fas fa-pen"></i> Edit Title
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




