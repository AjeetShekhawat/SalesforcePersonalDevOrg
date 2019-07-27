trigger TekSlateTriggerScenario9 on forOppo__c (after insert) {
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            TekSlateClassScenario9.checkOnOppo(Trigger.new);
        }
    }
    
}