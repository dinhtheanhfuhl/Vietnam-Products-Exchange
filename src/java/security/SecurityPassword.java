package security;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecurityPassword {
        public static String encrypt(String srcText) throws NoSuchAlgorithmException, UnsupportedEncodingException{
        String enrText;
        MessageDigest msd = MessageDigest.getInstance("MD5");
        byte[] srcTextBytes = srcText.getBytes("UTF-8");
        byte[] enrTextBytes = msd.digest(srcTextBytes);
        BigInteger bigInt = new BigInteger(1, enrTextBytes);
        enrText = bigInt.toString();
        return enrText;
    }
}
