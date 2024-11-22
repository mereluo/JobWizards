package blog.dal;

import blog.model.Sectors;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SectorsDao {
    protected ConnectionManager connectionManager;
    
    private static SectorsDao instance = null;
    protected SectorsDao() {
        connectionManager = new ConnectionManager();
    }
    public static SectorsDao getInstance() {
        if(instance == null) {
            instance = new SectorsDao();
        }
        return instance;
    }

    public Sectors create(Sectors sector) throws SQLException {
        String insertSector = "INSERT INTO Sectors(SectorId, Sector) VALUES(?, ?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertSector);
            insertStmt.setInt(1, sector.getSectorId());
            insertStmt.setString(2, sector.getSector());
            insertStmt.executeUpdate();
            return sector;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(insertStmt != null) {
                insertStmt.close();
            }
        }
    }

    public Sectors updateSector(Sectors sector, String newSector) throws SQLException {
        String updateSector = "UPDATE Sectors SET Sector=? WHERE SectorId=?;";
        Connection connection = null;
        PreparedStatement updateStmt = null;
        try {
            connection = connectionManager.getConnection();
            updateStmt = connection.prepareStatement(updateSector);
            updateStmt.setString(1, newSector);
            updateStmt.setInt(2, sector.getSectorId());
            updateStmt.executeUpdate();
            sector.setSector(newSector);
            return sector;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(updateStmt != null) {
                updateStmt.close();
            }
        }
    }

    public Sectors delete(Sectors sector) throws SQLException {
        String deleteSector = "DELETE FROM Sectors WHERE SectorId=?;";
        Connection connection = null;
        PreparedStatement deleteStmt = null;
        try {
            connection = connectionManager.getConnection();
            deleteStmt = connection.prepareStatement(deleteSector);
            deleteStmt.setInt(1, sector.getSectorId());
            deleteStmt.executeUpdate();
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(deleteStmt != null) {
                deleteStmt.close();
            }
        }
    }

    public Sectors getSectorById(int sectorId) throws SQLException {
        String selectSector = "SELECT SectorId, Sector FROM Sectors WHERE SectorId=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectSector);
            selectStmt.setInt(1, sectorId);
            results = selectStmt.executeQuery();
            if(results.next()) {
                int resultSectorId = results.getInt("SectorId");
                String sector = results.getString("Sector");
                Sectors sectorObj = new Sectors(resultSectorId, sector);
                return sectorObj;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
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

    public List<Sectors> getAllSectors() throws SQLException {
        List<Sectors> sectorsList = new ArrayList<>();
        String selectSectors = "SELECT SectorId, Sector FROM Sectors;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectSectors);
            results = selectStmt.executeQuery();
            while(results.next()) {
                int sectorId = results.getInt("SectorId");
                String sector = results.getString("Sector");
                Sectors sectorObj = new Sectors(sectorId, sector);
                sectorsList.add(sectorObj);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
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
        return sectorsList;
    }
}
