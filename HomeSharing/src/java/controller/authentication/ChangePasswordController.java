package controller.authentication;

import dao.AccountDBContext;
import dao.AccountInformationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Account;
import model.AccountInformation;
import model.AccountView;

public class ChangePasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./view/auth/changepassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        //Forget password
        if (session.getAttribute("account") == null) {
            String email = (String) session.getAttribute("email");
            String newpassword = request.getParameter("newpassword").trim();
            String renewpassword = request.getParameter("renewpassword").trim();
            if (newpassword.isEmpty() || renewpassword.isEmpty()) {
                request.setAttribute("newpassword", newpassword);
                request.setAttribute("renewpassword", renewpassword);
                request.setAttribute("verifyforgetpassword", false);
                request.getRequestDispatcher("./view/auth/changepassword.jsp").forward(request, response);
            }
            request.removeAttribute("verifyforgetpassword");

            AccountInformationDBContext accountInformationDBContext = new AccountInformationDBContext();
            AccountView accountView = accountInformationDBContext.getGoogleEmail(email);
            AccountDBContext accountDBContext = new AccountDBContext();
            Account account = new Account();
            account.setAccount_id(accountView.getAccount_id());
            account.setPassword(newpassword);
            accountDBContext.updatePassword(account);
            session.removeAttribute("email");
            response.sendRedirect("login");
        }

        //Change password
        if (session.getAttribute("account") != null) {
            Account account = (Account) session.getAttribute("account");
            String oldpassword = request.getParameter("oldpassword").trim();
            String newpassword = request.getParameter("newpassword").trim();
            String renewpassword = request.getParameter("renewpassword").trim();
            if (newpassword.isEmpty() || renewpassword.isEmpty() || oldpassword.isEmpty() || oldpassword.indexOf(" ") >= 0 || newpassword.indexOf(" ") >= 0 || renewpassword.indexOf(" ") >= 0) {
                request.setAttribute("oldpassword", oldpassword);
                request.setAttribute("newpassword", newpassword);
                request.setAttribute("renewpassword", renewpassword);
                request.setAttribute("verifyforgetpassword", false);
            }
            AccountDBContext accountDBContext = new AccountDBContext();
            account = (Account) session.getAttribute("account");
            if (oldpassword.equals(account.getPassword())) {
                boolean checkoldpassword = true;
                session.setAttribute("checkoldpassword", checkoldpassword);
                account.setPassword(newpassword);
                accountDBContext.updatePassword(account);
                if (account.getRole() == 1) {
                    response.sendRedirect("homeadmin");
                }
            } else if (!oldpassword.equals(account.getPassword())) {
                boolean checkoldpassword = false;
                session.setAttribute("checkoldpassword", checkoldpassword);
                request.setAttribute("oldpassword", oldpassword);
                request.setAttribute("newpassword", newpassword);
                request.setAttribute("renewpassword", renewpassword);
                request.getRequestDispatcher("./view/auth/changepassword.jsp").forward(request, response);

            }
        }
    }
}
