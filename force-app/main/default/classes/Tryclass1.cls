public class Tryclass1 {
    public static void calculate() {
        List<Account> accList = [select id, Count__c from Account where id != null];
        Decimal sum = 0;
        LIST<Account> li = new LIST<Account>();
        for(Account acc : accList) {
            Account a = new Account();
            for(Contact con : [select AccountId, Fee__c from Contact where AccountId =: acc.id and Fee__c != null]) {
                sum += con.Fee__c;
            }
            a.id = acc.Id;
            a.Count__c = sum;
            li.add(a);
            sum = 0;
        }
        if(!li.isEmpty() && li.size()>0){
            update li;
        }
    }
}