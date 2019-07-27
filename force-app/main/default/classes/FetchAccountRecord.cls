public class FetchAccountRecord {
    @AuraEnabled
    public static List<Account> getInvoiceRecords() {
        List<Account> invList = [select Id, Name, Total_Amount__c, QR_Code__c from Account limit 50]; 
        System.debug('invList ' + invList);
        return invList;
    }
}