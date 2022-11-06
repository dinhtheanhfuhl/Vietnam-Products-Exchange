package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.SubCategoryDAO;
import dbconnect.DBConnect;
import entity.Category;
import entity.SubCategory;
import java.io.IOException;
import java.sql.Connection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ModeratorCategoryController", urlPatterns = {"/ModeratorCategoryController"})
public class ModeratorCategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection connection = DBConnect.getConnection();
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        SubCategoryDAO subCategoryDAO = new SubCategoryDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);

        List<Category> allCategorys = categoryDAO.getAllCategory();
        Map<Category, List<SubCategory>> mapSubcategorys = new LinkedHashMap<Category, List<SubCategory>>();
        Map<SubCategory, Boolean> mapSubcategoryStatus = new LinkedHashMap<SubCategory, Boolean>();

        for (Category category : allCategorys) {
            List<SubCategory> subCategorys = subCategoryDAO.getSubcategoryByCategoryId(category.getCateId());
            mapSubcategorys.put(category, subCategorys);
        }
        for (Category category : mapSubcategorys.keySet()) {
            for (SubCategory subCategory : mapSubcategorys.get(category)) {
                int statsus = productDAO.getProductsBySubCateId(subCategory.getSubCateId());
                if (statsus == 1) {
                    mapSubcategoryStatus.put(subCategory, Boolean.TRUE);
                } else if (statsus == 0) {
                    mapSubcategoryStatus.put(subCategory, Boolean.FALSE);
                }
            }
        }
        request.setAttribute("mapSubcategorys", mapSubcategorys);
        request.setAttribute("mapSubcategoryStatus", mapSubcategoryStatus);
        RequestDispatcher rd = request.getRequestDispatcher("admin-page/moderator-category.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
