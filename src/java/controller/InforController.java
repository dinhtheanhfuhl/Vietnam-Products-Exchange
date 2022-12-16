package controller;

import dao.SystemManagerDAO;
import entity.Account;
import entity.SystemManager;
import java.io.File;
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
        HttpSession session = request.getSession();

        int roleId = (int) session.getAttribute("roleIdLoggin");
        Account acc = (Account) session.getAttribute("accountLoggin");
        String action = request.getParameter("action");
        SystemManager sys = sysDAO.getSystemManagerByAccId(acc.getAccId());
        if (action == null) {
            switch (roleId) {
                case 1:
                case 2:
                    request.setAttribute("acc", acc);
                    request.setAttribute("sys", sys);
                    request.getRequestDispatcher("admin-page/personal-infor-admin.jsp").forward(request, response);
                    break;
                case 3:
                    request.getRequestDispatcher("admin-page/personal-infor-supplier.jsp").forward(request, response);
                    break;
            }
        } else if (action.equals("changePhone")) {
            switch (roleId) {
                case 1:
                case 2:
                    String newPhone = request.getParameter("newPhone");
                    sys.setPhone(newPhone);
                    sysDAO.updateSystemManager(sys);
                    response.sendRedirect("InforController");
                    break;
            }
        } else if (action.equals("uploadImg")) {
            switch (roleId) {
                case 1:
                case 2:
                    Part fileImg = request.getPart("img");
                    String fileName = fileImg.getSubmittedFileName();
                    if (!fileImg.equals("")) {
                        String realPath = request.getServletContext().getRealPath("/uploads");
                        if (!Files.exists(Paths.get(realPath))) {
                            Files.createDirectories(Paths.get(realPath));
                        }
                        int indexDot = fileName.indexOf(".");
                        SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmss");
                        Date date = new Date();
                        fileName = formatter.format(date) + fileName.substring(indexDot);
                        fileImg.write(realPath + "/" + fileName);
                        sys.setAvartarImg(fileName);
                        sysDAO.updateSystemManager(sys);
                        session.removeAttribute("systemManager");
                        session.setAttribute("systemManager", sys);
                    }
                    response.sendRedirect("InforController");
                    break;
            }
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
