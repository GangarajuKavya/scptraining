trigger CourseTrigger on Course__c (before insert,before update,before delete, After Update, After insert, After delete, After undelete) {
    
    if(Trigger.isUpdate && Trigger.isBefore){
        CourseTriggerHandler.onbeforeUpdate(trigger.new, trigger.oldMap); // its always a best practice to have a handler class instead of haveing your logic in
        //trigger
    }
    
    if(Trigger.isInsert && Trigger.isbefore){
        CourseTriggerHandler.onbeforeInsert(trigger.new);
    }
    
    if(Trigger.isDelete && Trigger.isBefore){
        CourseTriggerHandler.onBeforeDelete(trigger.old);
    }

}

//Have only one trigger per object.
//Use supporting handler class to trigger the logic based on the trigger context.