package controller.admin;

import dao.AccountDBContext;
import dao.AccountInformationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.AccountInformation;
import model.AccountView;

public class UpdateUserAdminController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các giá trị được gửi từ client
        HttpSession session = request.getSession();
        String accountId = request.getParameter("account_id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String status = request.getParameter("status");
        Account account = new Account();
        account.setAccount_id(Integer.parseInt(accountId));
        account.setUsername(username);
        account.setPassword(password);
        account.setRole(Integer.parseInt(role));
        account.setStatus(Integer.parseInt(status));
        AccountInformation accountInformation = new AccountInformation();
        accountInformation.setAccount_id(Integer.parseInt(accountId));
        accountInformation.setFullname(fullname);
        accountInformation.setEmail(email);
        accountInformation.setAddress(address);
        accountInformation.setPhone(phone);
        AccountInformationDBContext dbaccountinformation = new AccountInformationDBContext();
        dbaccountinformation.updateAdminUserProfile(accountInformation);
        AccountDBContext dbaccount = new AccountDBContext();
        dbaccount.updateAccountStatus(account);
    }
}
