package controller;

import dao.CustomerDAO;
import entity.Customer;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author DEKUPAC
 */
@MultipartConfig
@WebServlet(name = "MiniMartChangeInfoController", urlPatterns = {"/MiniMartChangeInfoController"})
public class MiniMartChangeInfoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        Connection conn = dbconnect.DBConnect.getConnection();
        CustomerDAO cusDAO = new CustomerDAO(conn);

        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("common/customer-edit-info.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            String phone = request.getParameter("phone");
            String shopName = request.getParameter("shopName");
            String address = request.getParameter("address");
            Part file = request.getPart("file");
            Customer cus = (Customer) session.getAttribute("customer");

            String realPath = request.getServletContext().getRealPath("/uploads");
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            if (!file.getSubmittedFileName().equals("")) {
                String fileName = file.getSubmittedFileName();
                int indexDot = fileName.indexOf(".");
                fileName = new SimpleDateFormat("ddMMyyyyHHss").format(new Date()) + fileName.substring(indexDot, fileName.length());
                if (cus.getBusinessLicense() != null && !cus.getBusinessLicense().equals("")) {
                    if (Files.exists(Paths.get(cus.getBusinessLicense()))) {
                        Files.delete(Paths.get(cus.getBusinessLicense()));
                    }
                }
                file.write(realPath + "/" + fileName);
                cus.setBusinessLicense(fileName);
            }
            cus.setPhone(phone);
            cus.setShopName(shopName);
            cus.setMainAddress(address);
            if (cusDAO.updateCustomer(cus) > 0) {
                session.removeAttribute("customer");
                session.setAttribute("customer", cus);
                response.sendRedirect("CustomerInfoDetail");
            } else {
                request.getRequestDispatcher("common/error.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
