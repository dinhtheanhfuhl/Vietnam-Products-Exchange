package controller;

import dao.AccountDAO;
import dao.CustomerDAO;
import dao.MessageRejectAccountDAO;
import dbconnect.DBConnect;
import entity.Account;
import entity.Customer;
import entity.MessageRejectAccount;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DetailCustomerController", urlPatterns = {"/DetailCustomerController"})
public class DetailCustomerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = DBConnect.getConnection();
        CustomerDAO customerDAO = new CustomerDAO(connection);
        AccountDAO accountDAO = new AccountDAO(connection);
        MessageRejectAccountDAO messRejectDAO = new MessageRejectAccountDAO(connection);

        String action = request.getParameter("action");

        if (action == null) {
            int id = Integer.parseInt(request.getParameter("id"));
            Customer cus = customerDAO.getCustomerById(id);
            Account acc = accountDAO.getAccountById(cus.getAccId());
            MessageRejectAccount ma = messRejectDAO.getMessRejectAccByAccId(acc.getAccId());
            request.setAttribute("cus", cus);
            request.setAttribute("acc", acc);
            request.setAttribute("ma", ma);
            request.getRequestDispatcher("admin-page/admin-view-detail-customer.jsp").forward(request, response);
        } else if (action.equals("accept")) {
            String accId = request.getParameter("acc-id");
            String cusId = request.getParameter("cus-id");
            Account account = accountDAO.getAccountById(Integer.parseInt(accId));
            Customer customer = customerDAO.getCustomerById(Integer.parseInt(cusId));
            account.setStatus(2);
            int statusUpdate = accountDAO.updateAccount(account);
            request.setAttribute("cus", customer);
            request.setAttribute("acc", account);
            request.getRequestDispatcher("admin-page/admin-view-detail-customer.jsp").forward(request, response);
        } else if(action.equals("reject")) {
            int accId = Integer.parseInt(request.getParameter("acc-id"));
            int cusId = Integer.parseInt(request.getParameter("cus-id"));
            String reason = request.getParameter("reason");
            Account acc = accountDAO.getAccountById(accId);
            Customer cus = customerDAO.getCustomerByAccId(cusId);
            acc.setStatus(3);
            int status = accountDAO.updateAccount(acc);
            MessageRejectAccount ma = new MessageRejectAccount(0, accId, reason);
            int statusMess = messRejectDAO.saveMessageRejectAccount(ma);
            response.sendRedirect("DetailCustomerController?id="+cusId);
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
