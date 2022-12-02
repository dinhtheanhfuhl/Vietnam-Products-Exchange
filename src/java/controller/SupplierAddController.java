/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.CityDAO;
import dao.SubCategoryDAO;
import entity.Category;
import entity.City;
import entity.Product;
import entity.SubCategory;
import entity.Supplier;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DEKUPAC
 */
@WebServlet(name = "SupplierAddController", urlPatterns = {"/SupplierAddController"})
public class SupplierAddController extends HttpServlet {

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
        HttpSession session = request.getSession();
        Supplier supplier = (Supplier) session.getAttribute("supplier");
        int supplierId = supplier.getSupplierId();
        
        String action = request.getParameter("action");
        Connection conn = dbconnect.DBConnect.getConnection();
        CityDAO cityDAO = new CityDAO(conn);
        CategoryDAO cateDAO = new CategoryDAO(conn);
        SubCategoryDAO subCateDAO = new SubCategoryDAO(conn);
        
        List<City> allCities = cityDAO.getAllCity();
        List<Category> allCates = cateDAO.getAllCategory();
        
        Map<Category, List<SubCategory>> mapCateSubCate = new LinkedHashMap<>();
        
        for (Category c : allCates) {
            List<SubCategory> subCategorys = subCateDAO.getSubcategoryByCategoryId(c.getCateId());
            mapCateSubCate.put(c, subCategorys);
        }
        
        if (action == null || action.equals("")) {
            request.setAttribute("allCities", allCities);
            request.setAttribute("mapCateSubCate", mapCateSubCate);
            request.getRequestDispatcher("admin-page/supplier-add-product.jsp").forward(request, response);
            
        }else if(action.equals("add")){
            // add file anh va file giay phep vao uploads
            
            
            // add nhung field la field form
            String description = request.getParameter("description");
            String barcode = request.getParameter("barcode");
            String subCate = request.getParameter("category");
            String[] cities = request.getParameterValues("cities");
            String name = request.getParameter("name");
            String trademark = request.getParameter("trademark");
            String taste = request.getParameter("taste");
            String color = request.getParameter("color");
            String weight = request.getParameter("weight");
            String packaging = request.getParameter("packaging");
            String composition = request.getParameter("composition");
            
            
            String weight1 = request.getParameter("weight1");
            String weight2 = request.getParameter("weight2");
            String weight3 = request.getParameter("weight3");
            String price1 = request.getParameter("price1");
            String price2 = request.getParameter("price2");
            String price3 = request.getParameter("price3");
            
            Product product = new Product();
            product.setSupplierId(supplierId);
            product.setSubCateId(Integer.parseInt(subCate));
            product.setCreatedDate(new Date().toString());
            product.setDescription(description);
            product.setProductName(name);
            product.setBarCode(barcode);
            product.setProductCertificate("de trong");
            product.setTrademark(trademark);
            product.setSmell(taste);
            product.setColor(color);
            product.setWeight(Integer.parseInt(weight));
            product.setPacking(packaging);
            product.setElement(composition);
            product.setViewNumber(0);
            product.setStatusId(1);
            
            
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
