/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import dao.CartItemDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dbconnect.DBConnect;
import entity.CartItem;
import entity.Customer;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import entity.ProductHierarchy;
import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class OrderController extends HttpServlet {

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
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        Connection connection = DBConnect.getConnection();
        OrderDAO orderDAO = new OrderDAO(connection);
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO(connection);
        CartItemDAO cartItemDAO = new CartItemDAO(connection);
        CartDAO cartDAO = new CartDAO(connection);
        ProductDAO productDAO = new ProductDAO(connection);
        ProductHierarchyDAO proHieDAO = new ProductHierarchyDAO(connection);

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        int customerid = customer.getCustomerId();
        int cartId = cartDAO.getCartIdByCustomerId(customerid);

        String receiverName = request.getParameter("receiverName");
        String receiverAddress = request.getParameter("receiverAddress");
        String receiverPhone = request.getParameter("receiverPhone");
        int totalPrice = Integer.parseInt(request.getParameter("totalprice"));
        String note = request.getParameter("note");

        orderDAO.insertOrder(customerid, receiverName, receiverAddress, receiverPhone, totalPrice, 1, note);

        Order order = orderDAO.getNewestOrder();

        List<CartItem> listCartItem = cartItemDAO.getAllCartItemsByCartId(cartId);
        Map<CartItem, ProductHierarchy> mapProHie = new LinkedHashMap<>();
        for (CartItem cartItem : listCartItem) {
            Product product = productDAO.getProductById(cartItem.getProductId());
            if (cartItem.getAmount() <= product.getWeight()) {
                int cartAmount = cartItem.getAmount();
                int productId = cartItem.getProductId();
                Product p = productDAO.getProductById(productId);
                productDAO.updateAmountByProId(p.getWeight() - cartAmount, productId);
                
                List<ProductHierarchy> listProhie = proHieDAO.getHierarchyByProId(cartItem.getProductId());
                int amount = cartItem.getAmount();
                ProductHierarchy proHierachy = null;
                for (int i = 0; i < listProhie.size(); i++) {
                    if (i > 0 && amount < listProhie.get(i).getQuantity()) {
                        proHierachy = listProhie.get(i - 1);
                        break;
                    }
                }
                if (proHierachy == null) {
                    proHierachy = listProhie.get(listProhie.size() - 1);
                }
                mapProHie.put(cartItem, proHierachy);

                OrderDetail orderDetai = new OrderDetail();
                orderDetai.setOrderId(order.getOrderId());
                orderDetai.setProductId(cartItem.getProductId());
                orderDetai.setOrderDate(dtf.format(now));
                orderDetai.setAmount(cartItem.getAmount());
                orderDetai.setCost(proHierachy.getPrice() * cartItem.getAmount());
                orderDetailDAO.saveOrderDetail(orderDetai);
            }
        }

        cartItemDAO.deleteCartByCartId(cartId);

        response.sendRedirect("HistoryOrderController");

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
