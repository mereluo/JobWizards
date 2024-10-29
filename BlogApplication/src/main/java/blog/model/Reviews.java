package blog.model;

import java.math.BigDecimal;

public class Reviews {
    protected int reviewId;
    protected String cons;
    protected String pros;
    protected String publisher;
    protected BigDecimal ratingForCareerOpportunities;
    protected BigDecimal ratingForCompBenefits;
    protected BigDecimal ratingForCultureValues;
    protected BigDecimal ratingOverall;
    protected BigDecimal ratingForSeniorManagement;
    protected BigDecimal ratingForWorkLifeBalanace;
    protected String reviewContent;
    protected String reviewerLocation;
    protected String reviewerStatus;
    protected Jobs job;
	
    public Reviews(int reviewId, String cons, String pros, String publisher, BigDecimal ratingForCareerOpportunities,
			BigDecimal ratingForCompBenefits, BigDecimal ratingForCultureValues, BigDecimal ratingOverall,
			BigDecimal ratingForSeniorManagement, BigDecimal ratingForWorkLifeBalanace, String reviewContent,
			String reviewerLocation, String reviewerStatus, Jobs job) {
		this.reviewId = reviewId;
		this.cons = cons;
		this.pros = pros;
		this.publisher = publisher;
		this.ratingForCareerOpportunities = ratingForCareerOpportunities;
		this.ratingForCompBenefits = ratingForCompBenefits;
		this.ratingForCultureValues = ratingForCultureValues;
		this.ratingOverall = ratingOverall;
		this.ratingForSeniorManagement = ratingForSeniorManagement;
		this.ratingForWorkLifeBalanace = ratingForWorkLifeBalanace;
		this.reviewContent = reviewContent;
		this.reviewerLocation = reviewerLocation;
		this.reviewerStatus = reviewerStatus;
		this.job = job;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getCons() {
		return cons;
	}

	public void setCons(String cons) {
		this.cons = cons;
	}

	public String getPros() {
		return pros;
	}

	public void setPros(String pros) {
		this.pros = pros;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public BigDecimal getRatingForCareerOpportunities() {
		return ratingForCareerOpportunities;
	}

	public void setRatingForCareerOpportunities(BigDecimal ratingForCareerOpportunities) {
		this.ratingForCareerOpportunities = ratingForCareerOpportunities;
	}

	public BigDecimal getRatingForCompBenefits() {
		return ratingForCompBenefits;
	}

	public void setRatingForCompBenefits(BigDecimal ratingForCompBenefits) {
		this.ratingForCompBenefits = ratingForCompBenefits;
	}

	public BigDecimal getRatingForCultureValues() {
		return ratingForCultureValues;
	}

	public void setRatingForCultureValues(BigDecimal ratingForCultureValues) {
		this.ratingForCultureValues = ratingForCultureValues;
	}

	public BigDecimal getRatingOverall() {
		return ratingOverall;
	}

	public void setRatingOverall(BigDecimal ratingOverall) {
		this.ratingOverall = ratingOverall;
	}

	public BigDecimal getRatingForSeniorManagement() {
		return ratingForSeniorManagement;
	}

	public void setRatingForSeniorManagement(BigDecimal ratingForSeniorManagement) {
		this.ratingForSeniorManagement = ratingForSeniorManagement;
	}

	public BigDecimal getRatingForWorkLifeBalanace() {
		return ratingForWorkLifeBalanace;
	}

	public void setRatingForWorkLifeBalanace(BigDecimal ratingForWorkLifeBalanace) {
		this.ratingForWorkLifeBalanace = ratingForWorkLifeBalanace;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewerLocation() {
		return reviewerLocation;
	}

	public void setReviewerLocation(String reviewerLocation) {
		this.reviewerLocation = reviewerLocation;
	}

	public String getReviewerStatus() {
		return reviewerStatus;
	}

	public void setReviewerStatus(String reviewerStatus) {
		this.reviewerStatus = reviewerStatus;
	}

	public Jobs getJob() {
		return job;
	}

	public void setJob(Jobs job) {
		this.job = job;
	}
    
    
}
