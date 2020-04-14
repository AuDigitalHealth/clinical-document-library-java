package au.gov.nehta.builder.util;

import java.math.BigInteger;
import java.util.UUID;


public class UUIDTool {
    
    private static final int HEXADECIMAL = 16;
    private static String UUID_PATTERN ="^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$";
    private static final BigInteger TWO = new BigInteger("2");
    
    
    
    /**
     * Convert a uuid to an OID.
     * Will return a oid equivalent of the supplied UUID 
     * 
     * @param uuid
     * @return an oid if the supplied string looks like a valid UUID, else returns the string as supplied
     */
    public static String uuidToOid( UUID uuid){
        return uuidToOid(uuid.toString());
    }
    
    
    /**
     * Convert a uuid to an OID.
     * Will return a oid equivalent of the supplied UUID 
     * 
     * @param uuid
     * @return an oid if the supplied string looks like a valid UUID, else returns the string as supplied
     */
    public static String uuidToOid(String uuid )
    {
        if(uuid == null) return null;
        //idType = null;

        // Example
        // UUID = a7b7c3b7-4639-43a9-8bb1-7cb8c91216c1
        // OID = 2.25.N
        // Where N =  (2^96 * 0x a7b7c3b7) + (2^64 * 0x 463943a9) + (2^32 * 0x 8bb17cb8)) + 0x c91216c1 
        // Correct value  2.25.222935235211552455402395562399683974849

        String answer = uuid;

        // 0 start pos  01234567 9012 4567 9012 456789012345  for SubString
        //string uuid = "a7b7c3b7-4639-43a9-8bb1-7cb8c91216c1";
        // Remove unwanted chars if they exist
        uuid = uuid.toLowerCase().replaceFirst("urn:uuid:", "");

        if (uuid.matches( UUID_PATTERN ) )
        {
            uuid = uuid.replaceAll("-", "");

            //Convert hex (16) to decimal
            BigInteger num1 = new BigInteger(uuid.substring(0, 8), HEXADECIMAL);
            BigInteger num2 = new BigInteger(uuid.substring(8, 16), HEXADECIMAL);
            BigInteger num3 = new BigInteger(uuid.substring(16, 24), HEXADECIMAL);
            BigInteger num4 = new BigInteger(uuid.substring(24, 32), HEXADECIMAL);

            //Multiply by powers
           
            BigInteger num5 = TWO.pow(96).multiply(num1);
            BigInteger num6 = TWO.pow(64).multiply(num2);
            BigInteger num7 = TWO.pow(32).multiply(num3);

            //Add them up to get answer
            answer = "2.25." + num4.add(num5).add(num6).add(num7).toString();
        }
     

        return answer;
    }
    
    /**
     * Is UUID 
     * @param uuid
     * @return true if and only if this string looks like a UUID
     */
    public static boolean isUUID(String uuid){
        if(uuid == null) return false;
        
        uuid = uuid.toLowerCase().replaceFirst("urn:uuid:", "");
        return uuid.matches( UUID_PATTERN );
        
    }

}
