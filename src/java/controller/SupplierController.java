package controller;

import dao.ProductDAO;
import entity.Product;
import entity.Supplier;
import java.io.IOException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SupplierController", urlPatterns = {"/SupplierController"})
public class SupplierController extends HttpServlet {

    private static void convertDate(List<Product> products) {
        SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat formatter2 = new SimpleDateFormat("dd/MM/yyyy");
        for (Product p : products) {
            try {
                Date date = formatter1.parse(p.getCreatedDate());
                String strDate = formatter2.format(date);
                p.setCreatedDate(strDate);
            } catch (ParseException ex) {
                System.out.println(ex.getMessage());
            }
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        // fake session supplier
        Supplier supplierFake = new Supplier();
        supplierFake.setSupplierId(1);
        session.setAttribute("supplier", supplierFake);

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
