package controller;

import dao.SupplierDAO;
import dao.SystemManagerDAO;
import entity.Supplier;
import entity.SystemManager;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author DEKUPAC
 */
@MultipartConfig
@WebServlet(name = "InforController", urlPatterns = {"/InforController"})
public class InforController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Connection conn = dbconnect.DBConnect.getConnection();
        SystemManagerDAO sysDAO = new SystemManagerDAO(conn);
        SupplierDAO supDAO = new SupplierDAO(conn);
        HttpSession session = request.getSession();
        int roleId = (int) session.getAttribute("roleIdLoggin");

        String action = request.getParameter("action");
        // display screen
        if (action == null) {
            switch (roleId) {
                case 1:
                case 2:
                    request.getRequestDispatcher("admin-page/personal-infor-admin.jsp").forward(request, response);
                    break;
                case 3:
                    request.getRequestDispatcher("admin-page/personal-infor-supplier.jsp").forward(request, response);
                    break;
            }
            return;
        }
        if (action.equals("changePhone")) {
            switch (roleId) {
                case 1:
                case 2:
                    String phone = request.getParameter("phone");
                    SystemManager sys = (SystemManager) session.getAttribute("systemManager");
                    sys.setPhone(phone);
                    sysDAO.updateSystemManager(sys);
                    session.removeAttribute("systemManager");
                    session.setAttribute("systemManager", sys);
                    request.getRequestDispatcher("admin-page/personal-infor-admin.jsp").forward(request, response);
                    break;
                case 3:
                    phone = request.getParameter("phone");
                    Supplier sup = (Supplier) session.getAttribute("supplier");
                    sup.setPhone(phone);
                    supDAO.updateSupplier(sup);
                    session.removeAttribute("supplier");
                    session.setAttribute("supplier", sup);
                    request.getRequestDispatcher("admin-page/personal-infor-supplier.jsp").forward(request, response);
                    break;
            }
            return;
        }
        if (action.equals("changeImg")) {
            String realPath = request.getServletContext().getRealPath("/uploads");
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectory(Paths.get(realPath));
            }
            switch (roleId) {
                case 1:
                case 2:
                    SystemManager sys = (SystemManager) session.getAttribute("systemManager");
                    if (sys.getAvartarImg() != null && !sys.getAvartarImg().equals("")) {
                        Files.delete(Paths.get(realPath + "/" + sys.getAvartarImg()));
                    }
                    Part part = request.getPart("img");
                    String fileName = part.getSubmittedFileName();
                    if (!fileName.equals("")) {
                        int indexDot = fileName.indexOf(".");
                        fileName = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date()) + fileName.substring(indexDot, fileName.length());
                        part.write(realPath + "/" + fileName);
                        sys.setAvartarImg(fileName);
                        sysDAO.updateSystemManager(sys);
                        session.removeAttribute("systemManager");
                        session.setAttribute("systemManager", sys);
                    }
                    request.getRequestDispatcher("admin-page/personal-infor-admin.jsp").forward(request, response);
                    break;
                case 3:
                    Supplier sup = (Supplier) session.getAttribute("supplier");
                    if (sup.getAvartarImg() != null && !sup.getAvartarImg().trim().equals("")) {
                        Files.delete(Paths.get(realPath + "/" + sup.getAvartarImg()));
                    }
                    part = request.getPart("img");
                    fileName = part.getSubmittedFileName();
                    if (!fileName.equals("")) {
                        int indexDot = fileName.indexOf(".");
                        fileName = new SimpleDateFormat("ddMMyyyyHHmmss").format(new Date()) + fileName.substring(indexDot, fileName.length());
                        part.write(realPath + "/" + fileName);
                        sup.setAvartarImg(fileName);
                        supDAO.updateSupplier(sup);
                        session.removeAttribute("supplier");
                        session.setAttribute("supplier", sup);
                    }
                    request.getRequestDispatcher("admin-page/personal-infor-supplier.jsp").forward(request, response);
                    break;
            }
        }
        if (action.equals("changeShopName")) {
            if (roleId == 3) {
                String shopName = request.getParameter("shopName");
                Supplier sup = (Supplier) session.getAttribute("supplier");
                sup.setShopName(shopName);
                supDAO.updateSupplier(sup);
            }
            request.getRequestDispatcher("admin-page/personal-infor-supplier.jsp").forward(request, response);
        }
        if (action.equals("changeMainAddress")) {
            if (roleId == 3) {
                String mainAddress = request.getParameter("mainAddress");
                Supplier sup = (Supplier) session.getAttribute("supplier");
                sup.setMainAddress(mainAddress);
                supDAO.updateSupplier(sup);
            }
            request.getRequestDispatcher("admin-page/personal-infor-supplier.jsp").forward(request, response);
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
