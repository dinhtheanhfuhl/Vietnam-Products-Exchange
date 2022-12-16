package controller;

import dao.CustomerDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.OrderStatusDAO;
import entity.Customer;
import entity.Order;
import entity.OrderDetail;
import entity.OrderStatus;
import entity.Supplier;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DEKUPAC
 */
@WebServlet(name = "SupplierOrderController", urlPatterns = {"/SupplierOrderController"})
public class SupplierOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 3) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Connection conn = dbconnect.DBConnect.getConnection();
        OrderDAO orderDAO = new OrderDAO(conn);
        OrderStatusDAO orderStatusDAO = new OrderStatusDAO(conn);
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO(conn);
        CustomerDAO customerDAO = new CustomerDAO(conn);

        Supplier supplier = (Supplier) session.getAttribute("supplier");

        List<OrderStatus> allOrderStatus = orderStatusDAO.getAllOrderStatus();
        request.setAttribute("allOrderStatus", allOrderStatus);

        String action = request.getParameter("action");
        String filter = request.getParameter("filter");

        List<Order> resultOrders = new ArrayList<>();
        if (action == null) {
            String orderID = request.getParameter("id");
            resultOrders = orderDAO.searchOrderBySupplierID(supplier.getSupplierId(), orderID, filter);
            request.setAttribute("filter", filter);
        } else if (action.equals("search")) {
            String orderID = request.getParameter("id");
            resultOrders = orderDAO.searchOrderBySupplierID(supplier.getSupplierId(), orderID, filter);
            request.setAttribute("action", "search");
            request.setAttribute("id", orderID);
            request.setAttribute("filter", filter);
        }

        Map<Order, String> mapOrderAndCreateTime = new LinkedHashMap<>();
        for (Order order : resultOrders) {
            OrderDetail detail = orderDetailDAO.getOrderDetailByOrderId(order.getOrderId());
            mapOrderAndCreateTime.put(order, detail.getOrderDate());
        }
        request.setAttribute("mapOrderAndCreateTime", mapOrderAndCreateTime);

        Map<Order, String> mapOrderAndCustomerName = new LinkedHashMap<>();
        for (Order order : resultOrders) {
            Customer customer = customerDAO.getCustomerById(order.getCustomerId());
            mapOrderAndCustomerName.put(order, customer.getCustomerName());
        }
        request.setAttribute("mapOrderAndCustomerName", mapOrderAndCustomerName);

        Map<Order, Integer> MapOrderAndNumberProduct = new LinkedHashMap<>();
        for (Order order : resultOrders) {
            int number = orderDAO.sumAmount(order.getOrderId());
            MapOrderAndNumberProduct.put(order, number);
        }
        request.setAttribute("MapOrderAndNumberProduct", MapOrderAndNumberProduct);

        Map<Order, String> MapOrderAndStatus = new LinkedHashMap<>();
        for (Order order : resultOrders) {
            OrderStatus orderStatus = orderStatusDAO.getOrderStatusById(order.getOrderStatusId());
            MapOrderAndStatus.put(order, orderStatus.getStatusName());
        }
        request.setAttribute("MapOrderAndStatus", MapOrderAndStatus);

        request.setAttribute("resultOrders", resultOrders);
        request.getRequestDispatcher("admin-page/supplier-list-order.jsp").forward(request, response);

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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
