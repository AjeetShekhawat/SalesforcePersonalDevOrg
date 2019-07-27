public class COntactCountUsingBatchClass implements Database.Batchable<sobject> { 
    public Integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext baCon) {
        return Database.getQueryLocator('select id,(select accountid from contacts) from account');
    }
    public void execute(Database.BatchableContext baCon, List<Account> accList) {      
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList) {
            for(Contact con : acc.contacts) {
                count = acc.contacts.size();
            }
        }
    }
    public void finish(Database.BatchableContext baCon) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setReplyTo('ajeet.shekhawat@kvpcorp.com');
        mail.setSenderDisplayName('Apex Batch Processing Module'); 
        mail.setSubject('Batch Processing');
        mail.setPlainTextBody('The Batch Apex job processed and you have total contact ' + count);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}