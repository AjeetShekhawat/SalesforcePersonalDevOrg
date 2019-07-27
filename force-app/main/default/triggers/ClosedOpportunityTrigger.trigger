trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	if(trigger.isInsert && trigger.isAfter) {
        SuperbadgeAssignment.taskCreation(trigger.new);
    }
    if(trigger.isUpdate && trigger.isAfter) {
        SuperbadgeAssignment.taskCreation(trigger.new);
    }
}