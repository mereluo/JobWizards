package blog.dal;

import blog.model.Companies;
import blog.model.Jobs;
import blog.model.Locations;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JobsDao {
    protected ConnectionManager connectionManager;
    private static JobsDao instance = null;

    protected JobsDao() {
        connectionManager = new ConnectionManager();
    }

    public static JobsDao getInstance() {
        if(instance == null) {
            instance = new JobsDao();
        }
        return instance;
    }

    public Jobs create(Jobs job) throws SQLException {
        String insertJob = "INSERT INTO Jobs(JobId, Title, AdvertiserType, ApplyButtonDisabled, EasyApply, PostedDate, Rating, Source, CompanyId, LocationId) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertJob);
            insertStmt.setInt(1, job.getJobId());
            insertStmt.setString(2, job.getTitle());
            insertStmt.setString(3, job.getAdvertiserType());
            insertStmt.setBoolean(4, job.isApplyButtonDisabled());
            insertStmt.setBoolean(5, job.isEasyApply());
            insertStmt.setString(6, job.getPostedDate());
            insertStmt.setBigDecimal(7, job.getRating());
            insertStmt.setString(8, job.getSource());
            insertStmt.setInt(9, job.getCompany().getCompanyId());
            insertStmt.setInt(10, job.getLocation().getLocationId());
            insertStmt.executeUpdate();
            return job;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(insertStmt != null) {
                insertStmt.close();
            }
        }
    }

    public Jobs updateTitle(Jobs job, String newTitle) throws SQLException {
        String updateJob = "UPDATE Jobs SET Title=? WHERE JobId=?;";
        Connection connection = null;
        PreparedStatement updateStmt = null;
        try {
            connection = connectionManager.getConnection();
            updateStmt = connection.prepareStatement(updateJob);
            updateStmt.setString(1, newTitle);
            updateStmt.setInt(2, job.getJobId());
            updateStmt.executeUpdate();
            job.setTitle(newTitle);
            return job;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(updateStmt != null) {
                updateStmt.close();
            }
        }
    }

    public Jobs delete(Jobs job) throws SQLException {
        String deleteJob = "DELETE FROM Jobs WHERE JobId=?;";
        Connection connection = null;
        PreparedStatement deleteStmt = null;
        try {
            connection = connectionManager.getConnection();
            deleteStmt = connection.prepareStatement(deleteJob);
            deleteStmt.setInt(1, job.getJobId());
            deleteStmt.executeUpdate();
            return null;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(deleteStmt != null) {
                deleteStmt.close();
            }
        }
    }

    public Jobs getJobById(int jobId) throws SQLException {
        String selectJob = "SELECT JobId, Title, AdvertiserType, ApplyButtonDisabled, EasyApply, PostedDate, Rating, Source, CompanyId, LocationId FROM Jobs WHERE JobId=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        CompaniesDao companiesDao = CompaniesDao.getInstance();
        LocationsDao locationsDao = LocationsDao.getInstance();
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectJob);
            selectStmt.setInt(1, jobId);
            results = selectStmt.executeQuery();
            if(results.next()) {
                int resultJobId = results.getInt("JobId");
                String title = results.getString("Title");
                String advertiserType = results.getString("AdvertiserType");
                boolean applyButtonDisabled = results.getBoolean("ApplyButtonDisabled");
                boolean easyApply = results.getBoolean("EasyApply");
                String postedDate = results.getString("PostedDate");
                BigDecimal rating = results.getBigDecimal("Rating");
                String source = results.getString("Source");
                int companyId = results.getInt("CompanyId");
                int locationId = results.getInt("LocationId");
                Companies company = companiesDao.getCompanyById(companyId);
                Locations location = locationsDao.getLocationById(locationId);
                Jobs job = new Jobs(resultJobId, title, advertiserType, applyButtonDisabled, easyApply, postedDate, rating, source, company, location);
                return job;
            }
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(selectStmt != null) {
                selectStmt.close();
            }
            if(results != null) {
                results.close();
            }
        }
        return null;
    }
    
    public List<Jobs> getJobsByRating(String[] ratingCriteria) throws SQLException {
        List<Jobs> jobsList = new ArrayList<>();
        
        StringBuilder queryBuilder = new StringBuilder();
        queryBuilder.append("SELECT j.JobId, j.Title, j.AdvertiserType, j.ApplyButtonDisabled, ")
                    .append("j.EasyApply, j.PostedDate, j.Rating, j.Source, j.CompanyId, j.LocationId, ");

        // Add average ratings for selected criteria
        if (ratingCriteria != null && ratingCriteria.length > 0) {
            for (int i = 0; i < ratingCriteria.length; i++) {
                queryBuilder.append("AVG(r.").append(ratingCriteria[i]).append(") AS avg_").append(ratingCriteria[i]);
                if (i < ratingCriteria.length - 1) {
                    queryBuilder.append(", ");
                }
            }
        } else {
            queryBuilder.append("AVG(r.ratingForOverall) AS avg_ratingForOverall"); // Default to overall rating if no criteria selected
        }

        queryBuilder.append(" FROM Jobs j ")
                    .append("JOIN Reviews r ON j.JobId = r.JobId ")
                    .append("GROUP BY j.JobId, j.Title, j.AdvertiserType, j.ApplyButtonDisabled, ")
                    .append("j.EasyApply, j.PostedDate, j.Rating, j.Source, j.CompanyId, j.LocationId ");

        // Order by the specified criteria averages
        if (ratingCriteria != null && ratingCriteria.length > 0) {
            queryBuilder.append("ORDER BY ");
            for (int i = 0; i < ratingCriteria.length; i++) {
                queryBuilder.append("avg_").append(ratingCriteria[i]);
                if (i < ratingCriteria.length - 1) {
                    queryBuilder.append(", ");
                }
            }
            queryBuilder.append(" DESC Limit 12");
        }

        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
    	CompaniesDao companiesDao = CompaniesDao.getInstance();
        LocationsDao locationsDao = LocationsDao.getInstance();
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(queryBuilder.toString());
            results = selectStmt.executeQuery();
            
            while (results.next()) {
                Jobs job = new Jobs(
                		 results.getInt("JobId"),
                         results.getString("Title"),
                         results.getString("AdvertiserType"),
                         results.getBoolean("ApplyButtonDisabled"),
                         results.getBoolean("EasyApply"),
                         results.getString("PostedDate"),
                         results.getBigDecimal("Rating"),
                         results.getString("Source"),
                         companiesDao.getCompanyById(results.getInt("CompanyId")),
                         locationsDao.getLocationById(results.getInt("LocationId"))
                );
                jobsList.add(job);
            }
            
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (selectStmt != null) {
                selectStmt.close();
            }
            if (results != null) {
                results.close();
            }
        }
        return jobsList;
    }
    
    public int getNextAvailableJobId() throws SQLException {
        String selectMaxJobId = "SELECT MAX(JobId) AS MaxJobId FROM Jobs;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectMaxJobId);
            results = selectStmt.executeQuery();
            if (results.next()) {
                int maxJobId = results.getInt("MaxJobId");
                return maxJobId + 1;
            } else {
                return 1; // If there are no jobs, start with JobId 1
            }
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (selectStmt != null) {
                selectStmt.close();
            }
            if (results != null) {
                results.close();
            }
        }
    }

}
