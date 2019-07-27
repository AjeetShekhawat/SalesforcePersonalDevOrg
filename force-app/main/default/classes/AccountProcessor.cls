// 'Asynchronous Apex' trailhead for superbadge 
public class AccountProcessor {
    @future(callout=true)
    public static void countContacts(List<Id> accList) {
        List<Account> accListToUpdate = new List<Account>();
        for(AggregateResult agr : [SELECT Count(Id) totalContact, AccountId FROM Contact WHERE AccountId IN: accList GROUP BY accountId]) {
            Account acc = new Account();
            acc.Id = (Id)agr.get('AccountId');
            acc.Number_of_Contacts__c = Integer.valueOf(agr.get('totalContact'));
            accListToUpdate.add(acc);
        }
        if(accListToUpdate.size() > 0) {
            UPdate accListToUpdate; // Integer.valueOf(agr.get('totalContact'));
        }
    }
}