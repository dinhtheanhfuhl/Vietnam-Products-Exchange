package controller;

import dao.DeliveryAreaDAO;
import dao.ProductDAO;
import dbconnect.DBConnect;
import entity.Product;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ModeratorDetailProductController", urlPatterns = {"/ModeratorDetailProductController"})
public class ModeratorDetailProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String action = request.getParameter("action");

        Connection connection = DBConnect.getConnection();
        ProductDAO productDAO = new ProductDAO(connection);

        if (action == null) {
            Product product = productDAO.getProductById(Integer.parseInt(id));
            request.setAttribute("product", product);
        } else if (action.equals("accept")) {
            Product product = productDAO.getProductById(Integer.parseInt(id));
            product.setStatusId(2);
            int flag = productDAO.updateProduct(product);
            request.setAttribute("product", product);
        } else if (action.equals("reject")) {
            Product product = productDAO.getProductById(Integer.parseInt(id));
            product.setStatusId(3);
            int flag = productDAO.updateProduct(product);
            request.setAttribute("product", product);
        }
        RequestDispatcher rd = request.getRequestDispatcher("admin-page/moderator-product-detail.jsp");
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
