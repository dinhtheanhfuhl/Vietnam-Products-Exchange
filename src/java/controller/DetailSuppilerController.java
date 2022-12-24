package controller;

import dao.AccountDAO;
import dao.MessageRejectAccountDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.Account;
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

@WebServlet(name = "DetailSuppilerController", urlPatterns = {"/DetailSuppilerController"})
public class DetailSuppilerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 1) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        request.setCharacterEncoding("UTF-8");
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
        } else if (action.equals("reject")) {
            int accId = Integer.parseInt(request.getParameter("acc-id"));
            int supId = Integer.parseInt(request.getParameter("sup-id"));
            String reason = request.getParameter("reason");
            Account acc = accountDAO.getAccountById(accId);

            Supplier sup = supplierDAO.getSupplierById(supId);
            acc.setStatus(3);
            int status = accountDAO.updateAccount(acc);
            MessageRejectAccount ma = new MessageRejectAccount(0, accId, reason);
            int statusMess = messRejectDAO.saveMessageRejectAccount(ma);

            // send mail reject 
            security.SendMail.SendToDeMail(acc.getEmail(), "Từ chối tài khoản", reason);

            response.sendRedirect("DetailSuppilerController?id=" + supId);
        } else if(action.equals("downloadFile")){
            int id = Integer.parseInt(request.getParameter("supId"));
            Supplier sup = supplierDAO.getSupplierById(id);
            ServletContext context = request.getServletContext();
            String fullPath = context.getRealPath("/uploads/"+sup.getBusinessLicense());
            
            Path path = Paths.get(fullPath);
            byte[] data = Files.readAllBytes(path);
            
            response.setContentType("application/octet-stream");
            response.setHeader("Content-disposition", "attachment; filename="+sup.getBusinessLicense());
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
