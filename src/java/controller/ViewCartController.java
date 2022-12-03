/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import dao.CartItemDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dao.ProductImageDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.CartItem;
import entity.Category;
import entity.Customer;
import entity.Product;
import entity.ProductHierarchy;
import entity.ProductImage;
import entity.Supplier;
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
public class ViewCartController extends HttpServlet {

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
        CartItemDAO cartItemDAO = new CartItemDAO(connection);
        SupplierDAO supplierDAO = new SupplierDAO(connection);
        ProductHierarchyDAO proHieDAO = new ProductHierarchyDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);
        ProductImageDAO productImageDAO = new ProductImageDAO(connection);

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        int customerid = customer.getCustomerId();

        List<CartItem> allCart = cartItemDAO.getAllCartItemsByCustomertId(customerid);
        request.setAttribute("allCart", allCart);

        List<Category> allCate = categoryDAO.getAllCategory();
        request.setAttribute("listCate", allCate);

        Map<CartItem, List<ProductImage>> mapImages = new LinkedHashMap<CartItem, List<ProductImage>>();
        for (CartItem cart : allCart) {
            List<ProductImage> images = productImageDAO.getAllProductsImageByProId(cart.getProductId());
            mapImages.put(cart, images);
        }
        request.setAttribute("mapImages", mapImages);

        Map<CartItem, List<Product>> mapProduct = new LinkedHashMap<CartItem, List<Product>>();
        for (CartItem cart : allCart) {
            List<Product> products = productDAO.getAllProductsProductID(cart.getProductId());
            mapProduct.put(cart, products);
        }
        request.setAttribute("mapProduct", mapProduct);

        Map<CartItem, List<Supplier>> mapSupplier = new LinkedHashMap<CartItem, List<Supplier>>();
        for (CartItem cart : allCart) {
            List<Supplier> supplier = supplierDAO.getSupplierByProId(cart.getProductId());
            mapSupplier.put(cart, supplier);
        }
        request.setAttribute("mapSupplier", mapSupplier);

        Map<CartItem, Integer> mapProHie = new LinkedHashMap<>();
        int totalCart = 0;
        for (CartItem cart : allCart) {
            List<ProductHierarchy> listProhie = proHieDAO.getHierarchyByProId(cart.getProductId());
            int amount = cart.getAmount();
            ProductHierarchy proHierachy = null;
            for (int i = 0; i < listProhie.size(); i++) {
                if (amount <= listProhie.get(i).getQuantity()) {
                    proHierachy = listProhie.get(i);
                    break;
                }
            }
            if (proHierachy == null) {
                proHierachy = listProhie.get(listProhie.size() - 1);
            }
            int totalMoney = amount * proHierachy.getPrice();
            mapProHie.put(cart, totalMoney);

            totalCart += totalMoney;
            request.setAttribute("mapProHie", mapProHie);
        }
        request.setAttribute("totalCart", totalCart);
        request.getRequestDispatcher("ViewCart.jsp").forward(request, response);
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
