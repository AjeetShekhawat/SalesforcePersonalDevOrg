global class ScheduleClassTOUpdateAccountRecord implements Schedulable {
	global void execute(SchedulableContext sc)
    {
        BatchClassTOUpdateAccountRecord updateAccount = new BatchClassTOUpdateAccountRecord();
        Database.executeBatch(updateAccount, 100);
    }
}