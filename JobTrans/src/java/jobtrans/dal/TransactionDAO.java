/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.model.Transaction;
import jobtrans.model.User;
import jobtrans.utils.DBConnection;
import jobtrans.utils.DateTimeUtils;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import jobtrans.model.Job;

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
    public void updateBalance(User u){
        String sql = "UPDATE [dbo].[Users] SET balance = ? WHERE email = ?";
        ResultSet rs = null;
        
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setDouble(1, u.getBalance());
            statement.setString(2, u.getEmail());
            statement.executeQuery();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addTransaction(Transaction trans){
        String sql = """
                     INSERT INTO [Transaction] (senderId, amount, createdDate, status, transactionType, description)
                     VALUES (?, ?, ?, ?, ?, ?);""";
        trans.setCreatedDate(dateUtils.getDateTimeNow());
        Timestamp timestamp = Timestamp.valueOf(trans.getCreatedDate());
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, trans.getSenderId());
            statement.setDouble(2, trans.getAmount());
            statement.setTimestamp(3, timestamp);
            statement.setBoolean(4, trans.isStatus());
            statement.setNString(5, trans.getTransactionType());
            statement.setNString(6, trans.getDescription());
            statement.execute();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Transaction> getTransactionBySender(User u){
        ArrayList<Transaction> listTrans= new ArrayList<>();
        
        String sql = "SELECT * FROM [dbo].[Transaction] WHERE senderId = ?";
        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, u.getUserId());
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Transaction trans = new Transaction();
                trans.setTransactionId(rs.getInt(1));
                trans.setSenderId(rs.getInt(2));
                trans.setReceiverId(rs.getInt(3));
                trans.setAdminId(rs.getInt(4));
                trans.setAmount(rs.getDouble(5));
                trans.setCreatedDate(rs.getTimestamp(6).toLocalDateTime());
                trans.setStatus(rs.getBoolean(7));
                trans.setTransactionType(rs.getNString(8));
                trans.setJobId(rs.getInt(9));
                trans.setDescription(rs.getNString(10));
                listTrans.add(trans);
            }
            rs.close();
            statement.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listTrans;
    }
    public static void main(String[] args) {
        User u;
        u = userDao.getUserByEmail("duyenvtmde180048@fpt.edu.vn");
        System.out.println(new TransactionDAO().getTransactionBySender(u));
    }
    
}
