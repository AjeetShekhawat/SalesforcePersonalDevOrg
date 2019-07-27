public class LeadOperationClass {
    public static void createRecords(List<Lead> leadList) {
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        Account acc = new Account();
        Contact con = new Contact();
        Opportunity opp = new Opportunity();
        for(lead leadLoop : leadList) {
            if(leadLoop.CreateAccountConOPP__c == true && leadLoop.Status == 'Closed - Converted') {
                System.debug('ajay' + leadLoop.CreateAccountConOPP__c);
                acc.Name = leadLoop.Company;
                accList.add(acc);
                System.debug('ajay' + leadLoop.CreateAccountConOPP__c);
            }
        }     
        if(!accList.isEmpty() && accList.size() > 0) {
            insert accList;
        }
        else {
        	System.debug('acc is' +accList);    
        }
        
        for(Account accID : accList) {
            for(lead leadVarTOAccessRecords : leadList) {
                con.AccountId = accID.Id;
                con.LastName  = leadVarTOAccessRecords.Company;
                conList.add(con);
                
                opp.AccountId = accID.Id;
                opp.Name = leadVarTOAccessRecords.Company;
                opp.CloseDate = date.today();
                opp.StageName = 'prospecting';
                oppList.add(opp);
            }
        }
        if(!conList.isEmpty() && conList.size() > 0) {
            insert conList;
        }
        if(!oppList.isEmpty() && oppList.size() > 0) {
            insert oppList;
        }
    }
    public static void updateRecords(Map<id, Lead> oldMap, List<Lead> newleadList) {
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        Account acc = new Account();
        Contact con = new Contact();
        Opportunity opp = new Opportunity();
        for(lead leadLoop : newleadList) {
            if(leadLoop.CreateAccountConOPP__c == true && oldMap.get(leadLoop.Id).CreateAccountConOPP__c == false && leadLoop.Status == 'Closed - Converted') {
                acc.Name = leadLoop.Company;
                accList.add(acc);
            }
        } 
        if(!accList.isEmpty() && accList.size() > 0) {
            insert accList;
        }
        for(Account accID : accList) {
            for(lead leadVarTOAccessRecords : newleadList) {
                con.AccountId = accID.Id;
                con.LastName  = leadVarTOAccessRecords.Company;
                conList.add(con);
                
                opp.AccountId = accID.Id;
                opp.Name = leadVarTOAccessRecords.Company;
                opp.CloseDate = date.today();
                opp.StageName = 'prospecting';
                oppList.add(opp);
            }
        }
        
        if(!conList.isEmpty() && conList.size() > 0) {
            insert conList;
        }
        if(!oppList.isEmpty() && oppList.size() > 0) {
            insert oppList;
        }
    }
}