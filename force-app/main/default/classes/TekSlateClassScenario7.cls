public class TekSlateClassScenario7 {
    public static void method(List<Account> accList, Map<Id, Account> oldAccMap) {
        System.debug('UserInfo id ' + UserInfo.getUserId());
        System.debug('UserInfo name ' + UserInfo.getName());
        if (Schema.sObjectType.Contact.fields.Loan_Amount__c.isAccessible()) {
            List<Contact> conList1 = [SELECT Id, Name, Loan_Amount__c FROM Contact];
            System.debug('UserInfo conList1 ' + conList1);
            System.debug('UserInfo acc yes ');
        } else {
            List<Contact> conList2 = [SELECT Id, Name, Loan_Amount__c FROM Contact];
            System.debug('UserInfo conList2 ' + conList2);
            System.debug('UserInfo acc no ');
        }
        if (Schema.sObjectType.Contact.fields.Loan_Amount__c.isUpdateable()){
            System.debug('UserInfo update yes ');
        } else {
            System.debug('UserInfo update no ');
        }
        if (Schema.sObjectType.Contact.fields.Loan_Amount__c.isCreateable()){
            System.debug('UserInfo create yes ');
        } else {
            System.debug('UserInfo create no ');
        }
        Contact con = new Contact(LastName = '28', accountid = accList[0].Id, Loan_Amount__c = 500);
        Insert con;
    }
    
    public static void methodAfter(List<Account> accList) {
        System.debug('accList after update');
    }
    
    public static void parseJSONResponse() { 
        System.debug('response');
        Http httpProtocol = new Http();
        // Create HTTP request to send.
        HttpRequest request = new HttpRequest();
        // Set the endpoint URL.
        String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals';
        request.setEndPoint(endpoint);
        // Set the HTTP verb to GET.
        request.setMethod('GET');
    
        // Send the HTTP request and get the response.
        // The response is in JSON format.
        HttpResponse response = httpProtocol.send(request);
        Map<String, Object> str = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        List<Object> obj = (List<Object>) str.get('animals');
        System.debug(response.getBody());
    }   

    public static void workflowFIeldUpdate(List<Account> accList) { 
        for (Account acc : accList) {
            acc.Count__c = 200;
        }
    } 
}