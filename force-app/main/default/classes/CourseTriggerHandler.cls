public class CourseTriggerHandler {
    
    public Static Void onbeforeUpdate(List<Course__c> newCourses, map<Id, Course__c> oldCourseMap){
       
        CourseStatus.updateCourseDates(newCourses, oldCourseMap);
    }
    public Static Void onbeforeInsert(List<Course__c> newCourses){
       
        CourseStatus.updateCourseDates1(newCourses);
    }
    
    public Static void onBeforeDelete(list<course__c> coursesToDelete){
        CourseStatus cs = new courseStatus();
        cs.checkDeletingrecords(coursesToDelete);
    }

}