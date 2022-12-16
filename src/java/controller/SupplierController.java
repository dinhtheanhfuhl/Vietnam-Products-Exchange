package controller;

import dao.ProductDAO;
import entity.Product;
import entity.Supplier;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SupplierController", urlPatterns = {"/SupplierController"})
public class SupplierController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 3) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        Supplier supplier = (Supplier) session.getAttribute("supplier");

        Connection conn = dbconnect.DBConnect.getConnection();
        ProductDAO productDAO = new ProductDAO(conn);

        List<Product> resultP = new ArrayList<>();
        String action = request.getParameter("action");
        if (action == null) {
            List<Product> allProducts = productDAO.getAllProductBySupplier(supplier.getSupplierId());
            resultP = allProducts;
        } else if (action.equals("search")) {
            String idSr = request.getParameter("idSr");
            String nameSr = request.getParameter("nameSr");
            String barcodeSr = request.getParameter("barcodeSr");
            resultP = productDAO.searchProduct(supplier.getSupplierId(), idSr, nameSr, barcodeSr);

            request.setAttribute("idSr", idSr);
            request.setAttribute("nameSr", nameSr);
            request.setAttribute("barcodeSr", barcodeSr);
            request.setAttribute("action", "search");
        }

        String filter = request.getParameter("filter");
        if (filter != null) {
            int status = Integer.parseInt(request.getParameter("status"));
            if (status == 0) {
                request.setAttribute("resultP", resultP);
            } else {
                List<Product> resultLP = new ArrayList<>();
                for (Product product : resultP) {
                    if (product.getStatusId() == status) {
                        resultLP.add(product);
                    }
                }
                request.setAttribute("resultP", resultLP);
            }
            request.setAttribute("status", status);
        } else {
            request.setAttribute("resultP", resultP);
        }

        request.getRequestDispatcher("admin-page/supplier-product-pending.jsp").forward(request, response);
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
