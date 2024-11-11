package blog.dal;

import blog.model.Companies;
import blog.model.Industries;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CompaniesDao {
    protected ConnectionManager connectionManager;

    private static CompaniesDao instance = null;

    protected CompaniesDao() {
        connectionManager = new ConnectionManager();
    }

    public static CompaniesDao getInstance() {
        if(instance == null) {
            instance = new CompaniesDao();
        }
        return instance;
    }

    public Companies create(Companies company) throws SQLException {
        String insertCompany = "INSERT INTO Companies(CompanyId, CompanyName, IsExpired, FoundedYear, " +
                "Headquarters, CompanyType, CompanySize, HideCEOInfo, IsSponsored, Revenue, IndustryId) " +
                "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertCompany);
            insertStmt.setInt(1, company.getCompanyId());
            insertStmt.setString(2, company.getCompanyName());
            insertStmt.setBoolean(3, company.getIsExpired());
            insertStmt.setString(4, company.getFoundedYear());
            insertStmt.setString(5, company.getHeadquarters());
            insertStmt.setString(6, company.getCompanyType());
            insertStmt.setString(7, company.getCompanySize());
            insertStmt.setBoolean(8, company.getHideCEOInfo());
            insertStmt.setBoolean(9, company.getIsSponsored());
            insertStmt.setString(10, company.getRevenue());
            insertStmt.setInt(11, company.getIndustry().getIndustryId());
            insertStmt.executeUpdate();
            return company;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(insertStmt != null) {
                insertStmt.close();
            }
        }
    }

    public Companies updateCompanyName(Companies company, String newCompanyName) throws SQLException {
        String updateCompany = "UPDATE Companies SET CompanyName=? WHERE CompanyId=?;";
        Connection connection = null;
        PreparedStatement updateStmt = null;
        try {
            connection = connectionManager.getConnection();
            updateStmt = connection.prepareStatement(updateCompany);
            updateStmt.setString(1, newCompanyName);
            updateStmt.setInt(2, company.getCompanyId());
            updateStmt.executeUpdate();
            company.setCompanyName(newCompanyName);
            return company;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(updateStmt != null) {
                updateStmt.close();
            }
        }
    }

    public Companies delete(Companies company) throws SQLException {
        String deleteCompany = "DELETE FROM Companies WHERE CompanyId=?;";
        Connection connection = null;
        PreparedStatement deleteStmt = null;
        try {
            connection = connectionManager.getConnection();
            deleteStmt = connection.prepareStatement(deleteCompany);
            deleteStmt.setInt(1, company.getCompanyId());
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

    public Companies getCompanyById(int companyId) throws SQLException {
        String selectCompany = "SELECT CompanyId, CompanyName, IsExpired, FoundedYear, Headquarters, " +
                "CompanyType, CompanySize, HideCEOInfo, IsSponsored, Revenue, IndustryId " +
                "FROM Companies WHERE CompanyId=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectCompany);
            selectStmt.setInt(1, companyId);
            results = selectStmt.executeQuery();
            if(results.next()) {
                int resultCompanyId = results.getInt("CompanyId");
                String companyName = results.getString("CompanyName");
                boolean isExpired = results.getBoolean("IsExpired");
                String foundedYear = results.getString("FoundedYear");
                String headquarters = results.getString("Headquarters");
                String companyType = results.getString("CompanyType");
                String companySize = results.getString("CompanySize");
                boolean hideCEOInfo = results.getBoolean("HideCEOInfo");
                boolean isSponsored = results.getBoolean("IsSponsored");
                String revenue = results.getString("Revenue");
                int industryId = results.getInt("IndustryId");
                Industries industry = IndustriesDao.getInstance().getIndustryById(industryId);
                Companies company = new Companies(resultCompanyId, companyName, isExpired, foundedYear, 
                        headquarters, companyType, companySize, hideCEOInfo, isSponsored, revenue, industry);
                return company;
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
    
    public Companies getCompanyByName(String companyName) throws SQLException {
        String selectCompany = "SELECT CompanyId, CompanyName, IsExpired, FoundedYear, Headquarters, " +
                "CompanyType, CompanySize, HideCEOInfo, IsSponsored, Revenue, IndustryId " +
                "FROM Companies WHERE CompanyName=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectCompany);
            selectStmt.setString(1, companyName);
            results = selectStmt.executeQuery();
            
            if (results.next()) {
                int companyId = results.getInt("CompanyId");
                String resultCompanyName = results.getString("CompanyName");
                boolean isExpired = results.getBoolean("IsExpired");
                String foundedYear = results.getString("FoundedYear");
                String headquarters = results.getString("Headquarters");
                String companyType = results.getString("CompanyType");
                String companySize = results.getString("CompanySize");
                boolean hideCEOInfo = results.getBoolean("HideCEOInfo");
                boolean isSponsored = results.getBoolean("IsSponsored");
                String revenue = results.getString("Revenue");
                int industryId = results.getInt("IndustryId");
                Industries industry = IndustriesDao.getInstance().getIndustryById(industryId);
                
                Companies company = new Companies(companyId, resultCompanyName, isExpired, foundedYear, 
                        headquarters, companyType, companySize, hideCEOInfo, isSponsored, revenue, industry);
                return company;
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
        return null; // Return null if no matching company is found
    }

    public List<Companies> getCompaniesByIndustry(Industries industry) throws SQLException {
        List<Companies> companiesList = new ArrayList<>();
        String selectCompanies = "SELECT CompanyId, CompanyName, IsExpired, FoundedYear, Headquarters, " +
                "CompanyType, CompanySize, HideCEOInfo, IsSponsored, Revenue, IndustryId " +
                "FROM Companies WHERE IndustryId=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectCompanies);
            selectStmt.setInt(1, industry.getIndustryId());
            results = selectStmt.executeQuery();
            while(results.next()) {
                int companyId = results.getInt("CompanyId");
                String companyName = results.getString("CompanyName");
                boolean isExpired = results.getBoolean("IsExpired");
                String foundedYear = results.getString("FoundedYear");
                String headquarters = results.getString("Headquarters");
                String companyType = results.getString("CompanyType");
                String companySize = results.getString("CompanySize");
                boolean hideCEOInfo = results.getBoolean("HideCEOInfo");
                boolean isSponsored = results.getBoolean("IsSponsored");
                String revenue = results.getString("Revenue");
                Companies company = new Companies(companyId, companyName, isExpired, foundedYear,
                        headquarters, companyType, companySize, hideCEOInfo, isSponsored, revenue, industry);
                companiesList.add(company);
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
        return companiesList;
    }
    
	public int getNextAvailableCompanyId() throws SQLException {
	    String selectMaxId = "SELECT MAX(CompanyId) AS MaxId FROM Companies;";
	    Connection connection = null;
	    PreparedStatement selectStmt = null;
	    ResultSet results = null;
	    try {
	        connection = connectionManager.getConnection();
	        selectStmt = connection.prepareStatement(selectMaxId);
	        results = selectStmt.executeQuery();
	        
	        if (results.next()) {
	            int maxId = results.getInt("MaxId");
	            return maxId + 1; // Return the next available ID
	        } else {
	            return 1; // If no entries are found, start with ID 1
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
