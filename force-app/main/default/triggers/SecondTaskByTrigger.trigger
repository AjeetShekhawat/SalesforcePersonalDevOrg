trigger SecondTaskByTrigger on Student1__c (before insert, before update) {
    if(Trigger.isInsert && Trigger.isbefore){ // this trigger will fire after inserting records.
        SecondTaskByClass.recordPopulate1(Trigger.new);
    }
    if(Trigger.isupdate && Trigger.isbefore){ // this trigger will fire after updating records.
        SecondTaskByClass.recordPopulate2(Trigger.new);
    }
}