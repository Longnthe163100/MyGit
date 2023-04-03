package controller.authentication;

import dao.AccountDBContext;
import dao.AccountInformationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import model.Account;
import model.AccountInformation;
import util.DateTimeHelper;

public class RegisterController extends HttpServlet {

    static DateTimeHelper dth = new DateTimeHelper();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountDBContext dbaccount = new AccountDBContext();
        AccountInformationDBContext dbaccountinfo = new AccountInformationDBContext();
        Account account = new Account();
        AccountInformation accountinfo = new AccountInformation();

        //Add Account
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String repassword = request.getParameter("repassword").trim();
        String email = request.getParameter("email").trim();
        //current date
        long millis = System.currentTimeMillis();
        java.sql.Date created_date = new java.sql.Date(millis);
        //status default after register is on
        int status = 1;
        String role = request.getParameter("role");
        account.setUsername(username);
        account.setPassword(password);
        account.setCreate_date(created_date);
        account.setStatus(status);
        account.setRole(Integer.parseInt(role));

        //Add information account from form register to accountinformation 
        String fullname = request.getParameter("fullname").trim();
        String dob = request.getParameter("dob");
        Date dobsql = java.sql.Date.valueOf(dob);
        boolean sex = Boolean.parseBoolean(request.getParameter("sex"));
        String phone = request.getParameter("phone").trim();
        String address = request.getParameter("address").trim();
        String identity_card_number = request.getParameter("identity_card_number").trim();

        accountinfo.setFullname(fullname);
        accountinfo.setEmail(email);
        accountinfo.setDob(dobsql);
        accountinfo.setSex(sex);
        accountinfo.setPhone(phone);
        accountinfo.setAddress(address);
        accountinfo.setIdentity_card_number(identity_card_number);

        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setAttribute("repassword", repassword);
        session.setAttribute("phone", phone);
        session.setAttribute("fullname", fullname);
        session.setAttribute("email", email);
        session.setAttribute("dob", dob);
        session.setAttribute("role", role);
        session.setAttribute("sex", sex);
        session.setAttribute("address", address);
        session.setAttribute("identity_card_number", identity_card_number);

        ArrayList<Account> accounts = dbaccount.getAllAccounts();
        for (Account acc : accounts) {
            if (acc.getUsername().equals(account.getUsername())) {
                request.setAttribute("checkusername", "username exist");
            }
        }
        if (!password.equals(repassword)) {
            request.setAttribute("checkpassword", "password fail");
        }

        boolean check = dbaccountinfo.getExistEmail(email);
        if (check == false) {
            session.setAttribute("email", email);
            session.setAttribute("thread", "register");
            session.setAttribute("account", account);
            session.setAttribute("accountinfo", accountinfo);

        } else {
            request.setAttribute("checkemail", "email exist");
        }
        
        if (request.getAttribute("checkusername") != null || request.getAttribute("checkpassword") != null || request.getAttribute("checkpassword") != null) {
            request.getRequestDispatcher("./view/auth/register.jsp").forward(request, response);
        } else {
            response.sendRedirect("sendcode");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.removeAttribute("repassword");
        session.removeAttribute("phone");
        session.removeAttribute("fullname");
        session.removeAttribute("role");
        session.removeAttribute("email");
        session.removeAttribute("dob");
        session.removeAttribute("sex");
        session.removeAttribute("address");
        session.removeAttribute("identity_card_number");
        request.removeAttribute("checkusername");
        request.removeAttribute("checkpassword");
        request.removeAttribute("checkemail");
        request.getRequestDispatcher("./view/auth/register.jsp").forward(request, response);
    }

}
