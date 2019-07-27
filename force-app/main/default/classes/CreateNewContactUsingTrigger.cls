public class CreateNewContactUsingTrigger {
    public static void newContact(List<Account> accList1) {
        Map<id, Decimal> newMap = new Map<id, Decimal>();
        for(Account acc : accList1) {
            if(!newMap.isEmpty() && newMap.containsKey(acc.id) && newMap.get(acc.id) != null) {
        		newMap.put(acc.id, newMap.get(acc.id) + acc.Total_Contact__c);
                }
                else {
                newMap.put(acc.id, acc.Total_Contact__c);
                }
        }
        List<Account> accList = [select id, Total_Contact__c,(select accountid from Contacts) from account where ID IN : newMap.keySet()];
        List<Contact> sumList = new List<Contact>();
        for(Account acc : accList) {
            for(Decimal i =1; i<= newMap.get(acc.id); i++) {
                Contact conn = new Contact();
                conn.AccountId = acc.id;
                conn.LastName = 'ajay' + i;
                sumList.add(conn);
            }
        }
        if(!sumList.isEmpty()) {
            insert sumList;
        }
    }
}