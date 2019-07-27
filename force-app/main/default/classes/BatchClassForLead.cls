/**
 * @author Ajeet Singh Shekhawat
 * @Created Date : 26 may 2018
 * @LastModified Date : 26 may 2018
 */ 
global class BatchClassForLead implements Database.Batchable<Sobject> 
{
    global Database.QueryLocator start(Database.BatchableContext bc) 
    {
        return Database.getQueryLocator([Select LeadSource From Lead where Company = 'kvp']); // query on lead to get leadSource
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope)
    {
            for (Lead Leads : scope) 
            {
                Leads.LeadSource = 'Web';
            }
      //  update scope;
        Database.update(scope);
    }    
    global void finish(Database.BatchableContext bc){   }    
}