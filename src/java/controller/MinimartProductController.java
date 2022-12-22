package controller;

import dao.CategoryDAO;
import dao.CityDAO;
import dao.ProductDAO;
import dao.ProductHierarchyDAO;
import dao.ProductImageDAO;
import dao.SubCategoryDAO;
import dbconnect.DBConnect;
import entity.Category;
import entity.City;
import entity.Product;
import entity.ProductHierarchy;
import entity.ProductImage;
import entity.SubCategory;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ductd
 */
public class MinimartProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        Connection connection = DBConnect.getConnection();
        ProductDAO productDAO = new ProductDAO(connection);
        CategoryDAO categoryDAO = new CategoryDAO(connection);
        ProductImageDAO productImageDAO = new ProductImageDAO(connection);
        SubCategoryDAO subcategoryDAO = new SubCategoryDAO(connection);
        CityDAO cityDAO = new CityDAO(connection);
        ProductHierarchyDAO productHierarchyDAO = new ProductHierarchyDAO(connection);

        String cid = request.getParameter("cid");
        String txtSearch = request.getParameter("txtSearch");
        String filter1 = request.getParameter("filter1");
        List<Integer> productIds = new ArrayList<>();

        String begin = "", end = "", cityId = "";
        String[] subCateIds = null;
        if (filter1 != null) {
            begin = request.getParameter("begin").trim();
            end = request.getParameter("end").trim();
            subCateIds = request.getParameterValues("subCateId");
            cityId = request.getParameter("cityId");
            request.setAttribute("begin", begin);
            request.setAttribute("end", end);
            request.setAttribute("cityId", cityId);
            request.setAttribute("subCateIds", subCateIds);
            request.setAttribute("filter1", filter1);
            if (subCateIds != null) {
                Map<Integer, Integer> mapSubCateSelected = new LinkedHashMap<>();
                for (String id : subCateIds) {
                    mapSubCateSelected.put(Integer.parseInt(id), Integer.parseInt(id));
                }
                request.setAttribute("mapSubCateSelected", mapSubCateSelected);
            }
        }

        if (cid != null && txtSearch == null) {
            if (filter1 != null) {
                productIds = productDAO.searchProductForMart(begin, end, cityId, cid, subCateIds, null);
            } else {
                productIds = productDAO.searchProductForMart(null, null, null, cid, null, null);
            }
            request.setAttribute("cid", cid);
            int cidInt = Integer.parseInt(cid);
            Category cateName = categoryDAO.getCateNameById(cidInt);
            request.setAttribute("cateName", cateName.getCateName());
        } else if (txtSearch != null && cid == null) {
            if (filter1 != null) {
                productIds = productDAO.searchProductForMart(begin, end, cityId, null, subCateIds, txtSearch);
            } else {
                productIds = productDAO.searchProductForMart(null, null, null, null, null, txtSearch);
            }
            request.setAttribute("txtSearch", txtSearch);
        }

        List<Product> resultProducts = new ArrayList<>();
        for (int id : productIds) {
            Product pro = productDAO.getProductByIdNotHidden(id);
            if (pro != null) {
                resultProducts.add(pro);
            }
        }

        Map<Product, List<ProductImage>> mapImages = new LinkedHashMap<>();
        for (Product product : resultProducts) {
            List<ProductImage> images = productImageDAO.getAllProductsImageByProId(product.getProductId());
            mapImages.put(product, images);
        }

        Map<Product, List<ProductHierarchy>> mapHierarchy = new LinkedHashMap<>();
        for (Product product : resultProducts) {
            List<ProductHierarchy> hierarchy = productHierarchyDAO.getAllHieByProId(product.getProductId());
            mapHierarchy.put(product, hierarchy);
        }

        Map<Product, List<City>> mapCity = new LinkedHashMap<>();
        for (Product product : resultProducts) {
            List<City> city = cityDAO.getCitiesByProductId(product.getProductId());
            mapCity.put(product, city);
        }

        request.setAttribute("mapImages", mapImages);
        request.setAttribute("mapHierarchy", mapHierarchy);
        request.setAttribute("mapCity", mapCity);
        request.setAttribute("resultProducts", resultProducts);

        List<Category> allCate = categoryDAO.getAllCategory();
        request.setAttribute("listCate", allCate);

        List<City> allCities = cityDAO.getAllCity();
        request.setAttribute("allCities", allCities);

        List<SubCategory> allSubCategory = subcategoryDAO.getAllSubCateByCateId(cid);
        request.setAttribute("allSubCategory", allSubCategory);

        request.getRequestDispatcher("./common/fruit.jsp").forward(request, response);

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
