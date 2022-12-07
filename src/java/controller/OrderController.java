/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import dao.CartItemDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import dbconnect.DBConnect;
import entity.CartItem;
import entity.Customer;
import entity.Product;
import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
        request.setCharacterEncoding("UTF-8");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        Connection connection = DBConnect.getConnection();
        OrderDAO orderDAO = new OrderDAO(connection);
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO(connection);
        CartItemDAO cartItemDAO = new CartItemDAO(connection);
        CartDAO cartDAO = new CartDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        int customerid = customer.getCustomerId();
        int cartId = cartDAO.getCartIdByCustomerId(customerid);

        int productPrice = Integer.parseInt(request.getParameter("totalprice"));
        List<CartItem> listCart = cartItemDAO.getAllCartItemsByCustomertId(customerid);
        CartItem cartItem = null;
        for (int i = 0; i < listCart.size(); i++) {
            cartItem = listCart.get(i);
            int cartAmount = cartItem.getAmount();
            int productId = cartItem.getProductId();
            Product p = productDAO.getProductById(productId);
            productDAO.updateAmountByProId(p.getWeight() - cartAmount, productId);
            //orderDetailDAO.insertOrderDetail(cartId, productId, dtf.format(now), cartAmount, productPrice);
            
            System.out.println(productId);
            System.out.println(dtf.format(now));
            System.out.println(cartAmount);
            System.out.println(productPrice);
            //orderId - proId - orderDate - amount moi san pham - cost moi san pham
        }

        cartItemDAO.deleteCartByCartId(cartId);

        String receiverName = request.getParameter("receiverName");
        String receiverAddress = request.getParameter("receiverAddress");
        String receiverPhone = request.getParameter("receiverPhone");
        int totalPrice = Integer.parseInt(request.getParameter("totalprice"));
        String note = request.getParameter("note");

        orderDAO.insertOrder(customerid, receiverName, receiverAddress, receiverPhone, totalPrice, 1, note);
        request.getRequestDispatcher("HistoryOrderController").forward(request, response);

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
