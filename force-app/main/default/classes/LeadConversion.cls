public with sharing class LeadConversion {
    public LeadConversion() {

    }
    public static void convertLeadMethod(List<Lead> newLead) {
        List<Database.LeadConvert> leadConertList = new List<Database.LeadConvert>();
        Database.LeadConvert lc;
        for (Lead leadIterate : newLead) {
            lc = new Database.LeadConvert();
            lc.setLeadId(leadIterate.Id);
          //  leadConertList.add(lc);
        }
        System.debug('leadConertList ***** ' + lc);

        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.debug('lcr ***** ' + lcr);
    }
}