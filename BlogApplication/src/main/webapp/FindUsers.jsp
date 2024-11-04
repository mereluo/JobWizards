<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Find a User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery and Bootstrap Bundle (includes Popper) for dropdown functionality -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="d-flex flex-column vh-100" style="background: linear-gradient(135deg, #d7e9f7, #b3d1f2); color: #333;">
<div class="container-fluid vh-100 d-flex flex-column justify-content-center align-items-center">
    <!-- Job Wizard Searching Tool -->
    <div class="row justify-content-center mb-4">
        <h1 class="text-center">Job Wizard Searching Tool</h1>
        <div class="col-6 d-flex flex-column align-items-center">
            <form action="findusers" method="post" class="text-center">
                <p>
                <div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 600px;">
                        Menu
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#" onclick="populateTable('BenefitsComments')">BenefitsComments</a>
                        <a class="dropdown-item" href="#" onclick="populateTable('BenefitsHighlights')">BenefitsHighlights</a>
                        <a class="dropdown-item" href="#" onclick="populateTable('Company')">Company</a>
                        <a class="dropdown-item" href="#" onclick="populateTable('Industry')">Industry</a>
                        <a class="dropdown-item" href="#" onclick="populateTable('Currency')">Currency</a>
                        <a class="dropdown-item" href="#" onclick="populateTable('Sector')">Sector</a>
                        <a class="dropdown-item" href="#" onclick="populateTable('Job')">Job</a>
                        <a class="dropdown-item" href="#" onclick="populateTable('Location')">Location</a>
                        <a class="dropdown-item" href="#" onclick="populateTable('Reviews')">Reviews</a>
                        <a class="dropdown-item" href="#" onclick="populateTable('Salary')">Salary</a>
                        <a class="dropdown-item" href="#" onclick="populateTable('Sector')">Sector</a>
                    </div>
                <p>
                    <label for="firstname" id ="dropDownMenu" style = "font-size: 20px">Choose a Searching Type</label>
                    <input id="firstname" name="firstname"  style="width: 600px;">
                </p>
                </div>
                <div><a id="userCreate" href="usercreate"></a></div>
                </p>
                <p>
                    <input type="submit" class="btn btn-primary me-2" value="Search">
                    <input type="reset" class="btn btn-secondary" value="Reset">
                </p>
            </form>
        </div>
    </div>

    <!-- Matching Companies -->
    <div class="row">
        <div class="table-responsive mb-4 mt-3">
            <table table class="table table-bordered table-striped table-hover text-center" id="data-table">
                <thead>
                <tbody>
                <tr id="data-row">
                    <!-- Cells will be filled by JavaScript -->
                </tr>
                </tbody>
                </thead>

            </table>
        </div>

            <div class="btn-group mb-3" role="group" aria-label="Additional Actions">
                <button type="button" class="btn btn-info">View Details</button>
                <button type="button" class="btn btn-warning">Export Data</button>
                <button type="button" class="btn btn-danger">Delete Entry</button>
            </div>
        </div>
    </div>
