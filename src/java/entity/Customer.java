/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class Customer {

    private int customerId;
    private String customerName;
    private int accId;
    private String dateBirth;
    private String gender;
    private String email;
    private String phone;
    private String shopName;
    private String mainAddress;
    private int cityId;
    private String businessLicense;
    private String avartarImg;

    public Customer() {
    }

    public Customer(int customerId, String customerName, int accId, String dateBirth, String gender, String email, String phone, String shopName, String mainAddress, int cityId, String businessLicense, String avartarImg) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.accId = accId;
        this.dateBirth = dateBirth;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.shopName = shopName;
        this.mainAddress = mainAddress;
        this.cityId = cityId;
        this.businessLicense = businessLicense;
        this.avartarImg = avartarImg;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public String getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(String dateBirth) {
        this.dateBirth = dateBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getMainAddress() {
        return mainAddress;
    }

    public void setMainAddress(String mainAddress) {
        this.mainAddress = mainAddress;
    }

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public String getBusinessLicense() {
        return businessLicense;
    }

    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense;
    }

    public String getAvartarImg() {
        return avartarImg;
    }

    public void setAvartarImg(String avartarImg) {
        this.avartarImg = avartarImg;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerId=" + customerId + ", customerName=" + customerName + ", accId=" + accId + ", dateBirth=" + dateBirth + ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", shopName=" + shopName + ", mainAddress=" + mainAddress + ", city=" + cityId + ", businessLicense=" + businessLicense + ", avartarImg=" + avartarImg + '}';
    }
}
