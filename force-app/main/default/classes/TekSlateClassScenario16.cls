public class TekSlateClassScenario16 {
    public static void countContact(List<Contact> conList) {
        Integer size = 0;
        List<Account> acList = new LIST<Account>();
        for(Account acc : [select id,(select accountid from Contacts) from Account]) {
            Account acObj = new Account();
            for(Contact con : acc.contacts) {
                size = acc.contacts.size();
            }
            acObj.id = acc.Id;
            acObj.Total_Contact__c = size;
            acList.add(acObj);
        }
        if(!acList.isEmpty() && acList.size()>0) {
            update acList;
        }
        else if(acList.isEmpty()) {
     //       acList.add(0);
            update acList;
        }
    }
}