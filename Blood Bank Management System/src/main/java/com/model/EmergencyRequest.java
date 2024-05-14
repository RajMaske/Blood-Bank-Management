package com.model;
public class EmergencyRequest {
    private int id;
    private String bloodType;
    private int quantity;
    private String location;
    private String urgency;
    public EmergencyRequest(int id, String bloodType, int quantity, String location, String urgency, String string) {
		super();
		this.id = id;
		this.bloodType = bloodType;
		this.quantity = quantity;
		this.location = location;
		this.urgency = urgency;
	}
	// Constructor, getters, and setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBloodType() {
		return bloodType;
	}
	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getUrgency() {
		return urgency;
	}
	public void setUrgency(String urgency) {
		this.urgency = urgency;
	}
    
}
