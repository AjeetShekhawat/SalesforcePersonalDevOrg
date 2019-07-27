trigger LeadDuplicateDenied on Student__c (before insert, before update) {
	if(Trigger.isInsert && Trigger.isBefore) {
        LeadDuplicateDeniedClass.insertDuplicate(Trigger.new);
    }
    if(Trigger.isUpdate && Trigger.isBefore) {
        LeadDuplicateDeniedClass.updateDuplicate(Trigger.oldmap, Trigger.new);
    }
}