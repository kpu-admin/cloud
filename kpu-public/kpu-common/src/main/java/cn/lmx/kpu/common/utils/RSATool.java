package cn.lmx.kpu.common.utils;

import cn.hutool.core.codec.Base64;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.asymmetric.AsymmetricAlgorithm;
import cn.hutool.crypto.asymmetric.AsymmetricCrypto;
import cn.hutool.crypto.asymmetric.KeyType;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.io.ByteArrayOutputStream;
import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.interfaces.RSAPrivateCrtKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Objects;

import static cn.hutool.crypto.asymmetric.AsymmetricAlgorithm.RSA;
import static cn.hutool.crypto.asymmetric.AsymmetricAlgorithm.RSA_ECB_PKCS1;

/**
 * RSA加解密工具<br>
 *
 * @author 六如
 */
public class RSATool {
    private static final String RSA_ALGORITHM = RSA.getValue();

    private final KeyFormat keyFormat;
    private final KeyLength keyLength;

    public RSATool(KeyFormat keyFormat, KeyLength keyLength) {
        this.keyFormat = keyFormat;
        this.keyLength = keyLength;
    }

    /**
     * 创建公钥私钥
     *
     * @return 返回公私钥对
     * @throws Exception
     */
    public KeyStore createKeys() throws Exception {
        KeyPair keyPair = SecureUtil.generateKeyPair(RSA_ALGORITHM, keyLength.getLength());

        RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
        RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();

        KeyStore keyStore = new KeyStore();
        if (this.keyFormat == KeyFormat.PKCS1) {
            keyStore.setPublicKey(Base64.encode(publicKey.getEncoded()));
            keyStore.setPrivateKey(convertPkcs8ToPkcs1(privateKey.getEncoded()));
        } else {
            keyStore.setPublicKey(Base64.encode(publicKey.getEncoded()));
            keyStore.setPrivateKey(Base64.encode(privateKey.getEncoded()));
        }
        return keyStore;
    }

    /**
     * 获取公钥对象
     *
     * @param pubKeyData 公钥
     * @return 返回公钥对象
     * @throws Exception
     */
    public RSAPublicKey getPublicKey(byte[] pubKeyData) throws Exception {
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(pubKeyData);
        KeyFactory keyFactory = KeyFactory.getInstance(RSA_ALGORITHM);
        return (RSAPublicKey) keyFactory.generatePublic(keySpec);
    }

    /**
     * 获取公钥对象
     *
     * @param pubKey 公钥
     * @return 返回私钥对象
     * @throws Exception
     */
    public RSAPublicKey getPublicKey(String pubKey) throws Exception {
        return getPublicKey(Base64.encode(pubKey));

    }

    /**
     * 获取私钥对象
     *
     * @param priKey 私钥
     * @return 私钥对象
     * @throws Exception
     */
    public RSAPrivateKey getPrivateKey(String priKey) throws Exception {
        return getPrivateKey(Base64.encode(priKey));
    }

    /**
     * 通过私钥byte[]将公钥还原，适用于RSA算法
     *
     * @param keyBytes
     * @return 返回私钥
     * @throws Exception
     */
    public RSAPrivateKey getPrivateKey(byte[] keyBytes) throws Exception {
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance(RSA_ALGORITHM);
        return (RSAPrivateKey) keyFactory.generatePrivate(keySpec);

    }

    /**
     * 公钥加密
     *
     * @param data      待加密内容
     * @param publicKey 公钥
     * @return 返回密文
     * @throws Exception
     */
    public String encryptByPublicKey(String data, RSAPublicKey publicKey) throws Exception {
        AsymmetricCrypto crypto = createCrypto(null, publicKey);
        return bcd2Str(crypto.encrypt(data.getBytes(), KeyType.PublicKey));
    }

    public String encryptByPrivateKey(String data, String privateKey) throws Exception {
        return encryptByPrivateKey(data, getPrivateKey(privateKey));
    }

    /**
     * 私钥加密
     *
     * @param data       待加密数据
     * @param privateKey 私钥
     * @return 返回密文
     * @throws Exception
     */
    public String encryptByPrivateKey(String data, RSAPrivateKey privateKey) throws Exception {
        AsymmetricCrypto crypto = createCrypto(privateKey, null);
        return bcd2Str(crypto.encrypt(data.getBytes(), KeyType.PrivateKey));
    }

