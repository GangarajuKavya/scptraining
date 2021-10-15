/* 
* Controller class for Course info
*/
public class SCP_CourseInfoController {


    public Course__c courseInfo{get;set;}    
        
    public SCP_CourseInfoController() {
            
                Id courseId = ApexPages.currentPage().getParameters().get('id');

         courseInfo = [Select Id,Name,Course_code__c from Course__c Where Id=:courseId];  
      

        }
        
      
}