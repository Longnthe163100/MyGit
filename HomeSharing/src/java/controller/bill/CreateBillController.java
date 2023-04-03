package controller.bill;

import dao.BillDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import model.Account;
import model.AccountView;
import model.Bill;

public class CreateBillController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        BillDBContext db = new BillDBContext();
        Account currentUser = (Account)request.getSession().getAttribute("account");
        ArrayList<String> tenantList = db.getTenantListFromBill(currentUser.getAccount_id());
        request.getSession().setAttribute("tenantList", tenantList);
        request.getRequestDispatcher("./view/bill/createbill.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        BillDBContext db = new BillDBContext();
        Bill newBill = new Bill();
        LocalDateTime now = LocalDateTime.now();  
        Date currentDate = Date.valueOf(now.toLocalDate());
        AccountView currentUser = (AccountView)request.getSession().getAttribute("account");
        newBill.setManagerID(currentUser.getAccount_id());
        newBill.setTenantID((int)request.getAttribute("tenant-ID"));
        newBill.setRoomNumber((int)request.getAttribute("room-number"));
        newBill.setHouseID((int)request.getAttribute("house-ID"));
        newBill.setTitle((String)request.getAttribute("title"));
        newBill.setCreatedDate(currentDate);
        newBill.setDueDate((Date)request.getAttribute("due-date"));
        newBill.setPaymentDate(null);
        newBill.setStatus(false);
        newBill.setPaymentID(null);
        newBill.setRentMoney((int)request.getAttribute("rent-money"));
        newBill.setElectricMoney((int)request.getAttribute("electric-money"));
        newBill.setWaterMoney((int)request.getAttribute("water-money"));
        newBill.setExtraMoney((int)request.getAttribute("extra-money"));
        newBill.setTotalMoney(newBill.getRentMoney() + newBill.getElectricMoney() + newBill.getWaterMoney() + newBill.getExtraMoney());
        db.insert(newBill);
        request.getSession().setAttribute("newBill", newBill);
        request.getRequestDispatcher("view/bill/createbill.jsp").forward(request, response);
    }
}
