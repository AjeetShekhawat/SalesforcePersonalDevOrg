trigger SubContactFeeSumMultiLevelTrigger on SubContact__c (after insert, after update) {
	if(Trigger.isAfter && Trigger.isInsert) {
        ContactAndSubContactFeeSumClass.feeSum2(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
        ContactAndSubContactFeeSumClass.feeSum2(Trigger.new);
    }
}