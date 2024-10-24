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
import jobtrans.model.Notification;

/**
 *
 * @author admin
 */
public class NotificationDAO {

    private final DBConnection dbConnection;

    public NotificationDAO() {
        dbConnection = DBConnection.getInstance();
    }

    public List<Notification> getNotificationByUserId(int userId) throws Exception {
        List<Notification> notifications = new ArrayList<>();
        String query = "SELECT * FROM Notifications WHERE user_id = ? ";

        try {
            Connection con = dbConnection.openConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Notification notification = new Notification();
                notification.setNotificationId(rs.getInt("notification_id"));
                notification.setUserId(rs.getInt("user_id"));
                notification.setNotiTitle(rs.getString("noti_title"));
                notification.setContent(rs.getString("content"));
                notification.setCreatedTime(rs.getDate("created_time"));
                notification.setReadStatus(rs.getBoolean("isRead"));
                notifications.add(notification);
            }
        } catch (SQLException e) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return notifications;
    }

    public boolean insertNotification(Notification notification) throws Exception {
        // Câu lệnh SQL để chèn thông báo
        String sql = "INSERT INTO Notifications (user_id, noti_title, content, created_time, isRead) "
                + "VALUES (?, ?, ?, ?, ?)";

        // Kết nối đến cơ sở dữ liệu
        Connection connection = dbConnection.openConnection();

        try {
            // Chuẩn bị câu lệnh SQL
            PreparedStatement ps = connection.prepareStatement(sql);

            // Thiết lập các tham số cho câu lệnh
            ps.setInt(1, notification.getUserId());                    // user_id
            ps.setString(2, notification.getNotiTitle());              // noti_title
            ps.setString(3, notification.getContent());                // content
            ps.setDate(4, new java.sql.Date(notification.getCreatedTime().getTime())); // created_time
            ps.setBoolean(5, notification.isReadStatus());                   // isRead

            // Thực thi câu lệnh chèn
            int rowsAffected = ps.executeUpdate();

            // Nếu chèn thành công, trả về true
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // Trả về false nếu chèn không thành công
        return false;
    }

    public List<Notification> getUnreadNotificationsByUserId(int userId) throws Exception {
        // Tạo danh sách thông báo kết quả
        List<Notification> notifications = new ArrayList<>();

        // Câu lệnh SQL để truy vấn thông báo theo user_id và isRead = false
        String sql = "SELECT notification_id, user_id, noti_title, content, created_time, isRead "
                + "FROM Notifications WHERE user_id = ? AND isRead = 0 ORDER BY notification_id DESC";

        Connection connection = dbConnection.openConnection();

        try {
            // Chuẩn bị câu lệnh SQL
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId); // Thiết lập giá trị user_id

            // Thực thi câu lệnh truy vấn
            ResultSet rs = ps.executeQuery();

            // Duyệt qua các kết quả trả về và thêm vào danh sách
            while (rs.next()) {
                int notificationId = rs.getInt("notification_id");
                String notiTitle = rs.getString("noti_title");
                String content = rs.getString("content");
                Date createdTime = rs.getDate("created_time");
                boolean isRead = rs.getBoolean("isRead");

                // Tạo đối tượng Notification
                Notification notification = new Notification(notificationId, userId, notiTitle, content, createdTime, isRead);
                notifications.add(notification);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Trả về danh sách thông báo
        return notifications;
    }

    public boolean updateNotificationStatus(List<Notification> notifications) throws Exception {
        if (notifications == null || notifications.isEmpty()) {
            return false; // Nếu danh sách trống, không cần cập nhật
        }

        String sql = "UPDATE Notifications SET isRead = ? WHERE notification_id = ?";

        Connection connection = dbConnection.openConnection();

        try {
            connection.setAutoCommit(false);
            PreparedStatement ps = connection.prepareStatement(sql);

            for (Notification notification : notifications) {
                ps.setBoolean(1, true);  // Thiết lập giá trị isRead từ đối tượng Notification
                ps.setInt(2, notification.getNotificationId()); // Thiết lập notification_id
                ps.addBatch(); // Thêm vào batch để thực thi nhiều câu lệnh cùng lúc
            }
            int[] rowsAffected = ps.executeBatch();

            // Commit transaction nếu không có lỗi
            connection.commit();
            return rowsAffected.length == notifications.size(); // Trả về true nếu tất cả đều cập nhật thành công
        } catch (SQLException e) {
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        }

        return false;
    }

    public boolean notificationExists(int receiverId, String notiTitle) throws Exception {
        String checkSql = "SELECT COUNT(*) FROM [JOBTRANS].[dbo].[Notifications] "
                + "WHERE [user_id] = ? AND [noti_title] LIKE ?";

        boolean exists = false;

        try {
            // Chuẩn bị câu lệnh kiểm tra
            PreparedStatement ps = dbConnection.openConnection().prepareStatement(checkSql);
            ps.setInt(1, receiverId);
            ps.setString(2, "%" + notiTitle + "%");

            // Thực thi câu lệnh kiểm tra
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                exists = true; // Thông báo đã tồn tại
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return exists; // Trả về kết quả kiểm tra
    }
    public boolean updateNotification(Notification notification) throws Exception {
        String sql = "UPDATE [JOBTRANS].[dbo].[Notifications] " +
                     "SET [content] = ?, [isRead] = ? " +
                     "WHERE [user_id] = ? AND [noti_title] = ?";

        boolean isUpdated = false;

        try {
            // Chuẩn bị câu lệnh SQL
            PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql);
            ps.setString(1, notification.getContent()); // Nội dung mới
            ps.setBoolean(2, false); // Đánh dấu đã đọc
            ps.setInt(3, notification.getUserId()); // Thiết lập userId
            ps.setString(4, notification.getNotiTitle()); // Thiết lập tiêu đề thông báo

            // Thực thi câu lệnh
            int rowsAffected = ps.executeUpdate();
            isUpdated = rowsAffected > 0; // Kiểm tra xem có bản ghi nào được cập nhật không
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return isUpdated; // Trả về kết quả cập nhật
    }
}
