public class CourseStatus {   
    //Class Variable
    boolean isCourseAvailable = false;  
    /*******************************************************
     * @description: updateCourseDates updates course states,
     * based on course related dates.
     * @input courseList
     * @return void
     * *******************************************************/
    public static void updateCourseDates(list<course__c> courseList, Map<Id,course__c> oldCourseMap){
        for(course__c c: courseList){
            if(c.Course_Start_date__c == system.today() && c.Status__c == oldcourseMap.get(c.Id).Status__c){
                c.Status__c = 'In Progress';
               
            }else if(c.Next_Enrollment_Date__c == system.today()){
                c.Status__c = 'Enrolling';
            }else if(c.Next_Enrollment_End_Date__c < system.today()){
                c.Course_Start_date__c = c.Next_Enrollment_End_Date__c +7;
                c.status__c = 'Enrollment Closed'; 
            }else{
                //do nothing
            }
        }
    } 
    
    public void checkDeletingrecords(list<Course__c> coureseTodelete){
        for(course__c c: coureseTodelete){
            if(c.Name != 'test'){
                c.adderror('Course cannot be deleted'); //adderror() will show an error during the trigger execution if
                //given condition meets.
            }
        }
    }
    
    public static void updateCourseDates1(list<course__c> courseList){
        for(course__c c: courseList){
            if(c.Next_Enrollment_End_Date__c ==system.today()-1){
                c.Course_Start_date__c = c.Next_Enrollment_End_Date__c +7;
                c.status__c = 'Enrollment Closed';
               
            }else if(c.Course_Start_date__c == system.today()){
                c.Status__c = 'In Progress';
            }else if(c.Next_Enrollment_Date__c == system.today()){
                c.Status__c = 'Enrolling';
            }else{
                //do nothing
            }
        }
    } 
}