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
    private int userId;
    private String userName;
    private String email;
    private String password;
    private String oauthProvider;
    private String oauthId;
    private String role;
    private int balance;
    private String description;
    private String specification;
    private String address;
    private String avatarUrl;
    private boolean status;

    // Default constructor
    public User() {
    }
    
    // Parameterized constructor
    public User(int userId, String userName, String email, String password, String oauthProvider, String oauthId,
                String role, int balance, String description, String specification, String address, String avatarUrl, boolean status) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.oauthProvider = oauthProvider;
        this.oauthId = oauthId;
        this.role = role;
        this.balance = balance;
        this.description = description;
        this.specification = specification;
        this.address = address;
        this.avatarUrl = avatarUrl;
        this.status = status;
    }

    public User(String userName, String email, String oauthProvider, String oauthId, String role, String avatarUrl, boolean status) {
        this.userName = userName;
        this.email = email;
        this.oauthProvider = oauthProvider;
        this.oauthId = oauthId;
        this.role = role;
        this.avatarUrl = avatarUrl;
        this.status = status;
    }

    public User(String userName, String email, String password, String role, boolean status) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.status = status;
    }

   
    
    
    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    // Getters and Setters for each field
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public String getOauthProvider() {
        return oauthProvider;
    }

    public void setOauthProvider(String oauthProvider) {
        this.oauthProvider = oauthProvider;
    }

    public String getOauthId() {
        return oauthId;
    }

    public void setOauthId(String oauthId) {
        this.oauthId = oauthId;
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

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
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
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", oauthProvider='" + oauthProvider + '\'' +
                ", oauthId='" + oauthId + '\'' +
                ", role='" + role + '\'' +
                ", balance=" + balance +
                ", description='" + description + '\'' +
                ", specification='" + specification + '\'' +
                ", address='" + address + '\'' +
                ", avatarUrl='" + avatarUrl + '\'' +
                ", status=" + status +
                '}';
    }
    
}
