trigger OpportunityTrigger on Opportunity(before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isBefore && Trigger.isInsert) {
        
    }
    if(Trigger.isBefore && Trigger.isUpdate) {
        
    }
    if(Trigger.isBefore && Trigger.isDelete) {
     
    }
    if(Trigger.isBefore && Trigger.isUndelete) {
        
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        //TekSlateClassScenario5.addTeamMember(Trigger.new);
        //TargetAchieveOnRevenue.revenue(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
        TargetAchieveOnRevenue.revenue(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isDelete) {
       
    }
    if(Trigger.isAfter && Trigger.isUndelete) {
        
    }
}