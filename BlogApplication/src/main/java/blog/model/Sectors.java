package blog.model;

public class Sectors {
    protected int sectorId;
    protected String sector;

    public Sectors(int sectorId, String sector) {
        this.sectorId = sectorId;
        this.sector = sector;
    }

    public Sectors(int sectorId) {
        this.sectorId = sectorId;
    }

    public int getSectorId() {
        return sectorId;
    }

    public void setSectorId(int sectorId) {
        this.sectorId = sectorId;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }
}
