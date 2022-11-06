package controller;

import dao.CategoryDAO;
import dao.SubCategoryDAO;
import dbconnect.DBConnect;
import entity.Category;
import entity.SubCategory;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ModeratorAddSubCateController", urlPatterns = {"/ModeratorAddSubCateController"})
public class ModeratorAddSubCateController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = DBConnect.getConnection();
        String action = request.getParameter("action");
        if (action.equals("show")) {
            CategoryDAO categoryDAO = new CategoryDAO(connection);
            List<Category> allCategories = categoryDAO.getAllCategory();
            request.setAttribute("allCategories", allCategories);
            RequestDispatcher rd = request.getRequestDispatcher("admin-page/moderator-add-subcate.jsp");
            rd.forward(request, response);

        } else if (action.equals("add")) {
            SubCategoryDAO subCategoryDAO = new SubCategoryDAO(connection);
            String nameSubCate = request.getParameter("name");
            String idCate = request.getParameter("id");
            SubCategory subCategory = new SubCategory();
            subCategory.setCateId(Integer.parseInt(idCate));
            subCategory.setSubCateName(nameSubCate);
            int status = subCategoryDAO.saveSubCategory(subCategory);
            RequestDispatcher rd = request.getRequestDispatcher("ModeratorCategoryController");
            rd.forward(request, response);
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
