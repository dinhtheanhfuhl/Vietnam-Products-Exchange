package controller;

import dao.AccountDAO;
import dao.MessageRejectAccountDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.Account;
import entity.MessageRejectAccount;
import entity.Supplier;
import java.io.IOException;
import java.sql.Connection;
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
        MessageRejectAccountDAO messRejectDAO = new MessageRejectAccountDAO(connection);

        String action = request.getParameter("action");
        if (action == null) {
            int id = Integer.parseInt(request.getParameter("id"));
            Supplier sup = supplierDAO.getSupplierById(id);
            Account acc = accountDAO.getAccountById(sup.getAccId());
            MessageRejectAccount ma = messRejectDAO.getMessRejectAccByAccId(acc.getAccId());
            request.setAttribute("sup", sup);
            request.setAttribute("acc", acc);
            request.setAttribute("ma", ma);
            request.getRequestDispatcher("admin-page/admin-view-detail-supplier.jsp").forward(request, response);
        } else if (action.equals("accept")) {
            int accId = Integer.parseInt(request.getParameter("acc-id"));
            int supId = Integer.parseInt(request.getParameter("sup-id"));
            Account acc = accountDAO.getAccountById(accId);
            acc.setStatus(2);
            int statusUpdate = accountDAO.updateAccount(acc);
            Supplier sup = supplierDAO.getSupplierById(supId);
            request.setAttribute("sup", sup);
            request.setAttribute("acc", acc);
            request.getRequestDispatcher("admin-page/admin-view-detail-supplier.jsp").forward(request, response);
        } else if(action.equals("reject")) {
            int accId = Integer.parseInt(request.getParameter("acc-id"));
            int supId = Integer.parseInt(request.getParameter("sup-id"));
            String reason = request.getParameter("reason");
            Account acc = accountDAO.getAccountById(accId);
            Supplier sup = supplierDAO.getSupplierById(supId);
            acc.setStatus(3);
            int status = accountDAO.updateAccount(acc);
            MessageRejectAccount ma = new MessageRejectAccount(0, accId, reason);
            int statusMess = messRejectDAO.saveMessageRejectAccount(ma);
            response.sendRedirect("DetailSuppilerController?id="+supId);
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