    public String decryptByPrivateKey(String data, String privateKey) throws Exception {
        return decryptByPrivateKey(data, getPrivateKey(privateKey));
    }

    /**
     * 私钥解密
     *
     * @param data       待解密内容
     * @param privateKey 私钥
     * @return 返回明文
     * @throws Exception
     */
    public String decryptByPrivateKey(String data, RSAPrivateKey privateKey) throws Exception {
        byte[] bytes = data.getBytes();
        byte[] bcd = asciiToBcd(bytes, bytes.length);
        AsymmetricCrypto crypto = createCrypto(privateKey, null);
        return new String(crypto.decrypt(bcd, KeyType.PrivateKey));
    }

    /**
     * 公钥解密
     *
     * @param data         待解密内容
     * @param rsaPublicKey 公钥
     * @return 返回明文
     * @throws Exception
     */
    public String decryptByPublicKey(String data, RSAPublicKey rsaPublicKey) throws Exception {
        byte[] bytes = data.getBytes();
        byte[] bcd = asciiToBcd(bytes, bytes.length);
        AsymmetricCrypto crypto = createCrypto(null, rsaPublicKey);
        return new String(crypto.decrypt(bcd, KeyType.PublicKey));
    }

    private AsymmetricCrypto createCrypto(RSAPrivateKey privateKey, RSAPublicKey publicKey) {
        AsymmetricCrypto crypto = new AsymmetricCrypto(keyFormat.getAlgorithm(), privateKey, publicKey);
        int keyLen = (privateKey == null ? publicKey.getModulus() : privateKey.getModulus()).bitLength() / 8;
        crypto.setEncryptBlockSize(keyLen - 11);
        crypto.setDecryptBlockSize(keyLen);
        return crypto;
    }

    public static String convertPkcs8ToPkcs1(byte[] privateKeyData) throws Exception {
        KeyFactory keyFactory = KeyFactory.getInstance(RSA_ALGORITHM);
        PrivateKey privateKey = keyFactory.generatePrivate(new PKCS8EncodedKeySpec(privateKeyData));
        if (!(privateKey instanceof RSAPrivateCrtKey)) {
            throw new IllegalArgumentException("Private key is not an RSA CRT private key");
        }
        return Base64.encode(encodePkcs1PrivateKey((RSAPrivateCrtKey) privateKey));
    }

    private static byte[] encodePkcs1PrivateKey(RSAPrivateCrtKey privateKey) {
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        writeDerInteger(body, BigInteger.ZERO);
        writeDerInteger(body, privateKey.getModulus());
        writeDerInteger(body, privateKey.getPublicExponent());
        writeDerInteger(body, privateKey.getPrivateExponent());
        writeDerInteger(body, privateKey.getPrimeP());
        writeDerInteger(body, privateKey.getPrimeQ());
        writeDerInteger(body, privateKey.getPrimeExponentP());
        writeDerInteger(body, privateKey.getPrimeExponentQ());
        writeDerInteger(body, privateKey.getCrtCoefficient());

        ByteArrayOutputStream sequence = new ByteArrayOutputStream();
        sequence.write(0x30);
        writeDerLength(sequence, body.size());
        sequence.writeBytes(body.toByteArray());
        return sequence.toByteArray();
    }

    private static void writeDerInteger(ByteArrayOutputStream out, BigInteger value) {
        byte[] bytes = value.toByteArray();
        out.write(0x02);
        writeDerLength(out, bytes.length);
        out.writeBytes(bytes);
    }

    private static void writeDerLength(ByteArrayOutputStream out, int length) {
        if (length < 128) {
            out.write(length);
            return;
        }

        int size = 1;
        int value = length;
        while ((value >>>= 8) != 0) {
            size++;
        }
        out.write(0x80 | size);
        for (int i = (size - 1) * 8; i >= 0; i -= 8) {
            out.write(length >>> i);
        }
    }


