package blog.dal;

import blog.model.Industries;
import blog.model.Sectors;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IndustriesDao {
    protected ConnectionManager connectionManager;
    
    private static IndustriesDao instance = null;
    protected IndustriesDao() {
        connectionManager = new ConnectionManager();
    }
    public static IndustriesDao getInstance() {
        if(instance == null) {
            instance = new IndustriesDao();
        }
        return instance;
    }

    public Industries create(Industries industry) throws SQLException {
        String insertIndustry = "INSERT INTO Industries(IndustryId, Industry, SectorId) VALUES(?, ?, ?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertIndustry);
            insertStmt.setInt(1, industry.getIndustryId());
            insertStmt.setString(2, industry.getIndustry());
            insertStmt.setInt(3, industry.getSector().getSectorId());
            insertStmt.executeUpdate();
            return industry;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(insertStmt != null) {
                insertStmt.close();
            }
        }
    }

    public Industries updateIndustry(Industries industry, String newIndustry) throws SQLException {
        String updateIndustry = "UPDATE Industries SET Industry=? WHERE IndustryId=?;";
        Connection connection = null;
        PreparedStatement updateStmt = null;
        try {
            connection = connectionManager.getConnection();
            updateStmt = connection.prepareStatement(updateIndustry);
            updateStmt.setString(1, newIndustry);
            updateStmt.setInt(2, industry.getIndustryId());
            updateStmt.executeUpdate();
            industry.setIndustry(newIndustry);
            return industry;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(updateStmt != null) {
                updateStmt.close();
            }
        }
    }

    public Industries delete(Industries industry) throws SQLException {
        String deleteIndustry = "DELETE FROM Industries WHERE IndustryId=?;";
        Connection connection = null;
        PreparedStatement deleteStmt = null;
        try {
            connection = connectionManager.getConnection();
            deleteStmt = connection.prepareStatement(deleteIndustry);
            deleteStmt.setInt(1, industry.getIndustryId());
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

    public Industries getIndustryById(int industryId) throws SQLException {
        String selectIndustry = "SELECT IndustryId, Industry, SectorId FROM Industries WHERE IndustryId=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectIndustry);
            selectStmt.setInt(1, industryId);
            results = selectStmt.executeQuery();
            if(results.next()) {
                int resultIndustryId = results.getInt("IndustryId");
                String industry = results.getString("Industry");
                int sectorId = results.getInt("SectorId");
                Sectors sector = SectorsDao.getInstance().getSectorById(sectorId);
                Industries industryObj = new Industries(resultIndustryId, industry, sector);
                return industryObj;
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

    public List<Industries> getIndustriesBySector(Sectors sector) throws SQLException {
        List<Industries> industriesList = new ArrayList<>();
        String selectIndustries = "SELECT IndustryId, Industry, SectorId FROM Industries WHERE SectorId=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectIndustries);
            selectStmt.setInt(1, sector.getSectorId());
            results = selectStmt.executeQuery();
            while(results.next()) {
                int industryId = results.getInt("IndustryId");
                String industry = results.getString("Industry");
                Industries industryObj = new Industries(industryId, industry, sector);
                industriesList.add(industryObj);
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
        return industriesList;
    }
}
