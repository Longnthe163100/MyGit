package controller.admin;

import dao.AccountDBContext;
import dao.AccountInformationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteUserAdminController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountId = Integer.parseInt(request.getParameter("account_id"));
        AccountDBContext accountDBContext = new AccountDBContext();
        AccountInformationDBContext accountInformationDBContext = new AccountInformationDBContext();
        accountInformationDBContext.delete(accountId);
        accountDBContext.delete(accountId);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("./view/admin/adminhome.jsp").forward(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDBContext accountDBContext = new AccountDBContext();
        AccountInformationDBContext accountInformationDBContext = new AccountInformationDBContext();
        String account_id = request.getParameter("account_id");
        accountInformationDBContext.delete(Integer.parseInt(account_id));
        accountDBContext.delete(Integer.parseInt(account_id));
        request.getRequestDispatcher("./view/admin/admin-list-account.jsp").forward(request, response);
    }
}
