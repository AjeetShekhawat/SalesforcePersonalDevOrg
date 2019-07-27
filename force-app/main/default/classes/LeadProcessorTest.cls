// 'Asynchronous Apex' trailhead for superbadge
@isTest
public class LeadProcessorTest {
    @isTest static void leadTest() {
        List<Lead> leadToUpdate = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            Lead leadIns = new Lead();
            leadIns.LeadSource = 'Web';
            leadIns.Email = 'a' + i + '@g.c';
            leadIns.LastName = 'dd'+i;
            leadIns.Company = 'kvp' + i;
            leadToUpdate.add(leadIns);
        }
        if(leadToUpdate.size() > 0) {
            Insert leadToUpdate;
        }
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Database.executeBatch(lp);
        test.stopTest();
    }
}