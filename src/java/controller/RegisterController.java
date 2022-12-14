package controller;

import dao.AccountDAO;
import dao.CartDAO;
import dao.CityDAO;
import dao.CustomerDAO;
import dao.SupplierDAO;
import entity.Account;
import entity.Cart;
import entity.City;
import entity.Customer;
import entity.Supplier;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author DEKUPAC
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Connection conn = dbconnect.DBConnect.getConnection();
        AccountDAO accDAO = new AccountDAO(conn);
        CustomerDAO cusDAO = new CustomerDAO(conn);
        SupplierDAO supDAO = new SupplierDAO(conn);
        CityDAO cityDAO = new CityDAO(conn);
        CartDAO cartDAO = new CartDAO(conn);
        List<City> cities = cityDAO.getAllCity();
        request.setAttribute("cities", cities);

        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("common/createAccount.jsp").forward(request, response);
        } else if (action.equals("reg")) {
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("re-password");
            String dateBirth = request.getParameter("date-birth");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String cityId = request.getParameter("city");
            String shopName = request.getParameter("shop-name");
            String mainAddress = request.getParameter("main-address");
            Part lincsePart = request.getPart("lincse");

            String realpath = request.getServletContext().getRealPath("/uploads");
            if (!Files.exists(Paths.get(realpath))) {
                Files.createDirectories(Paths.get(realpath));
            }
            String filename = Paths.get(lincsePart.getSubmittedFileName()).getFileName().toString();
            int indexDot = filename.indexOf(".");
            SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmss");
            Date date = new Date();
            filename = formatter.format(date) + filename.substring(indexDot);

            Account acc = accDAO.getAccountByEmail(email);
            if (acc != null ) {
                request.setAttribute("messDupMail", "Email ???? t???n t???i!");
                request.getRequestDispatcher("common/createAccount.jsp").forward(request, response);
            } else if (acc == null || acc.getStatus() == 3) {
                lincsePart.write(realpath + "/" + filename);
                if (role.equals("3")) {
                    acc = new Account(0, email, security.SecurityPassword.encrypt(password), 3, 1);
                    int status = accDAO.saveAccount(acc);
                    acc = accDAO.getAccountByEmail(email);
                    Supplier sup = new Supplier(0, name, acc.getAccId(), dateBirth, gender,
                            email, phone, shopName, mainAddress, Integer.parseInt(cityId), filename, "");
                    int statusSup = supDAO.saveSupplier(sup);
                    if (statusSup > 0) {
                        response.sendRedirect("LogginController");
                    }
                } else if (role.equals("4")) {
                    acc = new Account(0, email, security.SecurityPassword.encrypt(password), 4, 1);
                    int status = accDAO.saveAccount(acc);
                    acc = accDAO.getAccountByEmail(email);
                    Customer cus = new Customer(0, name, acc.getAccId(), dateBirth, gender,
                            email, phone, shopName, mainAddress, Integer.parseInt(cityId), filename, "");
                    int statusCus = cusDAO.saveCustomer(cus);
                    cus = cusDAO.getCustomerByAccId(acc.getAccId());
                    Cart cart = new Cart(1, cus.getCustomerId());
                    cartDAO.saveCart(cart);
                    if (statusCus > 0) {
                        response.sendRedirect("LogginController");
                    }
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
