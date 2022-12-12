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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "SupplierDetailPController", urlPatterns = {"/SupplierDetailPController"})
public class SupplierDetailPController extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Supplier supplier = (Supplier) session.getAttribute("supplier");
        int supplierId = supplier.getSupplierId();

        Connection conn = dbconnect.DBConnect.getConnection();
        ProductDAO productDAO = new ProductDAO(conn);
        ProductHierarchyDAO proHieDAO = new ProductHierarchyDAO(conn);
        ProductImageDAO proImgDAO = new ProductImageDAO(conn);
        DeliveryAreaDAO deliDAO = new DeliveryAreaDAO(conn);
        CityDAO cityDAO = new CityDAO(conn);
        CategoryDAO cateDAO = new CategoryDAO(conn);
        SubCategoryDAO subcateDAO = new SubCategoryDAO(conn);

        String action = request.getParameter("action");
        if (action == null || action.equals("")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(id);
            List<ProductHierarchy> listProHies = proHieDAO.getHierarchyByProId(id);
            List<ProductImage> listProImgs = proImgDAO.getAllProductsImageByProId(id);
            List<DeliveryArea> listDelivery = deliDAO.getDeliverysAreaByProductId(id);
            List<City> listCities = new ArrayList<>();
            SubCategory subCate = subcateDAO.getSubCategoryById(product.getSubCateId());
            Category cate = cateDAO.getCategoryById(subCate.getCateId());
            for (DeliveryArea deliveryArea : listDelivery) {
                City city = cityDAO.getCityById(deliveryArea.getCityId());
                listCities.add(city);
            }

            request.setAttribute("listProHies", listProHies);
            request.setAttribute("listProImgs", listProImgs);
            request.setAttribute("listCities", listCities);
            request.setAttribute("cate", cate);
            request.setAttribute("product", product);
            request.getRequestDispatcher("admin-page/supplier-product-detail.jsp").forward(request, response);
        } else if (action.equals("cancel")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(id);
            List<ProductHierarchy> listProHies = proHieDAO.getHierarchyByProId(id);
            List<ProductImage> listProImgs = proImgDAO.getAllProductsImageByProId(id);
            List<DeliveryArea> listDelivery = deliDAO.getDeliverysAreaByProductId(id);

            // xoa cac row trong db
            int statusDelProHie = proHieDAO.deleteProductHierarchyByProId(id);
            int statusDelProImg = proImgDAO.deleteProductImageByProId(id);
            int statusDelDeli = deliDAO.deleteDeliveryAreaByProId(id);
            int statusDelPro = productDAO.deleteProduct(product);

            // xoa file trong folder
            String filename;
            javax.servlet.ServletContext servletContext = this.getServletConfig().getServletContext();
            for (ProductImage image : listProImgs) {
                filename = image.getImgPath();
                Path path = Paths.get(filename);
                String storePath = servletContext.getRealPath("/uploads");
                File pathFile = new File(storePath + "/" + path.getFileName());
                boolean statusDelFile = pathFile.delete();
            }
            filename = product.getProductCertificate();
            Path path = Paths.get(filename);
            String storePath = servletContext.getRealPath("/uploads");
            File pathFile = new File(storePath + "/" + path.getFileName());
            boolean statusDelFile = pathFile.delete();
            response.sendRedirect("SupplierController");
        } else if (action.equals("hidden")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(id);
            product.setStatusId(4);
            int status = productDAO.updateProduct(product);
            response.sendRedirect("SupplierDetailPController?id=" + product.getProductId());
        } else if (action.equals("cancel-hidden")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(id);
            product.setStatusId(2);
            int status = productDAO.updateProduct(product);
            response.sendRedirect("SupplierDetailPController?id=" + product.getProductId());
        } else if (action.equals("re-request")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Product pro = productDAO.getProductById(id);
            request.setAttribute("pro", pro);
            // get list produdct's image
            List<ProductImage> proImgs = proImgDAO.getAllProductsImageByProId(id);
            request.setAttribute("proImgs", proImgs);
            Map<Integer, Integer> mapCityOld = new LinkedHashMap<>();
            List<DeliveryArea> delis = deliDAO.getDeliverysAreaByProductId(id);
            for (DeliveryArea deli : delis) {
                mapCityOld.put(deli.getCityId(), 1);
            }
            request.setAttribute("mapCityOld", mapCityOld);
            List<ProductHierarchy> proHies = proHieDAO.getAllHieByProIdAsc(id);
            request.setAttribute("proHies", proHies);
            SubCategory subCate = subcateDAO.getSubCategoryById(pro.getSubCateId());
            request.setAttribute("subCateId", subCate.getSubCateId());

            List<Category> allCates = cateDAO.getAllCategory();
            Map<Category, List<SubCategory>> mapCateAndSupCate = new LinkedHashMap<>();
            for (Category cate : allCates) {
                List<SubCategory> subCates = subcateDAO.getAllSubCateByCateId(String.valueOf(cate.getCateId()));
                mapCateAndSupCate.put(cate, subCates);
            }
            List<City> allCities = cityDAO.getAllCity();
            request.setAttribute("allCities", allCities);
            request.setAttribute("mapCateAndSupCate", mapCateAndSupCate);
            request.getRequestDispatcher("admin-page/supplier-edit-product.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Part img1Part = request.getPart("photo1");
            Part img2Part = request.getPart("photo2");
            Part img3Part = request.getPart("photo3");
            Part img4Part = request.getPart("photo4");
            Part img5Part = request.getPart("photo5");
            String description = request.getParameter("description");
            String barcode = request.getParameter("barcode");
            Part lincsePart = request.getPart("lincse");
            int subCate = Integer.parseInt(request.getParameter("category"));
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
            Product oldProduct = productDAO.getProductById(id);
            Product product = new Product(id, supplierId, subCate, creatDate, description, name,
                    barcode, oldProduct.getProductCertificate(), trademark, smell, color, weight, packing, element, 0, 1);
            
            List<ProductImage> proImgsOld = proImgDAO.getAllProductsImageByProId(id);
            List<Part> proImgsUpdate = new ArrayList<>();
            proImgsUpdate.add(img1Part);
            proImgsUpdate.add(img2Part);
            proImgsUpdate.add(img3Part);
            proImgsUpdate.add(img4Part);
            proImgsUpdate.add(img5Part);
            String realPath = request.getServletContext().getRealPath("/uploads");
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            int number = 0;
            for (int i = 0; i < proImgsUpdate.size(); i++) {
                // save new image into folder
                number++;
                String filename = Paths.get(proImgsUpdate.get(i).getSubmittedFileName()).getFileName().toString();
                int indexDot = filename.indexOf(".");
                SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmss");
                Date date = new Date();
                filename = formatter.format(date) + number + filename.substring(indexDot);
                proImgsUpdate.get(i).write(realPath + "/" + filename);
                ProductImage proImg = new ProductImage(0, id, filename);
                int statusAdd = proImgDAO.saveProductImage(proImg);
                if (i < proImgsOld.size() && !proImgsUpdate.get(i).getSubmittedFileName().equals("")) {
                    // delete old image 
                    filename = proImgsOld.get(i).getImgPath();
                    Path path = Paths.get(filename);
                    File pathFile = new File(realPath + "/" + path.getFileName());
                    boolean statusDelFile = pathFile.delete();
                    int statusDelImgOld = proImgDAO.deleteProductImage(proImgsOld.get(i));
                }
            }
               
            String filelincse = Paths.get(lincsePart.getSubmittedFileName()).getFileName().toString();
            if (!filelincse.equals("")) {
                int indexDot = filelincse.indexOf(".");
                SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyyHHmmss");
                Date date = new Date();
                filelincse = formatter.format(date) + number + filelincse.substring(indexDot);
                lincsePart.write(realPath + "/" + filelincse);
                product.setProductCertificate(filelincse);
            }
            int statusAddPro = productDAO.updateProduct(product);
            // delete prohierachy
            int statusDelProHie = proHieDAO.deleteProductHierarchyByProId(id);
            // delete deliveryArea 
            int statusDelDeli = deliDAO.deleteDeliveryAreaByProId(id);
            // add new prohierachy
            ProductHierarchy productHierarchy1 = new ProductHierarchy(id, weight1, price1);
            ProductHierarchy productHierarchy2 = new ProductHierarchy(id, weight2, price2);
            ProductHierarchy productHierarchy3 = new ProductHierarchy(id, weight3, price3);
            int statusAddHie1 = proHieDAO.saveProductHierarchy(productHierarchy1);
            int statusAddHie2 = proHieDAO.saveProductHierarchy(productHierarchy2);
            int statusAddHie3 = proHieDAO.saveProductHierarchy(productHierarchy3);
            // add new deliveryArea
            for (String city : cities) {
                int cityId = Integer.parseInt(city);
                int statusAddDeli = deliDAO.saveDeliveryArea(new DeliveryArea(id, cityId));
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
