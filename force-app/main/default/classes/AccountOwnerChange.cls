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
  /*  public static void addTeamember(List<Account> oldList, List<Account> newList) {
        List<Account> acclist = new List<Account>();
        Map<ID, String> newMap = new Map<ID, String>(); 
        set<id> usrset = new set<id>();
        for(Account acc : oldList) {
            usrset.add(acc.OwnerId);
        }
        List<User> usrlist =[select name from user where id IN:usrset];
        for(Account acc : oldList) {
            for(user usr : usrlist){
                newmap.put(acc.id, usr.name);
            }  
        }       
        AccountTeamMember accTeamMember = new AccountTeamMember();
        List<AccountTeamMember> teamMemberList = new List<AccountTeamMember>();
        for(ID ids : newMap.keySet()) {
            for(Account a : newList) {
                if((a.id).equals(ids)) {
                    system.debug('Coming inside');
                    system.debug('values' + newMap.get(a.Id));
                    a.Old_Owner__c = newMap.get(a.Id);
                }	
                accTeamMember.AccountId = a.id;
                teamMemberList.add(accTeamMember);
            }
        }   
        if(!teamMemberList.isEmpty() && teamMemberList.size() > 0) {
            insert teamMemberList;
        }
    } */

    /*
        public static void changeAccount(List<Account> oldList, List<Account> newList) {
        List<Account> acclist = new List<Account>();
        Map<ID, String> newMap = new Map<ID, String>(); 
        system.debug('old list values'+oldList);
        system.debug('old list values'+oldList[0].owner.name);
        system.debug('new list values'+newList);
        set<id> usrset = new set<id>();
        for(Account acc : oldList) {
            usrset.add(acc.OwnerId);
        }
        System.debug('usrset is ' + usrset);
        List<User> usrlist =[select name from user where id IN : usrset];
        for(Account acc : oldList) {
            for(user usr : usrlist){
                newmap.put(acc.id, usr.name);
            }  
        }       
        System.debug('newmap is ' + newmap);
        for(ID ids : newMap.keySet()) {
            for(Account a : newList) {
                if((a.id).equals(ids)) {
                    system.debug('Coming inside');
                    system.debug('values' + newMap.get(a.Id));
                    a.Old_Owner__c = newMap.get(a.Id);
                }	
            }
        }   
    }
    */
}