/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class DeliveryArea {
    private int productId;
    private int cityId;

    public DeliveryArea() {
    }

    public DeliveryArea(int productId, int cityId) {
        this.productId = productId;
        this.cityId = cityId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    @Override
    public String toString() {
        return "DeliveryArea{" + "productId=" + productId + ", cityId=" + cityId + '}';
    }
    
}
