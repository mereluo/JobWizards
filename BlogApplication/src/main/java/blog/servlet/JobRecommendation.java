package blog.servlet;

import blog.dal.JobsDao;
import blog.model.Jobs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/jobrecommendation")
public class JobRecommendation extends HttpServlet {
	protected JobsDao jobsDao;
	@Override
	public void init() throws ServletException {
		jobsDao = JobsDao.getInstance();
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("currentPage", "jobrecommendation");
		// Map for storing messages.
        Map<String, String> messages = new HashMap<String, String>();
        req.setAttribute("messages", messages);
        // Provide a title and render the JSP.
        messages.put("title", "Job Recommendation");        
        req.getRequestDispatcher("/JobRecommendation.jsp").forward(req, resp);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("currentPage", "jobrecommendation");
	    String[] ratingCriteria = request.getParameterValues("ratingCriteria");
	    if (ratingCriteria == null) 
	    	ratingCriteria = new String[] {"RatingForOverall"};
	    String[] jobTitle = request.getParameterValues("jobTitle");
	    
	    System.out.println("Selected Rating Criteria: " + Arrays.toString(ratingCriteria));
	    System.out.println("Selected job title: " + Arrays.toString(jobTitle));
	    List<Jobs> jobList = null;
	    
	    try {
	    	jobList = jobsDao.getJobsByRating(ratingCriteria, jobTitle);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // Add both jobList and ratingCriteria to the request scope
	    request.setAttribute("jobList", jobList);
	    request.setAttribute("ratingCriteria", ratingCriteria);
	    request.setAttribute("jobTitle", jobTitle);

	    request.getRequestDispatcher("/JobRecommendation.jsp").forward(request, response);
	}

}
