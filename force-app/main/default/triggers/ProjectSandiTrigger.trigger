trigger ProjectSandiTrigger on ProjectSandi__c (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert) {
        ProjectSandiClass.salaryDistribution(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate) {
        ProjectSandiClass.salaryDistribution(Trigger.new);
    }
}