package au.gov.nehta.model.clinical.etp.common.item;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public enum IntegerityCheckType{
    
    //values must align with
    // IntegrityCheckAlgorithm.java
    SHA_1("SHA-1"),
    SHA_256("SHA-256");
    
    private String digest;
    
    IntegerityCheckType(String digest){
      this.digest=digest;
    }
    
    public byte[] check(File file) {
        byte[] check=null;
        MessageDigest md=null;
        try {
            md =  MessageDigest.getInstance(digest);
        } catch (NoSuchAlgorithmException e) {
            System.err.print( "Error bootstrapping integrity check with digest type "+digest );
            throw new RuntimeException(e);
        }
        
        
        try{
            RandomAccessFile raf = new RandomAccessFile(file, "rw");
            byte[] b = new byte[(int)raf.length()];
            raf.readFully(b);
            raf.close();
            md.update(b ); 
            check = md.digest();
        }catch(IOException e){
            System.err.println("Error opening file "+file.getName());
            throw new RuntimeException(e);
        }
        
        return check;
    }
    
    public String getDigestName(){
        return digest;
    }

    public byte[] check( byte[] b ) {
        byte[] check=null;
        MessageDigest md=null;
        
        try {
            md =  MessageDigest.getInstance(digest);
            md.update(b ); 
            check = md.digest();
        } catch (NoSuchAlgorithmException e) {
            System.err.print( "Error bootstrapping integrity check with digest type "+digest );
            throw new RuntimeException(e);
        }
        
       
     
       
      
        
        return check;
    }
}