public class AccountRecordsInTableController {
    public String search{get;set;}
    public ID accId{get;set;}
    Id a = accId;
    public String accountList;
    public List<Account> acclist;
    public List<Account> acclistFilter;
    public AccountRecordsInTableController() {
        System.debug('constructor execute');
        accList = new LIST<Account>();
        acclistFilter = new LIST<Account>();
    }
    public List<Account> getaccList() {
        accountList = 'select id, name, Rating, AnnualRevenue from Account where name like \''+search+'%\'';
        accList = Database.query(accountList);
        System.debug('acclist '+ acclist);
        System.debug('accId ' + a);
        return accList;
    }
    public void findSelectRecord() {
        acclistFilter = [select id, name, Rating, AnnualRevenue from Account where ID =: accId];
        System.debug('acclistFilter ' + acclistFilter);
      //  return null;
    }
    public List<Account> getacclistFilter() {
        System.debug('acclistFilter of getter' + acclistFilter);
        return acclistFilter;
    }
}