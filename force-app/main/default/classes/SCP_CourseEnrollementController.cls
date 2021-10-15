public class SCP_CourseEnrollementController{

    List< Course__c > coursesEnrolling; 
    
    
    public SCP_CourseEnrollementController(){
    
    list<course__C> c1 = new List<course__c>();
    
    for(course__C c:[SELECT ID,Name, course_code__c, Description__c, Max_Students_allowed_in_class__c, Number_Of_Students_Actively_enrolled__c FROM Course__c]){
        if(c.Max_Students_allowed_in_class__c > c.Number_Of_Students_Actively_enrolled__c){
               
                c1.add(c);
        
            }
    }
    
    this.coursesEnrolling = c1;

    }
    
    public List<Course__c> getcoursesEnrolling() {
        
    
    
        return coursesEnrolling;
    }
    
    
}