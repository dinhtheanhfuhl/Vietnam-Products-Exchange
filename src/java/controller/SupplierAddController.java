/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.CityDAO;
import dao.DeliveryAreaDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dao.ProductImageDAO;
import dao.SubCategoryDAO;
import entity.Category;
import entity.City;
import entity.DeliveryArea;
import entity.Product;
import entity.ProductHierarchy;
import entity.ProductImage;
import entity.SubCategory;
import entity.Supplier;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileUploadException;

/**
 *
 * @author DEKUPAC
 */
@MultipartConfig
@WebServlet(name = "SupplierAddController", urlPatterns = {"/SupplierAddController"})
public class SupplierAddController extends HttpServlet {

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
            throws ServletException, IOException, FileUploadException, Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 3) {
            request.getRequestDispatcher("common/error.jsp").forward(request, response);
            return;
        }
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Supplier supplier = (Supplier) session.getAttribute("supplier");
        int supplierId = supplier.getSupplierId();

        Connection conn = dbconnect.DBConnect.getConnection();
        CityDAO cityDAO = new CityDAO(conn);
        CategoryDAO cateDAO = new CategoryDAO(conn);
        SubCategoryDAO subCateDAO = new SubCategoryDAO(conn);
        ProductDAO productDAO = new ProductDAO(conn);
        DeliveryAreaDAO deliveryAreaDAO = new DeliveryAreaDAO(conn);
        ProductImageDAO productImageDAO = new ProductImageDAO(conn);
        ProductHierarchyDAO productHierarchyDAO = new ProductHierarchyDAO(conn);

        String action = request.getParameter("action");
        if (action == null || action.equals("")) {
            List<City> allCities = cityDAO.getAllCity();
            List<Category> allCates = cateDAO.getAllCategory();

            Map<Category, List<SubCategory>> mapCateSubCate = new LinkedHashMap<>();

            for (Category c : allCates) {
                List<SubCategory> subCategorys = subCateDAO.getSubcategoryByCategoryId(c.getCateId());
                mapCateSubCate.put(c, subCategorys);
            }
            request.setAttribute("allCities", allCities);
            request.setAttribute("mapCateSubCate", mapCateSubCate);
            request.getRequestDispatcher("admin-page/supplier-add-product.jsp").forward(request, response);
        } else if (action.equals("add")) {
            List<Part> listPartsImg = new ArrayList<>();
            Part img1Part = request.getPart("photo1");
            Part img2Part = request.getPart("photo2");
            Part img3Part = request.getPart("photo3");
            Part img4Part = request.getPart("photo4");
            Part img5Part = request.getPart("photo5");
            listPartsImg.add(img1Part);
            listPartsImg.add(img2Part);
            listPartsImg.add(img3Part);
            listPartsImg.add(img4Part);
            listPartsImg.add(img5Part);
            String description = request.getParameter("description");
            String barcode = request.getParameter("barcode");
            Part lincsePart = request.getPart("lincse");
            int subCate = Integer.parseInt(request.getParameter("subCate"));
            String[] cities = request.getParameterValues("cities");
            String name = request.getParameter("name");
            String trademark = request.getParameter("trademark");
            String smell = request.getParameter("smell");
            String color = request.getParameter("color");
            int weight = Integer.parseInt(request.getParameter("weight"));
            String packing = request.getParameter("packing");
            String element = request.getParameter("element");
            int weight1 = Integer.parseInt(request.getParameter("weight1"));
            int weight2 = Integer.parseInt(request.getParameter("weight2"));
            int weight3 = Integer.parseInt(request.getParameter("weight3"));
            int price1 = Integer.parseInt(request.getParameter("price1"));
            int price2 = Integer.parseInt(request.getParameter("price2"));
            int price3 = Integer.parseInt(request.getParameter("price3"));
            String creatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date());

            String realPath = request.getServletContext().getRealPath("/uploads");
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }

            Product product = new Product(1, supplierId, subCate, creatDate, description, name, barcode,
                    "lincse", trademark, smell, color, weight, packing, element, 0, 1);

            int number = 0;
            String filelincse = Paths.get(lincsePart.getSubmittedFileName()).getFileName().toString();
            if (!filelincse.equals("")) {
                int indexDot = filelincse.indexOf(".");
                SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmss");
                Date date = new Date();
                filelincse = formatter.format(date) + number + filelincse.substring(indexDot);
                lincsePart.write(realPath + "/" + filelincse);
                product.setProductCertificate(filelincse);
            }

            productDAO.saveProduct(product);
            product = productDAO.getTop1ProductNewest();

            for (Part part : listPartsImg) {
                number++;
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                if (!filename.equals("")) {
                    int indexDot = filename.indexOf(".");
                    SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmss");
                    Date date = new Date();
                    filename = formatter.format(date) + number + filename.substring(indexDot);
                    part.write(realPath + "/" + filename);
                    ProductImage proImg = new ProductImage(0, product.getProductId(), filename);
                    productImageDAO.saveProductImage(proImg);
                }
            }

            for (String cityId : cities) {
                DeliveryArea deliveryArea = new DeliveryArea();
                deliveryArea.setProductId(product.getProductId());
                deliveryArea.setCityId(Integer.parseInt(cityId));
                deliveryAreaDAO.saveDeliveryArea(deliveryArea);
            }
            ProductHierarchy productHierarchy1 = new ProductHierarchy(product.getProductId(), weight1, price1);
            ProductHierarchy productHierarchy2 = new ProductHierarchy(product.getProductId(), weight2, price2);
            ProductHierarchy productHierarchy3 = new ProductHierarchy(product.getProductId(), weight3, price3);
            productHierarchyDAO.saveProductHierarchy(productHierarchy1);
            productHierarchyDAO.saveProductHierarchy(productHierarchy2);
            productHierarchyDAO.saveProductHierarchy(productHierarchy3);
            response.sendRedirect("SupplierController");
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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(SupplierAddController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SupplierAddController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(SupplierAddController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SupplierAddController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
