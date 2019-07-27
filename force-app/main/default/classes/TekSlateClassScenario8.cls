public class TekSlateClassScenario8 {
    public static Boolean recr = true;
    public static void createCOntact(List<Account> accList1, List<Account> accList2, Map<Id, Account> accList3, Map<Id, Account> accList4) {
        System.debug('accList 1 ' + accList1);
        System.debug('accList 2 ' + accList2);
        System.debug('accList 3 ' + accList3);
        System.debug('accList 4 ' + accList4);
        List<Contact> conList = new List<Contact>();
        /*
        for(Account acc : accList) {
            for(Integer i = 0; i < acc.Total_Contact__c; i++) {
                Contact con = new Contact();
                con.accountId = acc.id;
                con.LastName = 'suman';
                conList.add(con);
            }
        }
        if(!conList.isEmpty() && conList.size()>0) {
            insert conList;
        }*/
    }
    public static void createContact2(List<Account> accList1) {
        
        System.debug('inside createContact2');
        if (TekSlateClassScenario8.recr) {
            TekSlateClassScenario8.recr = false;
            for(Account acc : accList1) {
                acc.Sum__c = 20;
            }
			Update accList1;
        }
    }
    
    public static void createContact3(List<Account> accList1) {
        
        System.debug('inside createContact2');
        if (TekSlateClassScenario8.recr) {
            TekSlateClassScenario8.recr = false;
            Account a = new Account();
            a.Sum__c = 30;
            a.Id = accList1[0].Id;
            System.debug('inside createContact2 accList1 ' + a);
            Update a;
        }
    } 
}