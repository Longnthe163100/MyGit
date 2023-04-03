
package controller.tenant;

import controller.manager.*;
import dao.BillDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import model.Account;
import model.AccountView;
import model.Bill;

public class ViewBillTenantController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session=  request.getSession();
        Account currentAccount = (Account) session.getAttribute("account");
        BillDBContext db = new BillDBContext();
        ArrayList<Bill> billList = db.getBillList((Account) session.getAttribute("account"));
        request.getSession().setAttribute("billList", billList);
        request.getRequestDispatcher("./view/tenant/viewbill.jsp").forward(request, response);
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
