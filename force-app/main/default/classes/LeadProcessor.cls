// 'Asynchronous Apex' trailhead for superbadge
public class LeadProcessor implements Database.Batchable<sObject> {
    public static Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }
    
    public static void execute(Database.BatchableContext bc, List<Lead> leadList) {
        List<Lead> leadToUpdate = new List<Lead>();
        for(Lead ld : leadList) {
            Lead leadIns = new Lead();
            leadIns.LeadSource = 'Dreamforce';
            leadIns.Id = ld.Id;
            leadToUpdate.add(leadIns);
        }
        if(leadToUpdate.size() > 0) {
            Update leadToUpdate;
        }
    }
    
    public static void finish(Database.BatchableContext bc) {
        
    }
}