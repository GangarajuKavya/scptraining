public class MyNewClass {
    //class variable
    public final string s = 'kavya'; // this is a constant variable and this value will stay intact and cannot assign a diff value.
    private string s1 = 'Brenda';
    
    public void myNewMethod(){
        //method variable
        string s = 'Kavya G'; // you can define another variable with same name 's' this will stay local to this method
        
        system.debug(s);
        system.debug(this.s); // to reference the class variable, when a same local variable exists in a method use this.classVariablename.
        system.debug(s1);
    }
    
    //system.debug(s2+''+s1); this gives error, as it cannot reference myNewMethod private variable outside that method.
}

//[Public|Private|Global] [Static|final] datatype  variable_name [= value]