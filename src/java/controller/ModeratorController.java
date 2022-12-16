package controller;

import dao.CityDAO;
import dao.DeliveryAreaDAO;
import dao.ProductDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.Product;
import entity.Supplier;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ModeratorController", urlPatterns = {"/ModeratorController"})
public class ModeratorController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 2) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        
        request.setCharacterEncoding("UTF-8");
        
        Connection connection = DBConnect.getConnection();
        ProductDAO productDAO = new ProductDAO(connection);
        SupplierDAO supplierDAO = new SupplierDAO(connection);
        CityDAO cityDAO = new CityDAO(connection);
        DeliveryAreaDAO deliveryAreaDAO = new DeliveryAreaDAO(connection);

        List<Product> resultProducts = new ArrayList<>();
        String action = request.getParameter("action");
        String statusFilter = request.getParameter("filter");

        if (action == null) {
            resultProducts = productDAO.searchProduct(null, null, null, null, statusFilter);
            request.setAttribute("statusFilter", statusFilter);
        } else if (action.equals("search")) {
            String id = request.getParameter("id").trim();
            String shopName = request.getParameter("shopName").trim();
            String name = request.getParameter("name").trim();
            String barCode = request.getParameter("barCode").trim();

            request.setAttribute("ACTION", "search");
            request.setAttribute("id", id);
            request.setAttribute("shopName", shopName);
            request.setAttribute("name", name);
            request.setAttribute("barCode", barCode);
            request.setAttribute("statusFilter", statusFilter);

            resultProducts = productDAO.searchProduct(id, shopName, name, barCode, statusFilter);
        }

        Map<Product, Supplier> mapProSupp = new LinkedHashMap<>();
        for (Product p : resultProducts) {
            Supplier s = supplierDAO.getSupplierById(p.getSupplierId());
            mapProSupp.put(p, s);
        }

        request.setAttribute("resultProducts", resultProducts);
        request.setAttribute("mapProSupp", mapProSupp);
        request.getRequestDispatcher("admin-page/moderator-list-product.jsp").forward(request, response);
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
