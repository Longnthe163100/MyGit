package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.AccountInformation;
import model.AccountView;
import util.DateTimeHelper;

/**
 *
 * @author MANH
 */
public class AccountInformationDBContext extends DBContext<AccountInformation> {

    static DateTimeHelper dth = new DateTimeHelper();

    public AccountInformation get(AccountInformation model) {
        AccountInformation accountInformation = new AccountInformation();
        try {
            connection.setAutoCommit(false);
            String statement = "select accountinfo_id, account_id, fullname, email, dob, sex, phone, address, identity_card_number from AccountInformation"
                    + " where account_id = ?";
            PreparedStatement stm = connection.prepareStatement(statement);
            stm.setInt(1, model.getAccount_id());
            ResultSet rs = stm.executeQuery();
            rs.next();
            accountInformation.setAccountinfo_id(rs.getInt(1));
            accountInformation.setAccount_id(rs.getInt(2));
            accountInformation.setFullname(rs.getString(3));
            accountInformation.setEmail(rs.getString(4));
            accountInformation.setDob(rs.getDate(5));
            accountInformation.setSex(rs.getBoolean(6));
            accountInformation.setPhone(rs.getString(7));
            accountInformation.setAddress(rs.getString(8));
            accountInformation.setIdentity_card_number(rs.getString(9));
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
        return accountInformation;
    }

    //Admin
    public ArrayList<AccountInformation> getAllAccountInformation() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<AccountInformation> accountinformations = new ArrayList<>();
        try {
            connection.setAutoCommit(false);
            String sql = "select * from AccountInformation";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                AccountInformation accountInformation = new AccountInformation();
                accountInformation.setAccountinfo_id(rs.getInt(1));
                accountInformation.setAccount_id(rs.getInt(2));
                accountInformation.setFullname(rs.getString(3));
                accountInformation.setEmail(rs.getString(4));
                accountInformation.setDob(rs.getDate(5));
                accountInformation.setSex(rs.getBoolean(6));
                accountInformation.setPhone(rs.getString(7));
                accountInformation.setAddress(rs.getString(8));
                accountInformation.setIdentity_card_number(rs.getString(9));
                accountinformations.add(accountInformation);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return accountinformations;
    }

    @Override
    public void insert(AccountInformation model) {

        try {
            connection.setAutoCommit(false);
            String sql = "insert into AccountInformation(account_id, fullname, email, dob, sex, phone, [address], identity_card_number)"
                    + "values (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getAccount_id());
            stm.setString(2, model.getFullname());
            stm.setString(3, model.getEmail());
            stm.setDate(4, model.getDob());
            stm.setBoolean(5, model.isSex());
            stm.setString(6, model.getPhone());
            stm.setString(7, model.getAddress());
            stm.setString(8, model.getIdentity_card_number());
            stm.executeUpdate();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void delete(int id) {
        try {
            connection.setAutoCommit(false);
            String sql = "Delete from AccountInformation where account_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
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

    public AccountInformation viewProfile(int account_id) {
        try {
            connection.setAutoCommit(false);
            String sql = "select ac.role,af.accountinfo_id,af.account_id,Ac.username,Af.[address],af.dob,af.email,af.fullname,af.identity_card_number,af.phone,af.sex\n"
                    + "from AccountInformation af, Account ac\n"
                    + "where af.account_id = ac.account_id\n"
                    + "and ac.account_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, account_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                AccountInformation accInfo = new AccountInformation();
                accInfo.setAccount_id(rs.getInt("account_id"));
                accInfo.setAccountinfo_id(rs.getInt("accountinfo_id"));
                accInfo.setAddress(rs.getString("address"));
                accInfo.setDob(rs.getDate("dob"));
                accInfo.setEmail(rs.getString("email"));
                accInfo.setFullname(rs.getString("fullname"));
                accInfo.setIdentity_card_number(rs.getString("identity_card_number"));
                accInfo.setPhone(rs.getString("phone"));
                accInfo.setSex(rs.getBoolean("sex"));
                connection.commit();
                stm.close();
                return accInfo;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (Exception ex) {
                Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    //Update new data profile in database
    public void updateProfile(String username, String name, String email,
            String phone, int sex, Date dob, String address, String cccd) {
        try {
            connection.setAutoCommit(false);
            String sql = "update AccountInformation\n"
                    + "                     set fullname = ?,\n"
                    + "                     email=?,\n"
                    + "                     dob=?,\n"
                    + "                     sex=?,\n"
                    + "                     phone=?,\n"
                    + "                     address=?,\n"
                    + "                     identity_card_number=?\n"
                    + "                     where account_id=(\n"
                    + "                     select Ai.account_id\n"
                    + "                     from Account Ac, AccountInformation Ai\n"
                    + "                     where Ac.account_id=Ai.account_id\n"
                    + "                     and username = ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, email);
            stm.setDate(3, (java.sql.Date) dob);
            stm.setInt(4, sex);
            stm.setString(5, phone);
            stm.setString(6, address);
            stm.setString(7, cccd);
            stm.setString(8, username);
            stm.executeUpdate();
            connection.commit();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (Exception ex) {
                Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public AccountView getGoogleEmail(String email) {
        AccountView accountView = new AccountView();
        try {
            String sql = "select a.account_id, username, [password],email from AccountInformation ai\n"
                    + " join Account a on a.account_id = ai.account_id"
                    + " where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                accountView.setAccount_id(rs.getInt(1));
                accountView.setUsername(rs.getString(2));
                accountView.setPassword(rs.getString(3));
                accountView.setEmail(rs.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return accountView;
    }

    public boolean getExistEmail(String email) {
        boolean kt = false;
        try {
            String sql = "select email from AccountInformation\n"
                    + "where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                AccountInformation account = new AccountInformation();
                account.setEmail(email);
                kt = true;
                return kt;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return kt;
    }

    @Override
    public void update(AccountInformation model) {
        try {
            connection.setAutoCommit(false);
            String sql = "update AccountInformation set fullname = ?,email=?, phone = ?,[address]= ?,[dob]= ?, identity_card_number = ?, sex = ? where account_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getFullname());
            stm.setString(2, model.getEmail());
            stm.setString(3, model.getPhone());
            stm.setString(4, model.getAddress());
            stm.setDate(5, model.getDob());
            stm.setString(6, model.getIdentity_card_number());
            stm.setBoolean(7, model.isSex());
            stm.setInt(8, model.getAccount_id());
            stm.executeUpdate();
            connection.commit();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (Exception ex) {
                Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(AccountInformation model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void updateAdminUserProfile(AccountInformation model) {
        try {
            connection.setAutoCommit(false);
            String sql = "update AccountInformation set fullname = ?,email=?, phone = ?,[address]= ?,[dob]= ?, identity_card_number = ? where account_id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getFullname());
            stm.setString(2, model.getEmail());
            stm.setString(3, model.getPhone());
            stm.setString(4, model.getAddress());
            stm.setDate(5, model.getDob());
            stm.setString(6, model.getIdentity_card_number());
            stm.setInt(7, model.getAccount_id());
            Logger logger = Logger.getLogger(AccountInformationDBContext.class.getName());
            connection.commit();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (Exception ex) {
                Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
