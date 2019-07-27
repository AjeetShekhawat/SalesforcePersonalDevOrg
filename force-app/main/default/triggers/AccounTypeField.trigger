trigger AccounTypeField on Contact (after insert) {
    Map<id, String> newMap = new Map<id, String>();
    List<Account> accList = new List<Account>();
    accList = [select id, Type, (select id, Languages__c from contacts) from Account];
    for(Account acc : accList){
        for(contact con : acc.contacts){
            if(!newMap.isEmpty() && newMap.containsKey(acc.id) && newMap.get(acc.id) != null){
                newMap.put(acc.id, acc.Type);
            }
            else{
                newMap.put(acc.id, acc.Type);
            }
        }
    }
}