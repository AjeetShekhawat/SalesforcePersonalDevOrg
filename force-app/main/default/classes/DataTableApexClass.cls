public class DataTableApexClass {
    @AuraEnabled
    public static List<Account> getAllAccounts() {
        System.debug('try');
        return [Select Id,Name ,AnnualRevenue,Industry,Rating,Phone from Account] ; 
        
    }
    @AuraEnabled
    public static void updateAccount(List<Account> acc ){
        System.debug('try update');
        System.debug('try update1');
        update acc;
    }
}