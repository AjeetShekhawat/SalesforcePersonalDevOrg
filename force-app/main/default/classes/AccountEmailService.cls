global with sharing class AccountEmailService implements Messaging.InboundEmailHandler {
    global AccountEmailService() {

    }
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        System.debug('email from outside ' + email);
        System.debug('email from outside envelope ' + envelope);
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        System.debug('email from outside result ' + result);
        String accName = email.fromName;
        String accdes = email.plainTextBody;
		String accIndus = email.Subject;
        Account acc = new Account();
        acc.Name = accName;
        acc.Description = accdes;
        acc.Industry = accIndus;
       // acc.Total_Amount__c = 20;  // Field is mandatory at page layout so it will allow record creation.
       // acc.Count__c = 11; // Field is mandatory while creating this field so it won't allow record creation, throws an exception.
        try {
            Insert acc;
            System.debug('Account id ' + acc.Id);
        } catch (Exception ex) {
            System.debug('Exception is ' + ex);
        }
        return null;
    }    
    /*
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
    Messaging.InboundEnvelope envelope) {

        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

		String subToCompare = 'Create Contact';

		if(email.subject.equalsIgnoreCase(subToCompare))
		{
            System.debug('plaintext ' + email.plainTextBody);
			Contact c = new Contact();
			c.LastName = email.plainTextBody;
			insert c;

            // Save text attachments, if any
        	for (Messaging.Inboundemail.TextAttachment tAttachment : email.textAttachments) {
          	Attachment attachment = new Attachment();

          	attachment.Name = tAttachment.fileName;
          	attachment.Body = Blob.valueOf(tAttachment.body);
          	attachment.ParentId = c.Id;
          	insert attachment;
        	}

        	//Save any Binary Attachment
        	for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) {
          	Attachment attachment = new Attachment();

          	attachment.Name = bAttachment.fileName;
          	attachment.Body = bAttachment.body;
          	attachment.ParentId = c.Id;
          	insert attachment;
        	}
		}

	    result.success = true;
        return result;
    }    */       
}

/* Global email :
emailfromnonsalesforceorg@q-1m2a6flzc8y2vifes6rdjbzz0bj2xowwgmfh1eon54gu4xlalk.7f-6pezbuag.ap5.apex.salesforce.com
*/