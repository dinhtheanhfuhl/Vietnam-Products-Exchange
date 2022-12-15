/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.MessageRejectOrderDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.OrderStatusDAO;
import dao.ProductDAO;
import dao.ProductImageDAO;
import dao.SupplierDAO;
import dbconnect.DBConnect;
import entity.Category;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import entity.ProductImage;
import entity.Supplier;
import java.io.IOException;
import java.sql.Connection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ductd
 */
public class HistoryOrderDetailController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        Connection connection = DBConnect.getConnection();
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO(connection);
        OrderDAO orderDAO = new OrderDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);
        ProductImageDAO productImageDAO = new ProductImageDAO(connection);
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        SupplierDAO supplierDAO = new SupplierDAO(connection);
        OrderStatusDAO orderStatusDAO = new OrderStatusDAO(connection);
        MessageRejectOrderDAO messageRejectOrderDAO = new MessageRejectOrderDAO(connection);

        String orderIdUpdateStatusStr = request.getParameter("orderId");

        String action = request.getParameter("action");
        if (action == null) {

            List<Category> allCate = categoryDAO.getAllCategory();
            request.setAttribute("listCate", allCate);

            int orderId = Integer.parseInt(request.getParameter("oid"));
            OrderDetail orderDetail = orderDetailDAO.getOrderDetailByOrderId(orderId);
            request.setAttribute("orderDetail", orderDetail);

            Order order = orderDAO.getOrderById(orderId);
            request.setAttribute("order", order);

            int totalPrice = orderDAO.sumPrice(orderId);
            request.setAttribute("totalPrice", totalPrice);

            List<OrderDetail> listProInOrder = orderDetailDAO.getAllOrderDetailsByOrderId(orderId);
            Map<OrderDetail, List<Product>> mapProduct = new LinkedHashMap<OrderDetail, List<Product>>();
            for (OrderDetail o : listProInOrder) {
                List<Product> product = productDAO.getAllProductsProductID(o.getProductId());
                mapProduct.put(o, product);
            }
            request.setAttribute("mapProduct", mapProduct);

            Map<OrderDetail, List<ProductImage>> mapImage = new LinkedHashMap<OrderDetail, List<ProductImage>>();
            for (OrderDetail o : listProInOrder) {
                List<ProductImage> image = productImageDAO.getAllProductsImageByProId(o.getProductId());
                mapImage.put(o, image);
            }
            request.setAttribute("mapImage", mapImage);

            Map<OrderDetail, List<Supplier>> mapSupplier = new LinkedHashMap<OrderDetail, List<Supplier>>();
            for (OrderDetail o : listProInOrder) {
                List<Supplier> supplier = supplierDAO.getSupplierByProId(o.getProductId());
                mapSupplier.put(o, supplier);
            }
            request.setAttribute("mapSupplier", mapSupplier);

            request.getRequestDispatcher("./common/customer-detail-order.jsp").forward(request, response);
        } else if (action.equals("success")) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            Order order = orderDAO.getOrderById(orderId);
            int orderIdUpdateStatus = Integer.parseInt(orderIdUpdateStatusStr);
            if (order.getOrderStatusId() == 4) {
                orderStatusDAO.updateOrderStatus(6, orderIdUpdateStatus);
            }
            response.sendRedirect("HistoryOrderDetailController?oid=" + orderId);
        } else if (action.equals("reject")) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            Order order = orderDAO.getOrderById(orderId);
            request.setAttribute("order", order);
            int orderIdUpdateStatus = Integer.parseInt(orderIdUpdateStatusStr);
            if (order.getOrderStatusId() == 1) {
                orderStatusDAO.updateOrderStatus(5, orderIdUpdateStatus);
            }
            String message = request.getParameter("message");
            messageRejectOrderDAO.saveMessageRejectOrder(orderIdUpdateStatus, message);
            OrderDetail orderDetail = orderDetailDAO.getOrderDetailByOrderId(orderId);
            request.setAttribute("orderDetail", orderDetail);

            List<OrderDetail> listCart = orderDetailDAO.getAllOrderDetailsByOrderId(orderId);

            for (int i = 0; i < listCart.size(); i++) {
                orderDetail = listCart.get(i);
                int cartAmount = orderDetail.getAmount();
                int productId = orderDetail.getProductId();
                Product p = productDAO.getProductById(productId);
                productDAO.updateAmountByProId(p.getWeight() + cartAmount, productId);
            }
            response.sendRedirect("HistoryOrderDetailController?oid=" + orderId);
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
