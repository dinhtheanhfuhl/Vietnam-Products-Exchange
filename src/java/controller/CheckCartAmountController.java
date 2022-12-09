/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartItemDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dbconnect.DBConnect;
import entity.Product;
import entity.ProductHierarchy;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ductd
 */
public class CheckCartAmountController extends HttpServlet {

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
        ProductDAO productDAO = new ProductDAO(connection);
        ProductHierarchyDAO proHieDAO = new ProductHierarchyDAO(connection);
        CartItemDAO cartItemDAO = new CartItemDAO(connection);
        
        String cartAmountStr = request.getParameter("amount");
        int cartAmount = Integer.parseInt(cartAmountStr);
        int producId = Integer.parseInt(request.getParameter("cartProducId"));
        System.out.println("proId: " + producId);
        Product p = productDAO.getProductById(producId);
        System.out.println("weight: " + p.getWeight());

        List<ProductHierarchy> listProhie = proHieDAO.getHierarchyByProId(producId);
        System.out.println("minquan: ");
        System.out.println(listProhie.get(0).getQuantity());
        if (cartAmount > p.getWeight()) {
            System.out.println("khong du so luong");
            request.setAttribute("message", "Số lượng sản phẩm trong kho chỉ còn:");
            request.setAttribute("AmountInStore", p.getWeight());
            request.setAttribute("icon", "exclamation-triangle");
            request.setAttribute("alert", "warning");
            request.getRequestDispatcher("CartController").forward(request, response);
        } else if (cartAmount < listProhie.get(0).getQuantity()) {
            System.out.println("nho hon so luong cho phep");
            request.setAttribute("message", "Nhỏ hơn số lượng tối thiểu cho phép mua là:");
            request.setAttribute("AmountInStore", listProhie.get(0).getQuantity());
            request.setAttribute("icon", "exclamation-triangle");
            request.setAttribute("alert", "warning");
            request.getRequestDispatcher("CartController").forward(request, response);

        } else {
            cartItemDAO.updateCartItemAmountByProId(cartAmount, producId);
            System.out.println("thoa man");
            request.getRequestDispatcher("CartController").forward(request, response);
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
