public class MyNewmethodDemo {
    
    /************************
     * Class variables
     ************************/
    
    public final String s = 'abc'; // constant variable
    public final static integer i = 10; // static constant - will exist with the class don't need a instance of class to be defined.
    public final static boolean bool = true;
    
    /**************************
     * Method
     **************************/
    
    public void myMethod1(){
        String s1 = s;
        integer i1 = i;
        system.debug(s1);
        system.debug(i1);
    }
    
    /**************************
     * Static Method
     * **********************/
    
    public static void myMethod2(){
        integer i1 = i;
        MyNewmethodDemo m = new MyNewmethodDemo(); // we need to inistiate an object to reference their instance variable(non static variable).
        string s1 = m.s;
        system.Debug(i1);
        system.debug(s1);
    }

}