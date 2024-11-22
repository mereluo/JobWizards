package blog.model;

public class Locations {
    protected int locationId;
    protected String city;
    protected String country;
    protected double lat;
    protected double lng;

    public Locations(int locationId, String city, String country, double lat, double lng) {
        this.locationId = locationId;
        this.city = city;
        this.country = country;
        this.lat = lat;
        this.lng = lng;
    }

    public Locations(int locationId) {
        this.locationId = locationId;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }
}
