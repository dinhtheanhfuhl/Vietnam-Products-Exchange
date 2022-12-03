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
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author DEKUPAC
 */
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
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
            // add file anh va file giay phep vao uploads
            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();

            // Configure a repository (to ensure a secure temp location is used)
            javax.servlet.ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            List<FileItem> items = upload.parseRequest(request);
            // Process the uploaded items
            Iterator<FileItem> iter = items.iterator();

            List<String> fileImages = new ArrayList<>();
            String fileLincse = "";

            String description = null;
            String barcode = null;
            int subCateId = 0;
            List<String> cities = new ArrayList<>();
            String nameP = null;
            String trademark = null;
            String taste = null;
            String color = null;
            int weight = 0;
            String packaging = null;
            String composition = null;
            int weight1 = 0;
            int weight2 = 0;
            int weight3 = 0;
            int price1 = 0;
            int price2 = 0;
            int price3 = 0;

            int number = 0;
            while (iter.hasNext()) {
                FileItem item = iter.next();
                if (!item.isFormField()) {
                    number++;
                    String filename = item.getName();
                    if (filename == null || filename.equals("")) {
                        continue;
                    } else {
                        int indexDot = filename.indexOf(".");
                        SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmss");
                        Date date = new Date();
                        filename = formatter.format(date) + number + filename.substring(indexDot);

                        if (item.getFieldName().equals("lincse")) {
                            fileLincse = filename;
                        } else {
                            fileImages.add(filename);
                        }
                        Path path = Paths.get(filename);
                        String storePath = servletContext.getRealPath("/uploads");

                        if (!Files.exists(Paths.get(storePath))) {
                            Files.createDirectories(Paths.get(storePath));
                        }

                        File uploadFile = new File(storePath + "/" + path.getFileName());
                        item.write(uploadFile);
                    }
                } else {
                    String name = item.getFieldName();
                    String value = item.getString();
                    if (name.equals("description")) {
                        description = value;
                    }
                    if (name.equals("barcode")) {
                        barcode = value;
                    }
                    if (name.equals("category")) {
                        subCateId = Integer.parseInt(value);
                    }
                    if (name.equals("cities")) {
                        cities.add(value);
                    }
                    if (name.equals("name")) {
                        nameP = value;
                    }
                    if (name.equals("trademark")) {
                        trademark = value;
                    }
                    if (name.equals("taste")) {
                        taste = value;
                    }
                    if (name.equals("color")) {
                        color = value;
                    }
                    if (name.equals("weight")) {
                        weight = Integer.parseInt(value);
                    }
                    if (name.equals("packaging")) {
                        packaging = value;
                    }
                    if (name.equals("composition")) {
                        composition = value;
                    }
                    if (name.equals("weight1")) {
                        weight1 = Integer.valueOf(value);
                    }
                    if (name.equals("weight2")) {
                        weight2 = Integer.valueOf(value);

                    }
                    if (name.equals("weight3")) {
                        weight3 = Integer.valueOf(value);

                    }
                    if (name.equals("price1")) {
                        price1 = Integer.valueOf(value);

                    }
                    if (name.equals("price2")) {
                        price2 = Integer.valueOf(value);

                    }
                    if (name.equals("price3")) {
                        price3 = Integer.valueOf(value);

                    }
                }
            }

            // add nhung field la field form
            Product product = new Product();
            product.setSupplierId(supplierId);
            product.setSubCateId(subCateId);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
            String dateStr = df.format(new Date());
            product.setCreatedDate(dateStr);
            product.setDescription(description);
            product.setProductName(nameP);
            product.setBarCode(barcode);
            product.setProductCertificate(fileLincse);
            product.setTrademark(trademark);
            product.setSmell(taste);
            product.setColor(color);
            product.setWeight(weight);
            product.setPacking(packaging);
            product.setElement(composition);
            product.setViewNumber(0);
            product.setStatusId(1);
            int status = productDAO.saveProduct(product);

            Product productNewest = productDAO.getTop1ProductNewest();
            int productNewestId = productNewest.getProductId();

            for (String cityId : cities) {
                DeliveryArea deliveryArea = new DeliveryArea();
                deliveryArea.setProductId(productNewestId);
                deliveryArea.setCityId(Integer.parseInt(cityId));
                int statusC = deliveryAreaDAO.saveDeliveryArea(deliveryArea);
            }
            for (String image : fileImages) {
                ProductImage productImage = new ProductImage();
                productImage.setProducId(productNewestId);
                productImage.setImgPath(image);
                int statusI = productImageDAO.saveProductImage(productImage);
            }
            ProductHierarchy productHierarchy1 = new ProductHierarchy(productNewestId, weight1, price1);
            ProductHierarchy productHierarchy2 = new ProductHierarchy(productNewestId, weight2, price2);
            ProductHierarchy productHierarchy3 = new ProductHierarchy(productNewestId, weight3, price3);
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
