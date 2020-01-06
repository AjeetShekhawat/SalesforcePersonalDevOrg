/**
 * @author Ajeet Singh Shekhawat
 * @Created Date : 26 may 2018
 * @LastModified Date : 26 may 2018
 */ 
global class BatchClassForLead implements Database.Batchable<Sobject> 
{
    global Database.QueryLocator start(Database.BatchableContext bc) 
    {
        return Database.getQueryLocator([Select Id, name, Total_Contact__c From Account LIMIT 12]); // query on lead to get leadSource
    }

    global void execute(Database.BatchableContext bc, List<Account> scope)
    {
        List<Account> accList = new List<Account>();
        for (Account acc : scope) {
            acc.Type = 'Customer';
            accList.add(acc);
            System.debug('coming 111 ' + acc);
        }
       // update accList;
        Database.update(accList, false);
        for (Account acc : accList) {
            System.debug('coming ' + acc);
        }
    }    
    global void finish(Database.BatchableContext bc){   }    
}