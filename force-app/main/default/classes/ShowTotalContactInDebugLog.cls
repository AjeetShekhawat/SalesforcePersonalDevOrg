public class ShowTotalContactInDebugLog {
    public static void contactCount() {
        LIST<Account> accList = [select id, name from Account]; // SOQL to get account record
        // SOQL to get contact which is in account list.
        LIST<Contact> conList = [select accountid, name from Contact where AccountId IN : accList];
        map<id, LIST<String>> contactMap = new map<id, LIST<String>>();
        for(Contact con : conList) { // iterating contact list.
            if(!contactMap.isEmpty() && contactMap.containsKey(con.accountid) && contactMap.get(con.accountid) != null) {
                contactMap.get(con.accountid).add(con.Name);
            } else {
                contactMap.put(con.accountid, new List<String>{con.Name}); // storing name of contact into accountid.
            }
        }
        for(Account acc : accList) { // iterating account list.
            if(contactMap.containsKey(acc.Id)) { // checking whether map contains particular id or not.
                System.debug(acc.Id + ' have these contacts' + contactMap.get(acc.Id)); // display contact associated with
                // particular account id.
            }
        }
    }
}