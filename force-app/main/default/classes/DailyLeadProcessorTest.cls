// 'Asynchronous Apex' trailhead for superbadge
@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    @isTest static void testLeadQueueable() {
        List<Lead> leadDataToUppdate = new List<Lead>();
        for(Integer i = 0; i < 50; i++) {
            Lead leadIns = new Lead();
            leadIns.LeadSource = '';
            leadIns.Email = 'a' + i + '@g.c';
            leadIns.LastName = 'dd'+i;
            leadIns.Company = 'kvp' + i;
            leadDataToUppdate.add(leadIns);
        }
        if(leadDataToUppdate.size() > 0) {
            Insert leadDataToUppdate;
        }
        
        Test.startTest();
        DailyLeadProcessor dp = new DailyLeadProcessor();
        System.schedule('Test Lead', CRON_EXP, dp);
        Test.stopTest();
    }
}