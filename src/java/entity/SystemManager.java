/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class SystemManager {
    private int id;
    private String name;
    private int accId;
    private String dateBirth;
    private String gender;
    private String email;
    private String phone;
    private String avartarImg;

    public SystemManager() {
    }

    public SystemManager(int id, String name, int accId, String dateBirth, String gender, String email, String phone, String avartarImg) {
        this.id = id;
        this.name = name;
        this.accId = accId;
        this.dateBirth = dateBirth;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.avartarImg = avartarImg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getAvartarImg() {
        return avartarImg;
    }

    public void setAvartarImg(String avartarImg) {
        this.avartarImg = avartarImg;
    }

    @Override
    public String toString() {
        return "SystemManager{" + "id=" + id + ", name=" + name + ", accId=" + accId + ", dateBirth=" + dateBirth + ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", avartarImg=" + avartarImg + '}';
    }

    
}
