// delete account where account name is msd12.
public class DeleteAccountByBatchClass implements Database.Batchable<sobject>{
    public Database.QueryLocator start(Database.BatchableContext exeBatch) { // for dataset
        string s = 'msd12';
        return Database.getQueryLocator('select id, name from account where name =: s');
    }
    public void execute(Database.BatchableContext exeBatch, List<Account> accList) {
        if(!accList.isEmpty() && accList.size()>0) {
       //    delete accList;
          Database.delete(accList);
        }
    }
    public void finish(Database.BatchableContext exeBatch) {
        
    }
}