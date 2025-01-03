package blog.dal;

import blog.model.BenefitsComments;
import blog.model.Jobs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class BenefitsCommentsDao {
    protected ConnectionManager connectionManager;
    private static BenefitsCommentsDao instance = null;

    protected BenefitsCommentsDao() {
        connectionManager = new ConnectionManager();
    }

    public static BenefitsCommentsDao getInstance() {
        if (instance == null) {
            instance = new BenefitsCommentsDao();
        }
        return instance;
    }

    public BenefitsComments create(BenefitsComments comment) throws SQLException {
        String insertComment = "INSERT INTO BenefitsComments(CommentCity, CommentState, CommentContent, CreatedTime, CommentRating, JobId) " +
                "VALUES(?, ?, ?, ?, ?, ?);";
        Connection connection = null;
        PreparedStatement insertStmt = null;
        try {
            connection = connectionManager.getConnection();
            insertStmt = connection.prepareStatement(insertComment);
            insertStmt.setString(1, comment.getCommentCity());
            insertStmt.setString(2, comment.getCommentState());
            insertStmt.setString(3, comment.getCommentContent());
            insertStmt.setTimestamp(4, comment.getCreatedTime());
            insertStmt.setDouble(5, comment.getCommentRating());
            insertStmt.setInt(6, comment.getJob().getJobId());
            insertStmt.executeUpdate();
            return comment;
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (insertStmt != null) {
                insertStmt.close();
            }
        }
    }


    public BenefitsComments updateCommentContent(BenefitsComments comment, String newContent) throws SQLException {
        String updateComment = "UPDATE BenefitsComments SET CommentContent=? WHERE BenefitsCommentsId=?;";
        Connection connection = null;
        PreparedStatement updateStmt = null;
        try {
            connection = connectionManager.getConnection();
            updateStmt = connection.prepareStatement(updateComment);
            updateStmt.setString(1, newContent);
            updateStmt.setInt(2, comment.getBenefitsCommentsId());
            updateStmt.executeUpdate();
            comment.setCommentContent(newContent);
            return comment;
        } finally {
            if (connection != null) {
                connection.close();
            }
            if (updateStmt != null) {
                updateStmt.close();
            }
        }
    }

    public BenefitsComments delete(BenefitsComments comment) throws SQLException {
        String deleteComment = "DELETE FROM BenefitsComments WHERE BenefitsCommentsId=?;";
        Connection connection = null;
        PreparedStatement deleteStmt = null;
        try {
            connection = connectionManager.getConnection();
            deleteStmt = connection.prepareStatement(deleteComment);
            deleteStmt.setInt(1, comment.getBenefitsCommentsId());
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
