package blog.servlet;

import blog.dal.*;
import blog.model.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * FindUsers is the primary entry point into the application.
 * 
 * Note the logic for doGet() and doPost() are almost identical. However, there is a difference:
 * doGet() handles the http GET request. This method is called when you put in the /findusers
 * URL in the browser.
 * doPost() handles the http POST request. This method is called after you click the submit button.
 * 
 * To run:
 * 1. Run the SQL script to recreate your database schema: http://goo.gl/86a11H.
 * 2. Insert test data. You can do this by running blog.tools.Inserter (right click,
 *    Run As > JavaApplication.
 *    Notice that this is similar to Runner.java in our JDBC example.
 * 3. Run the Tomcat server at localhost.
 * 4. Point your browser to http://localhost:8080/BlogApplication/findusers.
 */
@WebServlet("/findjobs")
public class FindJobs extends HttpServlet {
	
	protected JobsDao jobsDao;
	
	@Override
	public void init() throws ServletException {
		jobsDao = JobsDao.getInstance();
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    // Map for storing messages.
	    Map<String, String> messages = new HashMap<>();
	    req.setAttribute("messages", messages);

	    Jobs job = null;
	    String id = req.getParameter("jobId");

	    // Validate and retrieve jobId.
	    if (id == null || id.trim().isEmpty()) {
	        messages.put("error", "Please enter a valid job ID.");
	    } else {
	        try {
	            int idNumber = Integer.parseInt(id);
	            job = jobsDao.getJobById(idNumber);

	            if (job != null) {
	                messages.put("success", "Displaying results for Job ID: " + id);
	            } else {
	                messages.put("error", "No job found with Job ID: " + id);
	            }
	        } catch (NumberFormatException e) {
	            messages.put("error", "Job ID must be a valid number.");
	        } catch (SQLException e) {
	            e.printStackTrace();
	            messages.put("error", "An unexpected error occurred while retrieving job details.");
	        }
	    }

	    req.setAttribute("job", job);
	    req.getRequestDispatcher("/FindJobs.jsp").forward(req, resp);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    // Retrieve jobId from form data
	    String id = req.getParameter("jobId");

	    // Redirect to doGet with jobId as query parameter
	    if (id != null && !id.trim().isEmpty()) {
	        resp.sendRedirect("findjobs?jobId=" + id);
	    } else {
	        // If jobId is invalid, redirect to the form with an error message
	        req.setAttribute("messages", Map.of("error", "Please enter a valid job ID."));
	        req.getRequestDispatcher("/FindJobs.jsp").forward(req, resp);
	    }
	}
	
}
