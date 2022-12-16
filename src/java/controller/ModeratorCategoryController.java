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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ModeratorCategoryController", urlPatterns = {"/ModeratorCategoryController"})
public class ModeratorCategoryController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 2) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        request.setCharacterEncoding("UTF-8");

        Connection connection = DBConnect.getConnection();
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        SubCategoryDAO subCategoryDAO = new SubCategoryDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);

        List<Category> allCategorys = categoryDAO.getAllCategory();
        Map<Category, List<SubCategory>> mapSubcategorys = new LinkedHashMap<Category, List<SubCategory>>();
        Map<SubCategory, Boolean> mapSubcategoryStatus = new LinkedHashMap<SubCategory, Boolean>();

        String action = request.getParameter("action");
        if (action == null || action.equals("")) {
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
            request.getRequestDispatcher("admin-page/moderator-category.jsp").forward(request, response);;
        }else if(action.equals("delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            SubCategory subCate = subCategoryDAO.getSubCategoryById(id);
            int status = subCategoryDAO.deleteSubCategory(subCate);
            if(status > 0){
                response.sendRedirect("ModeratorCategoryController");
            }
        }
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
