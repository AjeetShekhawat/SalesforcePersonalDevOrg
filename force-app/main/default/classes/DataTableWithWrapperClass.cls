public with sharing class DataTableWithWrapperClass {
    public DataTableWithWrapperClass() {

    }

    @AuraEnabled
    public static List<InnerClass> dataTableWrapper() {
        
        List<InnerClass> innerClassList = new List<InnerClass>();
        Integer inc = 1;
        for (Account acc : [SELECT Id, Name FROM Account LIMIT 5]) {
            InnerClass inrCls = new InnerClass();
            inrCls.welcomeMessage = 'Welcome ' + acc.Name + ' ' + inc;
            inrCls.UserName = 'Welcome ' + userInfo.getUserName() + ' ' + inc;
            inrCls.accObj = acc;
            //inrCls.accName = acc.Name;
            innerClassList.add(inrCls);
            ++inc;
        }
        return innerClassList;
    }
    
    public class InnerClass {
        @AuraEnabled public String welcomeMessage;
        @AuraEnabled public String UserName;
        @AuraEnabled public Account accObj = new Account();
        //@AuraEnabled public String accName;
    }
}