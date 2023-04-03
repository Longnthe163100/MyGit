package controller.authentication;

import dao.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.AccountView;

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String message = "";
        AccountDBContext db = new AccountDBContext();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        Account account = new Account();
        account.setUsername(username);
        account.setPassword(password);
        account = db.get(account);

        if (username.trim().isEmpty() || password.trim().isEmpty()) {
            message = "Vui lòng nhập đầy đủ tài khoản và mật khẩu";
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            request.setAttribute("message", message);
            request.getRequestDispatcher("./view/auth/login.jsp").forward(request, response);
        } else if (account.getAccount_id() == 0) {
            message = "Tài khoản hoặc mật khẩu không đúng, vui lòng nhập lại";
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            request.setAttribute("message", message);
            request.getRequestDispatcher("./view/auth/login.jsp").forward(request, response);
        } else if (account.getStatus() == 0) {
            message = "Tài khoản của bạn đã bị chặn hoạt động, vui lòng liên hệ quản trị viên";
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            request.setAttribute("message", message);
            request.getRequestDispatcher("./view/auth/login.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("account", account);
            if (account.getRole() == 1) {
                response.sendRedirect("homeadmin");
            } else if (account.getRole() == 2) {
                response.sendRedirect("housemanager");
            } else if (account.getRole() == 3) {

            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("account", null);
        request.getSession().setAttribute("username", null);
        request.getSession().setAttribute("password", null);
        request.getRequestDispatcher("./view/auth/login.jsp").forward(request, response);
    }
}
