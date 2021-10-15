public class TestCustomEception {
    
    public class MyCustException extends Exception{}
    
    public static void insertcourse(){
        try{
            course__c c = new Course__C();
            insert c;
            
        }catch(DMLexception e){
             system.debug(e);
            throw new MyCustException('insertcourse method failed in Test Custome excetion class'+ e);
           
        
        }
      
    }

}