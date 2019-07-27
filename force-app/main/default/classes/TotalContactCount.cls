/******************************************
 * Created By  : Ajeet Singh Shekhawat
 * Created On  : 08 jun 2018
 * Modified By : 
 * Modified On :
 * Description : Count total Contact and show on Account field                      
*/ 
public class TotalContactCount {
    public static void contactCount(List<Contact> conListFromTrigger) { // Contact list from Trigger
        LIST<Account> queryAccList = new LIST<Account>(); // create Account list to hold query records
        LIST<Account> accListToUpdate = new LIST<Account>(); // create Account list to update account record.
        Map<ID, Integer> sumMap = new Map<ID, Integer>(); //define map
        set<id> contactIdSet = new set<id>();
        for(Contact con : conListFromTrigger){ // iterating contact data
            contactIdSet.add(con.accountId); // add id in set
		}
        for(Contact con : [select id, accountid from contact where accountid IN : contactIdSet]){ // iterating contact data
            if(!sumMap.isEmpty() && sumMap.containsKey(con.accountid) && sumMap.get(con.accountid) !=null){
                sumMap.put(con.accountid, sumMap.get(con.accountid) + 1); // store map with contact
            }
            else{
                sumMap.put(con.accountid, 1); // store total contact on particular acocuntID.
            }
		}
		queryAccList = [select id, Total_Contact__c from Account where ID IN :sumMap.keySet()]; // query to get account on Particular id.
        for(Account acc : queryAccList) {
            acc.Total_Contact__c = sumMap.get(acc.id); // assign total number of contact into account field.
            accListToUpdate.add(acc);    
        }
        if(!accListToUpdate.isEmpty() && accListToUpdate.size()>0) { // null check
            update accListToUpdate; // updating account record
        }

    }
}