    /**
     * ASCII码转BCD码
     */
    public static byte[] asciiToBcd(byte[] ascii, int asc_len) {
        byte[] bcd = new byte[asc_len / 2];
        int j = 0;
        for (int i = 0; i < (asc_len + 1) / 2; i++) {
            bcd[i] = ascToBcd(ascii[j++]);
            bcd[i] = (byte) (((j >= asc_len) ? 0x00 : ascToBcd(ascii[j++]) & 0xff) + (bcd[i] << 4));
        }
        return bcd;
    }

    public static byte ascToBcd(byte asc) {
        byte bcd;

        if ((asc >= '0') && (asc <= '9')) {
            bcd = (byte) (asc - '0');
        } else if ((asc >= 'A') && (asc <= 'F')) {
            bcd = (byte) (asc - 'A' + 10);
        } else if ((asc >= 'a') && (asc <= 'f')) {
            bcd = (byte) (asc - 'a' + 10);
        } else {
            bcd = (byte) (asc - 48);
        }
        return bcd;
    }

    /**
     * BCD转字符串
     */
    public String bcd2Str(byte[] bytes) {
        char[] temp = new char[bytes.length * 2];
        char val;

        for (int i = 0; i < bytes.length; i++) {
            val = (char) (((bytes[i] & 0xf0) >> 4) & 0x0f);
            temp[i * 2] = (char) (val > 9 ? val + 'A' - 10 : val + '0');

            val = (char) (bytes[i] & 0x0f);
            temp[i * 2 + 1] = (char) (val > 9 ? val + 'A' - 10 : val + '0');
        }
        return new String(temp);
    }

    /**
     * 拆分字符串
     */
    public String[] splitString(String string, int len) {
        int x = string.length() / len;
        int y = string.length() % len;
        int z = 0;
        if (y != 0) {
            z = 1;
        }
        String[] strings = new String[x + z];
        String str = "";
        for (int i = 0; i < x + z; i++) {
            if (i == x + z - 1 && y != 0) {
                str = string.substring(i * len, i * len + y);
            } else {
                str = string.substring(i * len, i * len + len);
            }
            strings[i] = str;
        }
        return strings;
    }

    /**
     * 拆分数组
     */
    public byte[][] splitArray(byte[] data, int len) {
        int x = data.length / len;
        int y = data.length % len;
        int z = 0;
        if (y != 0) {
            z = 1;
        }
        byte[][] arrays = new byte[x + z][];
        byte[] arr;
        for (int i = 0; i < x + z; i++) {
            arr = new byte[len];
            if (i == x + z - 1 && y != 0) {
                System.arraycopy(data, i * len, arr, 0, y);
            } else {
                System.arraycopy(data, i * len, arr, 0, len);
            }
            arrays[i] = arr;
        }
        return arrays;
    }

    public enum KeyLength {
        /**
         * 秘钥长度：1024
         */
        LENGTH_1024(1024),
        /**
         * 秘钥长度：2048
         */
        LENGTH_2048(2048);
        private int length;

        KeyLength(int length) {
            this.length = length;
        }

        public int getLength() {
            return length;
        }
    }

    public static class KeyStore {
        private String publicKey;
        private String privateKey;

        public String getPublicKey() {
            return publicKey;
        }

        public void setPublicKey(String publicKey) {
            this.publicKey = publicKey;
        }

        public String getPrivateKey() {
            return privateKey;
        }

        public void setPrivateKey(String privateKey) {
            this.privateKey = privateKey;
        }

        @Override
        public String toString() {
            return "KeyStore{" +
                    "publicKey='" + publicKey + '\'' +
                    ", privateKey='" + privateKey + '\'' +
                    '}';
        }
    }

    @AllArgsConstructor
    @Getter
    public enum KeyFormat {
        PKCS8(1, RSA),
        PKCS1(2, RSA_ECB_PKCS1);

        private Integer value;
        private AsymmetricAlgorithm algorithm;

        public static KeyFormat of(Integer value) {
            for (KeyFormat keyFormat : KeyFormat.values()) {
                if (Objects.equals(value, keyFormat.value)) {
                    return keyFormat;
                }
            }
            return PKCS8;
        }
    }

    public KeyFormat getKeyFormat() {
        return keyFormat;
    }

    public KeyLength getKeyLength() {
        return keyLength;
    }


}
