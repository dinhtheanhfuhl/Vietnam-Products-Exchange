/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartItemDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dbconnect.DBConnect;
import entity.CartItem;
import entity.Category;
import entity.Customer;
import entity.Product;
import entity.ProductHierarchy;
import java.io.IOException;
import java.sql.Connection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ductd
 */
public class CheckOutController extends HttpServlet {

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
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        ProductHierarchyDAO proHieDAO = new ProductHierarchyDAO(connection);
        CartItemDAO cartItemDAO = new CartItemDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        int customerid = customer.getCustomerId();

        List<CartItem> allCart = cartItemDAO.getAllCartItemsByCustomertId(customerid);
        request.setAttribute("allCart", allCart);

        Map<CartItem, Boolean> mapCartItemStatus = new LinkedHashMap<>();
        Map<CartItem, ProductHierarchy> mapProHie = new LinkedHashMap<>();
        long totalCart = 0;
        for (CartItem cart : allCart) {
            List<ProductHierarchy> listProhie = proHieDAO.getHierarchyByProId(cart.getProductId());
            int amount = cart.getAmount();
            ProductHierarchy proHierachy = null;
            for (int i = 0; i < listProhie.size(); i++) {
                if (i > 0 && amount < listProhie.get(i).getQuantity()) {
                    proHierachy = listProhie.get(i - 1);
                    break;
                }
            }
            if (proHierachy == null) {
                proHierachy = listProhie.get(listProhie.size() - 1);
            }
            mapProHie.put(cart, proHierachy);

            Product product = productDAO.getProductById(cart.getProductId());
            boolean flag = true;
            if (cart.getAmount() > product.getWeight()) {
                flag = false;
            } else {
                totalCart += (long) amount * (long) proHierachy.getPrice();
            }
            mapCartItemStatus.put(cart, flag);
            request.setAttribute("mapCartItemStatus", mapCartItemStatus);

            request.setAttribute("mapProHie", mapProHie);
            
        }
        request.setAttribute("totalCart", totalCart);

        List<Category> allCate = categoryDAO.getAllCategory();
        request.setAttribute("listCate", allCate);
        request.getRequestDispatcher("./common/payment.jsp").forward(request, response);
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
