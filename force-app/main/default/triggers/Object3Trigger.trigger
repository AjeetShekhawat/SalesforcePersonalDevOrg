trigger Object3Trigger on Object3__c (after insert, after update) {
    if(Trigger.isAfter && Trigger.isInsert) {
        Object2HandlerClass.sumOfObject3(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
        Object2HandlerClass.sumOfObject2AfterUpdate(Trigger.new);
    }
}