</div>
<script>
    function populateTable(option) {
        const dataRow = document.getElementById('data-row');
        const column = document.getElementById("dropDownMenu")
        const createSomething = document.getElementById("userCreate");
        dataRow.innerHTML = '';  // Clear previous data

        if (option === 'BenefitsComments') {
            const data = ["benefitsCommentsId", "commentCity", "commentState", "commentContent", "createdTime"
                , "commentRating", "job"];

            data.forEach(num => {
                let cell = document.createElement('th'); // Use <td> elements
                cell.textContent = num;
                cell.style.textAlign = 'center'; // Center-align the content
                dataRow.appendChild(cell); // Append to the data-row
            });
            column.innerText = "BenefitsCommentsId";
            createSomething.innerHTML = `<a href="BenefitsCommentsCreate">Create BenefitsComments</a>`;
        } else if (option === 'BenefitsHighlights') {
            const data = ["benefitsHighlightsId", "highlightPhrase", "highlightName", "commentCount", "job"];

            data.forEach(num => {
                let cell = document.createElement('th'); // Use <td> elements
                cell.textContent = num;
                cell.style.textAlign = 'center'; // Center-align the content
                dataRow.appendChild(cell); // Append to the data-row
            });
            column.innerText = "BenefitsHighlights";
            createSomething.innerText = "Create BenefitsHighlights";
        }
        else if (option === 'Company') {
            const data = ["companyId", "companyName", "isExpired", "foundedYear", "headquarters",
                "companyType", "companySize", "hideCEOInfo", "isSponsored", "revenue","industry"];

            data.forEach(num => {
                let cell = document.createElement('th'); // Use <td> elements
                cell.textContent = num;
                cell.style.textAlign = 'center'; // Center-align the content
                dataRow.appendChild(cell); // Append to the data-row
            });
            column.innerText = "Company";
            createSomething.innerText = "Create Company";
        }
        else if (option === 'Industry') {
            const data = ["industryId", "industry", "sector"];

            data.forEach(num => {
                let cell = document.createElement('th'); // Use <td> elements
                cell.textContent = num;
                cell.style.textAlign = 'center'; // Center-align the content
                dataRow.appendChild(cell); // Append to the data-row
            });
            column.innerText = "Industry";
            createSomething.innerText = "Create Industry";
        } else if (option === 'Sector') {
            const data = ["sectorId", "sector"];

            data.forEach(num => {
                let cell = document.createElement('th'); // Use <td> elements
                cell.textContent = num;
                cell.style.textAlign = 'center'; // Center-align the content
                dataRow.appendChild(cell); // Append to the data-row
            });
            column.innerText = "Sector";
            createSomething.innerText = "Create Sector";
        }
        else if (option === 'Job') {
            const data = ["jobId", "title", "advertiserType", "applyButtonDisabled", "easyApply"
                ,"postedDate", "rating", "source", "company", "location"];

            data.forEach(num => {
                let cell = document.createElement('th'); // Use <td> elements
                cell.textContent = num;
                cell.style.textAlign = 'center'; // Center-align the content
                dataRow.appendChild(cell); // Append to the data-row
            });
            column.innerText = "Job";
            createSomething.innerText = "Create Job";
        }
        else if (option === 'Location') {
            const data = ["locationId", "city", "country", "lat", "lng"];

            data.forEach(num => {
                let cell = document.createElement('th'); // Use <td> elements
                cell.textContent = num;
                cell.style.textAlign = 'center'; // Center-align the content
                dataRow.appendChild(cell); // Append to the data-row
            });
            column.innerText = "Location";
            createSomething.innerText = "Create Location";
        }
        else if (option === 'Reviews') {
            const data = ["reviewId", "cons", "pros", "publisher", "ratingForCareerOpportunities"
                ,"ratingForCompBenefits", "ratingForCultureValues", "ratingOverall", "ratingForSeniorManagement", "ratingForWorkLifeBalanace"
                ,"reviewContent", "reviewerLocation", "reviewerStatus", "job"];

            data.forEach(num => {
                let cell = document.createElement('th'); // Use <td> elements
                cell.textContent = num;
                cell.style.textAlign = 'center'; // Center-align the content
                dataRow.appendChild(cell); // Append to the data-row
            });
            column.innerText = "Reviews";
            createSomething.innerText = "Create Reviews";
        }
        else if (option === 'Salary') {
            const data = ["salaryId", "jobTitle", "payPeriod", "payPercentile10", "payPercentile50"
                ,"payPercentile90", "salaryType", "job", "currencyCode"];

            data.forEach(num => {
                let cell = document.createElement('th'); // Use <td> elements
                cell.textContent = num;
                cell.style.textAlign = 'center'; // Center-align the content
                dataRow.appendChild(cell); // Append to the data-row
            });
            column.innerText = "Salary";
            createSomething.innerText = "Create Salary";
        }
        else {
            const data = ["currencyCode", "currencyName", "exchangeRate"];
            data.forEach(num => {
                let cell = document.createElement('th'); // Use <td> elements
                cell.textContent = num;
                cell.style.textAlign = 'center'; // Center-align the content
                dataRow.appendChild(cell); // Append to the data-row
            });
            column.innerText = "Currency";
            createSomething.innerText = "Create Currency";
        }
    }
</script>
</body>
</html>

