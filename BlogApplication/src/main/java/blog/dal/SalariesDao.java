package blog.dal;

import blog.model.Jobs;
import blog.model.Salaries;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SalariesDao {
    protected ConnectionManager connectionManager;
    private static SalariesDao instance = null;

    protected SalariesDao() {
        connectionManager = new ConnectionManager();
    }

    public static SalariesDao getInstance() {
        if(instance == null) {
            instance = new SalariesDao();
        }
        return instance;
    }

    public Salaries create(Salaries salary) throws SQLException {
        String insertSalary = "INSERT INTO Salaries(SalaryId, JobTitle, PayPeriod, PayPercentile10, PayPercentile90, PayPercentile50, SalaryType, JobId, CurrencyCode) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertSalary);
            insertStmt.setInt(1, salary.getSalaryId());
            insertStmt.setString(2, salary.getJobTitle());
            insertStmt.setString(3, salary.getPayPeriod());
            insertStmt.setDouble(4, salary.getPayPercentile10());
            insertStmt.setDouble(5, salary.getPayPercentile90());
            insertStmt.setDouble(6, salary.getPayPercentile50());
            insertStmt.setString(7, salary.getSalaryType());
            insertStmt.setInt(8, salary.getJob().getJobId());
            insertStmt.setString(9, salary.getCurrencyCode());
            insertStmt.executeUpdate();
            return salary;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(insertStmt != null) {
                insertStmt.close();
            }
        }
    }

    public Salaries getSalaryById(int salaryId) throws SQLException {
        String selectSalary = "SELECT SalaryId, JobTitle, PayPeriod, PayPercentile10, PayPercentile90, PayPercentile50, SalaryType, JobId, CurrencyCode FROM Salaries WHERE SalaryId=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        JobsDao jobsDao = JobsDao.getInstance();
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectSalary);
            selectStmt.setInt(1, salaryId);
            results = selectStmt.executeQuery();
            if(results.next()) {
                int resultSalaryId = results.getInt("SalaryId");
                String jobTitle = results.getString("JobTitle");
                String payPeriod = results.getString("PayPeriod");
                double payPercentile10 = results.getDouble("PayPercentile10");
                double payPercentile90 = results.getDouble("PayPercentile90");
                double payPercentile50 = results.getDouble("PayPercentile50");
                String salaryType = results.getString("SalaryType");
                int jobId = results.getInt("JobId");
                String currencyCode = results.getString("CurrencyCode");
                Jobs job = jobsDao.getJobById(jobId);
                Salaries salary = new Salaries(resultSalaryId, jobTitle, payPeriod, payPercentile10, payPercentile90, payPercentile50, salaryType, job, currencyCode);
                return salary;
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


    public Salaries delete(Salaries salary) throws SQLException {
        String deleteSalary = "DELETE FROM Salaries WHERE SalaryId=?;";
        Connection connection = null;
        PreparedStatement deleteStmt = null;
        try {
            connection = connectionManager.getConnection();
            deleteStmt = connection.prepareStatement(deleteSalary);
            deleteStmt.setInt(1, salary.getSalaryId());
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
}
