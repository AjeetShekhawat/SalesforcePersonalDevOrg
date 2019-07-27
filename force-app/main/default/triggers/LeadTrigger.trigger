trigger LeadTrigger on Lead(before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isBefore && Trigger.isInsert) {
        //TekSlateClassScenario4.leadSalutationInsert(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate) {
        //TekSlateClassScenario4.leadSalutationUpdate(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isDelete) {
     
    }
    if(Trigger.isBefore && Trigger.isUndelete) {
        
    }
    if(Trigger.isAfter && Trigger.isInsert) {
      //  LeadOperationClass.createRecords(Trigger.new);
        LeadConversion.convertLeadMethod(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
     //   LeadOperationClass.updateRecords(Trigger.oldmap, Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isDelete) {
       
    }
    if(Trigger.isAfter && Trigger.isUndelete) {
        
    }
}