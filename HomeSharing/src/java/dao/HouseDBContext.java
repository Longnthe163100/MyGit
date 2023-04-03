package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.House;
import model.Room;

/**
 *
 * @author longn
 */
public class HouseDBContext extends DBContext<House> {

    public List<House> getHouse() {
        List<House> list = new ArrayList<>();
        try {
            String sql = "select house_id, housemanager_id, address, price, describe, city, img,status  from House";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<House> getListByPage(List<House> list, int start, int end) {
        ArrayList<House> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public House getHouseByID(String house_id) {
        List<House> list = new ArrayList<>();
        try {
            String sql = "select house_id, housemanager_id, address, price, describe, city, img,status from House Where house_id=" + house_id;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return (new House(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<House> SearchAll(String text) {
        List<House> list = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT house_id, housemanager_id, address, price, describe, city, img,status from House\n"
                    + "WHERE address LIKE ? OR price LIKE ? OR city LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + text + "%");
            stm.setString(2, "%" + text + "%");
            stm.setString(3, "_%" + text + "%_");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<House> getPriceLow() {
        List<House> list = new ArrayList<>();
        try {
            String sql = "select house_id, housemanager_id, address, price, describe, city, img,status from House ORDER BY price ASC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<House> getPriceHigh() {
        List<House> list = new ArrayList<>();
        try {
            String sql = "select house_id, housemanager_id, address, price, describe, city, img,status from House ORDER BY price DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public void insert(House model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(House model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(House model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public House get(House model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
// Get List Address and house_id of house

    public ArrayList<House> listHouse(String username) {
        ArrayList<House> list = new ArrayList<House>();
        try {
            connection.setAutoCommit(false);
            String sql = "Select h.house_id,h.[address] from house h, account a \n"
                    + "                    where h.housemanager_id = a.account_id and username=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                House h = new House();
//                h.setHouse_id(rs.getString("house_id"));
                h.setHousemanager_id(1);
                h.setAddress(rs.getString("address"));
                h.setCity("a");
                h.setDescribe("a");
                h.setImg("a");
                h.setPrice(Float.NaN);
                list.add(h);
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

        return list;
    }

    public void insertHouse(House house) {
        try {
            String sql = "insert into House (address,price,describe,city,img,housemanager_id) values(?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, house.getAddress());
            stm.setFloat(2, house.getPrice());
            stm.setString(3, house.getDescribe());
            stm.setString(4, house.getCity());
            stm.setString(5, house.getImg());
            stm.setInt(6, house.getHousemanager_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteHouse(String house_id) {
        try {
            String sql = "delete from House where house_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, house_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateHouse(House house) {
        try {
            String sql = "UPDATE House SET address=?, price=?, describe=?, city=?,status=? ";
            if (house.getImg() != null) {
                sql += ", img=?";
            }
            sql += " WHERE house_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, house.getAddress());
            stm.setFloat(2, house.getPrice());
            stm.setString(3, house.getDescribe());
            stm.setString(4, house.getCity());
            stm.setBoolean(5, house.isStatus());
            int i = 6;
            if (house.getImg() != null) {
                stm.setString(i++, house.getImg());
            }
            stm.setInt(i++, house.getHouse_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<House> getProductByCity(String city) {
        List<House> list = new ArrayList<>();
        try {
            String sql = "select house_id, housemanager_id, address, price, describe, city, img,status from House Where city=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, city);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<House> getHouseByHouseManagerID(int housemanager_id) {
        List<House> list = new ArrayList<>();
        try {
            String sql = "select house_id, housemanager_id, address, price, describe, city, img,status from House Where housemanager_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, housemanager_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new House(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<House> getListHouse(String username) {
        ArrayList<House> list = new ArrayList<House>();
        try {
            connection.setAutoCommit(false);
            String sql = "Select h.house_id,h.[address] "
                    + "from House h, account a "
                    + "where h.housemanager_id=a.account_id and a.username=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                House h = new House();
                h.setAddress(rs.getString("address"));
                h.setHouse_id(rs.getInt("house_id"));
                h.setCity("");
                h.setDescribe("");
                h.setHousemanager_id(0);
                h.setImg("");
                h.setPrice(Float.NaN);
                list.add(h);
            }
            connection.commit();
            stm.close();

        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            return list;
        }

    }

    public List<Room> getRoom(String house_id) {
        List<Room> list = new ArrayList<>();
        try {
            String sql = "select room_id, house_id, room_number, cus_name, cus_email, cus_phone, status from Room Where house_id=" + house_id;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getBoolean(7)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateRoom(Room room) {
        try {
            String sql = "UPDATE Room SET cus_name=?, cus_email=?, cus_phone=?status=? ";
            sql += " WHERE room_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, room.getCus_name());
            stm.setString(2, room.getCus_email());
            stm.setInt(3, room.getCus_phone());
            stm.setBoolean(4, room.isStatus());
            stm.setInt(5, room.getRoom_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertRoom(Room room) {
        try {
            String sql = "insert into Room (room_number,cus_name,cus_email,cus_phone,house_id) values(?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, room.getRoom_number());
            stm.setString(2, room.getCus_name());
            stm.setString(3, room.getCus_email());
            stm.setInt(4, room.getCus_phone());
            stm.setInt(5, room.getHouse_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HouseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
