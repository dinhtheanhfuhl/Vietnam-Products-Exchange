/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dao.ProductImageDAO;
import dao.SubCategoryDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.Category;
import entity.Product;
import entity.ProductHierarchy;
import entity.ProductImage;
import entity.SubCategory;
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
public class MinimartDetailProductController extends HttpServlet {

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
        SubCategoryDAO subCateDAO = new SubCategoryDAO(connection);
        SupplierDAO supplierDAO = new SupplierDAO(connection);
        ProductImageDAO productImageDAO = new ProductImageDAO(connection);
        ProductHierarchyDAO proHieDAO = new ProductHierarchyDAO(connection);
        
        String id = request.getParameter("pid");
        int productId = Integer.parseInt(id);
        
        Product product = productDAO.getProductByProductId(id);
        request.setAttribute("product", product);
        
        List<Product> listProduct = productDAO.getListProductByProductId(id);
        request.setAttribute("listProduct", listProduct);

        Supplier supplier = supplierDAO.getSupplierByProId(id);
        request.setAttribute("supplier", supplier);
        
        SubCategory subcate = subCateDAO.getSubCategoryNameByProductId(id);
        request.setAttribute("subcate", subcate);

        List<Product> listProBySubCateId = productDAO.getAllProductBySubCateID(subcate.getSubCateId());
        request.setAttribute("listProBySubCateId", listProBySubCateId);
        
        Map<Product, List<ProductImage>> mapImages = new LinkedHashMap<Product, List<ProductImage>>();
        for (Product p : listProBySubCateId) {
            List<ProductImage> images = productImageDAO.getAllProductsImageByProId(p.getProductId());
            mapImages.put(p, images);
        }
        request.setAttribute("mapImages", mapImages);
        
        List<Category> allCate = categoryDAO.getAllCategory();
        request.setAttribute("listCate", allCate);
        int viewNumber = product.getViewNumber()+1;
        productDAO.updateViewProduct(viewNumber,id);
        
        List<ProductHierarchy> listHierarchyByProId = proHieDAO.getHierarchyByProId(productId);
        for (int i = 0; i < listHierarchyByProId.size(); i++) {
                int min = listHierarchyByProId.get(0).getQuantity();
                request.setAttribute("min", min);
                int medium = listHierarchyByProId.get(1).getQuantity();
                request.setAttribute("medium", medium);
                int max = listHierarchyByProId.get(2).getQuantity();
                request.setAttribute("max", max);
                int priceMin = listHierarchyByProId.get(2).getPrice();
                request.setAttribute("priceMin", priceMin);
                int priceMedium = listHierarchyByProId.get(1).getPrice();
                request.setAttribute("priceMedium", priceMedium);
                int priceMax = listHierarchyByProId.get(0).getPrice();
                request.setAttribute("priceMax", priceMax);
            }
        
        request.getRequestDispatcher("./common/productdetail.jsp").forward(request, response);
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
