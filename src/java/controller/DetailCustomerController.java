package controller;

import dao.AccountDAO;
import dao.CustomerDAO;
import dao.MessageRejectAccountDAO;
import dbconnect.DBConnect;
import entity.Account;
import entity.Customer;
import entity.MessageRejectAccount;
import entity.Supplier;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DetailCustomerController", urlPatterns = {"/DetailCustomerController"})
public class DetailCustomerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 1) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        request.setCharacterEncoding("UTF-8");
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
        } else if (action.equals("reject")) {
            int accId = Integer.parseInt(request.getParameter("acc-id"));
            int cusId = Integer.parseInt(request.getParameter("cus-id"));
            String reason = request.getParameter("reason");
            Account acc = accountDAO.getAccountById(accId);
            Customer cus = customerDAO.getCustomerByAccId(cusId);
            acc.setStatus(3);
            int status = accountDAO.updateAccount(acc);
            MessageRejectAccount ma = new MessageRejectAccount(0, accId, reason);
            int statusMess = messRejectDAO.saveMessageRejectAccount(ma);
            // send mail reject 
            security.SendMail.SendToDeMail(acc.getEmail(), "Từ chối tài khoản", reason);
            response.sendRedirect("DetailCustomerController?id=" + cusId);
        } else if (action.equals("downloadFile")) {
            int id = Integer.parseInt(request.getParameter("cusId"));
            Customer cus = customerDAO.getCustomerById(id);
            ServletContext context = request.getServletContext();
            String fullPath = context.getRealPath("/uploads/" + cus.getBusinessLicense());

            Path path = Paths.get(fullPath);
            byte[] data = Files.readAllBytes(path);

            response.setContentType("application/octet-stream");
            response.setHeader("Content-disposition", "attachment; filename=" + cus.getBusinessLicense());
            response.setContentLength(data.length);

            InputStream inputStream = new BufferedInputStream(new ByteArrayInputStream(data));

            OutputStream outStream = response.getOutputStream();
            byte[] buffer = new byte[4096];
            int byteRead = -1;
            while ((byteRead = inputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, byteRead);
            }
            inputStream.close();
            outStream.close();
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
