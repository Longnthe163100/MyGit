package controller.admin;

import controller.manager.*;
import dao.PostDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;
import model.Account;
import model.Post;

public class CreatePostAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./view/admin/createpost.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Post post = new Post();
        Account account = (Account) session.getAttribute("account");
        PostDBContext postDBContext = new PostDBContext();
        long millis = System.currentTimeMillis();
        java.sql.Date create_date = new java.sql.Date(millis);
        post.setAccount_id(account.getAccount_id());
        post.setCreate_date(create_date);
        post.setPost_title(title);
        post.setPost_text(description);
        post.setStatus(1);
        postDBContext.insert(post);
        response.sendRedirect("adminviewpost");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
