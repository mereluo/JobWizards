package blog.servlet;

import blog.dal.*;
import blog.model.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/findjobs")
public class FindJobs extends HttpServlet {
    
    protected JobsDao jobsDao;
    protected ReviewsDao reviewsDao;
    
    @Override
    public void init() throws ServletException {
        jobsDao = JobsDao.getInstance();
        reviewsDao = ReviewsDao.getInstance(); // Initialize ReviewsDao
    }
    
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Map<String, String> messages = new HashMap<>();
        req.setAttribute("messages", messages);

        Jobs job = null;
        List<Reviews> reviewsList = new ArrayList<>();
        String searchQuery = req.getParameter("searchQuery");

        if (searchQuery == null || searchQuery.trim().isEmpty()) {
            messages.put("error", "Please enter a valid job ID.");
        } else {
            try {
                int idNumber = Integer.parseInt(searchQuery);
                job = jobsDao.getJobById(idNumber);

                if (job != null) {
                    messages.put("success", "Displaying results for Job ID: " + searchQuery);
                    reviewsList = reviewsDao.getReviewsByJobId(idNumber); // Retrieve reviews by job ID
                } else {
                    messages.put("error", "No job found with Job ID: " + searchQuery);
                }
            } catch (NumberFormatException e) {
                messages.put("error", "Job ID must be a valid number.");
            } catch (SQLException e) {
                e.printStackTrace();
                messages.put("error", "An unexpected error occurred while retrieving job details.");
            }
        }

        req.setAttribute("job", job);
        req.setAttribute("reviewsList", reviewsList); // Pass reviews to the JSP
        req.getRequestDispatcher("/FindJobs.jsp").forward(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String searchQuery = req.getParameter("searchQuery");

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            resp.sendRedirect("findjobs?searchQuery=" + searchQuery);
        } else {
            req.setAttribute("messages", Map.of("error", "Please enter a valid job ID."));
            req.getRequestDispatcher("/FindJobs.jsp").forward(req, resp);
        }
    }
}

