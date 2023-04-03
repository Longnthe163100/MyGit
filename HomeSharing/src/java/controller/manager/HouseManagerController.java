package controller.manager;

import dao.HouseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class HouseManagerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        HouseDBContext h = new HouseDBContext();
        String action = request.getParameter("action");

        if (action == null || action == "") {
            request.getRequestDispatcher("./home/housemanager.jsp").forward(request, response);
        } //List house by housemanager_id
        else if (action.equalsIgnoreCase("houselist")) {
            try {
                model.Account acc = (model.Account) session.getAttribute("account");
                int housemanager_id = acc.getAccount_id();
                List<model.House> house = h.getHouseByHouseManagerID(housemanager_id);
                request.setAttribute("house", house);
                request.getRequestDispatcher("./home/houselist.jsp").forward(request, response);
            } catch (Exception e) {
                response.sendRedirect("./view/auth/login.jsp");
            }
        } else if (action.equalsIgnoreCase("houseinsert")) {
            request.getRequestDispatcher("./home/houseinsert.jsp").forward(request, response);
        } //insert new house
        else if (action.equalsIgnoreCase("inserthouse")) {
            model.Account acc = (model.Account) session.getAttribute("account");
            int housemanager_id = acc.getAccount_id();
            String address = request.getParameter("address").trim();
            String price = request.getParameter("price");
            String describe = request.getParameter("describe").trim();
            String city = request.getParameter("city").trim();
            String image = "assets/img/imgproduct/" + uploadImage("img", request);
            Float pr = Float.parseFloat(price);
            // trim address
            address = address.trim().toLowerCase();
            address = address.replaceAll("\\s+", " ");
            String[] temp0 = address.split(" ");
            address = "";
            for (int i = 0; i < temp0.length; i++) {
                address += String.valueOf(temp0[i].charAt(0)).toUpperCase() + temp0[i].substring(1);
                if (i < temp0.length - 1) {
                    address += " ";
                }
            }
            price = price.trim().toLowerCase();
            price = price.replaceAll("\\s+", " ");
            String[] temp1 = price.split(" ");
            price = "";
            for (int i = 0; i < temp1.length; i++) {
                price += String.valueOf(temp1[i].charAt(0)) + temp1[i].substring(1);
                if (i < temp1.length - 1) {
                    price += " ";
                }
            }
            //trim city
            city = city.trim().toLowerCase();
            city = city.replaceAll("\\s+", " ");
            String[] temp3 = city.split(" ");
            city = "";
            for (int i = 0; i < temp3.length; i++) {
                city += String.valueOf(temp3[i].charAt(0)).toUpperCase() + temp3[i].substring(1);
                if (i < temp3.length - 1) {
                    city += " ";
                }
            }
            model.House house = new model.House();
            house.setHousemanager_id(housemanager_id);
            house.setAddress(address);
            house.setPrice(pr);
            house.setDescribe(describe);
            house.setCity(city);
            house.setImg(image);
            h.insertHouse(house);
            response.sendRedirect("housemanager?action=houselist");
        } //update house
        else if (action.equalsIgnoreCase("updatehouse")) {
            String house_id = request.getParameter("house_id");
            String address = request.getParameter("address" + house_id).trim();
            String price = request.getParameter("price" + house_id);
            String describe = request.getParameter("describe" + house_id).trim();
            String city = request.getParameter("city" + house_id).trim();
            String img = uploadImage("img" + house_id, request);
            boolean status = Boolean.parseBoolean(request.getParameter("status" + house_id));

            String image = "assets/img/imgproduct/" + img;
            if (img == null) {
                image = null;
            }
            int houseid = Integer.parseInt(house_id);
            Float pr = Float.parseFloat(price);

            address = address.trim().toLowerCase();
            address = address.replaceAll("\\s+", " ");
            String[] temp0 = address.split(" ");
            address = "";
            for (int i = 0; i < temp0.length; i++) {
                address += String.valueOf(temp0[i].charAt(0)).toUpperCase() + temp0[i].substring(1);
                if (i < temp0.length - 1) {
                    address += " ";
                }
            }
            price = price.trim().toLowerCase();
            price = price.replaceAll("\\s+", " ");
            String[] temp1 = price.split(" ");
            price = "";
            for (int i = 0; i < temp1.length; i++) {
                price += String.valueOf(temp1[i].charAt(0)) + temp1[i].substring(1);
                if (i < temp1.length - 1) {
                    price += " ";
                }
            }
            describe = describe.trim().toLowerCase();
            describe = describe.replaceAll("\\s+", " ");
            String[] temp2 = describe.split(" ");
            describe = "";
            for (int i = 0; i < temp2.length; i++) {
                describe += String.valueOf(temp2[i].charAt(0)) + temp2[i].substring(1);
                if (i < temp2.length - 1) {
                    describe += " ";
                }
            }
            city = city.trim().toLowerCase();
            city = city.replaceAll("\\s+", " ");
            String[] temp3 = city.split(" ");
            city = "";
            for (int i = 0; i < temp3.length; i++) {
                city += String.valueOf(temp3[i].charAt(0)).toUpperCase() + temp3[i].substring(1);
                if (i < temp3.length - 1) {
                    city += " ";
                }
            }
            model.House house = new model.House();
            house.setHouse_id(houseid);
            house.setAddress(address);
            house.setPrice(pr);
            house.setDescribe(describe);
            house.setCity(city);
            house.setImg(image);
            house.setStatus(status);
            h.updateHouse(house);
            response.sendRedirect("housemanager?action=houselist");
        } else if (action.equalsIgnoreCase("viewbill")) {
            request.getRequestDispatcher("./view/manager/viewbill.jsp").forward(request, response);
        }//view room list
        else if (action.equalsIgnoreCase("roomlist")) {
            List<model.Room> room = h.getRoom(request.getParameter("houseid"));
            request.setAttribute("room", room);
            request.getRequestDispatcher("./home/roomlist.jsp").forward(request, response);
        }//update room information
        else if (action.equalsIgnoreCase("updateroom")) {
            String room_id = request.getParameter("room_id");
            String cus_name = request.getParameter("cus_name" + room_id);
            String cus_email = request.getParameter("cus_email" + room_id);
            String cus_phone = request.getParameter("cus_phone" + room_id);
            boolean status = Boolean.parseBoolean(request.getParameter("status" + room_id));

            int roomid = Integer.parseInt(room_id);
            int phone = Integer.parseInt(cus_phone);

            model.Room room = new model.Room();
            room.setRoom_id(roomid);
            room.setCus_name(cus_name);
            room.setCus_email(cus_email);
            room.setCus_phone(phone);
            h.updateRoom(room);
            response.sendRedirect("housemanager?action=houselist");

        } else if (action.equalsIgnoreCase("roominsert")) {
            request.getRequestDispatcher("./home/roominsert.jsp").forward(request, response);
        } else if (action.equalsIgnoreCase("inserthouse")) {
            
            String house_id = request.getParameter("house_id");
            String room_number = request.getParameter("room_number").trim();
            String cus_name = request.getParameter("cus_name");
            String cus_email = request.getParameter("cus_email").trim();
            String cus_phone = request.getParameter("cus_phone").trim();
            
            int phone = Integer.parseInt(cus_phone);
            int houseid= Integer.parseInt(house_id);
            int roomnumber= Integer.parseInt(room_number);
            model.Room room = new model.Room();
            room.setHouse_id(houseid);
            room.setRoom_number(roomnumber);
            room.setCus_name(cus_name);
            room.setCus_email(cus_email);
            room.setCus_phone(phone);
            
            
            h.insertRoom(room);
            response.sendRedirect("housemanager?action=roomlist");
        }

    }

    private String uploadImage(String param, HttpServletRequest request) {
        String uploadPath = getServletContext().getRealPath("") + File.separator + "assets/img/imgproduct";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String filename;
        try {
            Part part = request.getPart(param);
            filename = part.getSubmittedFileName();
            if (filename.isEmpty()) {
                return null;
            }
            String uniname = UUID.randomUUID() + "_" + filename;
            part.write(uploadPath + File.separator + uniname);
            return uniname;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default.jpg";
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
