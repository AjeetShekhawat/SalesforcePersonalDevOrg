public class AccountOwnerChange {
    public static void changeAccount(List<Account> oldList, List<Account> newList) {

        Map<ID, String> userNameMap = new Map<ID, String>(); 
        Map<ID, ID> accUserIdMap = new Map<ID, ID>(); 
        Set<id> usrset = new Set<id>();

        for(Account acc : oldList) {
            usrset.add(acc.OwnerId);
            accUserIdMap.put(acc.id, acc.OwnerId);
        }
        System.debug('usrset is ' + usrset);

        List<User> usrlist =[SELECT Id, Name FROM user WHERE Id IN : usrset];
        for(user usr : usrlist){
            userNameMap.put(usr.id, usr.name);
        } 

        System.debug('userNameMap is ' + userNameMap);

        for(Account acc : newList) {
            Id usrId = accUserIdMap.get(acc.Id);   	
            acc.Old_Owner__c = userNameMap.get(usrId);
        }   
    }

  /*  // This code also will work 
  public class AccountRecord {
   
   public static void AccountSale(Map<Id,Account> newMap,map<id,Account> oldmap)
   {
       Map<Id,Id> accOLd=new Map<Id,Id>();
       if(newMap.values().size()>0 && oldmap.values().size()>0){
           for(Account ac:oldmap.values())
           {
               if(ac.OwnerId!=newMap.get(ac.Id).OwnerId)
               {
                   accOLd.put(ac.Id,ac.OwnerId);
               }
           }
           
           Map<Id,User> users=new Map<Id,User>([select Id,Name from User where Id IN: accOLd.values()]);
           for(Account ac:newMap.values())
           {
               ac.OldOwner__c=users.get(accOLd.get(ac.Id)).Name;
           }
       }
   }

} */

    
}