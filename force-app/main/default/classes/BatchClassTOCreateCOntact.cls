/**
 * @author Ajeet Singh Shekhawat
 * @Created Date : 28 may 2018
 * @LastModified Date : 28 may 2018
 */ 
global class BatchClassTOCreateCOntact implements Database.Batchable<Sobject> { // implement  Batchable interface
	global Database.QueryLocator start(Database.BatchableContext bc) // start method to get data set
    {
        return Database.getQueryLocator([Select id From Account where name = 'Zensar']); // return dataset of  account in execute method
    }

    global void execute(Database.BatchableContext bc, List<Account> scope) // scope contains dataset of account
    {
        LIST<Contact> conList = new LIST<Contact>(); // list to store contact records
            for (Account acc : scope) 
            {
                Contact newCon = new Contact(); // instace of contact
                newCon.accountId = acc.id; // link contact to account
                newCon.lastName = 'anurag2'; 
                conList.add(newCon); // add contact instance into list
            }
        try {
       //     insert conList;
            Database.insert(conList); // insert contact using database method.
        } catch(DmlException ex) {
            System.debug(ex);
        }
    }    

    global void finish(Database.BatchableContext bc){   }  
}