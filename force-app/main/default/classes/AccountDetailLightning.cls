public class AccountDetailLightning {
	@AuraEnabled
    public static LIST<Account> findAccoundName(String name) {
        System.debug('accList bn name ' + name);
        LIST<Account> accList = [select name from Account limit 5]; 
        System.debug('accList bn ' +accList);
        
        for(Account acc : [select name from Account limit 5]) {
        //    System.debug('accList 1st Loop ' +acc.Name);
        }
        
        for(List<Account> acc : [select name from Account limit 5]) {
       //     System.debug('accList 2nd Loop ' +acc[0].Name);
        }
        
        List<Account> accForList = [select name from Account limit 5];
        for(Account acc : accForList) {
       //     System.debug('accList 3rd Loop' +acc.Name);
        }
        return accList;
    }
}