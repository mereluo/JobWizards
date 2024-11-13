package blog.servlet;

import blog.dal.JobsDao;
import blog.model.Jobs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/jobwizards")
public class JobWizards extends HttpServlet {
	protected JobsDao jobsDao;
	@Override
	public void init() throws ServletException {
		jobsDao = JobsDao.getInstance();
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    Map<String, String> messages = new HashMap<>();
	    req.setAttribute("messages", messages);
	    req.setAttribute("currentPage", "jobwizards");
	    messages.put("title", "Job Recommendation");
	    

	    List<Jobs> jobList = null;

	    try {
	        // Default rating criteria for recommendations
	    	System.out.println("Not null");
	        String[] ratingCriteria = {"RatingForOverall"};
	        String[] jobTitle = new String[0];
	        jobList = jobsDao.getJobsByRating(ratingCriteria, jobTitle);
	        if (jobList.size() > 9) {
	            jobList = jobList.subList(0, 9); // Keeps only the first 9 elements since I need 9 cards
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    req.setAttribute("jobList", jobList);
	    req.getRequestDispatcher("/JobWizards.jsp").forward(req, resp);
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setAttribute("currentPage", "jobwizards");
        String[] ratingCriteria = null;
        ratingCriteria[0] = "RatingForOverall";

        List<Jobs> jobList = null;

        try {
            if (ratingCriteria != null) {
            	System.out.println("Not null");
            	String[] jobTitle = new String[0];
                jobList = jobsDao.getJobsByRating(ratingCriteria, jobTitle);
                for (Jobs job : jobList) {
                    System.out.println(job);
                }
            }
            
            System.out.println(" null");
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("jobList", jobList);
        request.getRequestDispatcher("/JobRecommendation.jsp").forward(request, response);
    }
}