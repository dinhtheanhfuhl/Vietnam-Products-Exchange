package controller;

import dao.AccountDAO;
import dao.CategoryDAO;
import dao.CustomerDAO;
import dao.SupplierDAO;
import dao.SystemManagerDAO;
import dbconnect.DBConnect;
import entity.Account;
import entity.Category;
import entity.Customer;
import entity.Supplier;
import entity.SystemManager;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import security.SecurityPassword;

@WebServlet(name = "LogginController", urlPatterns = {"/LogginController"})
public class LogginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        request.setCharacterEncoding("UTF-8");
        Connection connection = DBConnect.getConnection();
        AccountDAO accountDAO = new AccountDAO(connection);
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        SystemManagerDAO systemManagerDAO = new SystemManagerDAO(connection);

        List<Category> allCate = categoryDAO.getAllCategory();
        request.setAttribute("listCate", allCate);
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("./common/login.jsp").forward(request, response);
        } else if (action.equals("login")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String passwordEnr = SecurityPassword.encrypt(password);
            Account account = accountDAO.getAccountByInfo(email, passwordEnr);
            if (account == null) {
                request.setAttribute("error", "M???t kh???u b???n nh???p kh??ng ch??nh x??c!");
                request.getRequestDispatcher("common/login.jsp").forward(request, response);
                return;
            }
            if (account.getStatus() == 1) {
                request.setAttribute("error", "T??i kho???n c???a b???n ch??a ???????c ph?? duy???t!");
                request.getRequestDispatcher("common/login.jsp").forward(request, response);
                return;
            }
            if (account.getStatus() == 3) {
                request.setAttribute("error", "T??i kho???n c???a b???n b??? kh??ng c?? quy???n truy c???p!");
                request.getRequestDispatcher("common/login.jsp").forward(request, response);
                return;
            }
            HttpSession session = request.getSession();
            session.setAttribute("emailLoggin", email);
            session.setAttribute("passwordLoggin", password);
            session.setAttribute("roleIdLoggin", account.getRoldId());
            switch (account.getRoldId()) {
                case 1:
                    SystemManager systemManager = systemManagerDAO.getSystemManagerByAccId(account.getAccId());
                    session.setAttribute("systemManager", systemManager);
                    response.sendRedirect("AdminController");
                    break;
                case 2:
                    systemManager = systemManagerDAO.getSystemManagerByAccId(account.getAccId());
                    session.setAttribute("systemManager", systemManager);
                    response.sendRedirect("ModeratorController");
                    break;
                case 3:
                    SupplierDAO supDAO = new SupplierDAO(connection);
                    Supplier supplier = supDAO.getSupplierByAccId(account.getAccId());
                    session.setAttribute("supplier", supplier);
                    response.sendRedirect("SupplierController");
                    break;
                case 4:
                    CustomerDAO customerDAO = new CustomerDAO(connection);
                    Customer customer = customerDAO.getCustomerByAccId(account.getAccId());
                    session.setAttribute("nameUser", customer.getCustomerName());
                    session.setAttribute("roleCusId", account.getRoldId());
                    session.setAttribute("customer", customer);
                    response.sendRedirect("Home");
                    break;
                default:
                    break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LogginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LogginController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
