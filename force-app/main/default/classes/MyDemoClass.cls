public class MyDemoClass {
    
    /*********************
     * class method
     * *******************/
    
    public integer getSum(integer s){
        try{
           integer s1;
             return s+s1;
        }catch(Exception n){
            system.debug('Cause: '+n.getCause());
            system.debug('message: '+n.getMessage());
            system.debug('linenumber: '+ n.getLineNumber());
            system.debug('stacktrace: '+ n.getStackTraceString());
            system.debug('type: '+ n.getTypeName());
            return s;
        }
        
    }

}

//Running this in Anonymous window will give you exception
//
//myDemoClass mdc = new MyDemoClass();

//mdc.getSum(10);