@isTest
public class Test_Class_NewOpportunityBYTrigger {
    static testMethod void checkLogic() {
        Account ac = new Account(name = 'vijay');
        insert ac;
        Opportunity opp = new Opportunity();
        LIST<Opportunity> liOpp = new LIST<Opportunity>();
        opp.Name = 'opportunity';
        opp.CloseDate = date.today();
        opp.StageName = 'prospecting';
        liOpp.add(opp);
        insert liOpp;
        
    }
}