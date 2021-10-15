@isTest
public class TestDataFactory {
    
    //test data factory is used to create necessary data for your test class 
    //always a best practise to have test data factory which has methods that create specific data and you can reference them from
    //other test classes.
    //
    public Static course__c createCourse(string courseName, date courseStartDate, integer maxStudentsAllowed){
        Course__c c = new Course__c();
        c.Name = courseName;
        c.Course_Start_Date__c = courseStartDate;
        c.Max_Students_allowed_in_class__c = maxStudentsAllowed; 
        return c;
    }
    

}