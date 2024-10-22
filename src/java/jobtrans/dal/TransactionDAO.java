/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.model.Transaction;
import jobtrans.utils.DBConnection;
import jobtrans.utils.DateTimeUtils;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import java.util.Date;
import jobtrans.model.User;

/**
 *
 * @author admin
 */
public class TransactionDAO {
    private final DBConnection dbConnection;
    private DateTimeUtils dateUtils = new DateTimeUtils();
    private static UserDAO userDao = new UserDAO();

    public TransactionDAO() {
        dbConnection = DBConnection.getInstance();
    }
    
    public List<Transaction> getTransactionBySenderId(int senderId) throws Exception {
        List<Transaction> transactions = new ArrayList<>();
        String query = "SELECT * FROM [Transaction] WHERE senderId = ?";

        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, senderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transactionId"));
                transaction.setSenderId(rs.getInt("senderId"));
                transaction.setReceiverId(rs.getInt("receiverId"));
                transaction.setAdminId(rs.getInt("adminId"));
                transaction.setAmount(rs.getInt("amount"));
                transaction.setCreatedDate(rs.getTimestamp("createdDate"));
                transaction.setStatus(rs.getBoolean("status"));
                transaction.setTransactionType(rs.getString("transactionType"));
                transaction.setDescription(rs.getString("description"));
                transaction.setJobId(rs.getInt("jobId"));
                transactions.add(transaction);
            }
        } catch (SQLException e) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, e);
            throw new Exception("Error retrieving transactions for sender ID: " + senderId, e);
        }
        return transactions;
    }

    public boolean addTransaction(Transaction transaction) throws Exception {
        String query = "INSERT INTO [Transaction] (senderId, amount, createdDate, status, transactionType, description) " +
                       "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = dbConnection.openConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, transaction.getSenderId());
            ps.setInt(2, transaction.getAmount());
            ps.setTimestamp(3, new Timestamp(transaction.getCreatedDate().getTime()));
            ps.setBoolean(4, transaction.isStatus());
            ps.setNString(5, transaction.getTransactionType());
            ps.setNString(6, transaction.getDescription());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, e);
            throw new Exception("Error adding transaction", e);
        }
    }
    
    public boolean checkTransactionExists(int jobId, String description) throws Exception {
        String query = "SELECT COUNT(1) FROM [dbo].[Transaction] " +
                       "WHERE description = ? AND jobId = ?";

        try (Connection connection = dbConnection.openConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setNString(1, description);
            preparedStatement.setInt(2, jobId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    }
    
    public boolean addTransactionForJob(Transaction transaction) throws Exception {
        String query = "INSERT INTO [dbo].[Transaction] " +
                       "(senderId, amount, createdDate, status, transactionType, description, jobId) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = dbConnection.openConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, transaction.getSenderId());
            preparedStatement.setInt(2, transaction.getAmount());
            preparedStatement.setTimestamp(3, new Timestamp(transaction.getCreatedDate().getTime())); // Lấy thời gian hiện tại
            preparedStatement.setBoolean(4, transaction.isStatus());
            preparedStatement.setNString(5, transaction.getTransactionType());
            preparedStatement.setNString(6, transaction.getDescription());
            preparedStatement.setInt(7, transaction.getJobId());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String[] args) throws Exception {
        TransactionDAO dao = new TransactionDAO();
        System.out.println(dao.getTransactionBySenderId(1));
        
        Transaction trans = new Transaction();
            trans.setSenderId(1);
            trans.setAmount(200000);
            trans.setStatus(true);
            trans.setTransactionType("Thêm tiền");
            trans.setDescription("Nộp tiền vào ví");
            Date createdDate = new Date();
            trans.setCreatedDate(createdDate);
//            user.setBalance(user.getBalance() + Integer.parseInt(amount));
dao.addTransaction(trans);
    }

    
    
    
}
