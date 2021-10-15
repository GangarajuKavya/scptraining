public class MyCourseListController {

   
    public ApexPages.StandardSetController Course {
        get {
            if(Course == null) {
                Course = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name FROM Course__c]));
            }
            return Course;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List<Course__c> getCourses() {
        return (List<Course__c>) Course.getRecords();
    }

}