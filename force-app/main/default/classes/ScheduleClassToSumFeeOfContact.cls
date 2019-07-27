global class ScheduleClassToSumFeeOfContact implements Schedulable {
	global void execute(SchedulableContext sc)
    {
        BatchClassToSumFeeOfContact sumOfFee = new BatchClassToSumFeeOfContact();
        Database.executeBatch(sumOfFee);
    }
}