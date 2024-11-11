package blog.servlet;

import blog.dal.*;
import blog.model.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/jobdelete")
public class JobDelete extends HttpServlet {
	
	protected JobsDao jobsDao;
	
	@Override
	public void init() throws ServletException {
		jobsDao = JobsDao.getInstance();
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    String id = req.getParameter("jobId");
	    Map<String, String> messages = new HashMap<>();
	    req.setAttribute("messages", messages);

	    if (id == null || id.trim().isEmpty()) {
	        messages.put("title", "Invalid jobId");
	    } else {
	        try {
	            int idnumber = Integer.parseInt(id);
	            Jobs job = null;
	            job = jobsDao.getJobById(idnumber);
	            job = jobsDao.delete(job);
	            if (job == null) {
	                messages.put("title", "Successfully deleted Job ID: " + id);
	            } else {
	                messages.put("title", "Failed to delete Job ID: " + id);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            throw new IOException(e);
	        }
	    }

	    resp.sendRedirect("findjobs");
	}
	
	@Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
        // Map for storing messages.
        Map<String, String> messages = new HashMap<String, String>();
        req.setAttribute("messages", messages);

        // Retrieve and validate jobId.
        String id = req.getParameter("jobId");
        int idnumber = Integer.parseInt(id);
        if (id == null || id.trim().isEmpty()) {
            messages.put("title", "Invalid jobId");
            messages.put("disableSubmit", "true");
        } else {
        	String title = req.getParameter("title");
        	String advertiserType = req.getParameter("advertiserType");
        	String postedDate = req.getParameter("postedDate");
        	BigDecimal rating = new BigDecimal("4.456");
        	String source = req.getParameter("source");
            Companies company = new Companies(0);
            Locations location = new Locations(18);
	        Jobs job = new Jobs(idnumber, title, advertiserType, false, false, postedDate, rating, source, company, location);
	        try {
	        	job = jobsDao.delete(job);
	        	// Update the message.
		        if (job == null) {
		            messages.put("title", "Successfully deleted " + idnumber);
		            messages.put("disableSubmit", "true");
		        } else {
		        	messages.put("title", "Failed to delete " + idnumber);
		        	messages.put("disableSubmit", "false");
		        }
	        } catch (SQLException e) {
				e.printStackTrace();
				throw new IOException(e);
	        }
        }
        
        req.getRequestDispatcher("/JobDelete.jsp").forward(req, resp);
    }
}
