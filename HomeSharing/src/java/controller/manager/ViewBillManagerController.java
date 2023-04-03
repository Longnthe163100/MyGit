
package controller.manager;

import dao.BillDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import model.Account;
import model.AccountView;
import model.Bill;

public class ViewBillManagerController extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Account currentAccount = (Account) request.getSession().getAttribute("account");
        BillDBContext db = new BillDBContext();
        ArrayList<Bill> billList = db.getBillList(currentAccount);
        request.getSession().setAttribute("billList", billList);
        request.getRequestDispatcher("./view/manager/viewbill.jsp").forward(request, response);
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
