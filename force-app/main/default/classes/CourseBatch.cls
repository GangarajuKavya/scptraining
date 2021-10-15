/**
 * @description     Batch Class for Updating Course__c records
 * @author          Kavya Gangaraju
 * @date            09/26/2021
 * 
**/
global class CourseBatch implements Database.Batchable<sObject>,schedulable {

    private String query;
    
    /***********************************************************************************************
    *
    * Constructor
    *
    ***********************************************************************************************/
  
    global CourseBatch() {

        query = 'SELECT Id, Course_Code__c, Course_Start_Date__c, Next_Enrollment_Date__c,'
              + ' Next_Enrollment_End_Date__C, Status__c'
              + ' FROM Course__c '
              + ' WHERE Next_Enrollment_End_Date__C < TODAY OR '
              + ' Course_Start_Date__c = TODAY OR Next_Enrollment_Date__c = TODAY';
    }

    /***********************************************************************************************
    *
    * Start Method
    *
    ***********************************************************************************************/     
       
    global Database.QueryLocator start(Database.BatchableContext BC) {
        system.debug(query);
        return Database.getQueryLocator(query);
    }

    /***********************************************************************************************
    *
    * Execute Method
    *
    ***********************************************************************************************/

    global void execute(Database.BatchableContext BC, List<Course__c> courseList) {

        CourseStatus.updateCourseDates1(courseList);
    }

    /***********************************************************************************************
    *
    * Finish Method
    *
    ***********************************************************************************************/
      
    global void finish(Database.BatchableContext BC) {
    }
    
    /**********************************************************************************************
	*
	* Schedulable Methods
	*
	**********************************************************************************************/

	global void execute(SchedulableContext sc) { 
		Database.executeBatch(new CourseBatch(), 100);
	}

}

/*** abort existing scheduled batch job
 * Id detailId = [SELECT Id FROM CronJobDetail WHERE Name='CourseBatch2'][0].Id;
if (detailId != null) {
	Id jobId = [SELECT Id from CronTrigger WHERE CronJobDetailId = :detailId][0].Id;
	System.abortJob(jobId);
}
*** To execute a schedulable batch run this from anonymous window

system.schedule('CourseBatch','0 0 14 * * ?', new CourseBatch());
**/