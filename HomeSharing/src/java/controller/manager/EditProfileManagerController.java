package controller.manager;

import dao.AccountInformationDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.AccountInformation;

public class EditProfileManagerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AccountInformation accInfo = (AccountInformation) session.getAttribute("accInfo");
        request.getSession().setAttribute("accInfo", accInfo);
        request.getRequestDispatcher("./view/manager/editprofile.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String btn = request.getParameter("btn");
        if (btn.equalsIgnoreCase("cancel")) {
            response.sendRedirect("managereditprofile");
        } else {
            String username = "renter";//request.getParameter("username");
            String name = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int sex = Integer.parseInt(request.getParameter("gender"));
            String raw_dob = request.getParameter("dob");
            java.sql.Date dob = null;
            if (raw_dob == null || raw_dob.length() == 0) {
                dob = null;
            } else {
                dob = java.sql.Date.valueOf(raw_dob);
            }
            String address = request.getParameter("address");
            String cccd = request.getParameter("cccd");
            AccountInformationDBContext accInfo = new AccountInformationDBContext();
//            accInfo.updateProfile(username, name, email, phone, sex, dob, address, cccd);
            response.sendRedirect("managereditprofile");
        }

    }
}
