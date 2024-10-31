package blog.dal;

import blog.model.Companies;
import blog.model.Jobs;
import blog.model.Locations;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
