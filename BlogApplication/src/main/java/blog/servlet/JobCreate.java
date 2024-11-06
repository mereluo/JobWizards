package blog.servlet;

import blog.dal.*;
import blog.model.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
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
	
	@Override
	public void init() throws ServletException {
		jobsDao = JobsDao.getInstance();
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// Map for storing messages.
        Map<String, String> messages = new HashMap<String, String>();
        req.setAttribute("messages", messages);
        //Just render the JSP.   
        req.getRequestDispatcher("/JobCreate.jsp").forward(req, resp);
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
            messages.put("success", "Invalid jobId");
        } else {
        	// Create the BlogUser.
        	String title = req.getParameter("title");
        	String advertiserType = req.getParameter("advertiserType");
//        	boolean applyButtonDisabled = req.getParameter("applyButtonDisabled");
//        	boolean easyApply = req.getParameter("easyApply");
        	String postedDate = req.getParameter("postedDate");
//        	String rating = req.getParameter("rating");
        	BigDecimal rating = new BigDecimal("4.456");
        	String source = req.getParameter("source");
//        	String company = req.getParameter("company");
//        	String location = req.getParameter("location");
            Companies company = new Companies(0);
            Locations location = new Locations(18);
	        try {
	        	// Exercise: parse the input for StatusLevel.
	        	Jobs job = new Jobs(idnumber, title, advertiserType, false, false, postedDate, rating, source, company, location);
	        	job = jobsDao.create(job);
	        	messages.put("success", "Successfully created " + idnumber);
	        } catch (SQLException e) {
				e.printStackTrace();
				throw new IOException(e);
	        }
        }
        
        req.getRequestDispatcher("/JobCreate.jsp").forward(req, resp);
    }
}
