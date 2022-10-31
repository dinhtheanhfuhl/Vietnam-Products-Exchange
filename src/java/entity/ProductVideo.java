/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class ProductVideo {
    private int ProductVideoId;
    private int productId;
    private String videoPath;

    public ProductVideo() {
    }

    public ProductVideo(int ProductVideoId, int productId, String videoPath) {
        this.ProductVideoId = ProductVideoId;
        this.productId = productId;
        this.videoPath = videoPath;
    }

    public int getProductVideoId() {
        return ProductVideoId;
    }

    public void setProductVideoId(int ProductVideoId) {
        this.ProductVideoId = ProductVideoId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    @Override
    public String toString() {
        return "ProductVideo{" + "ProductVideoId=" + ProductVideoId + ", productId=" + productId + ", videoPath=" + videoPath + '}';
    }

    
}
