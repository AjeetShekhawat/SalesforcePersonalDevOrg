trigger Object2Trigger on Object2__c (after insert) {
    if(Trigger.isAfter && Trigger.isInsert) {
        Object2HandlerClass.sumOfObject2(Trigger.new);
    }
}