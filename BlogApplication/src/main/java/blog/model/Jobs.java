package blog.model;

import java.math.BigDecimal;

public class Jobs {
    protected int jobId;
    protected String title;
    protected String advertiserType;
    protected boolean applyButtonDisabled;
    protected boolean easyApply;
    protected String postedDate;
    protected BigDecimal rating;
    protected String source;
    protected Companies company;
    protected Locations location;
	
    public Jobs(int jobId, String title, String advertiserType, boolean applyButtonDisabled, boolean easyApply,
			String postedDate, BigDecimal rating, String source, Companies company, Locations location) {
		super();
		this.jobId = jobId;
		this.title = title;
		this.advertiserType = advertiserType;
		this.applyButtonDisabled = applyButtonDisabled;
		this.easyApply = easyApply;
		this.postedDate = postedDate;
		this.rating = rating;
		this.source = source;
		this.company = company;
		this.location = location;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAdvertiserType() {
		return advertiserType;
	}

	public void setAdvertiserType(String advertiserType) {
		this.advertiserType = advertiserType;
	}

	public boolean isApplyButtonDisabled() {
		return applyButtonDisabled;
	}

	public void setApplyButtonDisabled(boolean applyButtonDisabled) {
		this.applyButtonDisabled = applyButtonDisabled;
	}

	public boolean isEasyApply() {
		return easyApply;
	}

	public void setEasyApply(boolean easyApply) {
		this.easyApply = easyApply;
	}

	public String getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(String postedDate) {
		this.postedDate = postedDate;
	}

	public BigDecimal getRating() {
		return rating;
	}

	public void setRating(BigDecimal rating) {
		this.rating = rating;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Companies getCompany() {
		return company;
	}

	public void setCompany(Companies company) {
		this.company = company;
	}

	public Locations getLocation() {
		return location;
	}

	public void setLocation(Locations location) {
		this.location = location;
	}

    
    
}
