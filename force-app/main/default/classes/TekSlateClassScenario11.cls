public class TekSlateClassScenario11 {
    public static void changeOwnerName(LIST<Account> accList) {
        set<id> usrset = new set<id>();
        for(Account acc : accList) {
            usrset.add(acc.OwnerId);  
            for(User usr : [select name from user where id in : usrset]) {
                acc.MergeInfo__c = usr.name;
            }
        }
    }
}