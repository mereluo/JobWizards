package blog.dal;

import blog.model.Reviews;
import blog.model.Jobs;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReviewsDao {
    protected ConnectionManager connectionManager;
    private static ReviewsDao instance = null;

    protected ReviewsDao() {
        connectionManager = new ConnectionManager();
    }

    public static ReviewsDao getInstance() {
        if (instance == null) {
            instance = new ReviewsDao();
        }
        return instance;
    }

    public Reviews create(Reviews review) throws SQLException {
        String insertReview = "INSERT INTO Reviews(Cons, Pros, Publisher, RatingForCareerOpportunities, " +
                "RatingForCompBenefits, RatingForCultureValues, RatingOverall, RatingForSeniorManagement, " +
                "RatingForWorkLifeBalanace, ReviewContent, ReviewerLocation, ReviewerStatus, JobId) " +
                "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertReview);
            insertStmt.setString(1, review.getCons());
            insertStmt.setString(2, review.getPros());
            insertStmt.setString(3, review.getPublisher());
            insertStmt.setBigDecimal(4, review.getRatingForCareerOpportunities());
            insertStmt.setBigDecimal(5, review.getRatingForCompBenefits());
            insertStmt.setBigDecimal(6, review.getRatingForCultureValues());
            insertStmt.setBigDecimal(7, review.getRatingOverall());
            insertStmt.setBigDecimal(8, review.getRatingForSeniorManagement());
            insertStmt.setBigDecimal(9, review.getRatingForWorkLifeBalanace());
            insertStmt.setString(10, review.getReviewContent());
            insertStmt.setString(11, review.getReviewerLocation());
            insertStmt.setString(12, review.getReviewerStatus());
            insertStmt.setInt(13, review.getJob().getJobId());
            insertStmt.executeUpdate();
            return review;
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (insertStmt != null) {
                insertStmt.close();
            }
        }
    }


    public Reviews updateContent(Reviews review, String newContent) throws SQLException {
        String updateReview = "UPDATE Reviews SET ReviewContent=? WHERE ReviewId=?;";
        Connection connection = null;
        PreparedStatement updateStmt = null;
        try {
            connection = connectionManager.getConnection();
            updateStmt = connection.prepareStatement(updateReview);
            updateStmt.setString(1, newContent);
            updateStmt.setInt(2, review.getReviewId());
            updateStmt.executeUpdate();
            review.setReviewContent(newContent);
            return review;
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (updateStmt != null) {
                updateStmt.close();
            }
        }
    }

    public Reviews delete(Reviews review) throws SQLException {
        String deleteReview = "DELETE FROM Reviews WHERE ReviewId=?;";
        Connection connection = null;
        PreparedStatement deleteStmt = null;
        try {
            connection = connectionManager.getConnection();
            deleteStmt = connection.prepareStatement(deleteReview);
            deleteStmt.setInt(1, review.getReviewId());
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
