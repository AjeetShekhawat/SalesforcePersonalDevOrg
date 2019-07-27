public class FindTimeofSentMail {
    public static void findTime(List<Contact> conList) {
        LIST<Contact> ConListUpdate = NEW LIST<Contact>();
        for(Contact con : conList) {           
           /* if(con.Email != null) {
                List<String> sentToEmail = new List<String>();
                sentToEmail.add(con.email);
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(sentToEmail); // add recipient
                mail.setReplyTo('ajeet.shekhawat@kvpcorp.com');
                mail.setSenderDisplayName('Ajeet'); // set name to be displayed
                mail.setSubject('update time field');
                mail.setPlainTextBody('At what time mail is sent');
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
                con.mail_sent_time__c = DateTime.now();
            } */
            con.mail_sent_time__c = DateTime.now();  
            ConListUpdate.add(con);
        }
    }
}