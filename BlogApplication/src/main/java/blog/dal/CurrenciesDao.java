package blog.dal;

import blog.model.Currencies;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CurrenciesDao {
    protected ConnectionManager connectionManager;
    private static CurrenciesDao instance = null;

    protected CurrenciesDao() {
        connectionManager = new ConnectionManager();
    }

    public static CurrenciesDao getInstance() {
        if(instance == null) {
            instance = new CurrenciesDao();
        }
        return instance;
    }

    public Currencies create(Currencies currency) throws SQLException {
        String insertCurrency = "INSERT INTO Currencies(CurrencyCode, CurrencyName, ExchangeRate) VALUES(?, ?, ?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertCurrency);
            insertStmt.setString(1, currency.getCurrencyCode());
            insertStmt.setString(2, currency.getCurrencyName());
            insertStmt.setBigDecimal(3, currency.getExchangeRate());
            insertStmt.executeUpdate();
            return currency;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(insertStmt != null) {
                insertStmt.close();
            }
        }
    }

    public Currencies getCurrencyByCode(String currencyCode) throws SQLException {
        String selectCurrency = "SELECT CurrencyCode, CurrencyName, ExchangeRate FROM Currencies WHERE CurrencyCode=?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectCurrency);
            selectStmt.setString(1, currencyCode);
            results = selectStmt.executeQuery();
            if(results.next()) {
                String resultCurrencyCode = results.getString("CurrencyCode");
                String currencyName = results.getString("CurrencyName");
                BigDecimal exchangeRate = results.getBigDecimal("ExchangeRate");
                Currencies currency = new Currencies(resultCurrencyCode, currencyName, exchangeRate);
                return currency;
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

    public Currencies updateExchangeRate(Currencies currency, BigDecimal newExchangeRate) throws SQLException {
        String updateCurrency = "UPDATE Currencies SET ExchangeRate=? WHERE CurrencyCode=?;";
        Connection connection = null;
        PreparedStatement updateStmt = null;
        try {
            connection = connectionManager.getConnection();
            updateStmt = connection.prepareStatement(updateCurrency);
            updateStmt.setBigDecimal(1, newExchangeRate);
            updateStmt.setString(2, currency.getCurrencyCode());
            updateStmt.executeUpdate();
            currency.setExchangeRate(newExchangeRate);
            return currency;
        } finally {
            if(connection != null) {
                connection.close();
            }
            if(updateStmt != null) {
                updateStmt.close();
            }
        }
    }

    public Currencies delete(Currencies currency) throws SQLException {
        String deleteCurrency = "DELETE FROM Currencies WHERE CurrencyCode=?;";
        Connection connection = null;
        PreparedStatement deleteStmt = null;
        try {
            connection = connectionManager.getConnection();
            deleteStmt = connection.prepareStatement(deleteCurrency);
            deleteStmt.setString(1, currency.getCurrencyCode());
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
