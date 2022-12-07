/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import dao.CartItemDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import dbconnect.DBConnect;
import entity.CartItem;
import entity.Category;
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
public class AddToCartController extends HttpServlet {

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
        CartItemDAO cartItemDAO = new CartItemDAO(connection);
        CartDAO cartDAO = new CartDAO(connection);
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);
        List<Category> allCate = categoryDAO.getAllCategory();
        String id = request.getParameter("pid");
        Product product = productDAO.getProductByProductId(id);

        int productid = Integer.parseInt(request.getParameter("proId"));
        String amountstr = request.getParameter("amount");
        int amount = Integer.parseInt(amountstr);

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        int customerid = customer.getCustomerId();
        int cartId = cartDAO.getCartIdByCustomerId(customerid);

        CartItem cartItem = cartItemDAO.getCartItemByProductId(productid, cartId);
//        if (amount + cartItem.getAmount() > product.getWeight()) {
//
//        }
        if (amount > product.getWeight()) {
            request.setAttribute("message", "Bạn đã nhập quá trọng lượng sản phẩm có trong kho");
            request.setAttribute("alert", "danger");
            request.setAttribute("icon", "exclamation-triangle");
            request.setAttribute("product", product);
            request.setAttribute("listCate", allCate);
            request.getRequestDispatcher("MimartDetailProduct").forward(request, response);
        } else {
            if (cartItem == null) {
                cartItemDAO.insertCartItem(cartId, productid, amount);
                request.setAttribute("message", "Sản phẩm đã được thêm vào giỏ hàng");
                request.setAttribute("icon", "shopping-cart");
                request.setAttribute("alert", "success");
            } else {
                amount = amount + cartItem.getAmount();
                cartItemDAO.updateAmount(amount, cartId, productid);
                request.setAttribute("message", "Sản phẩm đã được thêm vào giỏ hàng");
                request.setAttribute("icon", "shopping-cart");
                request.setAttribute("alert", "success");
            }
            request.setAttribute("product", product);
            request.setAttribute("listCate", allCate);
            request.getRequestDispatcher("MimartDetailProduct").forward(request, response);
        }

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
