trigger CarTrigger on Car__c (before Insert, before Update, before Delete, After Insert, After Update, After delete, After Undelete) {
    
    if(Trigger.isBefore && Trigger.isInsert) {
        
    }
    
    if(Trigger.isBefore && Trigger.isUpdate) {
        
    }
    
    if(Trigger.isBefore && Trigger.isDelete) {

    }
    
    if(Trigger.isAfter && Trigger.isInsert) {
        
    }
    
    if(Trigger.isAfter && Trigger.isUpdate) {
        TriggerDoubtPractice.TriggerDoubtPracticeMethod();
    }
    
    if(Trigger.isAfter && Trigger.isDelete) {
       // TriggerDoubtPractice.TriggerDoubtPracticeMethod(Trigger.New);
      //  TriggerDoubtPractice.TriggerDoubtPracticeMethod(Trigger.Old);
     //   TriggerDoubtPractice.TriggerDoubtMapMethod(Trigger.oldMap);
     //   TriggerDoubtPractice.TriggerDoubtMapMethod(Trigger.newMap);
    }
    
    if(Trigger.isAfter && Trigger.isUndelete) {
     //   TriggerDoubtPractice.TriggerDoubtPracticeMethod(Trigger.New);
    }
}