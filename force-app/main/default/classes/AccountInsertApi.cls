@RestResource(urlMapping='/accountApi')
global with sharing class AccountInsertApi {
    global AccountInsertApi() {

    }

    @HttpPost
    global static void insertAccount() {
        List<AccountWrapper> accWrapper = new List<AccountWrapper>();
        List<Account> accList = new List<Account>();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        System.debug('req ** ' + req);
        System.debug('res ++ ' + res);
        System.debug('before trim ' + req.requestBody.toString());

        String body = req.requestBody.toString().trim();

        System.debug('After trim ' + body);
        // body != null && body != ''
        if (String.isNotEmpty(body) && String.isNotBlank(body)) {
            try {
                // Both way of Deserialize are correct.
                accWrapper = (List<AccountWrapper>) JSON.deserialize(body, List<AccountWrapper>.class); 
             //   accWrapper = (List<AccountWrapper>) JSON.deserialize(body, AccountInsertApi.AccountWrapper[].class);
                System.debug('After deserialize ' + accWrapper);
                for (AccountWrapper accWpr : accWrapper) {
                    Account acc = new Account();
                    if (accWpr.name != null && accWpr.name != '') {
                        acc.Name = accWpr.name;
                    }
                    if (accWpr.mergeInfo != null && accWpr.mergeInfo != '') {
                        acc.MergeInfo__c = accWpr.mergeInfo;
                    }
                    if (accWpr.oldOwner != null && accWpr.oldOwner != '') {
                        acc.Old_Owner__c = accWpr.oldOwner;
                    }
                    if (accWpr.totalContact != null) {
                        acc.Total_Contact__c = accWpr.totalContact;
                    }
                    if (accWpr.count != null) {
                        acc.Count__c = accWpr.count;
                    }
                    if (accWpr.totalAmount != null) {
                        acc.Total_Amount__c = accWpr.totalAmount;
                    }
                    if (accWpr.Description != null) {
                        acc.Description = accWpr.Description;
                    }
                    accList.add(acc);
                }
                System.debug('After accList ' + accList);
                if (accList.size() > 0 && accList != null) {
                    Insert accList;
                    res.statusCode = 200;
                    res.responseBody = Blob.valueOf(String.valueOf(accList));
                    System.debug('try res ' + res);
                }
            } catch (Exception ex) {
                res.statusCode = 500;
                res.responseBody = Blob.valueOf(ex.getMessage());
                System.debug('Exception res ' + res);
            }
        }
    }

    public class AccountWrapper {
        
        public String name;
        public String mergeInfo;
        public String oldOwner;
        public Integer totalContact;
        public Integer count;
        public Integer totalAmount;
        public String Description;
        
    }
}

/*
* Execute in workbench : /services/apexrest/accountApi 

Valid JSON : [{"name":"Account using Rest Api",
                "mergeInfo":"accAndRest",
                "oldOwner":"Kvp",
                "totalContact":"5",
                "count":"10",
                "totalAmount":"15"
                }]

Few considerstions :
1. StatusCode should be correct else give internal server error.
2. JSON format should be proper and should be in object form.
3. Page layout mandatory fields are omitted if not specify in json. But if field is required while field creation then it is mandatory in json file.
4. Not need to specify get, set property in wrapper class.
5. After deserializing json from request, it will convert in to object type.
6. RestContext.request : It will give request related entire information.
7. 
*/