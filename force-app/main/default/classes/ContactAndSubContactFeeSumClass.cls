public class ContactAndSubContactFeeSumClass {
    public static void feeSum1(LIST<Contact> conList) {
        Decimal sum = 0 , total = 0;
        LIST<Account> accouList = new LIST<Account>();
        Set<id> accId = new Set<id>();
        for(Account acc : [select id, Count__c from Account where id != null]) {
            accId.add(acc.Id);
        }  
            for(Contact con : conList) {
                sum = 0;
            	total = 0;
                if(accId.contains(con.AccountId)) {
                    Account accObj= new Account();
                    total = con.Fee__c;
                    System.debug('hellocontat'); 
                    for(SubContact__c subCon : [select Contact__c, FeeOfChild__c from SubContact__c where Contact__c =: con.id]) {
                        sum += subCon.FeeOfChild__c;     
                    }
                    accObj.Count__c = sum + total;
                    accObj.id = con.accountId;
                    accouList.add(accObj);
                }
            } 
        if(!accouList.isEmpty() && accouList.size()>0) {
                update accouList;
        }
    }
    public static void feeSum2(LIST<SubContact__c> conList) {
        Decimal sum = 0 , total = 0;
        LIST<Account> accouList = new LIST<Account>();
        for(Account acc : [select id, Count__c from Account where id != null]) {
            for(Contact con : [select accountid, Fee__c from Contact where accountid =: acc.id and Fee__c != null limit 1]) {
                sum = 0;
            	total = 0;
                    Account accObj= new Account();
                    total = con.Fee__c; 
                System.debug('total in con '+ total);
                    for(SubContact__c subCon : [select Contact__c, FeeOfChild__c from SubContact__c where Contact__c =: con.id]) {
                        sum += subCon.FeeOfChild__c;
                        System.debug('helloajay '+sum);       
                    }
                    accObj.Count__c = sum + total;
                    System.debug('total is '+ sum + total);
                    accObj.id = con.accountId;
                    accouList.add(accObj);
                break;
            } 
        }  
        if(!accouList.isEmpty() && accouList.size()>0) {
                System.debug('hello');
                update accouList;
        }
    }
}