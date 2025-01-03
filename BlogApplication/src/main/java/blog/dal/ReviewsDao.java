package blog.dal;

import blog.model.Reviews;
import blog.model.Jobs;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
                "RatingForCompBenefits, RatingForCultureValues, RatingForOverall, RatingForSeniorManagement, " +
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
            insertStmt.setBigDecimal(7, review.getRatingForOverall());
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
    
    public List<Reviews> getReviewsByJobId(int jobId) throws SQLException {
        List<Reviews> reviewsList = new ArrayList<>();
        String selectReviews = "SELECT ReviewId, Cons, Pros, Publisher, RatingForCareerOpportunities, " +
                "RatingForCompBenefits, RatingForCultureValues, RatingForOverall, RatingForSeniorManagement, " +
                "RatingForWorkLifeBalanace, ReviewContent, ReviewerLocation, ReviewerStatus, JobId " +
                "FROM Reviews WHERE JobId = ?;";
        Connection connection = null;
        PreparedStatement selectStmt = null;
        ResultSet results = null;
        JobsDao jobsDao = JobsDao.getInstance();
        try {
            connection = connectionManager.getConnection();
            selectStmt = connection.prepareStatement(selectReviews);
            selectStmt.setInt(1, jobId);
            results = selectStmt.executeQuery();

            while (results.next()) {
                int reviewId = results.getInt("ReviewId");
                String cons = results.getString("Cons");
                String pros = results.getString("Pros");
                String publisher = results.getString("Publisher");
                BigDecimal ratingForCareerOpportunities = results.getBigDecimal("RatingForCareerOpportunities");
                BigDecimal ratingForCompBenefits = results.getBigDecimal("RatingForCompBenefits");
                BigDecimal ratingForCultureValues = results.getBigDecimal("RatingForCultureValues");
                BigDecimal ratingForOverall = results.getBigDecimal("RatingForOverall");
                BigDecimal ratingForSeniorManagement = results.getBigDecimal("RatingForSeniorManagement");
                BigDecimal ratingForWorkLifeBalanace = results.getBigDecimal("RatingForWorkLifeBalanace");
                String reviewContent = results.getString("ReviewContent");
                String reviewerLocation = results.getString("ReviewerLocation");
                String reviewerStatus = results.getString("ReviewerStatus");
                Jobs job = jobsDao.getJobById(jobId);

                Reviews review = new Reviews(reviewId, cons, pros, publisher, ratingForCareerOpportunities,
                        ratingForCompBenefits, ratingForCultureValues, ratingForOverall,
                        ratingForSeniorManagement, ratingForWorkLifeBalanace, reviewContent,
                        reviewerLocation, reviewerStatus, job);
                reviewsList.add(review);
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
        return reviewsList;
    }
}
