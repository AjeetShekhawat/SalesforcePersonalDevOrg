public class RefreshInterval {
    public RefreshInterval() {
        System.debug('coming in constructor');
    }
    @AuraEnabled
    public static WrapperCount refreshAfterFixedTime() {
        System.debug('coming in refreshAfterFixedTime');
        List<Account> accList = new List<Account>([Select Id From Account]);
        List<Contact> conList = new List<Contact>([Select Id From Contact]);
        
        WrapperCount wrpCount = new WrapperCount();
        wrpCount.accountCount = accList.size();
        wrpCount.contactCount = conList.size();
        return wrpCount;
    }
    public class WrapperCount {
        @AuraEnabled public Integer accountCount;
        @AuraEnabled public Integer contactCount;
    }

    @AuraEnabled
    public static void saveAccountRecords(sObject accountList){
        try {
            System.debug('accountList is ' + accountList);
            Insert accountList;
        } catch (Exception ex) {
            System.debug('Exception ex ' + ex);
            throw new AuraHandledException(ex.getMessage());
        }
    }
}