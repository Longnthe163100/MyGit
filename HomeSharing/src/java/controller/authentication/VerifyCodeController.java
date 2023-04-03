package controller.authentication;

import dao.AccountDBContext;
import dao.AccountInformationDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.AccountInformation;

public class VerifyCodeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./view/auth/verify.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        AccountInformation accountinfo = (AccountInformation) session.getAttribute("accountinfo");
        AccountDBContext dbaccount = new AccountDBContext();
        AccountInformationDBContext dbaccountinfo = new AccountInformationDBContext();
        String authcode = request.getParameter("authcode");
        String code = (String) session.getAttribute("code");
        String thread = (String) session.getAttribute("thread");

        if (code.equals(authcode)) {
            if (thread.equals("register")) {
                dbaccount.insert(account);
                account = dbaccount.get(account);
                accountinfo.setAccount_id(account.getAccount_id());
                dbaccountinfo.insert(accountinfo);
                request.setAttribute("message", "success");
                request.getRequestDispatcher("./view/auth/login.jsp").forward(request, response);
            } else if (thread.equals("forgetpassword")) {
                session.setAttribute("verifyemail", "Success");
                response.sendRedirect("changepassword");
            }
        } else {
            request.setAttribute("message", "fail");
            request.getRequestDispatcher("./view/auth/verify.jsp").forward(request, response);
        }
    }
}
