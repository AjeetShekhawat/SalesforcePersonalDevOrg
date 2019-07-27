public class AccountMap {
	@AuraEnabled
    public static void saveAccount(sObject accountList) {
        System.debug('acc 1 ' + accountList);
        System.debug('acc 2 ' + accountList.get('Name')); 
        Insert accountList;
    }
}