/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.OrderStatusDAO;
import dbconnect.DBConnect;
import entity.Category;
import entity.Customer;
import entity.Order;
import entity.OrderDetail;
import entity.OrderStatus;
import java.io.IOException;
import java.sql.Connection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ductd
 */
public class HistoryOrderController extends HttpServlet {

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
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO(connection);
        OrderDAO orderDAO = new OrderDAO(connection);
        OrderStatusDAO orderStatusDAO = new OrderStatusDAO(connection);

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        int customerid = customer.getCustomerId();

        List<Category> allCate = categoryDAO.getAllCategory();
        request.setAttribute("listCate", allCate);
        List<OrderStatus> listOrderStatus = orderStatusDAO.getAllOrderDetails();
        request.setAttribute("listOrderStatus", listOrderStatus);

        String valueStatusStr = request.getParameter("selectstatus");
        if (valueStatusStr == null) {
            Map<Order, List<OrderDetail>> mapOrder = new LinkedHashMap<Order, List<OrderDetail>>();
            Map<Order, Integer> mapAmount = new LinkedHashMap<Order, Integer>();
            Map<Order, Integer> mapPrice = new LinkedHashMap<Order, Integer>();
            List<Order> listOrder = orderDAO.getOrderByCusId(customerid);
            for (Order order : listOrder) {
                List<OrderDetail> orderDetail = orderDetailDAO.getAllOrderDetailsByOrderId(order.getOrderId());
                mapOrder.put(order, orderDetail);

                mapAmount.put(order, orderDAO.sumAmount(order.getOrderId()));
                mapPrice.put(order, orderDAO.sumPrice(order.getOrderId()));
            }
            request.setAttribute("mapPrice", mapPrice);
            request.setAttribute("mapAmount", mapAmount);
            request.setAttribute("mapOrder", mapOrder);
            request.getRequestDispatcher("./common/customer-history-order.jsp").forward(request, response);
        } else {
            int valueStatus = Integer.parseInt(valueStatusStr);
            request.setAttribute("valueStatus", valueStatus);
            List<Order> listOrderByStatus = null;
            if (valueStatus == 0) {
                listOrderByStatus = orderDAO.getOrderByCusId(customerid);
            } else {
                listOrderByStatus = orderDAO.getListOrderByStatusId(valueStatus, customerid);
            }
            Map<Order, List<OrderDetail>> mapOrder = new LinkedHashMap<Order, List<OrderDetail>>();
            Map<Order, Integer> mapAmount = new LinkedHashMap<Order, Integer>();
            Map<Order, Integer> mapPrice = new LinkedHashMap<Order, Integer>();
            for (Order order : listOrderByStatus) {
                List<OrderDetail> orderDetail = orderDetailDAO.getAllOrderDetailsByOrderId(order.getOrderId());
                mapOrder.put(order, orderDetail);

                mapAmount.put(order, orderDAO.sumAmount(order.getOrderId()));
                mapPrice.put(order, orderDAO.sumPrice(order.getOrderId()));
            }
            request.setAttribute("mapPrice", mapPrice);
            request.setAttribute("mapAmount", mapAmount);
            request.setAttribute("mapOrder", mapOrder);
            request.getRequestDispatcher("./common/customer-history-order.jsp").forward(request, response);
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
