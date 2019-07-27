public class OneTimeServerCall {
    @AuraEnabled public static List<WrapperClass> wrapList{get;set;}
    
    @AuraEnabled
    public static List<WrapperClass> fetchRecords() {
        wrapList = new List<WrapperClass>();
        WrapperClass wp = new WrapperClass();
        wp.accWrapper = [Select Id, Name From Account Limit 2];
        wp.conWrapper = [Select Id, Name From Contact Limit 2 ];
        wrapList.add(wp);
        System.debug('Wrapper List is ' + wrapList);
        return wrapList;
    }
    
    @AuraEnabled
    public static String getServerErrorMessage(){
        try{
            List<Integer> li = new List<Integer>();
            li.add(15);
            Integer i2 = li[1]; // Causes a ListException
            Integer i = 1/0;
            return 'nothing';
        }catch(Exception e) {
            System.debug('Exception1 ' + e.getCause());
            System.debug('Exception2 ' + e.getLineNumber());
            System.debug('Exception3 ' + e.getStackTraceString());
            System.debug('Exception4 ' + e.getTypeName());
            return e.getMessage();
        }
        
    }
    
    public class WrapperClass {
        @AuraEnabled public List<Account> accWrapper{get;set;}
        @AuraEnabled public List<Contact> conWrapper{get;set;}
    }
}