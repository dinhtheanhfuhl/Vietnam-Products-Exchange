/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author DEKUPAC
 */
public class SubCategory {
    private int subCateId;
    private String subCateName;
    private int cateId;

    public SubCategory() {
    }

    public SubCategory(int subCateId, String subCateName, int cateId) {
        this.subCateId = subCateId;
        this.subCateName = subCateName;
        this.cateId = cateId;
    }

    public int getSubCateId() {
        return subCateId;
    }

    public void setSubCateId(int subCateId) {
        this.subCateId = subCateId;
    }

    public String getSubCateName() {
        return subCateName;
    }

    public void setSubCateName(String subCateName) {
        this.subCateName = subCateName;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    @Override
    public String toString() {
        return "SubCategory{" + "subCateId=" + subCateId + ", subCateName=" + subCateName + ", cateId=" + cateId + '}';
    }
    
}
