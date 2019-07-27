public class ContactFeeSumClass {
    public static void feeSum(LIST<Contact> conList) {
        LIST<Account> accList = new LIST<Account>();
        Decimal sum = 0, totalCount = 0;
        for(Account acc : [select id, Count__c, Sum__c from Account where id != null and Count__c != null]) {
            Account accToUpdate = new Account();
            for(Contact con : [select accountId, Fee__c from Contact where accountId =: acc.id and Fee__c != null]) {
                sum += con.Fee__c;
            }
            totalCount = sum + acc.Count__c;
            accToUpdate.id = acc.id;
            accToUpdate.Sum__c = totalCount;
            accList.add(accToUpdate);
            sum = 0; totalCount = 0;
        }
        if(!accList.isEmpty() && accList.size()>0) {
            update accList;
        }
    }
    public static void feeSumOnAccount(LIST<Account> acList) {
        Decimal sum = 0, totalCount = 0;
        for(Account acc : acList) {
            for(Contact con : [select accountId, Fee__c from Contact where accountId =: acc.id and Fee__c != null]) {
                sum += con.Fee__c;
            }
            totalCount = sum + acc.Count__c;
            acc.Sum__c = totalCount;
            sum = 0; totalCount = 0;
        }
    }
}