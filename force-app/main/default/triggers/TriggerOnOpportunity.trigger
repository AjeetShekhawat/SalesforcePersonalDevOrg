trigger TriggerOnOpportunity on Account (after insert,after update) {
    LIST<Opportunity> oppList = new LIST<Opportunity>();
    LIST<Contact> conList = new LIST<Contact>();
    LIST<Account> accList = new LIST<Account>();
    for(Account acc : Trigger.New){
        if(acc.Name == 'ajeet'){
            Contact con = new Contact();
            con.Department='singh';
            con.LastName='Shekhawat';
            con.Description='ajeetafterinsert';
            
            Opportunity oppo = new Opportunity();
            oppo.Name='myoppo';
            oppo.StageName='Prospecting';
            oppo.Probability=10;
            oppo.CloseDate=system.today();
            oppo.AccountId = acc.id;
            con.AccountId = acc.id;
            conList.add(con);
            oppList.add(oppo);
        }
    }
    if(!conList.isEmpty() && conList.size()>0) {
        insert conList;
    }
    if(!oppList.isEmpty() && oppList.size()>0) {
        insert oppList;
    }
}