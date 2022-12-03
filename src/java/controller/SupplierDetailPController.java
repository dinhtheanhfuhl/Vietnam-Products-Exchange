/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.CityDAO;
import dao.DeliveryAreaDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dao.ProductImageDAO;
import dao.SubCategoryDAO;
import entity.Category;
import entity.City;
import entity.DeliveryArea;
import entity.Product;
import entity.ProductHierarchy;
import entity.ProductImage;
import entity.SubCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DEKUPAC
 */
@WebServlet(name = "SupplierDetailPController", urlPatterns = {"/SupplierDetailPController"})
public class SupplierDetailPController extends HttpServlet {

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

        Connection conn = dbconnect.DBConnect.getConnection();
        ProductDAO productDAO = new ProductDAO(conn);
        ProductHierarchyDAO proHieDAO = new ProductHierarchyDAO(conn);
        ProductImageDAO proImgDAO = new ProductImageDAO(conn);
        DeliveryAreaDAO deliDAO = new DeliveryAreaDAO(conn);
        CityDAO cityDAO = new CityDAO(conn);
        CategoryDAO cateDAO = new CategoryDAO(conn);
        SubCategoryDAO subcateDAO = new SubCategoryDAO(conn);

        String action = request.getParameter("action");
        if (action == null || action.equals("")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(id);
            List<ProductHierarchy> listProHies = proHieDAO.getProductHierachiesByProId(id);
            List<ProductImage> listProImgs = proImgDAO.getAllProductsImageByProId(id);
            List<DeliveryArea> listDelivery = deliDAO.getDeliverysAreaByProductId(id);
            List<City> listCities = new ArrayList<>();
            SubCategory subCate = subcateDAO.getSubCategoryById(product.getSubCateId());
            Category cate = cateDAO.getCategoryById(subCate.getCateId());
            for (DeliveryArea deliveryArea : listDelivery) {
                City city = cityDAO.getCityById(deliveryArea.getCityId());
                listCities.add(city);
            }

            request.setAttribute("listProHies", listProHies);
            request.setAttribute("listProImgs", listProImgs);
            request.setAttribute("listCities", listCities);
            request.setAttribute("cate", cate);
            request.setAttribute("product", product);
            request.getRequestDispatcher("admin-page/supplier-product-detail.jsp").forward(request, response);

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
