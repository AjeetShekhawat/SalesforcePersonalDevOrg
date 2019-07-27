public class ShowAccountListView {
    public String accountname {get;set;}
    public String message {get;set;}
    LIST<LIST<SObject>> aclist = new LIST<LIST<SObject>>();
    public LIST<Account> acc {get;set;}
    public LIST<Contact> con {get;set;}
    public LIST<Opportunity> opp {get;set;}
    public ShowAccountListView() {
       // String aclist2 = 'select name, Industry, Type from Account where name LIKE \''+accountname+'%\''; 
      //  aclist = Database.query(aclist2);
    }
    public void save() {        
        String aclist2 = 'find \'anurag\' IN ALL FIELDS RETURNING account(name), contact(name)'; 
        aclist = Search.query(aclist2);
        acc = (Account[])aclist[0];
        con = (Contact[])aclist[1];
    }
    public void Clear() {
		aclist.clear();
    }
}