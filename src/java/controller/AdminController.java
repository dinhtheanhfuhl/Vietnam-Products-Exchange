package controller;

import dao.AccountDAO;
import dao.CityDAO;
import dao.CustomerDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.Account;
import entity.City;
import entity.Customer;
import entity.Supplier;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 1) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        Connection connection = DBConnect.getConnection();
        SupplierDAO supplierDAO = new SupplierDAO(connection);
        CustomerDAO customerDAO = new CustomerDAO(connection);
        CityDAO cityDAO = new CityDAO(connection);
        AccountDAO accDAO = new AccountDAO(connection);

        List<City> allCities = cityDAO.getAllCity();
        request.setAttribute("allCities", allCities);

        List<Supplier> resultSuppliers = new ArrayList<>();
        List<Customer> resultCustomers = new ArrayList<>();

        String action = request.getParameter("action");
        String statusFilter = request.getParameter("filter");
        if (action == null) {
            resultCustomers = customerDAO.searchCustomer(null, null, null, null, null, statusFilter);
            resultSuppliers = supplierDAO.searchSupplier(null, null, null, null, null, statusFilter);
            request.setAttribute("statusFilter", statusFilter);
        } else if (action.equals("search")) {

            String name = request.getParameter("name-search").trim();
            String shopName = request.getParameter("shop-name-search").trim();
            String address = request.getParameter("address-search").trim();
            String phone = request.getParameter("phone-search").trim();
            String email = request.getParameter("email-search").trim();

            request.setAttribute("ACTION", "search");
            request.setAttribute("name", name);
            request.setAttribute("shopName", shopName);
            request.setAttribute("address", Integer.parseInt(address));
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("statusFilter", statusFilter);

            resultCustomers = customerDAO.searchCustomer(name, shopName, address, phone, email, statusFilter);
            resultSuppliers = supplierDAO.searchSupplier(name, shopName, address, phone, email, statusFilter);
        }

        Map<Supplier, String> mapSuppliers = new LinkedHashMap<>();
        Map<Customer, String> mapCustomers = new LinkedHashMap<>();

        Map<Supplier, City> mapSupplierCity = new LinkedHashMap<>();
        Map<Customer, City> mapCustomerCity = new LinkedHashMap<>();

        Map<Supplier, Integer> mapSupplierStatus = new LinkedHashMap<>();
        Map<Customer, Integer> mapCustomerStatus = new LinkedHashMap<>();

        for (Supplier supplier : resultSuppliers) {
            mapSuppliers.put(supplier, "Nhà cung cấp");
            City c = cityDAO.getCityById(supplier.getCityId());
            mapSupplierCity.put(supplier, c);
            Account a = accDAO.getAccountById(supplier.getAccId());
            mapSupplierStatus.put(supplier, a.getStatus());
        }
        for (Customer customer : resultCustomers) {
            mapCustomers.put(customer, "Khách hàng");
            City c = cityDAO.getCityById(customer.getCityId());
            mapCustomerCity.put(customer, c);
            Account a = accDAO.getAccountById(customer.getAccId());
            mapCustomerStatus.put(customer, a.getStatus());
        }
        request.setAttribute("mapSuppliers", mapSuppliers);
        request.setAttribute("mapCustomers", mapCustomers);

        request.setAttribute("mapSupplierCity", mapSupplierCity);
        request.setAttribute("mapCustomerCity", mapCustomerCity);

        request.setAttribute("mapSupplierStatus", mapSupplierStatus);
        request.setAttribute("mapCustomerStatus", mapCustomerStatus);

        RequestDispatcher rd = request.getRequestDispatcher("admin-page/admin-list-user.jsp");
        rd.forward(request, response);

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
