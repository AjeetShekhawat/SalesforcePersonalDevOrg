/**
 * @author Ajeet Singh Shekhawat
 * @Created Date : 26 may 2018
 * @LastModified Date : 26 may 2018
 */
global class BatchClassTOUpdateAccountRecord implements Database.Batchable<SObject>{
    global String[] email = new String[] {'ajeet.shekhawat@kvpcorp.com'};
    global Database.QueryLocator start(Database.BatchableContext batchCon) {
        return Database.getQueryLocator('select id, name, site from account');
    }
    global void execute(Database.BatchableContext batchCon, List<sObject> listOfsObj) {
        LIST<Account> acListToUpdate = new LIST<Account>();
        for(SObject sobj : listOfsObj) {
            Account acc = (Account) sobj;
            acc.site = 'Banglore';
            acListToUpdate.add(acc);
        }
        if(!acListToUpdate.isEmpty() && acListToUpdate.size() > 0) {
            Database.update(acListToUpdate);
     //       update acListToUpdate;
        }
    }
    global void finish(Database.BatchableContext batchCon) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(email);
        mail.setReplyTo('ajeet.shekhawat@kvpcorp.com');
        mail.setSenderDisplayName('Apex Batch Processing Module'); 
        mail.setSubject('Batch Processing');
        mail.setPlainTextBody('The Batch Apex job processed');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        
    }
}