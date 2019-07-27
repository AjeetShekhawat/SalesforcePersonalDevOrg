/**
 * @author Ajeet Singh Shekhawat
 * @Created Date : 28 may 2018
 * @LastModified Date : 28 may 2018
 */ 
global class BatchClassToSumFeeOfContact implements Database.Batchable<Sobject>, DataBase.stateful {
    global String[] email = new String[] {'ajeet.shekhawat@kvpcorp.com'};
    public Decimal totalCount = 0;
    global Database.QueryLocator start(Database.BatchableContext BaCon) {
        string accname = 'Zensar'; // used in account query
   //     String str = 'select id, Count__c, (select Fee__c from contacts) from account where name =' + accname;
   //     fetch fee record of contact from account where name is Zensar.
        return Database.getQueryLocator('select id, Count__c, (select Fee__c from contacts) from account where name =: accname');
    }
    global void execute(Database.BatchableContext BaCon, List<Account> accList) {
        List<Account> acUpdateList = new List<Account>();
        for(Account acc : accList) { // iterate over dataset. 
            Decimal feeSum = 0;
            Account acObj = new Account(); 
            for(Contact con : acc.contacts) {
                feeSum += con.Fee__c; // calculating sum of fee of each contact
            }
            acObj.id = acc.id;
            acObj.Count__c = feeSum; // assign sum of fee into account count field.
            acUpdateList.add(acObj); 
            totalCount = feeSum;
            feeSum = 0;
        }	        
        try {
     //       update acUpdateList;
            Database.update(acUpdateList); // updating data using database method
        }
        catch(DmlException ex) {
            System.debug('Exception occured: ' + ex);
        }
    }
    global void finish(Database.BatchableContext BaCon) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(email); // add recipient
        mail.setReplyTo('ajeet.shekhawat@kvpcorp.com');
        mail.setSenderDisplayName('Ajay'); // set name to be displayed
        mail.setSubject('Count update');
        mail.setPlainTextBody('total fee sum of all contact is : ' + totalCount);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}