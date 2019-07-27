trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isBefore && Trigger.isInsert) {
        //TekSlateClassScenario11.changeOwnerName(Trigger.new);
        //ContactFeeSumClass.feeSumOnAccount(Trigger.new);
        //TekSlateClassScenario6.currencyPercentage(Trigger.new);
        //TekSlateClassScenario3.textFieldChange1(Trigger.new);    
        //TekSlateClassScenario7.method(Trigger.new);
        //TekSlateClassScenario2.duplicatePrevention(Trigger.new);
        
    }
    if(Trigger.isBefore && Trigger.isUpdate) {
        //TekSlateClassScenario11.changeOwnerName(Trigger.new);
      //  AccountOwnerChange.changeAccount(Trigger.old, Trigger.new);
        //ContactFeeSumClass.feeSumOnAccount(Trigger.new);
     //   TekSlateClassScenario6.currencyPercentage(Trigger.new);
        //TekSlateClassScenario3.textFieldChange2(Trigger.new);
       // TekSlateClassScenario7.method(Trigger.new, trigger.oldMap);
       // TekSlateClassScenario2.duplicatePreventionOnUpdate(Trigger.new);
      //  TekSlateClassScenario2.aggregatePractice();
    }
    if(Trigger.isBefore && Trigger.isDelete) {
      //  DeleteAccountClass.deleteAccount(Trigger.old);
        //TekSlateClassScenario7.method(Trigger.new); 
        
    }
    if(Trigger.isBefore && Trigger.isUndelete) {
        
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        //NewOpportunityBYTrigger.createOpportunity(Trigger.new);
        //CreateNewContactUsingTrigger.newContact();
      //  TekSlateClassScenario8.createCOntact(Trigger.new, trigger.old, trigger.oldMap, trigger.newMap);
       // TekSlateClassScenario8.createContact2(Trigger.new);
        //CreateNewContactUsingTrigger.newContact(Trigger.new);
        //TekSlateClassScenario7.method(Trigger.new); 
       // AmountDistribution.distributeAmount2(Trigger.new);
       
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
        //TekSlateClassScenario8.createCOntact(Trigger.new);
        //AccountOwnerChange.addTeamember(Trigger.old, Trigger.new);
        //TekSlateClassScenario7.method(Trigger.new); 
       // AmountDistribution.distributeAmount2(Trigger.new);
     //  TekSlateClassScenario8.createContact2(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isDelete) {
    	//TekSlateClassScenario7.method(Trigger.new);  
    //	TekSlateClassScenario8.createCOntact(Trigger.new, trigger.old, trigger.oldMap, trigger.newMap);        
    }
    if(Trigger.isAfter && Trigger.isUndelete) {
        TekSlateClassScenario8.createCOntact(Trigger.new, trigger.old, trigger.oldMap, trigger.newMap); 
    }
}