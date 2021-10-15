@isTest
private class CourseBatchTest {
    
    @testSetup
    static void Setup(){
        list<Course__c> listofCourses = new list<course__C>();
        
        listofCourses.add(TestDataFactory.createCourse('course1',system.today()+0,20));
        listofCourses.add(TestDataFactory.createCourse('test',system.today()-69,20));
        listofCourses.add(TestDataFactory.createCourse('course3',system.today()+2,20));
        listofCourses.add(TestDataFactory.createCourse('course4',system.today()-105,20));
        insert listofCourses;
    }
    
    @isTest static void courseBatchTest(){
        
        test.startTest();
        CourseBatch cb = new CourseBatch();
        id jobId = database.executeBatch(cb);
        test.stopTest();
        
        system.assertEquals(1, [select count() from Course__c where status__c = 'In progress']);
    }
    

}