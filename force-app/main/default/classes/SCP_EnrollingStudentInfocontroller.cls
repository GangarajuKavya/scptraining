public with sharing class SCP_EnrollingStudentInfocontroller {
  Public string firstName{get;set;}
  Public String lastName{get;set;}
  Public String email{get;Set;}
  Public String Phone{get;Set;}
  Public String City{get;Set;}
  Public String state{get;set;}
  public id CourseId{get;set;} 
  public Student__c studentInfo{get;set;}
  public Attachment coverletter{get; set;}
  
  Public SCP_EnrollingStudentInfocontroller(){
  
   this.courseId = ApexPages.currentPage().getParameters().get('id');
   coverletter = new attachment();
  
  }
  
  

}