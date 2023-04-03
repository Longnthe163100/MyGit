package controller.manager;

import dao.PostDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Post;

public class ViewPostManagerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String index = request.getParameter("index");
//        if (index == null) {
//            index = "1"; // Day vao trang dau tien cua web
//        }
//        int indexPage = Integer.parseInt(index);
//        PostDBContext post = new PostDBContext();
//        List<Post> list = post.pagingPost(indexPage);
//        request.setAttribute("listP", list);
//        request.getRequestDispatcher("./view/post/blog.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            PostDBContext p = new PostDBContext();
            List<model.Post> postList = p.getPostManager();
            int page, numperpage = 4; // số lượng bài đăng trong 1 page
            int size = postList.size(); // 
            int num = (size % 4 == 0 ? (size / 4) : ((size / 4)) + 1); //số lượng trang
            //So luong bai
            String xpage = request.getParameter("page"); //xpage
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            List<model.Post> post = p.getListByPage(postList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("PostData", post);
            request.getRequestDispatcher("./view/manager/viewpost.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
