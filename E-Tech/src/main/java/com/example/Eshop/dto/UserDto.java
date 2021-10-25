package com.example.Eshop.dto;

public class UserDto {

    private int id;
    private String email;
    private String fname;
    private String lname;
    private String phone;
    private String role;

    public UserDto(int id, String email, String fname, String lname, String phone, String role) {
        this.id = id;
        this.email = email;
        this.fname = fname;
        this.lname = lname;
        this.phone = phone;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("UserDto{id=").append(id);
        sb.append(", email=").append(email);
        sb.append(", fname=").append(fname);
        sb.append(", lname=").append(lname);
        sb.append(", phone=").append(phone);
        sb.append(", role=").append(role);
        sb.append('}');
        return sb.toString();
    }

}
