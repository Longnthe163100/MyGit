/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.House;
import model.Post;
import util.DateTimeHelper;

public class PostDBContext extends DBContext<Post> {

    static DateTimeHelper dth = new DateTimeHelper();

    public List<Post> getPostAdmin() {
        List<Post> list = new ArrayList<>();
        try {
            connection.setAutoCommit(false);
            String sql = "select post_id,post_title,post_text,account_id,create_date, status from Post";
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Post(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getDate(5),
                            rs.getInt(6)
                    ));
                }
                connection.commit();
                stm.close();
            }
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
        return list;
    }

    public List<Post> getPostManager() {
        List<Post> list = new ArrayList<>();
        try {
            connection.setAutoCommit(false);
            String sql = "select post_id,post_title,post_text,account_id,create_date, status from Post where status = 1";
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Post(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getDate(5),
                            rs.getInt(6)
                    ));
                }
                connection.commit();
                stm.close();
            }
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
        return list;
    }

    @Override
    public void insert(Post model) {
        try {
            connection.setAutoCommit(false);
            String sql = "insert into Post(post_title, post_text, account_id, create_date, [address], phone, price, status)"
                    + " values (?, ?, ?, ?, ?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getPost_title());
            stm.setString(2, model.getPost_text());
            stm.setInt(3, model.getAccount_id());
            stm.setDate(4, model.getCreate_date());
            stm.setString(5, model.getAddress());
            stm.setString(6, model.getPhone());
            stm.setString(7, model.getPrice());
            stm.setInt(8, model.getStatus());
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
    public void update(Post model) {
        try {
            connection.setAutoCommit(false);
            String sql = "update Post set post_title = ?, post_text = ?, create_date = ?, [address] = ?, phone = ?, price = ? where post_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getPost_title());
            stm.setString(2, model.getPost_text());
            stm.setDate(3, model.getCreate_date());
            stm.setString(4, model.getAddress());
            stm.setString(5, model.getPhone());
            stm.setString(6, model.getPrice());
            stm.setInt(7, model.getPost_id());
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
    
    public void updatePostAdmin(Post model) {
        try {
            connection.setAutoCommit(false);
            String sql = "update Post set post_title = ?, post_text = ?, create_date = ?, [address] = ?, phone = ?, price = ?, status = ? where post_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getPost_title());
            stm.setString(2, model.getPost_text());
            stm.setDate(3, model.getCreate_date());
            stm.setString(4, model.getAddress());
            stm.setString(5, model.getPhone());
            stm.setString(6, model.getPrice());
            stm.setInt(7, model.getStatus());
            stm.setInt(8, model.getPost_id());
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
    public void delete(Post model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Post fill(String post_title) {
        try {
            String sql = "select * from post";
            PreparedStatement stm = connection.prepareStatement(sql);
            //stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Post posts = new Post();
                posts.setPost_id(rs.getInt("post_id"));
                posts.setPost_title(rs.getString("post_title"));
                posts.setPost_text(rs.getString("post_text"));
                posts.setAccount_id(rs.getInt("account_id"));
                posts.setCreate_date(rs.getDate("create_date"));
                return posts;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //Lay thong tin tu database
    public Post viewPost(int post_id) {
        List<Post> list = new ArrayList<>();
        try {
            connection.setAutoCommit(false);
            String sql = "select post_id, post_title, post_text, account_id, create_date"
                    + "from post";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Post ps = new Post();
                ps.setPost_id(rs.getInt("post_id"));
                ps.setPost_title(rs.getString("post_tittle"));
                ps.setPost_text(rs.getString("post_text"));
                ps.setAccount_id(rs.getInt("account_id"));
                ps.setCreate_date(rs.getDate("create_date"));
                connection.commit();
                stm.close();
                return ps;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountInformationDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public int getTotalPost() {
        List<Post> list = new ArrayList<>();
        try {
            connection.setAutoCommit(false);
            String sql = "select COUNT (*)\n"
                    + "from Post";
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    rs.getInt(1);
                }
                connection.commit();
                stm.close();
            }
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
        return 0;
    }

    public List<Post> pagingPost(int index) {
        List<Post> list = new ArrayList<>();
        try {
            connection.setAutoCommit(false);
            String sql = "select * from Post\n"
                    + "order by post_id\n"
                    + "offset ? ROW FETCH NEXT 4 ROWS ONLY";
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                ResultSet rs = stm.executeQuery();
                stm.setInt(1, (index - 1) * 4);
//                while (rs.next()) {
//                    list.add(new Post(rs.getInt(1),
//                            rs.getString(2),
//                            rs.getString(3),
//                            rs.getInt(4),
//                            rs.getDate(5)));
//                }
                connection.commit();
                stm.close();
            }
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
        return list;
    }

//    public int getNuberPage() {
//        try {
//            connection.setAutoCommit(false);
//            String sql = "select COUNT (*)\n"
//                    + "from Post";
//            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
//                ResultSet rs = stm.executeQuery();
//                while (rs.next()) {
//                    int total = rs.getInt(1);
//                    int countPage = 0;
//                    countPage = total / 4;
//                    if (total % 4 != 0) {
//                        countPage++;
//                    }
//                    return countPage;
//                }
//                connection.commit();
//                stm.close();
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            try {
//                connection.setAutoCommit(true);
//                connection.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return 0;
//    }
//
//    public List<Post> pagingPost(int index) {
//        List<Post> list = new ArrayList<>();
//        try {
//            connection.setAutoCommit(false);
//            String sql = "select * from Post\n"
//                    + "order by post_id\n"
//                    + "offset ? ROW FETCH NEXT 4 ROWS ONLY";
//            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
//                ResultSet rs = stm.executeQuery();
//                stm.setInt(1, (index - 1) * 5);//memory
//                while (rs.next()) {
//                    list.add(new Post(rs.getInt(1),
//                            rs.getString(2),
//                            rs.getString(3),
//                            rs.getInt(4),
//                            rs.getDate(5)));
//                }
//                connection.commit();
//                stm.close();
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            try {
//                connection.setAutoCommit(true);
//                connection.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return list;
//    }
//    public static void main(String[] args) {
//        PostDBContext post = new PostDBContext();
//        int count = post.getTotalPost();
//        System.out.println(count);
//   }
//    public static void main(String[] args) {
//        PostDBContext postDBContext = new PostDBContext();
//        List<Post> list = postDBContext.pagingPost(3);
//        for (Post o : list)
//        System.out.println(o);
//    }
    //get detail post
    @Override
    public Post get(Post model) {
        Post post = new Post();
        try {
            connection.setAutoCommit(false);
            String sql = "select post_id, post_title, post_text, create_date, [address], phone, price, img, account_id, status from Post \n"
                    + "where post_id= ?";
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                stm.setInt(1, model.getPost_id());
                ResultSet rs = stm.executeQuery();
                if (rs.next()) {
                    post.setPost_id(rs.getInt(1));
                    post.setPost_title(rs.getString(2));
                    post.setPost_text(rs.getString(3));
                    post.setCreate_date(rs.getDate(4));
                    post.setAddress(rs.getString(5));
                    post.setPhone(rs.getString(6));
                    post.setPrice(rs.getString(7));
                    post.setImg(rs.getString(8));
                    post.setAccount_id(rs.getInt(9));
                    post.setStatus(rs.getInt(10));
                }
                connection.commit();
                stm.close();
            }
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
        return post;
    }

    public void deletePost(String post_id) {
        try {
            connection.setAutoCommit(false);
            String sql = "delete from Post \n"
                    + "where post_id= ?";
            try ( PreparedStatement stm = connection.prepareStatement(sql)) {
                ResultSet rs = stm.executeQuery();
                stm.setString(1, post_id);
                stm.executeUpdate();
                connection.commit();
                stm.close();
            }
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

    public List<Post> getListByPage(List<Post> post, int start, int end) {
        ArrayList<Post> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(post.get(i));
        }
        return arr;
    }
}
