package au.gov.nehta.cda.test;

import au.gov.nehta.builder.util.UUIDTool;
import junit.framework.TestCase;

public class TestUUIDToOID extends TestCase {

    public void testUUIDToOID(){
        // Example
        // UUID = a7b7c3b7-4639-43a9-8bb1-7cb8c91216c1
        // OID = 2.25.N
        // Where N =  (2^96 * 0x a7b7c3b7) + (2^64 * 0x 463943a9) + (2^32 * 0x 8bb17cb8)) + 0x c91216c1 
        // Correct value  2.25.222935235211552455402395562399683974849
        
        
        String uuid =  "a7b7c3b7-4639-43a9-8bb1-7cb8c91216c1";
        String oid = UUIDTool.uuidToOid( uuid );
        String expected = "2.25.222935235211552455402395562399683974849";
        assertEquals( expected, oid );
    }
    public void testNoNaturalNumbers(){
        // Example
        // UUID = a7b7c3b7-4639-43a9-8bb1-7cb8c91216c1
        // OID = 2.25.N
        // Where N =  (2^96 * 0x a7b7c3b7) + (2^64 * 0x 463943a9) + (2^32 * 0x 8bb17cb8)) + 0x c91216c1 
        // Correct value  2.25.222935235211552455402395562399683974849
        
        
        String uuid =  "cafebabe-dead-beef-deaf-beeffeedcafe";
        String oid = UUIDTool.uuidToOid( uuid );
        String expected = "2.25.269826686201073727486720538094968097534";
        assertEquals( expected, oid );
    }
    
    public void testNotUUIDToOID(){
        String uuid =  "a7b7c3b7-4639-43a9-8bb1-7cb8c91216c1";
        String oid = UUIDTool.uuidToOid( uuid );
        String notExpected = "2.25.222935235211552455402395562399683974841"; //ends in 1 not 9
        assertFalse( notExpected.equals( oid ) );
    }
    
    
    
    
    public void testPrefixedValue(){
        String uuid =  "urn:uuid:a7b7c3b7-4639-43a9-8bb1-7cb8c91216c1";
        String oid = UUIDTool.uuidToOid( uuid );
        String expected = "2.25.222935235211552455402395562399683974849";
        assertEquals( expected, oid );
    }
    
    public void testPrefixedUppercasePrefixValue(){
        String uuid =  "URN:UUID:a7b7c3b7-4639-43a9-8bb1-7cb8c91216c1";
        String oid = UUIDTool.uuidToOid( uuid );
        String expected = "2.25.222935235211552455402395562399683974849";
        assertEquals( expected, oid );
    }
    
    public void testPrefixedUppercaseHexValue(){
        String uuid =  "URN:UUID:A7B7C3b7-4639-43a9-8BB1-7cb8c91216c1";
        String oid = UUIDTool.uuidToOid( uuid );
        String expected = "2.25.222935235211552455402395562399683974849";
        assertEquals( expected, oid );
    }
    
    public void testNullValue(){
        String uuid =  null;
        String oid = UUIDTool.uuidToOid( uuid );
        String expected = null;
        assertEquals( expected, oid );
    }
    
    public void testNotAnOid(){
        
        String uuid =  "2.25.222935235211552455402395562399683974849";
        String oid = UUIDTool.uuidToOid( uuid );
        String expected = "2.25.222935235211552455402395562399683974849";
        assertEquals( expected, oid );
    }
}
