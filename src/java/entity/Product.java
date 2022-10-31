/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class Product {
    private int productId;
    private int supplierId;
    private int subCateId;
    private String createdDate;
    private String requestCode;
    private String productName;
    private String barCode;
    private String productCertificate;
    private String trademark;
    private String smell;
    private String color;
    private int weight;
    private String packing;
    private String element;
    private int statusId;

    public Product() {
    }

    public Product(int productId, int supplierId, int subCateId, String createdDate, String requestCode, String productName, String barCode, String productCertificate, String trademark, String smell, String color, int weight, String packing, String element, int statusId) {
        this.productId = productId;
        this.supplierId = supplierId;
        this.subCateId = subCateId;
        this.createdDate = createdDate;
        this.requestCode = requestCode;
        this.productName = productName;
        this.barCode = barCode;
        this.productCertificate = productCertificate;
        this.trademark = trademark;
        this.smell = smell;
        this.color = color;
        this.weight = weight;
        this.packing = packing;
        this.element = element;
        this.statusId = statusId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public int getSubCateId() {
        return subCateId;
    }

    public void setSubCateId(int subCateId) {
        this.subCateId = subCateId;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getRequestCode() {
        return requestCode;
    }

    public void setRequestCode(String requestCode) {
        this.requestCode = requestCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getBarCode() {
        return barCode;
    }

    public void setBarCode(String barCode) {
        this.barCode = barCode;
    }

    public String getProductCertificate() {
        return productCertificate;
    }

    public void setProductCertificate(String productCertificate) {
        this.productCertificate = productCertificate;
    }

    public String getTrademark() {
        return trademark;
    }

    public void setTrademark(String trademark) {
        this.trademark = trademark;
    }

    public String getSmell() {
        return smell;
    }

    public void setSmell(String smell) {
        this.smell = smell;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getPacking() {
        return packing;
    }

    public void setPacking(String packing) {
        this.packing = packing;
    }

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", supplierId=" + supplierId + ", subCateId=" + subCateId + ", createdDate=" + createdDate + ", requestCode=" + requestCode + ", productName=" + productName + ", barCode=" + barCode + ", productCertificate=" + productCertificate + ", trademark=" + trademark + ", smell=" + smell + ", color=" + color + ", weight=" + weight + ", packing=" + packing + ", element=" + element + ", statusId=" + statusId + '}';
    }
}
