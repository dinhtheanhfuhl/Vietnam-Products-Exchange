package controller;

import dao.CategoryDAO;
import dao.CustomerDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.OrderStatusDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dao.ProductImageDAO;
import entity.Category;
import entity.Order;
import entity.OrderDetail;
import entity.OrderStatus;
import entity.Product;
import entity.ProductHierarchy;
import entity.ProductImage;
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
@WebServlet(name = "ModeratorDetailOrderController", urlPatterns = {"/ModeratorDetailOrderController"})
public class ModeratorDetailOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 2) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        Connection conn = dbconnect.DBConnect.getConnection();
        OrderDAO orderDAO = new OrderDAO(conn);
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO(conn);
        OrderStatusDAO orderStatusDAO = new OrderStatusDAO(conn);
        CustomerDAO customerDAO = new CustomerDAO(conn);
        ProductDAO productDAO = new ProductDAO(conn);
        ProductImageDAO proImgDAO = new ProductImageDAO(conn);
        CategoryDAO cateDAO = new CategoryDAO(conn);
        ProductHierarchyDAO proHieDAO = new ProductHierarchyDAO(conn);

        List<OrderStatus> allOrderStatuses = orderStatusDAO.getAllOrderStatus();
        request.setAttribute("allOrderStatuses", allOrderStatuses);

        int id = Integer.parseInt(request.getParameter("id"));
        Order order = orderDAO.getOrderById(id);
        request.setAttribute("order", order);
        List<OrderDetail> orderDetails = orderDetailDAO.getAllOrderDetailsByOrderId(id);
        request.setAttribute("orderDetails", orderDetails);

        Map<OrderDetail, String> mapOrderDetailAndProduct = new LinkedHashMap<>();
        Map<OrderDetail, String> mapOrderDetailAndImg = new LinkedHashMap<>();
        Map<OrderDetail, String> mapOrderDetailAndCate = new LinkedHashMap<>();
        Map<OrderDetail, String> mapOrderDetailAndPrice = new LinkedHashMap<>();
        for (OrderDetail orderDetail : orderDetails) {
            Product pro = productDAO.getProductById(orderDetail.getProductId());
            mapOrderDetailAndProduct.put(orderDetail, pro.getProductName());
            ProductImage proImg = proImgDAO.getFirstProductImgByProId(pro.getProductId());
            mapOrderDetailAndImg.put(orderDetail, proImg.getImgPath());
            Category cate = cateDAO.getCategoryByProId(pro.getProductId());
            mapOrderDetailAndCate.put(orderDetail, cate.getCateName());
            List<ProductHierarchy> proHies = proHieDAO.getAllHieByProIdAsc(pro.getProductId());

            ProductHierarchy proHie = null;
            for (int i = 0; i < proHies.size(); i++) {
                if (orderDetail.getAmount() < proHies.get(i).getQuantity() && i > 0) {
                    proHie = proHies.get(i - 1);
                    break;
                }
            }
            if (proHie == null) {
                proHie = proHies.get(proHies.size() - 1);
            }
            mapOrderDetailAndPrice.put(orderDetail, String.valueOf(proHie.getPrice()));
        }

        request.setAttribute("mapOrderDetailAndProduct", mapOrderDetailAndProduct);
        request.setAttribute("mapOrderDetailAndImg", mapOrderDetailAndImg);
        request.setAttribute("mapOrderDetailAndCate", mapOrderDetailAndCate);
        request.setAttribute("mapOrderDetailAndPrice", mapOrderDetailAndPrice);
        request.getRequestDispatcher("admin-page/moderator-view-order.jsp").forward(request, response);

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
