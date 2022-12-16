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
import javax.servlet.http.HttpSession;

@WebServlet(name = "ModeratorAddSubCateController", urlPatterns = {"/ModeratorAddSubCateController"})
public class ModeratorAddSubCateController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 2) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        request.setCharacterEncoding("UTF-8");
        Connection connection = DBConnect.getConnection();
        String action = request.getParameter("action");
        if (action.equals("show") || action == null) {
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
            response.sendRedirect("ModeratorCategoryController");
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
