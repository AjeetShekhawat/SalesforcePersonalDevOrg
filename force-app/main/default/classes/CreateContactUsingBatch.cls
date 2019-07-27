public class CreateContactUsingBatch implements Database.Batchable<sobject> { 
    public Database.QueryLocator start(Database.BatchableContext baCon) {
        String accountName = 'msd';
        return Database.getQueryLocator('select id from account where name =: accountName');
    }
    public void execute(Database.BatchableContext baCon, List<Account> accList) {
        System.debug('Accdata: '+ accList);
        List<Contact> conList = new List<Contact>();
        Contact con = new Contact();
        for(Account acc : accList) {
            con.AccountId = acc.id;
            con.Email = 'jila@g.c';
            con.LastName = 'Neeru';
            conList.add(con);
        }
        if(!conList.isEmpty() && conList.size()>0) {
          //  Database.insert(conlist);
        	insert conList;
        }
    }
    public void finish(Database.BatchableContext baCon) {
        
    }
}