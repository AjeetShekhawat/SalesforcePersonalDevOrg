global class ScheduleClassForLead implements Schedulable {
	global void execute(SchedulableContext sc)
    {
        BatchClassForLead updateLead = new BatchClassForLead();
        Database.executeBatch(updateLead);
    }
}