package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Notification;

public class NotificationDBContext extends DBContext<Notification> {

    // insert notification
    @Override
    public void insert(Notification model) {
        try {
            connection.setAutoCommit(false);
            String sql = "Insert into Notification"
                    + "(housemanager_id,house_id,title,content,create_date) values(?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getHousemanager_id());
            stm.setInt(2, model.getHouse_id());
            stm.setString(3, model.getTitle());
            stm.setString(4, model.getContent());
            stm.setDate(5, (Date) model.getCreate_date());
            stm.executeUpdate();
            connection.commit();
            stm.close();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override //Update notification
    public void update(Notification model) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [dbo].[Notification]\n"
                    + "   SET [title] = ?\n"
                    + "      ,[content] = ?\n"
                    + "      ,[create_date] = ?\n"
                    + " WHERE notification_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getTitle());
            stm.setString(2, model.getContent());
            stm.setDate(3, (Date) model.getCreate_date());
            stm.setInt(4, model.getNotification_id());
            stm.executeUpdate();
            connection.commit();
            stm.close();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    //Delete Notiffication with notiffication_id
    public void delete(Notification model) {
        try {
            connection.setAutoCommit(false);
            String sql = "Delete from Notification where notification_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getNotification_id());
            stm.executeUpdate();
            connection.commit();
            stm.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public Notification get(Notification model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    // List all notiffication in Database
    public ArrayList<Notification> list(String username) {
        ArrayList<Notification> notiList = new ArrayList<Notification>();
        try {
            connection.setAutoCommit(false);
            String sql = "select * from Notification noti, Account ac\n"
                    + "where noti.housemanager_id = ac.account_id and ac.username = ?\n"
                    + "order by noti.create_date desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Notification noti = new Notification();
                noti.setNotification_id(rs.getInt("notification_id"));
                noti.setHousemanager_id(rs.getInt("housemanager_id"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setCreate_date(rs.getDate("create_date"));
                notiList.add(noti);
            }
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.commit();
                connection.close();
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return notiList;
    }

    //get notification by notification_id
    public Notification get(int notification_id) {
        Notification noti = new Notification();
        try {
            connection.setAutoCommit(false);
            String sql = "select * from Notification \n"
                    + "where notification_id=? \n";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, notification_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                noti.setNotification_id(rs.getInt("notification_id"));
                noti.setHousemanager_id(rs.getInt("housemanager_id"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setCreate_date(rs.getDate("create_date"));
            }
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.commit();
                connection.close();
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return noti;
    }
}
