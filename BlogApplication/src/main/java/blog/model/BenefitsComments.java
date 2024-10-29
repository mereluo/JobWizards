package blog.model;

import java.sql.Timestamp;

public class BenefitsComments {
    protected int benefitsCommentsId;
    protected String commentCity;
    protected String commentState;
    protected String commentContent;
    protected Timestamp createdTime;
    protected double commentRating;
    protected Jobs job;

    public BenefitsComments(int benefitsCommentsId, String commentCity, String commentState,
                            String commentContent, Timestamp createdTime, double commentRating, Jobs job) {
        this.benefitsCommentsId = benefitsCommentsId;
        this.commentCity = commentCity;
        this.commentState = commentState;
        this.commentContent = commentContent;
        this.createdTime = createdTime;
        this.commentRating = commentRating;
        this.job = job;
    }

    public BenefitsComments(int benefitsCommentsId) {
        this.benefitsCommentsId = benefitsCommentsId;
    }

    public int getBenefitsCommentsId() {
        return benefitsCommentsId;
    }

    public void setBenefitsCommentsId(int benefitsCommentsId) {
        this.benefitsCommentsId = benefitsCommentsId;
    }

    public String getCommentCity() {
        return commentCity;
    }

    public void setCommentCity(String commentCity) {
        this.commentCity = commentCity;
    }

    public String getCommentState() {
        return commentState;
    }

    public void setCommentState(String commentState) {
        this.commentState = commentState;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    public double getCommentRating() {
        return commentRating;
    }

    public void setCommentRating(double commentRating) {
        this.commentRating = commentRating;
    }

    public Jobs getJob() {
        return job;
    }

    public void setJob(Jobs job) {
        this.job = job;
    }
}
