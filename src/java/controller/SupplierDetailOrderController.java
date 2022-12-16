package controller;

import dao.CategoryDAO;
import dao.MessageRejectOrderDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.OrderStatusDAO;
import dao.ProductDAO;
import dao.ProductImageDAO;
import dao.SubCategoryDAO;
import entity.Category;
import entity.MessageRejectOrder;
import entity.Order;
import entity.OrderDetail;
import entity.OrderStatus;
import entity.Product;
import entity.ProductImage;
import entity.SubCategory;
import java.io.IOException;
import java.sql.Connection;
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
@WebServlet(name = "SupplierDetailOrderController", urlPatterns = {"/SupplierDetailOrderController"})
public class SupplierDetailOrderController extends HttpServlet {

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
        OrderDetailDAO detailDAO = new OrderDetailDAO(conn);
        OrderStatusDAO statusDAO = new OrderStatusDAO(conn);
        ProductImageDAO proImgDAO = new ProductImageDAO(conn);
        ProductDAO productDAO = new ProductDAO(conn);
        CategoryDAO cateDAO = new CategoryDAO(conn);
        SubCategoryDAO subCateDAO = new SubCategoryDAO(conn);
        MessageRejectOrderDAO messDAO = new MessageRejectOrderDAO(conn);

        int orderId = Integer.parseInt(request.getParameter("id"));
        Order order = orderDAO.getOrderById(orderId);
        List<OrderDetail> details = detailDAO.getAllOrderDetailsByOrderId(orderId);
        String action = request.getParameter("action");
        if (action == null) {
            
            OrderStatus status = statusDAO.getOrderStatusById(order.getOrderStatusId());
            if(status.getOrderStatusID()==5){
                MessageRejectOrder mess = messDAO.getMessageRejectOrderByOrderId(orderId);
                request.setAttribute("mess", mess);
            }
            Map<OrderDetail, String> mapOrderDetailAndImagePath = new LinkedHashMap<>();
            for (OrderDetail detail : details) {
                ProductImage proImg = proImgDAO.getFirstProductImgByProId(detail.getProductId());
                mapOrderDetailAndImagePath.put(detail, proImg.getImgPath());
            }
            request.setAttribute("mapOrderAndImagePath", mapOrderDetailAndImagePath);
            Map<OrderDetail, String> mapOrderDetailAndProductName = new LinkedHashMap<>();
            for (OrderDetail detail : details) {
                Product product = productDAO.getProductById(detail.getProductId());
                mapOrderDetailAndProductName.put(detail, product.getProductName());
            }
            request.setAttribute("mapOrderDetailAndProductName", mapOrderDetailAndProductName);
            Map<OrderDetail, String> mapOrderDetailAndCateName = new LinkedHashMap<>();
            Map<OrderDetail, String> mapOrderDetailAndSubCateName = new LinkedHashMap<>();
            for (OrderDetail detail : details) {
                Product product = productDAO.getProductById(detail.getProductId());
                SubCategory subCate = subCateDAO.getSubCategoryById(product.getSubCateId());
                Category cate = cateDAO.getCategoryById(subCate.getCateId());
                mapOrderDetailAndCateName.put(detail, cate.getCateName());
                mapOrderDetailAndSubCateName.put(detail, subCate.getSubCateName());
            }
            request.setAttribute("mapOrderDetailAndCateName", mapOrderDetailAndCateName);
            request.setAttribute("mapOrderDetailAndSubCateName", mapOrderDetailAndSubCateName);
            Map<OrderDetail, String> mapOrderDetailAndCost = new LinkedHashMap<>();
            for (OrderDetail detail : details) {
                int cost = detail.getCost() / detail.getAmount();
                mapOrderDetailAndCost.put(detail, String.valueOf(cost));
            }
            request.setAttribute("mapOrderDetailAndCost", mapOrderDetailAndCost);
            request.setAttribute("order", order);
            request.setAttribute("details", details);
            request.setAttribute("status", status);
            request.getRequestDispatcher("admin-page/supplier-view-order.jsp").forward(request, response);
        } else if (action.equals("accept")) {
            order.setOrderStatusId(2);
            orderDAO.updateStatusOrder(order);
            response.sendRedirect("SupplierDetailOrderController?id=" + orderId);
        } else if (action.equals("reject")) {
            order.setOrderStatusId(3);
            orderDAO.updateStatusOrder(order);
            for (OrderDetail detail : details) {
                Product product = productDAO.getProductById(detail.getProductId());
                product.setWeight(product.getWeight() + detail.getAmount());
                productDAO.updateProduct(product);
            }
            response.sendRedirect("SupplierDetailOrderController?id=" + orderId);
        } else if (action.equals("success")) {
            order.setOrderStatusId(4);
            orderDAO.updateStatusOrder(order);
            response.sendRedirect("SupplierDetailOrderController?id=" + orderId);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
