package controller;

import dao.ProductDAO;
import dbconnect.DBConnect;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
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
        
        List<Product> allProducts = productDAO.getAllProduct();
        List<Product> resultProducts = new ArrayList<>();
        
        String action = request.getParameter("action");
        
        if(action == null){
            resultProducts = allProducts;
        }else if(action.equals("search")){
            // 
        }
        
        request.setAttribute("resultProducts", resultProducts);
        
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
