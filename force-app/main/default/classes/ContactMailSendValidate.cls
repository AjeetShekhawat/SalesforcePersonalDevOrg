public class ContactMailSendValidate {
    public static void sendMailMethod1(LIST<Contact> conList) {
        for(Contact con : conList) {
            if(con.Email != null) {
                List<String> sentToEmail = new List<String>();
                sentToEmail.add(con.email);
                if(con.Validate__c == true) {
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(sentToEmail); // add recipient
                    mail.setReplyTo('ajeet.shekhawat@kvpcorp.com');
                    mail.setSenderDisplayName('Ajeet'); // set name to be displayed
                    mail.setSubject('Validation is checked');
                    mail.setPlainTextBody('when validate is true then only sent mail');
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
                    con.Fax = con.Email;
                }
            } else {
                con.Fax = null;
            }
        }
    }
    public static void sendMailMethod2(Map<id, Contact> oldMap, LIST<Contact> conList) {
        for(Contact con : conList) {
            if(con.Email != null) {
                List<String> sentToEmail = new List<String>();
                sentToEmail.add(con.email);
                if(con.Validate__c == true && oldMap.get(con.Id).Validate__c == false) {
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(sentToEmail); // add recipient
                    mail.setReplyTo('ajeet.shekhawat@kvpcorp.com');
                    mail.setSenderDisplayName('Ajay'); // set name to be displayed
                    mail.setSubject('Validation is checked');
                    mail.setPlainTextBody('total fee sum of all contact is : ');
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
                    con.Fax = con.Email;
                }
            } else {
                con.Fax = null;
            }
        }
    }
}