package blog.servlet;

import blog.dal.*;
import blog.model.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/jobcreate")
public class JobCreate extends HttpServlet {
	
	protected JobsDao jobsDao;
	protected CompaniesDao companiesDao;
	protected ConnectionManager connectionManager;
	
	@Override
	public void init() throws ServletException {
		jobsDao = JobsDao.getInstance();
		companiesDao = CompaniesDao.getInstance();
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Map for storing messages.
        Map<String, String> messages = new HashMap<String, String>();
        req.setAttribute("messages", messages);
        req.setAttribute("currentPage", "jobcreate");
        //Just render the JSP.   
        req.getRequestDispatcher("/JobCreate.jsp").forward(req, resp);
	}
	
	@Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
        // Map for storing messages.
        Map<String, String> messages = new HashMap<String, String>();
        req.setAttribute("messages", messages);
        req.setAttribute("currentPage", "jobcreate");

        // Retrieve and validate jobId.
        String id = req.getParameter("jobId");
        int idnumber = Integer.parseInt(id);
        if (id == null || id.trim().isEmpty()) {
            messages.put("success", "Invalid jobId");
        } else {
        	String title = req.getParameter("title");
        	if (title == null || title.trim().isEmpty()) {
        	    title = "Untitled"; // Default title
        	}

        	String advertiserType = req.getParameter("advertiserType");
        	if (advertiserType == null || advertiserType.trim().isEmpty()) {
        	    advertiserType = "Unknown"; // Default advertiser type
        	}

        	// Commented out fields, assume default values if needed
        	boolean applyButtonDisabled = Boolean.parseBoolean(req.getParameter("applyButtonDisabled"));
        	boolean easyApply = Boolean.parseBoolean(req.getParameter("easyApply"));

        	// Set default posted date to current date if not provided
        	String postedDate = req.getParameter("postedDate");
        	if (postedDate == null || postedDate.trim().isEmpty()) {
        	    postedDate = java.time.LocalDate.now().toString(); // Default to today's date
        	}

        	// Set a default rating if none is provided
        	BigDecimal rating;
        	String ratingStr = req.getParameter("rating");
        	if (ratingStr == null || ratingStr.trim().isEmpty()) {
        	    rating = new BigDecimal("4.000"); // Default rating
        	} else {
        	    rating = new BigDecimal(ratingStr);
        	}

        	String source = req.getParameter("source");
        	if (source == null || source.trim().isEmpty()) {
        	    source = "N/A"; // Default source
        	}

        	String companyName = req.getParameter("companyName");
        	Companies company = null;
        	Industries industry = null;
        	try {
        	    // Check if the company already exists
        	    company = companiesDao.getCompanyByName(companyName);
        	    if (companyName == null || companyName.trim().isEmpty()) {
        	        companyName = "Unknown";
        	    }

        	    if (company == null) {
        	        // Set a default industry 
        	        industry = IndustriesDao.getInstance().getIndustryById(200064); 

        	        // create a new Companies object with the default industry
        	        int newCompanyId = companiesDao.getNextAvailableCompanyId();
        	        boolean isExpired = false;
        	        String foundedYear = "2020";
        	        String headquarters = "Unknown";
        	        String companyType = "Private";
        	        String companySize = "Medium";
        	        boolean hideCEOInfo = false;
        	        boolean isSponsored = false;
        	        String revenue = "Not Disclosed";

        	        company = new Companies(newCompanyId, companyName, isExpired, foundedYear, headquarters,
        	                                companyType, companySize, hideCEOInfo, isSponsored, revenue, industry);
        	        
        	        // Insert the new company into the database
        	        company = companiesDao.create(company);
        	    }
        	} catch (SQLException e) {
        	    e.printStackTrace();
        	    throw new IOException(e);
        	}
        	
        	String city = req.getParameter("locationName"); // User-provided city
        	Locations location = null;

        	try {
        	    if (city == null || city.trim().isEmpty()) {
        	        city = "Unknown";
        	    }
        	    // Check if the location exists by city
        	    if (city != null && !city.trim().isEmpty()) {
        	        location = LocationsDao.getInstance().getLocationByCity(city);
        	    }

        	    // If the location does not exist, create a new one with default values for other fields
        	    if (location == null) {
        	        int newLocationId = LocationsDao.getInstance().getNextAvailableLocationId(); // Get a unique LocationId
        	        String defaultCountry = "Unknown"; // Default country
        	        double defaultLat = 0.0; // Default latitude
        	        double defaultLng = 0.0; // Default longitude

        	        // Create a new Locations object with the city and default values
        	        location = new Locations(newLocationId, city, defaultCountry, defaultLat, defaultLng);
        	        location = LocationsDao.getInstance().create(location); // Insert the new location into the database
        	    }
        	} catch (SQLException e) {
        	    e.printStackTrace();
        	    throw new IOException(e);
        	}

	        try {
	        	Jobs job = new Jobs(idnumber, title, advertiserType, false, false, postedDate, rating, source, company, location);
	        	job = jobsDao.create(job);
	        	messages.put("success", "Successfully Created Job " + idnumber + " " + title);
	        } catch (SQLIntegrityConstraintViolationException e) {
	            // Handle duplicate primary key error
	            messages.put("error", "Job ID " + idnumber + " already exists. Please use a unique Job ID.");
	        } catch (SQLException e) {
	            e.printStackTrace();
	            messages.put("error", "An unexpected error occurred. Please try again.");
	        }
        }
        
        req.getRequestDispatcher("/JobCreate.jsp").forward(req, resp);
    }
	

}
