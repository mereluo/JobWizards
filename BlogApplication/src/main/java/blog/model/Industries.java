package blog.model;

public class Industries {
    protected int industryId;
    protected String industry;
    protected Sectors sector;

    public Industries(int industryId, String industry, Sectors sector) {
        this.industryId = industryId;
        this.industry = industry;
        this.sector = sector;
    }

    public Industries(int industryId) {
        this.industryId = industryId;
    }

    public int getIndustryId() {
        return industryId;
    }

    public void setIndustryId(int industryId) {
        this.industryId = industryId;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public Sectors getSector() {
        return sector;
    }

    public void setSector(Sectors sector) {
        this.sector = sector;
    }
}
