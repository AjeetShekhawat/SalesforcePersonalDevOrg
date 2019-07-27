// WarpDrive Question
public with sharing class LeadDuplicateHandler {
    public static void preventDuplicateLead(List<Lead> leadTobeInserted) {
        Set<String> emailSet = new Set<String>();
        Map<String, String> emailMap = new Map<String, String>();
        for(Lead leadData :leadTobeInserted) {
            emailSet.add(leadData.Email);
        }
        for(Lead allLeads : [SELECT Id, Email FROM Lead WHERE Email IN: emailSet]) {
            emailMap.put(allLeads.Email, allLeads.Email);
        }
        for(Lead ld : leadTobeInserted) {
            if(emailMap.get(ld.Email) == ld.Email) {
                ld.addError('Duplicate Email Found.');
            }
        }
    }
}