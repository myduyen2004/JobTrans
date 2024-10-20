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
        String query = "SELECT * FROM Notifications WHERE user_id = ?";

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
                notifications.add(notification);
            }
        } catch (SQLException e) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return notifications;
    }
    
}
