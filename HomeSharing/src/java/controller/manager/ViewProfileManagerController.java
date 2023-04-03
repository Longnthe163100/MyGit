package controller.manager;

import dao.AccountInformationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.AccountInformation;

public class ViewProfileManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String username = "renter";//request.getParameter("username");
//        AccountInformationDBContext accountInfo = new AccountInformationDBContext();
//        AccountInformation accInfo = accountInfo.viewProfile(username);
//        request.getSession().setAttribute("accInfo", accInfo);
//        request.getRequestDispatcher("./view/profile/viewprofile.jsp").forward(request, response);
        String action = request.getParameter("action");
        //List house by housemanager_id
        if (action.equalsIgnoreCase("viewprofile")) {
            try {
                HttpSession session = request.getSession();
                model.Account acc = (model.Account) session.getAttribute("account");
                int account_id = acc.getAccount_id();
                AccountInformationDBContext accountInfo = new AccountInformationDBContext();
                AccountInformation accInfo = accountInfo.viewProfile(account_id);
                request.getSession().setAttribute("accInfo", accInfo);
                request.getRequestDispatcher("./view/manager/viewprofile.jsp").forward(request, response);
            } catch (Exception e) {
                response.sendRedirect("./view/auth/login.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
