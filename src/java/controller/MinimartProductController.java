/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.CityDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dao.ProductImageDAO;
import dao.SubCategoryDAO;
import dbconnect.DBConnect;
import entity.Category;
import entity.City;
import entity.Product;
import entity.ProductHierarchy;
import entity.ProductImage;
import entity.SubCategory;
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
public class MinimartProductController extends HttpServlet {

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
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        ProductImageDAO productImageDAO = new ProductImageDAO(connection);
        SubCategoryDAO subcategoryDAO = new SubCategoryDAO(connection);
        CityDAO cityDAO = new CityDAO(connection);
        ProductHierarchyDAO productHierarchyDAO = new ProductHierarchyDAO(connection);
        
        String id = request.getParameter("cid");
        List<Product> getAllProductsbyCateId = productDAO.getAllProductsByCateID(id);
        
        Map<Product, List<ProductImage>> mapImages = new LinkedHashMap<>();
        for (Product product : getAllProductsbyCateId) {
            List<ProductImage> images = productImageDAO.getAllProductsImageByProId(product.getProductId());
            mapImages.put(product, images);
        }
        
        Map<Product, List<ProductHierarchy>> mapHierarchy = new LinkedHashMap<>();
        for (Product product : getAllProductsbyCateId) {
            List<ProductHierarchy> hierarchy = productHierarchyDAO.getAllHieByProId(product.getProductId());
            mapHierarchy.put(product, hierarchy);
        }
        
        Map<Product, List<City>> mapCity = new LinkedHashMap<>();
        for (Product product : getAllProductsbyCateId) {
            List<City> city = cityDAO.getCitiesByProductId(product.getProductId());
            mapCity.put(product, city);
        }
        
        request.setAttribute("mapImages", mapImages);
        request.setAttribute("mapHierarchy", mapHierarchy);
        request.setAttribute("mapCity", mapCity);
        
        List<Category> allCate = categoryDAO.getAllCategory();
        request.setAttribute("listCate", allCate);
        
        List<City> allCities = cityDAO.getAllCity();
        request.setAttribute("allCities", allCities);
        
        List<SubCategory> allSubCategory = subcategoryDAO.getAllSubCateByCateId(id);
        request.setAttribute("allSubCategory", allSubCategory);
        
        request.getRequestDispatcher("./common/fruit.jsp").forward(request, response);

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
