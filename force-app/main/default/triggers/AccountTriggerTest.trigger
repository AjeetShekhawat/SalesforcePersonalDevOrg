trigger AccountTriggerTest on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
	if(Trigger.isBefore && Trigger.isInsert) {
      /*  for(Account acc : Trigger.new) {
            if(acc.Total_Amount__c > 100) {
                acc.AnnualRevenue = 500;
            }
        }*/
    }
    if(Trigger.isBefore && Trigger.isUpdate) {
    	
    }
    if(Trigger.isBefore && Trigger.isDelete) {
    	
    	//ContactSum.findSum(Trigger.new);
    	//DeleteContactError.deleteContactError(Trigger.old);      
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
           
    }
    if(Trigger.isAfter && Trigger.isDelete) {
        
    }
    if(Trigger.isAfter && Trigger.isUndelete) {
        
    }
}