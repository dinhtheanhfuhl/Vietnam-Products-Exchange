/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validate;

import entity.DeliveryArea;
import entity.Product;
import entity.ProductHierarchy;
import java.util.List;
import javax.servlet.http.Part;

/**
 *
 * @author DEKUPAC
 */
public class Validation {

    public static boolean validateString(String str, int minLength, int maxLength) {
        String pattern = "^[a-zA-Z0-9\\p{L} ]{" + minLength + "," + maxLength + "}$";
        return str.matches(pattern);
    }

    public static boolean validateLongString(String str, int minLength, int maxLength) {
        String pattern = "^[a-zA-Z0-9,.\n\\p{L} ]{" + minLength + "," + maxLength + "}$";
        return str.matches(pattern);
    }

    public static boolean validateNumber(String str, int minLength, int maxLength) {
        String pattern = "^[0-9]{" + minLength + "," + maxLength + "}$";
        return str.matches(pattern);
    }

    public static boolean validateSaveProduct(Product product, List<Part> imgParts, Part licensePart, List<DeliveryArea> delis, List<ProductHierarchy> hierarchies) throws Exception {
        if (validateLongString(product.getDescription(), 1, 255)
                && validateNumber(product.getBarCode(), 8, 13)
                && validateNumber(String.valueOf(product.getSubCateId()), 1, Integer.MAX_VALUE)
                && validateString(product.getProductName(), 1, 50)
                && validateString(product.getTrademark(), 1, 50)
                && validateString(product.getSmell(), 1, 50)
                && validateNumber(String.valueOf(product.getWeight()), 1, Integer.MAX_VALUE)) {
        } else {
            throw new Exception("invalid product value");
        }
        if (imgParts.size() < 2) {
            throw new Exception("invalid number img");
        }
        for (Part imgPart : imgParts) {
            if (imgPart.getSize() > 1024 * 1024 * 50) {
                throw new Exception("invalid size image");
            }
        }
        if (licensePart.getSubmittedFileName().equals("") || licensePart.getSize() > 1024 * 1024 * 50) {
            throw new Exception("invalid file license");
        }
        if (delis.size() <= 0) {
            throw new Exception("invalid size delivary area");
        }
        if (hierarchies.size() != 3) {
            throw new Exception("invalid size hirachy");
        }
        for (int i = 0; i < hierarchies.size() - 1; i++) {
            if (hierarchies.get(i).getQuantity() > hierarchies.get(i + 1).getQuantity()
                    || hierarchies.get(i).getPrice() > hierarchies.get(i + 1).getPrice()) {
                throw new Exception("invalid hierachies");
            }
        }
        return true;
    }
}
