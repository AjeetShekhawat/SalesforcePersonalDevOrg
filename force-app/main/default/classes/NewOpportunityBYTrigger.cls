public class NewOpportunityBYTrigger {
    public static void createOpportunity(List<Account> acclist) {
        List<Opportunity> opplist = new List<Opportunity>();
        for(Account acc : acclist) {
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name + 'opportunity';
            opp.CloseDate = date.today() + 90;
            opp.StageName = 'prospecting';
            opp.AccountId = acc.Id;
            opplist.add(opp);
        }
        if(opplist.size() != null) {
            insert opplist;
        }
    }
}