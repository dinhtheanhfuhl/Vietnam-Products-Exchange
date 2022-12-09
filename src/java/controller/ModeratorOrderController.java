package controller;

import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.OrderStatusDAO;
import dao.SupplierDAO;
import entity.Order;
import entity.OrderDetail;
import entity.OrderStatus;
import java.io.IOException;
import java.sql.Connection;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DEKUPAC
 */
@WebServlet(name = "ModeratorOrderController", urlPatterns = {"/ModeratorOrderController"})
public class ModeratorOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        Connection conn = dbconnect.DBConnect.getConnection();
        OrderDAO orderDAO = new OrderDAO(conn);
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO(conn);
        SupplierDAO supDAO = new SupplierDAO(conn);
        OrderStatusDAO odStatusDAO = new OrderStatusDAO(conn);

        List<OrderStatus> orderStatuses = odStatusDAO.getAllOrderStatus();
        List<Order> orders = new LinkedList<>();
        
        String action = request.getParameter("action");
        String filter = request.getParameter("filter");
        if (action == null) {
            orders = orderDAO.getAllOrders();
        }else if(action.equals("search")){
            String id = request.getParameter("id");
            orders = orderDAO.searchOrder(id, filter);
        }

        Map<Order, List<OrderDetail>> mapOrderAndOrderDetail = new LinkedHashMap<>();
        Map<Order, List<String>> mapOrderAndSupName = new LinkedHashMap<>();
        Map<Order, Integer> mapOrderAndTotalWeight = new LinkedHashMap<>();
        Map<Order, OrderStatus> mapOrderAndOrderStatus = new LinkedHashMap<>();

        for (Order order : orders) {

            List<OrderDetail> orderDetails = orderDetailDAO.getAllOrderDetailsByOrderId(order.getOrderId());
            mapOrderAndOrderDetail.put(order, orderDetails);

            int total = 0;
            for (OrderDetail orderDetail : orderDetails) {
                total += orderDetail.getAmount();
            }
            mapOrderAndTotalWeight.put(order, total);

            List<String> supNames = supDAO.getSuppliersNameInOrder(order.getOrderId());
            mapOrderAndSupName.put(order, supNames);

            OrderStatus os = odStatusDAO.getOrderStatusById(order.getOrderStatusId());
            mapOrderAndOrderStatus.put(order, os);
        }
        request.setAttribute("orders", orders);
        request.setAttribute("orderStatuses", orderStatuses);
        request.setAttribute("mapOrderAndOrderDetail", mapOrderAndOrderDetail);
        request.setAttribute("mapOrderAndSupName", mapOrderAndSupName);
        request.setAttribute("mapOrderAndTotalWeight", mapOrderAndTotalWeight);
        request.setAttribute("mapOrderAndOrderStatus", mapOrderAndOrderStatus);
        request.getRequestDispatcher("admin-page/moderator-list-order.jsp").forward(request, response);

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
