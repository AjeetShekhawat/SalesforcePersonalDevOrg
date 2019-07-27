// 'Asynchronous Apex' trailhead for superbadge
public class DailyLeadProcessor implements Schedulable {
    public static void execute(SchedulableContext sc) {
        List<Lead> leadData = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        List<Lead> leadDataToUppdate = new List<Lead>();
        for(Lead ld : leadData) {
            Lead leadIntance = new Lead();
            leadIntance.Id = ld.Id;
            leadIntance.LeadSource = 'Dreamforce';
            leadDataToUppdate.add(leadIntance);
        }
        if(leadDataToUppdate.size() > 0) {
            Update leadDataToUppdate;
        }
    }
}