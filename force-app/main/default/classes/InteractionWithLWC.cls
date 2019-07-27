public with sharing class InteractionWithLWC {
    public InteractionWithLWC() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> fetchAccount() {
        return [SELECT Id, Name FROM Account LIMIT 5];
    } 

    @AuraEnabled
    public static List<Contact> fetchContact() {
        return [SELECT Id, Name FROM Contact LIMIT 5];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> fetchAccountWithParams(String name) {
        System.debug('name is ' + name);
        String key = '%' + name + '%';
      /*  Account acc = new Account();
        acc.Name = 20;
        acc.AnnualRevenue = 50;
        Insert acc;*/
        return [SELECT Id, Name FROM Account WHERE Name like : key LIMIT 5];
    }

}