/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.CustomerDAO;
import dbconnect.DBConnect;
import entity.Category;
import entity.Customer;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ductd
 */
public class CustomerInfoDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection connection = DBConnect.getConnection();
        CustomerDAO customerDAO = new CustomerDAO(connection);
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        List<Category> allCate = categoryDAO.getAllCategory();

        String action = request.getParameter("action");
        if (action == null) {
            request.setAttribute("listCate", allCate);
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            int customerid = customer.getCustomerId();
            Customer customerDetail = customerDAO.getCustomerById(customerid);
            request.setAttribute("customerDetail", customerDetail);
            request.getRequestDispatcher("./common/customer-personal-info.jsp").forward(request, response);
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
