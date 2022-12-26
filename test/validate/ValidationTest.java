/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package validate;

import entity.DeliveryArea;
import entity.Product;
import entity.ProductHierarchy;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.Part;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author DEKUPAC
 */
public class ValidationTest {

    public ValidationTest() {
        String str = "dame bor";
        boolean rs = validate.Validation.validateString(str, 1, 10);
        assertEquals(rs, true);
    }

    @Test
    public void testValidateSaveProduct() throws Exception {
        Product product = new Product();
        product.setDescription("mo ta san pham");
        product.setBarCode("0123456789");
        product.setSubCateId(1);
        product.setProductName("apple ha noi");
        product.setTrademark("vải đông anh");
        product.setSmell("hôi rình");
        product.setWeight(1000000);
        List<Part> imgParts = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            Part part = new Part() {
                @Override
                public InputStream getInputStream() throws IOException {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public String getContentType() {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public String getName() {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public String getSubmittedFileName() {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public long getSize() {
                    return 1024 * 1024 * 50;
                }

                @Override
                public void write(String fileName) throws IOException {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public void delete() throws IOException {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public String getHeader(String name) {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public Collection<String> getHeaders(String name) {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }

                @Override
                public Collection<String> getHeaderNames() {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }
            };
            imgParts.add(part);
        }
        Part licensePart = new Part() {
            @Override
            public InputStream getInputStream() throws IOException {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public String getContentType() {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public String getName() {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public String getSubmittedFileName() {
                return "dauxanh.txt";
            }

            @Override
            public long getSize() {
                return 1024 * 1024 * 50;
            }

            @Override
            public void write(String fileName) throws IOException {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public void delete() throws IOException {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public String getHeader(String name) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public Collection<String> getHeaders(String name) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public Collection<String> getHeaderNames() {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }
        };
        List<DeliveryArea> delis = new ArrayList<>();
        delis.add(new DeliveryArea());
        List<ProductHierarchy> hierarchies = new ArrayList<>();
        hierarchies.add(new ProductHierarchy(0, 1, 1));
        hierarchies.add(new ProductHierarchy(0, 2, 2));
        hierarchies.add(new ProductHierarchy(0, 3, 4));
        boolean rs = validate.Validation.validateSaveProduct(product, imgParts, licensePart, delis, hierarchies);
        boolean expected = true;
        assertEquals(rs, expected);
    }
}
