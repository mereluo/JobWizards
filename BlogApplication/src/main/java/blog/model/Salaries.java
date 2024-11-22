package blog.model;

public class Salaries {
    protected int salaryId;
    protected String jobTitle;
    protected String payPeriod;
    protected double payPercentile10;
    protected double payPercentile90;
    protected double payPercentile50;
    protected String salaryType;
    protected Jobs job;
    protected String currencyCode;

    public Salaries(int salaryId, String jobTitle, String payPeriod, double payPercentile10,
                    double payPercentile90, double payPercentile50, String salaryType,
                    Jobs job, String currencyCode) {
        this.salaryId = salaryId;
        this.jobTitle = jobTitle;
        this.payPeriod = payPeriod;
        this.payPercentile10 = payPercentile10;
        this.payPercentile90 = payPercentile90;
        this.payPercentile50 = payPercentile50;
        this.salaryType = salaryType;
        this.job = job;
        this.currencyCode = currencyCode;
    }

    public Salaries(int salaryId) {
        this.salaryId = salaryId;
    }

    public int getSalaryId() {
        return salaryId;
    }

    public void setSalaryId(int salaryId) {
        this.salaryId = salaryId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getPayPeriod() {
        return payPeriod;
    }

    public void setPayPeriod(String payPeriod) {
        this.payPeriod = payPeriod;
    }

    public double getPayPercentile10() {
        return payPercentile10;
    }

    public void setPayPercentile10(double payPercentile10) {
        this.payPercentile10 = payPercentile10;
    }

    public double getPayPercentile90() {
        return payPercentile90;
    }

    public void setPayPercentile90(double payPercentile90) {
        this.payPercentile90 = payPercentile90;
    }

    public double getPayPercentile50() {
        return payPercentile50;
    }

    public void setPayPercentile50(double payPercentile50) {
        this.payPercentile50 = payPercentile50;
    }

    public String getSalaryType() {
        return salaryType;
    }

    public void setSalaryType(String salaryType) {
        this.salaryType = salaryType;
    }

    public Jobs getJob() {
        return job;
    }

    public void setJobId(Jobs job) {
        this.job = job;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }
}
