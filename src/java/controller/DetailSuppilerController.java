package controller;

import dao.AccountDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.Account;
import entity.Supplier;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DetailSuppilerController", urlPatterns = {"/DetailSuppilerController"})
public class DetailSuppilerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = DBConnect.getConnection();
        SupplierDAO supplierDAO = new SupplierDAO(connection);
        AccountDAO accountDAO = new AccountDAO(connection);

        String action = request.getParameter("action");
        if (action.equals("accept-account")) {
            String accId = request.getParameter("acc-id");
            String supId = request.getParameter("sup-id");
            Account account = accountDAO.getAccountById(Integer.parseInt(accId));
            account.setStatus(true);
            int statusUpdate = accountDAO.updateAccount(account);
            Supplier supplier = supplierDAO.getSupplierById(Integer.parseInt(supId));
            Account account1 = accountDAO.getAccountById(supplier.getAccId());
            request.setAttribute("supplier", supplier);
            request.setAttribute("account", account1);
            RequestDispatcher rd = request.getRequestDispatcher("admin-page/admin-view-detail-supplier.jsp");
            rd.forward(request, response);

        } else {
            String id = request.getParameter("id");

            Supplier supplier = supplierDAO.getSupplierById(Integer.parseInt(id));
            Account account = accountDAO.getAccountById(supplier.getAccId());

            request.setAttribute("supplier", supplier);
            request.setAttribute("account", account);
            RequestDispatcher rd = request.getRequestDispatcher("admin-page/admin-view-detail-supplier.jsp");
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
