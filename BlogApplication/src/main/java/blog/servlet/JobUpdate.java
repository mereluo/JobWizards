package blog.servlet;

import blog.dal.*;
import blog.model.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/jobupdate")
public class JobUpdate extends HttpServlet {
	
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
        
        Jobs jobs = null;

        // Retrieve job and validate.
        String id = req.getParameter("jobId");
        int idnumber = Integer.parseInt(id);
        if (id == null || id.trim().isEmpty()) {
            messages.put("success", "Please enter a valid jobId.");
        } else {
        	try {
        		jobs = jobsDao.getJobById(idnumber);
        		if(jobs == null) {
        			messages.put("success", "UserName does not exist.");
        		}
        		req.setAttribute("job", jobs);
        	} catch (SQLException e) {
				e.printStackTrace();
				throw new IOException(e);
	        }
        }
        req.getRequestDispatcher("/JobUpdate.jsp").forward(req, resp);
	}
	
	@Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
        // Map for storing messages.
        Map<String, String> messages = new HashMap<String, String>();
        req.setAttribute("messages", messages);
        
        Jobs jobs = null;

        // Retrieve job and validate.
        String id = req.getParameter("jobId");
        int idnumber = Integer.parseInt(id);
        if (id == null || id.trim().isEmpty()) {
            messages.put("success", "Please enter a valid jobId.");
        } else {
        	try {
        		jobs = jobsDao.getJobById(idnumber);
        		if(jobs == null) {
        			messages.put("success", "jobId does not exist. No update to perform.");
        		} else {
        			String newTitle = req.getParameter("title");
        			if (newTitle == null || newTitle.trim().isEmpty()) {
        	            messages.put("success", "Please enter a valid Title.");
        	        } else {
        	        	jobs = jobsDao.updateTitle(jobs, newTitle);
        	        	messages.put("success", "Successfully updated " + idnumber);
        	        }
        		}
        		req.setAttribute("Job", jobs);
        	} catch (SQLException e) {
				e.printStackTrace();
				throw new IOException(e);
	        }
        }
        
        req.getRequestDispatcher("/JobUpdate.jsp").forward(req, resp);
    }
}
