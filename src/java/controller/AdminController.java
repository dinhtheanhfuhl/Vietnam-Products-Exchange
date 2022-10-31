package controller;

import dao.CityDAO;
import dao.CustomerDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.City;
import entity.Customer;
import entity.Supplier;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection connection = DBConnect.getConnection();
        SupplierDAO supplierDAO = new SupplierDAO(connection);
        CustomerDAO customerDAO = new CustomerDAO(connection);
        CityDAO cityDAO = new CityDAO(connection);

        List<Supplier> allSuppliers = supplierDAO.getAllSupplier();
        List<Customer> allCustomers = customerDAO.getAllCustomer();
        List<City> allCities = cityDAO.getAllCity();

        List<Supplier> resultSuppliers = new ArrayList<>();
        List<Customer> resultCustomers = new ArrayList<>();

        Map<Supplier, String> mapSuppliers = new HashMap<>();
        Map<Customer, String> mapCustomers = new HashMap<>();

        String action = request.getParameter("action");
        if (action == null) {
            resultSuppliers = allSuppliers;
            resultCustomers = allCustomers;

            for (Supplier supplier : resultSuppliers) {
                mapSuppliers.put(supplier, "Nhà cung cấp");
            }
            for (Customer customer : resultCustomers) {
                mapCustomers.put(customer, "Khách hàng");
            }
            request.setAttribute("mapSuppliers", mapSuppliers);
            request.setAttribute("mapCustomers", mapCustomers);
            request.setAttribute("allCities", allCities);

            RequestDispatcher rd = request.getRequestDispatcher("admin-page/admin-list-user.jsp");
            rd.forward(request, response);
        } else {
            String nameSearch = request.getParameter("name-search");
            String shopNameSearch = request.getParameter("shop-name-search");
            String addressSearch = request.getParameter("address-search");
            String phoneSearch = request.getParameter("phone-search");
            String emailSearch = request.getParameter("email-search");
            boolean flagName, flagShopName, flagAddress, flagPhone, flagEmail;
            for (Customer customer : allCustomers) {
                if(nameSearch.isBlank()) flagName = true;
            }
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