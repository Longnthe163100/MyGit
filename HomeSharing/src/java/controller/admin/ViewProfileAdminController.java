package controller.admin;

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

public class ViewProfileAdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        AccountInformation accountInformation = new AccountInformation();
        accountInformation.setAccount_id(account.getAccount_id());
        AccountInformationDBContext accountInformationDBContext = new AccountInformationDBContext();
        accountInformation = accountInformationDBContext.get(accountInformation);
        session.setAttribute("accountViewProfile", accountInformation);
        request.getRequestDispatcher("./view/admin/admin-view-profile.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
