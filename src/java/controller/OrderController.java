/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartItemDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dbconnect.DBConnect;
import entity.CartItem;
import entity.Customer;
import entity.Product;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ductd
 */
public class OrderController extends HttpServlet {

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
        OrderDAO orderDAO = new OrderDAO(connection);
        CartItemDAO cartItemDAO = new CartItemDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");

        int customerid = customer.getCustomerId();
        List<CartItem> listCart = cartItemDAO.getAllCartItemsByCustomertId(customerid);
        //List<Product> listPro = productDAO.getAllProduct;
        CartItem cartItem = null;
        for (int i = 0; i < listCart.size(); i++) {
            cartItem = listCart.get(i);
            int cartAmount = cartItem.getAmount();
            //int newCartAmount = cartAmount - 
            int productId = cartItem.getProductId();
          
            productDAO.updateAmountByProId(cartAmount, productId);
        }
        
        
        
        
        String receiverName = request.getParameter("receiverName");
        String receiverAddress = request.getParameter("receiverAddress");
        String receiverPhone = request.getParameter("receiverPhone");
        int totalPrice = 1;
        String note = request.getParameter("note");
        orderDAO.insertOrder(customerid, receiverName, receiverAddress, receiverPhone, totalPrice, 1, note);
        request.getRequestDispatcher("CartController").forward(request, response);

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
