package com.model;
public class Donor {
    private int id;
    private String name;
    private String email;
    private String password; // Note: Storing passwords in plaintext is not recommended. Consider using hashing.
    private String bloodGroup; // This was added to the table via ALTER TABLE

    // Constructor
    public Donor() {
    }

    public Donor(int id, String name, String email,  String bloodGroup) {
        this.id = id;
        this.name = name;
        this.email = email;
       
        this.bloodGroup = bloodGroup;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    // toString method for debugging purposes
    @Override
    public String toString() {
        return "Donor{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", bloodGroup='" + bloodGroup + '\'' +
                '}';
    }
}
