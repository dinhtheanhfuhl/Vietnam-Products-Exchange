/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import dao.ProductImageDAO;
import dbconnect.DBConnect;
import entity.Category;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import entity.ProductImage;
import java.io.IOException;
import java.sql.Connection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ductd
 */
public class HistoryOrderDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection connection = DBConnect.getConnection();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO(connection);
        OrderDAO orderDAO = new OrderDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);
        ProductImageDAO productImageDAO = new ProductImageDAO(connection);
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        
        List<Category> allCate = categoryDAO.getAllCategory();
        request.setAttribute("listCate", allCate);
        
        int orderId = Integer.parseInt(request.getParameter("oid"));
        OrderDetail orderDetail = orderDetailDAO.getOrderDetailByOrderId(orderId);
        request.setAttribute("orderDetail", orderDetail);
        
        Order order = orderDAO.getOrderById(orderId);
        request.setAttribute("order", order);
        
        List<OrderDetail> listProInOrder = orderDetailDAO.getAllOrderDetailsByOrderId(orderId);
        Map<OrderDetail, List<Product>> mapProduct = new LinkedHashMap<OrderDetail, List<Product>>();
        for (OrderDetail o : listProInOrder) {
            List<Product> product = productDAO.getAllProductsProductID(o.getProductId());
            mapProduct.put(o, product);
        }
        request.setAttribute("mapProduct", mapProduct);
        
        Map<OrderDetail, List<ProductImage>> mapImage = new LinkedHashMap<OrderDetail, List<ProductImage>>();
        for (OrderDetail o : listProInOrder) {
            List<ProductImage> image = productImageDAO.getAllProductsImageByProId(o.getProductId());
            mapImage.put(o, image);
        }
        request.setAttribute("mapImage", mapImage);
        
        request.getRequestDispatcher("./common/customer-detail-order.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
