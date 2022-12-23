package controller;

import dao.CartItemDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dbconnect.DBConnect;
import entity.Product;
import entity.ProductHierarchy;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ductd
 */
public class CheckCartAmountController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Connection connection = DBConnect.getConnection();
        ProductDAO productDAO = new ProductDAO(connection);
        ProductHierarchyDAO proHieDAO = new ProductHierarchyDAO(connection);
        CartItemDAO cartItemDAO = new CartItemDAO(connection);

        String cartAmountStr = request.getParameter("amount");
        long cartAmount = Long.parseLong(cartAmountStr);
        int producId = Integer.parseInt(request.getParameter("cartProducId"));
        Product p = productDAO.getProductById(producId);

        List<ProductHierarchy> listProhie = proHieDAO.getHierarchyByProId(producId);
        if (cartAmount > p.getWeight()) {
            request.setAttribute("message", "Số lượng sản phẩm");
            request.setAttribute("productName", p.getProductName());
            request.setAttribute("message2", "chỉ còn: ");
            request.setAttribute("AmountInStore", p.getWeight());
            request.setAttribute("icon", "exclamation-triangle");
            request.setAttribute("alert", "warning");
            request.getRequestDispatcher("CartController").forward(request, response);
        } else if (cartAmount < listProhie.get(0).getQuantity()) {
            request.setAttribute("message", "Nhỏ hơn số lượng tối thiểu cho phép mua của ");
            request.setAttribute("productName", p.getProductName());
            request.setAttribute("message2", "là: ");
            request.setAttribute("AmountInStore", listProhie.get(0).getQuantity());
            request.setAttribute("icon", "exclamation-triangle");
            request.setAttribute("alert", "warning");
            request.getRequestDispatcher("CartController").forward(request, response);

        } else {
            cartItemDAO.updateCartItemAmountByProId((int)cartAmount, producId);
            request.getRequestDispatcher("CartController").forward(request, response);
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
