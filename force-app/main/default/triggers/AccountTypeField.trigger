trigger AccountTypeField on Account (after insert, after update) {
Map<id, String> newMap = new Map<id, String>();
List<Account> accList = new List<Account>();
accList = [select id, Type, (select accountid, Languages__c from contacts) from Account where Type != null];
for(Account acc : accList){
    for(contact con : acc.contacts){
        if(!newMap.isEmpty() && newMap.containsKey(acc.id) && newMap.get(acc.id) != null){
            //  newMap.put(acc.id, acc.Type);
        }
        else{
            newMap.put(acc.id, acc.Type);
        }
    }
}
List<Contact> conList = new List<Contact>();
List<Account> acList = [select id, Type, (select accountid, Languages__c from contacts) from Account where ID IN : newMap.keySet()];
for(Account accID : acList){
    for(Contact con : accID.contacts){
     //   con.Languages__c = accID.Type; or we can write like this
        con.Languages__c = newMap.get(accID.id);
        conList.add(con);
    }
    
}
if(!conList.isEmpty()){
    update conList;
}
}