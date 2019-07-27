public class CheckIsPrimary {
    static Integer count = 0;
    public static void isPrimaryCheck(List<Contact> conList) {
        Set<Id> idSet = new Set<Id>();
        for(Contact con : conList) {
            idSet.add(con.accountId);
        }
        System.debug('count1 is ' + count);
        for(Contact con : [Select Id, Validate__c From Contact Where AccountId IN: idSet]) {
            if(con.Validate__c == true) {
                ++count;
            }
        }
        System.debug('count2 is ' + count);
        for(Contact con : conList) {
            if(count > 1) {
                con.addError('can not add contact');
            }
        }
    }
}