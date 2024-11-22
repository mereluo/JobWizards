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
import java.util.List;

@WebServlet("/findjobsbyname")
public class FindJobsByName extends HttpServlet {
    protected JobsDao jobsDao;

    @Override
    public void init() throws ServletException {
        jobsDao = JobsDao.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String jobName = req.getParameter("searchQuery");
        List<Jobs> jobList = null;

        try {
            if (jobName != null && !jobName.trim().isEmpty()) {
                jobList = jobsDao.getJobsByName(jobName);
            }
	        if (jobList.size() > 9) {
	            jobList = jobList.subList(0, 9); // Keeps only the first 9 elements since I need 9 cards
	        }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new IOException(e);
        }

        // Set jobList and jobName as request attributes to pass to the JSP
        req.setAttribute("jobList", jobList);
        req.setAttribute("jobName", jobName);

        // Forward the request to the JSP page for rendering results
        req.getRequestDispatcher("/FindJobsByName.jsp").forward(req, resp);
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Redirect POST requests to doGet to handle form submissions as a GET request
        doGet(req, resp);
    }
}
