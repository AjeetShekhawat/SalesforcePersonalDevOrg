trigger TriggerOnforOppo on forOppo__c (after insert, after update) {
	if(Trigger.isAfter && Trigger.isInsert) {
        CurrenyPickListImplementation.currenyPick(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
        CurrenyPickListImplementation.currenyPick(Trigger.new);
    }
}