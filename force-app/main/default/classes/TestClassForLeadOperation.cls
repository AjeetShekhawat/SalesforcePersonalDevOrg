@isTest
public class TestClassForLeadOperation {
    static testMethod void leadOperation() {
        Lead leadInstance = new Lead();
        Account acc = new Account();
        leadInstance.LastName = 'ajay';
        leadInstance.Company = 'kvp';
        leadInstance.Status = 'Closed - Converted';
        leadInstance.CreateAccountConOPP__c = true;
        insert leadInstance;
        if(leadInstance.CreateAccountConOPP__c == true && leadInstance.Status == 'Closed - Converted') {
            acc.Name = 'ajay1';
            insert acc;
            Contact con = new Contact();
            con.LastName = 'vikram';
            insert con;
            Opportunity oppo = new Opportunity();
            oppo.Name = 'gurjar';
            oppo.CloseDate = date.today();
            oppo.StageName = 'prospecting';
            insert oppo;
        }
        Lead ld = new Lead();
        ld.Id = leadInstance.Id;
        leadInstance.CreateAccountConOPP__c = false;
        update leadInstance;
        if(leadInstance.CreateAccountConOPP__c != true && leadInstance.Status == 'Closed - Converted') {
            acc.Name = 'ajay2';
            insert acc;
            Contact con = new Contact();
            con.LastName = 'vikram2';
            insert con;
            Opportunity oppo = new Opportunity();
            oppo.Name = 'gurjar2';
            oppo.CloseDate = date.today();
            oppo.StageName = 'prospecting';
            insert oppo;
        }
        
    }
}