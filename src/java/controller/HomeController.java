/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dao.ProductImageDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.Category;
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

/**
 *
 * @author ductd
 */
public class HomeController extends HttpServlet {

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
        ProductImageDAO productImageDAO = new ProductImageDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);
        SupplierDAO supplierDAO = new SupplierDAO(connection);
        List<Product> getTop4 = productDAO.getTop4ProductOrderByView();
        
        Map<Product, List<ProductImage>> mapImages = new LinkedHashMap<>();
        for (Product product : getTop4) {
            List<ProductImage> images = productImageDAO.getAllProductsImageByProId(product.getProductId());
            mapImages.put(product, images);
        }
        Map<Product, List<Supplier>> mapSuppliers = new LinkedHashMap<>();
        for (Product product : getTop4) {
            List<Supplier> supplier = supplierDAO.getSupplierByProId(product.getProductId());
            mapSuppliers.put(product, supplier);
        }
        List<Product> getTop4Newest = productDAO.getTop4ProductNewest();
        Map<Product, List<ProductImage>> mapImages2 = new LinkedHashMap<>();
        for (Product product : getTop4Newest) {
            List<ProductImage> images = productImageDAO.getAllProductsImageByProId(product.getProductId());
            mapImages2.put(product, images);
        }
        Map<Product, List<Supplier>> mapSuppliers2 = new LinkedHashMap<>();
        for (Product product : getTop4Newest) {
            List<Supplier> supplier = supplierDAO.getSupplierByProId(product.getProductId());
            mapSuppliers2.put(product, supplier);
        }
        request.setAttribute("mapImages", mapImages);
        request.setAttribute("mapSuppliers", mapSuppliers);
        request.setAttribute("mapImages2", mapImages2);
        request.setAttribute("mapSupplier2", mapSuppliers2);
        List<Category> allCate = categoryDAO.getAllCategory();
        request.setAttribute("listCate", allCate);
        request.getRequestDispatcher("./common/home.jsp").forward(request, response);
        
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
