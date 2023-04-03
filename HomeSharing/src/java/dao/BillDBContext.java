package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.AccountView;
import model.Bill;

public class BillDBContext extends DBContext<Bill> {

    @Override
    public void insert(Bill model) {
        insertIntoBill(model);
        insertIntoBillDetails(model);
    }

    @Override
    public void update(Bill model) {
        updateInBill(model);
        updateInBillDetails(model);
    }

    @Override
    public void delete(Bill model) {
        try {
            connection.setAutoCommit(false);
            String sql = "Delete from Bill"
                    + "where bill_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getBillID());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void insertIntoBill(Bill model) {
        try {
            connection.setAutoCommit(false);
            String sql = "Insert into Bill(service_date, tenant_ID, house_manager_ID, room_number, house_ID, title, created_date, due_date, payment_date, status, payment_ID)"
                    + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, model.getServiceDate());
            stm.setInt(2, model.getTenantID());
            stm.setInt(3, model.getManagerID());
            stm.setInt(4, model.getRoomNumber());
            stm.setInt(5, model.getHouseID());
            stm.setString(6, model.getTitle());
            stm.setDate(7, model.getCreatedDate());
            stm.setDate(8, model.getDueDate());
            stm.setDate(9, model.getPaymentDate());
            stm.setBoolean(10, model.isStatus());
            stm.setString(11, model.getPaymentID());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void insertIntoBillDetails(Bill model) {
        try {
            int id = getBillID(model);
            connection.setAutoCommit(false);
            String sql = "Insert into BillDetails(bill_ID, service_date, electric_money, water_money, extra_money)"
                    + "values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setDate(2, model.getServiceDate());
            stm.setInt(3, model.getElectricMoney());
            stm.setInt(4, model.getWaterMoney());
            stm.setInt(5, model.getExtraMoney());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private int getBillID(Bill model) {
        int id = -1;
        try {
            connection.setAutoCommit(false);
            String sql = "select bill_ID from Bill"
                    + "where tenant_ID = ?"
                    + "and house_manager_ID = ?"
                    + "and service_date = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getTenantID());
            stm.setInt(1, model.getManagerID());
            stm.setDate(3, model.getServiceDate());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return id;
    }

    @Override
    public Bill get(Bill model) {
        Bill target = null;
        try {
            connection.setAutoCommit(false);
            String sql = "select * from Bill"
                    + "where bill_ID = ?"
                    + "or service_date = ?"
                    + "or tenant_ID = ?"
                    + "or house_manager_ID = ?"
                    + "or title = ?"
                    + "or room_number = ?"
                    + "or house_ID = ?"
                    + "or created_date = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getBillID());
            stm.setDate(2, model.getServiceDate());
            stm.setInt(3, model.getTenantID());
            stm.setInt(4, model.getManagerID());
            stm.setString(5, model.getTitle());
            stm.setInt(6, model.getRoomNumber());
            stm.setInt(7, model.getHouseID());
            stm.setDate(8, model.getCreatedDate());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                if (target == null) {
                    target = new Bill();
                }
                target.setBillID(rs.getInt("bill_ID"));
                target.setServiceDate(rs.getDate("service_date"));
                target.setTenantID(rs.getInt("tenant_ID"));
                target.setManagerID(rs.getInt("house_manager_ID"));
                target.setRoomNumber(rs.getInt("room_number"));
                target.setHouseID(rs.getInt("house_ID"));
                target.setTitle(rs.getString("title"));
                target.setCreatedDate(rs.getDate("created_date"));
                target.setDueDate(rs.getDate("due_date"));
                target.setPaymentDate(rs.getDate("payment_date"));
                target.setStatus(rs.getBoolean("status"));
                target.setPaymentID(rs.getString("payment_ID"));
                target.setTenantName(getName(target.getTenantID()));
                target.setManagerName(getName(target.getManagerID()));
                getBillDetails(target);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return target;
    }

    private void updateInBill(Bill model) {
        try {
            connection.setAutoCommit(false);
            String sql = "Update Bill"
                    + "set service_date = ?,"
                    + "tenant_ID = ?,"
                    + "and room_number = ?,"
                    + "and house_ID = ?,"
                    + "and title = ?,"
                    + "and created_date = ?,"
                    + "and due_date = ?,"
                    + "and payment_date = ?"
                    + "where bill_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, model.getServiceDate());
            stm.setInt(2, model.getTenantID());
            stm.setInt(3, model.getRoomNumber());
            stm.setInt(4, model.getHouseID());
            stm.setString(5, model.getTitle());
            stm.setDate(6, model.getCreatedDate());
            stm.setDate(7, model.getDueDate());
            stm.setDate(8, model.getPaymentDate());
            stm.executeUpdate();
            stm.close();

        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();

            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void updateInBillDetails(Bill model) {
        try {
            connection.setAutoCommit(false);
            String sql = "Update BillDetails"
                    + "set room_number = ?"
                    + "and house_ID = ?"
                    + "and service_date = ?"
                    + "and electric_money = ?"
                    + "and water_money = ?"
                    + "and extra_money = ?"
                    + "where bill_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getRoomNumber());
            stm.setInt(2, model.getHouseID());
            stm.setDate(3, model.getServiceDate());
            stm.setInt(4, model.getElectricMoney());
            stm.setInt(5, model.getWaterMoney());
            stm.setInt(6, model.getExtraMoney());
            stm.executeUpdate();
            stm.close();

        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();

            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updatePaymentStatus(Bill model) {
        try {
            connection.setAutoCommit(false);
            String sql = "Update Bill"
                    + "set status = ?,"
                    + "payment_ID = ?"
                    + "where bill_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, true);
            stm.setString(2, model.getPaymentID());
            stm.setInt(3, model.getBillID());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Bill> getBillList(Account user) {
        ArrayList<Bill> billList = null;
        try {
            connection.setAutoCommit(false);
            String role = "";
            if (user.getRole() == 2) {
                role = "house_manager_ID";
            } else {
                role = "tenant_ID";
            }
            String sql = "select * from Bill"
                    + "where " + role + " = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user.getAccount_id());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                if (billList == null) {
                    billList = new ArrayList<Bill>();
                }
                Bill target = new Bill();
                target.setBillID(rs.getInt("bill_ID"));
                target.setServiceDate(rs.getDate("service_date"));
                target.setTenantID(rs.getInt("tenant_ID"));
                target.setManagerID(rs.getInt("house_manager_ID"));
                target.setRoomNumber(rs.getInt("room_number"));
                target.setHouseID(rs.getInt("house_ID"));
                target.setTitle(rs.getString("title"));
                target.setCreatedDate(rs.getDate("created_date"));
                target.setDueDate(rs.getDate("due_date"));
                target.setPaymentDate(rs.getDate("payment_date"));
                target.setStatus(rs.getBoolean("status"));
                target.setPaymentID(rs.getString("payment_ID"));
                getBillDetails(target);
                billList.add(target);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return billList;
    }

    private void getBillDetails(Bill target) {
        try {
            connection.setAutoCommit(false);
            String sql = "select rent_money, electric_money, water_money, extra_money from Bill"
                    + "where bill_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, target.getBillID());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                target.setRentMoney(rs.getInt("rent_money"));
                target.setElectricMoney(rs.getInt("electric_money"));
                target.setWaterMoney(rs.getInt("water_money"));
                target.setExtraMoney(rs.getInt("extra_money"));
                target.setTotalMoney(target.getRentMoney() + target.getElectricMoney() + target.getWaterMoney() + target.getExtraMoney());
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private String getName(int id) {
        try {
            connection.setAutoCommit(false);
            String sql = "select fullname from AccountInformation"
                    + "where account_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public ArrayList<String> getTenantListFromBill(int id) {
        ArrayList<String> tenantList = null;
        try {
            connection.setAutoCommit(false);
            String sql = "select fullname from AccountInformation"
                    + "where account_id = (select distinct tenant_ID from Bill"
                    + "where house_manager_ID = ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                if (tenantList == null) {
                    tenantList = new ArrayList<String>();
                }
                tenantList.add(rs.getString(1));
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(BillDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return tenantList;
    }
}
