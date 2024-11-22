package blog.model;

public class Companies {
    protected int companyId;
    protected String companyName;
    protected boolean isExpired;
    protected String foundedYear;
    protected String headquarters;
    protected String companyType;
    protected String companySize;
    protected boolean hideCEOInfo;
    protected boolean isSponsored;
    protected String revenue;
    protected Industries industry;

    public Companies(int companyId, String companyName, boolean isExpired, String foundedYear, 
                     String headquarters, String companyType, String companySize, 
                     boolean hideCEOInfo, boolean isSponsored, String revenue, Industries industry) {
        this.companyId = companyId;
        this.companyName = companyName;
        this.isExpired = isExpired;
        this.foundedYear = foundedYear;
        this.headquarters = headquarters;
        this.companyType = companyType;
        this.companySize = companySize;
        this.hideCEOInfo = hideCEOInfo;
        this.isSponsored = isSponsored;
        this.revenue = revenue;
        this.industry = industry;
    }

    public Companies(int companyId) {
        this.companyId = companyId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public boolean getIsExpired() {
        return isExpired;
    }

    public void setIsExpired(boolean isExpired) {
        this.isExpired = isExpired;
    }

    public String getFoundedYear() {
        return foundedYear;
    }

    public void setFoundedYear(String foundedYear) {
        this.foundedYear = foundedYear;
    }

    public String getHeadquarters() {
        return headquarters;
    }

    public void setHeadquarters(String headquarters) {
        this.headquarters = headquarters;
    }

    public String getCompanyType() {
        return companyType;
    }

    public void setCompanyType(String companyType) {
        this.companyType = companyType;
    }

    public String getCompanySize() {
        return companySize;
    }

    public void setCompanySize(String companySize) {
        this.companySize = companySize;
    }

    public boolean getHideCEOInfo() {
        return hideCEOInfo;
    }

    public void setHideCEOInfo(boolean hideCEOInfo) {
        this.hideCEOInfo = hideCEOInfo;
    }

    public boolean getIsSponsored() {
        return isSponsored;
    }

    public void setIsSponsored(boolean isSponsored) {
        this.isSponsored = isSponsored;
    }

    public String getRevenue() {
        return revenue;
    }

    public void setRevenue(String revenue) {
        this.revenue = revenue;
    }

    public Industries getIndustry() {
        return industry;
    }

    public void setIndustry(Industries industry) {
        this.industry = industry;
    }
}
