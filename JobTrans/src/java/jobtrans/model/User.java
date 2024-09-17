/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.model;

/**
 *
 * @author admin
 */
public class User {
    private int user_id;
    private String user_name;
    private String email;
    private String password;
    private String oauth_provider;
    private String oauth_id;
    private String role;
    private int balance;
    private String description;
    private String specification;
    private String address;
    private String avatar_url;
    private boolean status;

    // Default constructor
    public User() {
    }

    // Parameterized constructor
    public User(int user_id, String user_name, String email, String password, String oauth_provider, String oauth_id,
                String role, int balance, String description, String specification, String address, String avatar_url, boolean status) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.email = email;
        this.password = password;
        this.oauth_provider = oauth_provider;
        this.oauth_id = oauth_id;
        this.role = role;
        this.balance = balance;
        this.description = description;
        this.specification = specification;
        this.address = address;
        this.avatar_url = avatar_url;
        this.status = status;
    }

    // Getters and Setters for each field
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
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

    public String getOauth_provider() {
        return oauth_provider;
    }

    public void setOauth_provider(String oauth_provider) {
        this.oauth_provider = oauth_provider;
    }

    public String getOauth_id() {
        return oauth_id;
    }

    public void setOauth_id(String oauth_id) {
        this.oauth_id = oauth_id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar_url() {
        return avatar_url;
    }

    public void setAvatar_url(String avatar_url) {
        this.avatar_url = avatar_url;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    // Overriding toString() method to display the User object
    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", oauth_provider='" + oauth_provider + '\'' +
                ", oauth_id='" + oauth_id + '\'' +
                ", role='" + role + '\'' +
                ", balance=" + balance +
                ", description='" + description + '\'' +
                ", specification='" + specification + '\'' +
                ", address='" + address + '\'' +
                ", avatar_url='" + avatar_url + '\'' +
                ", status=" + status +
                '}';
    }
    
}
