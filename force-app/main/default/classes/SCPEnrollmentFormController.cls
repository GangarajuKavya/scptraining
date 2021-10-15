public class SCPEnrollmentFormController {

    public PageReference studentInfo() {
    
    try{
        student__c s = [Select first_name__c, last_name__c, email__c from Student__c where Student_ExternalID__c =:studentId];
        this.firstName = s.first_name__c;
        this.lastName = s.last_name__c;
        this.email = s.email__c;
        return null;
    
    }catch(Exception e){
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Oops! Seems like you did not enter a valid StudentID'));
        return null;
        
    
    }
    
        
    }




    public String studentId { get; set; }
    public id courseId {get; set;}
    public String courseName {get;set;}
    public string firstName{get;set;}
    public string lastName{get;set;}
    public string email{get;set;}
    
    Public SCPEnrollmentFormController(){
  
      this.courseId = ApexPages.currentPage().getParameters().get('id');
      Course__c c = [SELECT Name from course__c where id =:this.courseId];
      this.courseName = c.Name; 

    }
    
    public PageReference createClassRecord() {
        
        List<Student__c> s = [Select id from Student__c where Student_ExternalID__c = :studentId];
        
        try{
        
            if(s.size()>0){
                class__c c = new class__c();
                c.Course__c = this.courseId;
                c.Student__c = s[0].Id;
                c.Student_Status__c = 'Enrolled for Future classes';
            
                insert c;
                PageReference p = new PageReference('/apex/SCPconfirmCourseEnrollement');
                 p.setRedirect(true);
                return p;
            }else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Oops! Seems like you did not enter a valid StudentID'));
            }
        
             
        }catch(Exception e){
        
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Unsuccessfully!'));
        
        }
        

        
        return null;
    }
    
    
  
}