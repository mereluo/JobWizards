package blog.dal;

import blog.model.BenefitsHighlights;
import blog.model.Jobs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BenefitsHighlightsDao {
    protected ConnectionManager connectionManager;
    private static BenefitsHighlightsDao instance = null;

    protected BenefitsHighlightsDao() {
        connectionManager = new ConnectionManager();
    }

    public static BenefitsHighlightsDao getInstance() {
        if (instance == null) {
            instance = new BenefitsHighlightsDao();
        }
        return instance;
    }

    public BenefitsHighlights create(BenefitsHighlights highlight) throws SQLException {
        String insertHighlight = "INSERT INTO BenefitsHighlights(HighlightPhrase, HighlightName, CommentCount, JobId) " +
                "VALUES(?, ?, ?, ?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertHighlight);
            insertStmt.setString(1, highlight.getHighlightPhrase());
            insertStmt.setString(2, highlight.getHighlightName());
            insertStmt.setString(3, highlight.getCommentCount());
            insertStmt.setInt(4, highlight.getJob().getJobId());
            insertStmt.executeUpdate();
            return highlight;
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (insertStmt != null) {
                insertStmt.close();
            }
        }
    }


    public BenefitsHighlights updateHighlightPhrase(BenefitsHighlights highlight, String newPhrase) throws SQLException {
        String updateHighlight = "UPDATE BenefitsHighlights SET HighlightPhrase=? WHERE BenefitsHighlightsId=?;";
        Connection connection = null;
        PreparedStatement updateStmt = null;
        try {
            connection = connectionManager.getConnection();
            updateStmt = connection.prepareStatement(updateHighlight);
            updateStmt.setString(1, newPhrase);
            updateStmt.setInt(2, highlight.getBenefitsHighlightsId());
            updateStmt.executeUpdate();
            highlight.setHighlightPhrase(newPhrase);
            return highlight;
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (updateStmt != null) {
                updateStmt.close();
            }
        }
    }

    public BenefitsHighlights delete(BenefitsHighlights highlight) throws SQLException {
        String deleteHighlight = "DELETE FROM BenefitsHighlights WHERE BenefitsHighlightsId=?;";
        Connection connection = null;
        PreparedStatement deleteStmt = null;
        try {
            connection = connectionManager.getConnection();
            deleteStmt = connection.prepareStatement(deleteHighlight);
            deleteStmt.setInt(1, highlight.getBenefitsHighlightsId());
            deleteStmt.executeUpdate();
            return null;
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (deleteStmt != null) {
                deleteStmt.close();
            }
        }
    }
}
