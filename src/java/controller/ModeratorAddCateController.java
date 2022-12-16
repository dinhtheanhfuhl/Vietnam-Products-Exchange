package controller;

import dao.CategoryDAO;
import dbconnect.DBConnect;
import entity.Category;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ModeratorAddCateController", urlPatterns = {"/ModeratorAddCateController"})
public class ModeratorAddCateController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 2) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action.equals("show") || action == null) {
            RequestDispatcher rd = request.getRequestDispatcher("admin-page/moderator-add-cate.jsp");
            rd.forward(request, response);

        } else if (action.equals("add")) {
            Connection connection = DBConnect.getConnection();
            CategoryDAO categoryDAO = new CategoryDAO(connection);
            String name = request.getParameter("name");
            Category category = new Category();
            category.setCateName(name);
            int status = categoryDAO.saveCategory(category);
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
