global class ScheduleClassTOCreateCOntact implements Schedulable {
	global void execute(SchedulableContext sc)
    {
        BatchClassTOCreateCOntact createCon = new BatchClassTOCreateCOntact();
        Database.executeBatch(createCon);
    }
}