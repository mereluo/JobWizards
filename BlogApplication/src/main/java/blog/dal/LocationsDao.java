package blog.dal;

import blog.model.Locations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LocationsDao {
    protected ConnectionManager connectionManager;

    private static LocationsDao instance = null;

    protected LocationsDao() {
        connectionManager = new ConnectionManager();
    }

    public static LocationsDao getInstance() {
        if(instance == null) {
            instance = new LocationsDao();
        }
        return instance;
    }

    public Locations create(Locations location) throws SQLException {
        String insertLocation = "INSERT INTO Locations(LocationId, City, Country, Lat, Lng) VALUES(?, ?, ?, ?, ?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertLocation);
            insertStmt.setInt(1, location.getLocationId());
            insertStmt.setString(2, location.getCity());
            insertStmt.setString(3, location.getCountry());
            insertStmt.setDouble(4, location.getLat());
            insertStmt.setDouble(5, location.getLng());
            insertStmt.executeUpdate();
            return location;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(insertStmt != null) {
                insertStmt.close();
            }
        }
    }

    public Locations updateCity(Locations location, String newCity) throws SQLException {
        String updateLocation = "UPDATE Locations SET City=? WHERE LocationId=?;";
        Connection connection = null;
        PreparedStatement updateStmt = null;
        try {
            connection = connectionManager.getConnection();
            updateStmt = connection.prepareStatement(updateLocation);
            updateStmt.setString(1, newCity);
            updateStmt.setInt(2, location.getLocationId());
            updateStmt.executeUpdate();
            location.setCity(newCity);
            return location;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(updateStmt != null) {
                updateStmt.close();
            }
        }
    }

    public Locations delete(Locations location) throws SQLException {
        String deleteLocation = "DELETE FROM Locations WHERE LocationId=?;";
        Connection connection = null;
        PreparedStatement deleteStmt = null;
        try {
            connection = connectionManager.getConnection();
            deleteStmt = connection.prepareStatement(deleteLocation);
            deleteStmt.setInt(1, location.getLocationId());
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

    public Locations getLocationById(int locationId) throws SQLException {
        String selectLocation = "SELECT LocationId, City, Country, Lat, Lng FROM Locations WHERE LocationId=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectLocation);
            selectStmt.setInt(1, locationId);
            results = selectStmt.executeQuery();
            if(results.next()) {
                int resultLocationId = results.getInt("LocationId");
                String city = results.getString("City");
                String country = results.getString("Country");
                double lat = results.getDouble("Lat");
                double lng = results.getDouble("Lng");
                Locations location = new Locations(resultLocationId, city, country, lat, lng);
                return location;
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

    public List<Locations> getLocationsByCountry(String country) throws SQLException {
        List<Locations> locationsList = new ArrayList<>();
        String selectLocations = "SELECT LocationId, City, Country, Lat, Lng FROM Locations WHERE Country=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectLocations);
            selectStmt.setString(1, country);
            results = selectStmt.executeQuery();
            while(results.next()) {
                int locationId = results.getInt("LocationId");
                String city = results.getString("City");
                double lat = results.getDouble("Lat");
                double lng = results.getDouble("Lng");
                Locations location = new Locations(locationId, city, country, lat, lng);
                locationsList.add(location);
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
        return locationsList;
    }
}
