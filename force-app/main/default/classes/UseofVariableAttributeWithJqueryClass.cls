public class UseofVariableAttributeWithJqueryClass {
    public LIST<Account> accounts{get;set;}
    public Integer deleteRow{get;set;}
    public Integer rowNum{get;set;}
    public UseofVariableAttributeWithJqueryClass() {
        accounts = new LIST<Account>();
        accounts = [select name, AnnualRevenue, Industry, Phone from Account];
    }

    public PageReference deleteRecord() {
        System.debug('deleteRow ' + deleteRow);
        accounts.remove(deleteRow);   // delete from account list
        //delete accounts[deleteRow];     // delete from database.
        System.debug('list ' + accounts);
        return null;
    }
}