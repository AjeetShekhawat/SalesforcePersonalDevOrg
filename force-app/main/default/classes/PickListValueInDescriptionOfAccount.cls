/**
 * Contact has picklist and when we insert or update contact and if picklist value is equals to 'ajeet' then Description
   field of Account should be updated with 'ajeet'
*/
public class PickListValueInDescriptionOfAccount {
    public static void pickListValue(List<Contact> conList) {
        Id idVar;
        String pickListName;
        LIST<Account> acctoUpdateList = new LIST<Account>();
        for(Contact con : conList) {
           idVar = con.accountId; 
           pickListName = con.Name_PickList__c;
        }
        if(pickListName == 'Ajeet') {
            Account ac = new Account();
            ac.id = idVar;
            ac.Description = pickListName;
            acctoUpdateList.add(ac);      
        } else {
            Account ac = new Account();
            ac.id = idVar;
            ac.Description = null;
            acctoUpdateList.add(ac);   
        }
        if(!acctoUpdateList.isEmpty() && acctoUpdateList.size()>0) {
            update acctoUpdateList;
        }
    }
    public static void pickListValueUpdate(List<Contact> oldConList, List<Contact> newConList) {
        Id idVar;
        String oldPickListName, newPickListName;
        LIST<Account> acctoUpdateList = new LIST<Account>();
        for(Contact con : oldConList) {
           oldPickListName = con.Name_PickList__c;
        }
        for(Contact con : newConList) {
           idVar = con.accountId; 
           newPickListName = con.Name_PickList__c;
        }
        if(newPickListName == 'Ajeet' && oldPickListName != 'Ajeet') {
            Account ac = new Account();
            ac.id = idVar;
            ac.Description = newPickListName;
            acctoUpdateList.add(ac);      
        } else {
            Account ac = new Account();
            ac.id = idVar;
            ac.Description = null;
            acctoUpdateList.add(ac);   
        }
        if(!acctoUpdateList.isEmpty() && acctoUpdateList.size()>0) {
            update acctoUpdateList;
        }
    }
}