package controller.tenant;

import dao.AccountDBContext;
import dao.HouseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Account;
import model.House;

public class HomeTenantController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HouseDBContext h = new HouseDBContext();
        String action = request.getParameter("action");
        //List house by housemanager_id
        if (action == null || action == "") {
            request.getRequestDispatcher("./home/housemanager.jsp").forward(request, response);
        } 

        //delete house
        else if (action.equalsIgnoreCase("houselist")) {
            try {
                HttpSession session = request.getSession();
                model.Account acc = (model.Account) session.getAttribute("account");
                int housemanager_id = acc.getAccount_id();
                List<model.House> house = h.getHouseByHouseManagerID(housemanager_id);
                request.setAttribute("house", house);
                request.getRequestDispatcher("./home/houselist.jsp").forward(request, response);
            } catch (Exception e) {
                response.sendRedirect("./view/auth/login.jsp");
            }
        } else if (action.equalsIgnoreCase("insert")) {
            request.getRequestDispatcher("./home/houseinsert.jsp").forward(request, response);
        } //insert new house
        else if (action.equalsIgnoreCase("inserthouse")) {

            String address = request.getParameter("address").trim();
            String price = request.getParameter("price");
            String describe = request.getParameter("describe").trim();
            String city = request.getParameter("city").trim();
            String img = "images/" + request.getParameter("img");
            Float pr = Float.parseFloat(price);
            House house = new House();
            house.setAddress(address);
            house.setPrice(pr);
            house.setDescribe(describe);
            house.setCity(city);
            house.setImg(img);
            h.insertHouse(house);
            response.sendRedirect("housemanager?action=insert");
        } //update house
        else if (action.equalsIgnoreCase("updatehouse")) {
            String house_id = request.getParameter("house_id");
            String address = request.getParameter("address").trim();
            String price = request.getParameter("price");
            String describe = request.getParameter("describe").trim();
            String city = request.getParameter("city").trim();
            String img = "images/" + request.getParameter("img");
            int houseid = Integer.parseInt(house_id);
            Float pr = Float.parseFloat(price);
            House house = new House();
            house.setHouse_id(houseid);
            house.setAddress(address);
            house.setPrice(pr);
            house.setDescribe(describe);
            house.setCity(city);
            house.setImg(img);
            h.updateHouse(house);
            response.sendRedirect("housemanager");
        }
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
