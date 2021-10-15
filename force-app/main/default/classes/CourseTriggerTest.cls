@isTest
private class CourseTriggerTest {
    
    @isTest
    static void testCourseStatusUpdate(){
        list<Course__c> listofCourses = new list<course__C>();
        
        listofCourses.add(TestDataFactory.createCourse('course1',system.today()+0,20));
        listofCourses.add(TestDataFactory.createCourse('test',system.today()-69,20));
        listofCourses.add(TestDataFactory.createCourse('course3',system.today()+2,20));
        listofCourses.add(TestDataFactory.createCourse('course4',system.today()-105,20));
        insert listofCourses;
        
        list<Course__c> listforUpdatingCourse = [SELECT Name,Course_Start_Date__C,Next_Enrollment_date__C,
                                                 Next_Enrollment_End_date__C,Max_Students_allowed_in_class__c
                                                FROM Course__c];
        list<Course__C> listofUpdatedCourses = new List<Course__c>();
        for(Course__c c1:listforUpdatingCourse){
            c1.Name = c1.Name+'Update';
            system.debug(c1.Next_Enrollment_End_date__C);
            listofUpdatedCourses.add(c1);
        }
        test.startTest();
        
        update listofUpdatedCourses;
        
        try{
            delete listofUpdatedCourses;
        }catch(exception e){
            boolean expectedErrorThrown = e.getMessage().contains('Course cannot be deleted')?true:false;
            system.assertEquals(expectedErrorThrown, true);
                                                                  
        }
  
        test.stopTest();
        
    }
      @isTest
    static void testCourseStatusUpdate1(){
        list<Course__c> listofCourses = new list<course__C>();
        
        listofCourses.add(TestDataFactory.createCourse('course1',system.today()+0,20));
        listofCourses.add(TestDataFactory.createCourse('test',system.today()-69,20));
        listofCourses.add(TestDataFactory.createCourse('course3',system.today()+2,20));
        listofCourses.add(TestDataFactory.createCourse('course4',system.today()-85,20));
     
        test.startTest();
        
         insert listofCourses;
  
        test.stopTest();
        
    }

}