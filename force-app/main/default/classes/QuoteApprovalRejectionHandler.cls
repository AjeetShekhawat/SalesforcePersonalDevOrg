/******************************************
* Created By  : Ajeet Singh Shekhawat
* Created On  : 09 july 2019
* Modified By : Ajeet Singh Shekhawat
* Modified On : 
* Test Class  : QuoteHandlerTest
* Description : If new quote is created with same 'Product' and 'Use Case' then fetch previous quote version and update new quote.                         
******************************************/
public with sharing class QuoteApprovalRejectionHandler {
    /*
    public QuoteApprovalRejectionHandler() {
        
    }
    
    // Variable to stop recursion
    public static boolean stopRecursion = true;
    public static boolean stopRecursionQuote = true;
    
    // Method to update Quote Version if Product and Use case are same for that opportunity.
    public static void updateQuoteVersion(List<Quote> quoteList) {
        
        Set<Id> opportunityIdSet = new Set<Id>();
        Decimal quoteVersion;
        
        if (QuoteApprovalRejectionHandler.stopRecursion) {
            QuoteApprovalRejectionHandler.stopRecursion = false;
            try {
                if (quoteList.size() > 0) {
                    for (Quote qt : quoteList) {
                        opportunityIdSet.add(qt.OpportunityId); 
                    }
                }
                
                if (opportunityIdSet.size() > 0) {
                    quoteVersion = [SELECT Id, Product__c, Use_case_name__c, Quote_Version_2__c FROM Quote
                                    WHERE OpportunityId IN: opportunityIdSet ORDER BY CreatedDate DESC LIMIT 1].Quote_Version_2__c; // SOQL to fetch latest quote record which have new quote version for same product and use case.
                    // We are not comparing Product and Use case with old quote of that opportunity because Product and Use case always be same for that opportunity.
                }
                
                if (quoteList.size() > 0) {
                    for (Quote qt : quoteList) {
                        if (quoteVersion != null) {
                            qt.Quote_Version_2__c = quoteVersion + 1;   // Updating Quote version 
                        }
                    }  
                }
                
                System.debug('quoteList ' + quoteList);
            } catch (Exception ex) {
                System.debug('Exception in updateQuoteVersion ' + ex);
            }
        }            
    }
    // Comment box is mandatory while rejecting quote approval
    public static void commentBoxMandatoryOnApprovalRejection(List<Quote> quoteList, Map<Id, Quote> quoteMap) {
        
        
        if (QuoteApprovalRejectionHandler.stopRecursionQuote) {
            QuoteApprovalRejectionHandler.stopRecursionQuote = false;
            
            Map<Id, Quote> rejectedStatements = new Map<Id, Quote>{};
                
                
                try {
                    
                    if(quoteList.size() > 0) {
                        for(Quote inv : quoteList) {
                            /* 
Get the old object record, and check if the approval status 
field has been updated to rejected. If so, put it in a map 
so we only have to use 1 SOQL query to do all checks.

                            if(!quoteMap.isEmpty()) {
                                if (quoteMap.get(inv.Id).Status != 'Rejected' && inv.Status == 'Rejected' && quoteMap.get(inv.Id).Status != 'Approved') { 
                                    rejectedStatements.put(inv.Id, inv);  
                                }
                            }
                        }
                    }
                    
                    
                    if (!rejectedStatements.isEmpty()) {
                        // Get the most recent approval process instance for the object.
                        // If there are some approvals to be reviewed for approval, then
                        // get the most recent process instance for each object.
                        List<Id> processInstanceIds = new List<Id>{};
                            
                            for (Quote invs : [SELECT (SELECT ID FROM ProcessInstances ORDER BY CreatedDate DESC LIMIT 1)
                                               FROM Quote WHERE ID IN :rejectedStatements.keySet()]) {
                                                   
                                                   processInstanceIds.add(invs.ProcessInstances[0].Id);
                                               }
                        
                        // Now that we have the most recent process instances, we can check
                        // the most recent process steps for comments. 
                        String customErrorMessage = Label.Approval_Rejection_Message; 
                        if(processInstanceIds.size() > 0) {
                            for (ProcessInstance pi : [SELECT TargetObjectId,
                                                       (SELECT Id, StepStatus, Comments 
                                                        FROM Steps
                                                        ORDER BY CreatedDate DESC
                                                        LIMIT 1 )
                                                       FROM ProcessInstance
                                                       WHERE Id IN :processInstanceIds
                                                       ORDER BY CreatedDate DESC]) {                   
                                                           if ((pi.Steps[0].Comments == null || pi.Steps[0].Comments.trim().length() == 0)) {
                                                               rejectedStatements.get(pi.TargetObjectId).addError(customErrorMessage);
                                                           }else if(pi.Steps[0].StepStatus == 'Rejected' && pi.Steps[0].Comments != null){
                                                               rejectedStatements.get(pi.TargetObjectId).Rejection_Reason__c = pi.Steps[0].Comments;
                                                           }
                                                       }  
                        } 
                        //Update your object
                        update rejectedStatements.values();
                    }
                    
                    
                } catch (Exception ex) {
                    System.debug('Exception in updateQuoteVersion ' + ex);
                }
        }            
    }
    
    public static void updateOpportunityStatus(List<Quote> quoteList, Map<Id, Quote> quoteMap){
        
        
        List<Opportunity> oppoList = new List<Opportunity>();
        System.debug('-----quoteList--11-----'+quoteList[0].OpportunityId);
        System.debug('-----quoteList--22-----'+quoteList[0].Approval_Status__c);
        System.debug('-----quoteList--33-----'+quoteList[0].Status);
        
        try {
            if(quoteList.size() > 0) {
                for(Quote inv : quoteList) {
                    if(!quoteMap.isEmpty()) {
                        if (quoteMap.get(inv.Id).Status != 'Approved' && inv.Status == 'Approved') { 
                            oppoList.add(new Opportunity(id = inv.OpportunityId, Quote_Approval_Status__c = true));
                        }
                    }
                }
            }
            
            System.debug('------oppoList------'+oppoList);
            if(!oppoList.isEmpty()){
                Update oppoList;
            }
        } catch (Exception ex) {
            System.debug('Exception in updateOpportunityStatus ' + ex);
        }
        
        
    }
    */
}