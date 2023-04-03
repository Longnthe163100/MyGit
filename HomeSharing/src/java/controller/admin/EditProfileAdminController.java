package controller.admin;

import controller.manager.*;
import dao.AccountDBContext;
import dao.AccountInformationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import model.Account;
import model.AccountInformation;
import model.AccountView;

public class EditProfileAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./view/admin/admin-edit-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountInformationDBContext accountInformationDBContext = new AccountInformationDBContext();
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Date dob = java.sql.Date.valueOf(request.getParameter("dob"));
        String sex = request.getParameter("sex");
//        response.getWriter().println(sex);
        boolean gender = false;
        if (sex.equals("true")) {
            gender = true;
        } 
        String identity_card_number = request.getParameter("identity_card_number");
        Account account = (Account) session.getAttribute("account");
        AccountInformation accountInformation = new AccountInformation();
        accountInformation.setAccount_id(account.getAccount_id());
        accountInformation.setFullname(fullname);
        accountInformation.setEmail(email);
        accountInformation.setPhone(phone);
        accountInformation.setAddress(address);
        accountInformation.setDob((java.sql.Date) dob);
        accountInformation.setSex(gender);
        accountInformation.setIdentity_card_number(identity_card_number);
        accountInformationDBContext.update(accountInformation);
        request.getRequestDispatcher("/adminviewprofile").forward(request, response);
    }

}
