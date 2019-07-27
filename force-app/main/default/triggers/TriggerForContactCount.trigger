trigger TriggerForContactCount on Contact (after insert, after delete, after undelete) {
/*    for(Contact conn :Trigger.New){
        
    }
    
LIST<Account> accList = new LIST<Account>();  
LIST<Account> accList1 = new LIST<Account>(); 

accList = [select id,name,(select Id,Description from Contacts) from Account];
for(Account acc : accList){
    Integer i=0, count;
    for(Contact con : acc.Contacts){
        con.AccountId = acc.id;
        count = ++i;
    }
    acc.Total_Contact__c = count;
    accList1.add(acc);
    System.debug('Account name: ' + acc.name + ' total contact: ' + count);
}
update accList1;
*/
}