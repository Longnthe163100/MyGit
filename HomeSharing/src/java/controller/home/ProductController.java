
package controller.home;
        
import dao.HouseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author longn
 */
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            HouseDBContext h = new HouseDBContext();
            List<model.House> houseList = h.getHouse();
            int page, numperpage = 9;
            int size = houseList.size();
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            List<model.House> house = h.getListByPage(houseList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("HouseData", house);
            request.getRequestDispatcher("./home/product.jsp").forward(request, response);
        } 
        
        else if (action.equalsIgnoreCase("housedetail")) {
            String house_id = request.getParameter("house_id");            
            HouseDBContext h = new HouseDBContext();
            model.House house = h.getHouseByID(house_id);
            String city = house.getCity();
            List<model.House> productByCity = h.getProductByCity(city);
            request.setAttribute("HouseData", house);
            request.setAttribute("ProductByCity", productByCity);
            request.getRequestDispatcher("./home/housedetails.jsp").forward(request, response);
        } 
        
            else if (action.equals("search")) {
            String text = request.getParameter("text").trim();
            HouseDBContext h = new HouseDBContext();
            List<model.House> houseList = h.SearchAll(text);
            int page, numperpage = 9;
            int size = houseList.size();
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);
            List<model.House> house = h.getListByPage(houseList, start, end);
            request.setAttribute("page", page);
            request.setAttribute("saa", text);
            request.setAttribute("num", num);
            request.setAttribute("HouseData", house);
            request.getRequestDispatcher("./home/product.jsp").forward(request, response);
        } 
        
        else if (action.equals("sort")) {
            String type = request.getParameter("type");
            if (type.equals("low")) {
                HouseDBContext h = new HouseDBContext();
                List<model.House> houseList = h.getPriceLow();
                int page, numperpage = 9;
                int size = houseList.size();
                int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * numperpage;
                end = Math.min(page * numperpage, size);
                List<model.House> house = h.getListByPage(houseList, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("HouseData", house);
                request.getRequestDispatcher("./home/product.jsp").forward(request, response);
            } 
            else if (type.equals("high")) {
                HouseDBContext h = new HouseDBContext();
                List<model.House> houseList = h.getPriceHigh();
                int page, numperpage = 9;
                int size = houseList.size();
                int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * numperpage;
                end = Math.min(page * numperpage, size);
                List<model.House> house = h.getListByPage(houseList, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("HouseData", house);
                request.getRequestDispatcher("./home/product.jsp").forward(request, response);
            }
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
