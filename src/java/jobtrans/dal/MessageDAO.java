/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jobtrans.dal;

import jobtrans.model.Message;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jobtrans.utils.DBConnection;

/**
 *
 * @author admin
 */
public class MessageDAO {
    private final DBConnection dbConnection;

    public MessageDAO() {
        dbConnection = DBConnection.getInstance();
    }
    
     public List<Message> getMessagesByJobId(int jobId) throws SQLException, Exception {
        List<Message> messages = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String query = "SELECT * FROM dMESSAGE WHERE job_id = ? ORDER BY sent_time ASC";

        try {
            // Chuẩn bị câu truy vấn SQL
            preparedStatement = dbConnection.openConnection().prepareStatement(query);
            preparedStatement.setInt(1, jobId);

            // Thực thi truy vấn
            resultSet = preparedStatement.executeQuery();
            // Lặp qua kết quả trả về và thêm vào danh sách
            while (resultSet.next()) {
                Message message = new Message();
                message.setMessageId(resultSet.getInt("message_id"));
                message.setSenderId(resultSet.getInt("sender_id"));
                message.setReceiverId(resultSet.getInt("receiver_id"));
                message.setAttachment(resultSet.getString("attachment"));
                message.setContent(resultSet.getString("content"));
                message.setSentTime(resultSet.getTimestamp("sent_time"));
                message.setJobId(resultSet.getInt("job_id"));
                
                messages.add(message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Lỗi khi lấy danh sách tin nhắn: " + e.getMessage());
        }
        return messages;
    }
     
    public boolean addMessage(Message message) throws SQLException, Exception {
    PreparedStatement preparedStatement = null;
    boolean isInserted = false;

    String query = "INSERT INTO dMESSAGE (sender_id, receiver_id, attachment, content, sent_time, job_id) " +
                   "VALUES (?, ?, ?, ?, ?, ?)";

    try {
        // Chuẩn bị câu truy vấn SQL
        preparedStatement = dbConnection.openConnection().prepareStatement(query);
        preparedStatement.setInt(1, message.getSenderId());          // Người gửi
        preparedStatement.setInt(2, message.getReceiverId());        // Người nhận
        preparedStatement.setString(3, message.getAttachment());     // Đính kèm
        preparedStatement.setString(4, message.getContent());        // Nội dung tin nhắn
        preparedStatement.setTimestamp(5, message.getSentTime());    // Thời gian gửi
        preparedStatement.setInt(6, message.getJobId());             // Job ID

        // Thực thi truy vấn
        int rowsInserted = preparedStatement.executeUpdate();
        isInserted = rowsInserted > 0;  // Kiểm tra xem có dòng nào được chèn không

    } catch (SQLException e) {
        e.printStackTrace();
        throw new SQLException("Lỗi khi thêm tin nhắn: " + e.getMessage());
    } finally {
        // Đóng PreparedStatement
        if (preparedStatement != null) preparedStatement.close();
    }

    return isInserted;
    }

}
