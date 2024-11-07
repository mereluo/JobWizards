package blog.servlet;

import blog.dal.JobsDao;
import blog.model.Jobs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
		// Map for storing messages.
        Map<String, String> messages = new HashMap<String, String>();
        req.setAttribute("messages", messages);
        // Provide a title and render the JSP.
        messages.put("title", "Job Recommendation");        
        req.getRequestDispatcher("/JobRecommendation.jsp").forward(req, resp);
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] ratingCriteria = request.getParameterValues("ratingCriteria");

        List<Jobs> jobList = null;

        try {
            if (ratingCriteria != null) {
                jobList = jobsDao.getJobsByRating(ratingCriteria);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("jobList", jobList);
        request.getRequestDispatcher("/JobRecommendation.jsp").forward(request, response);
    }
}
