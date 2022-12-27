package controller;

import dao.AccountDAO;
import dao.ResetPassDAO;
import entity.Account;
import entity.Customer;
import entity.ResetPass;
import entity.Supplier;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "EditPassController", urlPatterns = {"/EditPassController"})
public class EditPassController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Connection conn = dbconnect.DBConnect.getConnection();
        AccountDAO accDAO = new AccountDAO(conn);
        ResetPassDAO resetDAO = new ResetPassDAO(conn);

        String action = request.getParameter("action");
        if (action == null || action.equals("show-change-pass")) {
            request.getRequestDispatcher("common/changepass.jsp").forward(request, response);
        } else if (action.equals("change-pass")) {
            String oldPass = request.getParameter("oldPass");
            String newPass = request.getParameter("newPass");
            String reNewPass = request.getParameter("reNewPass");
            String oldPassEnr = security.SecurityPassword.encrypt(oldPass);
            String newPassEnr = security.SecurityPassword.encrypt(newPass);
            HttpSession session = request.getSession();
            Customer cus = (Customer) session.getAttribute("customer");
            Supplier sup = (Supplier) session.getAttribute("supplier");
            if (cus == null && sup == null) {
                request.getRequestDispatcher("common/error.jsp").forward(request, response);
                return;
            }
            Account acc = new Account();
            if (cus != null) {
                acc = accDAO.getAccountById(cus.getAccId());
            }
            if (sup != null) {
                acc = accDAO.getAccountById(sup.getAccId());
            }
            if (!acc.getPassWord().equals(oldPassEnr)) {
                request.setAttribute("errorOldPass", "Mật khẩu không chính xác!");
                request.getRequestDispatcher("common/changepass.jsp").forward(request, response);
                return;
            }
            if (!newPass.equals(reNewPass)) {
                request.setAttribute("errorRePass", "Mật khẩu không trùng khớp!");
                request.getRequestDispatcher("common/changepass.jsp").forward(request, response);
                return;
            }
            acc.setPassWord(newPassEnr);
            accDAO.updateAccount(acc);
            request.setAttribute("success-mess", "Đổi mật khẩu thành công!");
            response.sendRedirect("LogoutController");
        } else if (action.equals("show-forgot-pass")) {
            request.getRequestDispatcher("common/resetPass.jsp").forward(request, response);
        } else if (action.equals("fogot-pass")) {
            String email = request.getParameter("email");
            Account acc = accDAO.getAccountByEmail(email);
            resetDAO.deleteResetPass(new ResetPass(acc.getAccId(), ""));

            String str = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
            StringBuilder codeBuilder = new StringBuilder("");
            String code;
            for (int i = 0; i < 10; i++) {
                int index = (int) Math.round(Math.random() * str.length() - 1);
                codeBuilder.append(str.charAt(index));
            }
            code = codeBuilder.toString();
            ResetPass reset = new ResetPass(acc.getAccId(), code);
            resetDAO.deleteResetPass(reset);
            int status = resetDAO.saveResetPass(reset);
            if (status > 0) {
                String content = "Xin chào quý khách, <br/>"
                        + "Chúng tôi nhận được yêu cầu thiết lập lại mật khẩu từ bạn.<br/>"
                        + "<a href='http://localhost:8080/CapstoneProject/EditPassController?action=verifypass&code=" + code + "'>Bấm vào đây để thiết lập   lại mật khẩu!</a><br/>"
                        + "Cảm ơn quý khách đã sử dụng dịch vụ của chúng tôi<br/>"
                        + "VnProX Service Team";
                security.SendMail.SendToDeMail(email, "Thiết lập lại mật khẩu", content);
            }
            request.setAttribute("mess", "Đường dẫn đổi mật khẩu đã được gửi đến địa chỉ mail của bạn!");
            request.getRequestDispatcher("common/resetPass.jsp").forward(request, response);
        } else if (action.equals("verifypass")) {
            String code = request.getParameter("code");
            ResetPass reset = resetDAO.getCodeReset(code);
            if (reset != null) {
                request.setAttribute("accId", reset.getAccId());
                request.getRequestDispatcher("common/resetpassword.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("common/error.jsp").forward(request, response);
            }
        } else if (action.equals("editpass")) {
            String pass = request.getParameter("pass");
            String rePass = request.getParameter("rePass");
            if (!pass.equals(rePass)) {
                request.setAttribute("error", "Mật khẩu nhập lại không trùng khớp");
                String accId = request.getParameter("accId");
                request.setAttribute("accId", accId);
                request.getRequestDispatcher("common/resetpassword.jsp").forward(request, response);
                return;
            }
            if (pass != null && rePass != null) {
                if (pass.equals(rePass)) {
                    String accId = request.getParameter("accId");
                    request.setAttribute("accId", accId);
                    Account acc = accDAO.getAccountById(Integer.parseInt(accId));
                    acc.setPassWord(security.SecurityPassword.encrypt(pass));
                    accDAO.updateAccount(acc);
                    resetDAO.deleteResetPass(new ResetPass(acc.getAccId(), ""));
                }
            }
            request.getRequestDispatcher("common/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(EditPassController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(EditPassController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
