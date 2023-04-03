package controller.manager;

import dao.PostDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Post;

public class ViewPostDetailManagerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String post_id = request.getParameter("post_id");
        PostDBContext postDBContext = new PostDBContext();
        Post post_detail = new Post();
        post_detail.setPost_id(Integer.parseInt(post_id));
        post_detail = postDBContext.get(post_detail);
        request.getSession().setAttribute("post_detail", post_detail);  
        request.getRequestDispatcher("./view/manager/viewpostdetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
