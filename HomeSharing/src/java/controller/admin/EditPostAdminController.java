package controller.admin;

import controller.manager.*;
import dao.PostDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Account;
import model.Post;

public class EditPostAdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./view/admin/editpost.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String price = request.getParameter("price");
        String status = request.getParameter("status");
        Post post_detail = (Post) session.getAttribute("post_detail");
        Post post = new Post();
        Account account = (Account) session.getAttribute("account");
        PostDBContext postDBContext = new PostDBContext();
        long millis = System.currentTimeMillis();
        java.sql.Date create_date = new java.sql.Date(millis);
        post.setAccount_id(account.getAccount_id());
        post.setCreate_date(create_date);
        post.setPost_title(title);
        post.setPost_id(post_detail.getPost_id());
        post.setPost_text(description);
        post.setAddress(address);
        post.setPhone(phone);
        post.setPrice(price);
        post.setStatus(Integer.parseInt(status));
        postDBContext.updatePostAdmin(post);
        response.sendRedirect("adminviewpostdetail?post_id=" + post.getPost_id());
    }
}
