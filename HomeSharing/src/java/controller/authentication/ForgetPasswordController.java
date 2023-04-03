package controller.authentication;

import dao.AccountInformationDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ForgetPasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newpassword = request.getParameter("newpassword");
        String renewpassword = request.getParameter("renewpassword");
        request.setAttribute("newpassword", newpassword);
        request.setAttribute("renewpassword", renewpassword);
        request.removeAttribute("failemail");
        request.removeAttribute("message");
        request.getRequestDispatcher("./view/auth/forgetpassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountInformationDBContext db = new AccountInformationDBContext();
        String message = "";
        String email = request.getParameter("email");
        boolean check = db.getExistEmail(email);
        if (check) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("thread", "forgetpassword");
            response.sendRedirect("sendcode");
        } else {
            String failemail = "Not found email";
            message = "Email chưa được đăng ký, vui lòng nhập lại";
            request.setAttribute("email", email);
            request.setAttribute("failemail", failemail);
            request.setAttribute("message", message);
            request.getRequestDispatcher("./view/auth/forgetpassword.jsp").forward(request, response);
        }
    }
}
