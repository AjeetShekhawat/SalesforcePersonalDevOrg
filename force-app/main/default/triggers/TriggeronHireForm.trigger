trigger TriggeronHireForm on Hire_Form__c (before insert, before update) {
     if(Trigger.isBefore && Trigger.isInsert) {
        HireFormFieldUpdate.updateHIreForm(Trigger.new); 
    }
    if(Trigger.isBefore && Trigger.isUpdate) {
    	HireFormFieldUpdate.updateHIreForm(Trigger.new); 
    }	  
}