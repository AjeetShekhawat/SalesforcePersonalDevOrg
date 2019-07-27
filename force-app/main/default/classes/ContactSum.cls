/**
 * find sum of contact in particular account but use only single query means without subquery.
*/
public class ContactSum {
    public static void findSum(LIST<Contact> conList) {
        LIST<Account> accList = new LIST<Account>();
        LIST<Account> acctoUpdateList = new LIST<Account>();
        accList = [select id, Sum__c from Account];
        Id idVar;
        Decimal sum = 0;
        for(Contact con : conList) {
           idVar = con.accountId; 
        }
        for(Contact con : [select id, Fee__c from Contact where accountid =: idvar]) {
           sum += con.Fee__c;
        }
        Account ac = new Account();
        ac.id = idVar;
        ac.Sum__c = sum;
        acctoUpdateList.add(ac);
        if(!acctoUpdateList.isEmpty() && acctoUpdateList.size()>0) {
            update acctoUpdateList;
        } 
    }
}