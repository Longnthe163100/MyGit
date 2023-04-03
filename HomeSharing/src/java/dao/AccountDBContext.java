package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.AccountView;
import util.DateTimeHelper;

public class AccountDBContext extends DBContext<Account> {

    static DateTimeHelper dth = new DateTimeHelper();

    @Override
    public Account get(Account model) {
        Account account = new Account();
        try {
            connection.setAutoCommit(false);
            String sql = "select account_id, username, password, create_date, expired_date, status, role from Account where username = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getUsername());
            stm.setString(2, model.getPassword());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                account.setAccount_id(rs.getInt(1));
                account.setUsername(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setCreate_date(rs.getDate(4));
                account.setExpired_date(rs.getDate(5));
                account.setStatus(rs.getInt(6));
                account.setRole(rs.getInt(7));
            }
            connection.commit();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return account;
    }

    public ArrayList<Account> getAllAccounts() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            connection.setAutoCommit(false);
            String sql = "select account_id, username, [password], create_date, expired_date, [status] from Account";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getInt(1));
                account.setUsername(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setCreate_date(rs.getDate(4));
                account.setExpired_date(rs.getDate(5));
                account.setStatus(rs.getInt(6));
                accounts.add(account);
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

        return accounts;
    }

    public ArrayList<AccountView> getAllAccountsView() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<AccountView> accountViews = new ArrayList<>();
        try {
            connection.setAutoCommit(false);
            String sql = "select a.account_id, a.username, a.password, ai.fullname, a.[role], ai.email, ai.phone, ai.[address], a.[status] from Account a "
                    + "join Accountinformation ai on a.account_id = ai.account_id";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                AccountView accountView = new AccountView();
                accountView.setAccount_id(rs.getInt(1));
                accountView.setUsername(rs.getString(2));
                accountView.setPassword(rs.getString(3));
                accountView.setFullname(rs.getString(4));
                accountView.setRole(rs.getInt(5));
                accountView.setEmail(rs.getString(6));
                accountView.setPhone(rs.getString(7));
                accountView.setAddress(rs.getString(8));
                accountView.setStatus(rs.getInt(9));
                accountViews.add(accountView);
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

        return accountViews;
    }

    @Override
    public void insert(Account model) {
        String sql = "INSERT INTO Account (username, [password], create_date, [status], [role]) VALUES (?, ?, ?, ?, ?)";
        try {
            connection.setAutoCommit(false);
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getUsername());
            stm.setString(2, model.getPassword());
            stm.setDate(3, model.getCreate_date());
            stm.setInt(4, model.getStatus());
            stm.setInt(5, model.getRole());
            stm.executeUpdate();
            connection.commit();
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
    public void update(Account model) {
        PreparedStatement stm = null;
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE Account \n"
                    + "SET [password] =  ?, [status] = ?, [room_id] = ?, post_id = ?\n"
                    + "where account_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, model.getPassword());
            stm.setInt(2, model.getStatus());
            stm.setInt(3, model.getRoom_id());
            stm.setInt(4, model.getPost_id());
            stm.setInt(5, model.getAccount_id());
            stm.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public void updatePassword(Account model) {
        PreparedStatement stm = null;
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE Account \n"
                    + "SET [password] =  ?\n"
                    + " where account_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, model.getPassword());
            stm.setInt(2, model.getAccount_id());
            stm.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updateAccountStatus(Account model) {
        PreparedStatement stm = null;
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE Account \n"
                    + "SET username =?,"
                    + "password = ?,"
                    + "role = ?, "
                    + " [status] = ?\n"
                    + " where account_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, model.getUsername());
            stm.setString(2, model.getPassword());
            stm.setInt(3, model.getRole());
            stm.setInt(4, model.getStatus());
            stm.setInt(5, model.getAccount_id());
            stm.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void delete(int account_id) {
        PreparedStatement stm = null;
        try {
            connection.setAutoCommit(false);
            String sql = "Delete from Account where account_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, account_id);
            stm.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public AccountView getAccountProfile(int account_id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
