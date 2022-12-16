package controller;

import dao.CategoryDAO;
import dao.CityDAO;
import dao.DeliveryAreaDAO;
import dao.MessageRejectProductDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dao.ProductImageDAO;
import dao.SubCategoryDAO;
import dbconnect.DBConnect;
import entity.Category;
import entity.City;
import entity.DeliveryArea;
import entity.MessageRejectProduct;
import entity.Product;
import entity.ProductHierarchy;
import entity.ProductImage;
import entity.SubCategory;
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

@WebServlet(name = "ModeratorDetailProductController", urlPatterns = {"/ModeratorDetailProductController"})
public class ModeratorDetailProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 2) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        request.setCharacterEncoding("UTF-8");
        Connection connection = DBConnect.getConnection();
        ProductDAO productDAO = new ProductDAO(connection);
        ProductImageDAO proImgDAO = new ProductImageDAO(connection);
        ProductHierarchyDAO proHieDAO = new ProductHierarchyDAO(connection);
        DeliveryAreaDAO deliDAO = new DeliveryAreaDAO(connection);
        CityDAO cityDAO = new CityDAO(connection);
        CategoryDAO cateDAO = new CategoryDAO(connection);
        SubCategoryDAO subCateDAO = new SubCategoryDAO(connection);
        MessageRejectProductDAO messRejectProDAO = new MessageRejectProductDAO(connection);
        
        
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        if (action == null) {
            Product product = productDAO.getProductById(id);
            List<ProductImage> proImgs = proImgDAO.getAllProductsImageByProId(id);
            List<ProductHierarchy> proHies = proHieDAO.getAllHieByProId(id);
            List<DeliveryArea> deliveryAreas = deliDAO.getDeliverysAreaByProductId(id);
            List<City> cities = new ArrayList<>();
            for (DeliveryArea d : deliveryAreas) {
                City c = cityDAO.getCityById(d.getCityId());
                cities.add(c);
            }
            SubCategory subCate = subCateDAO.getSubCategoryById(product.getSubCateId());
            Category cate = cateDAO.getCategoryById(subCate.getCateId());
            MessageRejectProduct mess = messRejectProDAO.getMessageRejectProductByProId(id);
            request.setAttribute("product", product);
            request.setAttribute("proImgs", proImgs);
            request.setAttribute("proHies", proHies);
            request.setAttribute("cities", cities);
            request.setAttribute("subCate", subCate);
            request.setAttribute("cate", cate);
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("/admin-page/moderator-product-detail.jsp").forward(request, response);
        } else if (action.equals("accept")) {
            Product product = productDAO.getProductById(id);
            product.setStatusId(2);
            int flag = productDAO.updateProduct(product);
            if (flag > 0) {
                response.sendRedirect("ModeratorDetailProductController?id=" + id);
            }
        } else if (action.equals("reject")) {
            Product product = productDAO.getProductById(id);
            product.setStatusId(3);
            String reason = request.getParameter("reason");
            MessageRejectProduct mess = new MessageRejectProduct(0, id, reason);
            int status = messRejectProDAO.saveMessageRejectProduct(mess);
            int flag = productDAO.updateProduct(product);
            if (flag > 0 && status > 0) {
                response.sendRedirect("ModeratorDetailProductController?id=" + id);
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
}
