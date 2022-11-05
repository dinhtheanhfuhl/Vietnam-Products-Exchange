package controller;

import dao.ProductDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.City;
import entity.Product;
import entity.Supplier;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ModeratorController", urlPatterns = {"/ModeratorController"})
public class ModeratorController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection connection = DBConnect.getConnection();
        ProductDAO productDAO = new ProductDAO(connection);
        SupplierDAO supplierDAO = new SupplierDAO(connection);
        
        List<Product> allProducts = productDAO.getAllProduct();
        List<Product> resultProducts = new ArrayList<>();
        Map<Product, Supplier> mapProductSupplier = new LinkedHashMap<>();
        Map<Product, List<City>> mapProductCities = new LinkedHashMap<>();
        
        String action = request.getParameter("action");
        
        if(action == null){
            resultProducts = allProducts;
            for (Product product : resultProducts) {
                Supplier supplier = supplierDAO.getSupplierById(product.getSupplierId());
                mapProductSupplier.put(product, supplier);
            }
        }else if(action.equals("search")){
            // 
        }
        
        request.setAttribute("resultProducts", resultProducts);
        request.setAttribute("mapProductSupplier", mapProductSupplier);
        
        RequestDispatcher rd = request.getRequestDispatcher("admin-page/moderator-list-product.jsp");
        rd.forward(request, response);
        
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
