public class ApexController {
	@AuraEnabled
    public static String fetchAccount() {
        return 'ajay';
    }
    
    @AuraEnabled
    public static String fetchAccountName() {
        String name = 'select name from account limit 1';
        Account acc = Database.query(name);
        return string.valueOf(acc.Name);
    }
}