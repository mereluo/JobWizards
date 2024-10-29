package blog.model;

public class BenefitsHighlights {
    protected int benefitsHighlightsId;
    protected String highlightPhrase;
    protected String highlightName;
    protected String commentCount;
    protected Jobs job;

    public BenefitsHighlights(int benefitsHighlightsId, String highlightPhrase, 
                              String highlightName, String commentCount, Jobs job) {
        this.benefitsHighlightsId = benefitsHighlightsId;
        this.highlightPhrase = highlightPhrase;
        this.highlightName = highlightName;
        this.commentCount = commentCount;
        this.job = job;
    }

    public BenefitsHighlights(int benefitsHighlightsId) {
        this.benefitsHighlightsId = benefitsHighlightsId;
    }

    public int getBenefitsHighlightsId() {
        return benefitsHighlightsId;
    }

    public void setBenefitsHighlightsId(int benefitsHighlightsId) {
        this.benefitsHighlightsId = benefitsHighlightsId;
    }

    public String getHighlightPhrase() {
        return highlightPhrase;
    }

    public void setHighlightPhrase(String highlightPhrase) {
        this.highlightPhrase = highlightPhrase;
    }

    public String getHighlightName() {
        return highlightName;
    }

    public void setHighlightName(String highlightName) {
        this.highlightName = highlightName;
    }

    public String getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(String commentCount) {
        this.commentCount = commentCount;
    }

    public Jobs getJob() {
        return job;
    }

    public void setJob(Jobs job) {
        this.job = job;
    }
}
