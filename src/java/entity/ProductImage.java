/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class ProductImage {
    private int productImageId;
    private int producId;
    private String ImgPath;

    public ProductImage() {
    }
    public ProductImage(int productImageId, int producId, String ImgPath) {
        this.productImageId = productImageId;
        this.producId = producId;
        this.ImgPath = ImgPath;
    }

    public int getProductImageId() {
        return productImageId;
    }

    public void setProductImageId(int productImageId) {
        this.productImageId = productImageId;
    }

    public int getProducId() {
        return producId;
    }

    public void setProducId(int producId) {
        this.producId = producId;
    }

    public String getImgPath() {
        return ImgPath;
    }

    public void setImgPath(String ImgPath) {
        this.ImgPath = ImgPath;
    }

    @Override
    public String toString() {
        return "ProductImage{" + "productImageId=" + productImageId + ", producId=" + producId + ", ImgPath=" + ImgPath + '}';
    }

   
}
