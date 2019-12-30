@RestResource(urlMapping='/Accountapi3/*')
global class RestWebServiceExampleApi {
 /*
    @HttpGet
    global static List<Account> getRecords() {
        List<Account> accList = new List<Account>();
    	RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        System.debug('accountId is ' + accountId);
        accList = [select name from account where id =: accountId];
        return accList;
    } */

    @httpGet
    global static List<Account> fetchRecord() {
        RestRequest req = RestContext.request;
        System.debug('req is ' + req);
        String accontId = req.params.get('id');
        System.debug('before trim ' + accontId);
        
        /* if we are passing list type JSON(with square bracket) then use List<Object> in deserialization process like this :
            /services/apexrest/Accountapi3/?id=[{"Id":"0017F00002D3mmtQAB"},{"Id1":"0017F00002D3nuFQAR"}]

            or 
            /services/apexrest/Accountapi3/?id=[{"Id":"0017F00002D3mmtQAB","name":"ajay"},{"Id1":"0017F00002D3nuFQAR","name":"ajayaaa"}]

            or 

            /services/apexrest/Accountapi3/?id=[{"Id":"0017F00002D3mmtQAB"}]
        */

        List<Object> accountIdList = (List<Object>) JSON.deserializeUntyped(accontId);
        System.debug('Data is 1 ' + accountIdList);
        
        Set<String> accIdSet1 = new Set<String>();
        accIdSet1.add('0017F00002D3mmtQAB');
        accIdSet1.add('0017F00002D3nuFQAR');
        System.debug('accIdSet111 ' + accIdSet1);

        return [SELECT Id, Name FROM Account WHERE Id IN: accIdSet1];
    }

  //  @httpGet
    global static List<Account> fetchRecordMap() {
        RestRequest req = RestContext.request;
        System.debug('req is ' + req);
        String accontId = req.params.get('id'); // getting JSON data as parameter from URL  
        System.debug('before trim ' + accontId);

        String body = accontId.substring(1, accontId.length()-1); // Removing Square bracket
        System.debug('after trim ' + body);
        
        /* if we are passing JSON(with curly braces) then use Map<String,Object> in deserialization process like this :
            /services/apexrest/Accountapi3/?id=[{"Id":"0017F00002D3mmtQAB","Id1":"0017F00002D3nuFQAR"}]
        */

        Map<String,Object> accountIdMap = (Map<String,Object>) JSON.deserializeUntyped(body);
        System.debug('map is 1 ' + accountIdMap.keySet());
        
        Set<String> accIdSet = new Set<String>();
        for (Object obj : accountIdMap.values()) {
            accIdSet.add(JSON.serialize(obj));
        }
        System.debug('accIdSet ' + accIdSet);

        Set<String> accIdSet1 = new Set<String>();
        accIdSet1.add('0017F00002D3mmtQAB');
        accIdSet1.add('0017F00002D3nuFQAR');
        System.debug('accIdSet111 ' + accIdSet1);

        return [SELECT Id, Name FROM Account WHERE Id IN: accIdSet1];
    }


    @HttpPost
    global static void insertRecord() {
        RestRequest req = RestContext.request;
        System.debug('req ** ' + req);
        System.debug('before trim ' + req.requestBody.toString());
        String body = req.requestBody.toString().trim();
        body = body.substring(1, body.length()-1);
        System.debug('after trim ' + body);
        Map<String,Object> accountIdList = (Map<String,Object>) JSON.deserializeUntyped(body);
        System.debug('map is 1 ' + accountIdList);

        String objToString = JSON.serialize(accountIdList);
        System.debug('normal seriallize ' + objToString);
    
        String objToStringSuppress = JSON.serialize(accountIdList, true);
        System.debug('Remove null normal seriallize ' + objToStringSuppress);

        String objToStringPretty = JSON.serializePretty(accountIdList);
        System.debug('Pretty seriallize ' + objToStringPretty);

        String objToStringPrettySuppress = JSON.serializePretty(accountIdList, true);
        System.debug('Pretty suppress seriallize ' + objToStringPrettySuppress);
    }
}
/* 
workbench : /services/apexrest/Accountapi3/
body : [{"name":"0017F00002D3mmtQAB","mergeInfo":"0017F00002D3mmtQAB"}]

/services/apexrest/Accountapi3/?id=[{"Id":"0017F00002D3mmtQAB","Id1":"0017F00002D3nuFQAR"}] : Parameterized
/services/apexrest/Accountapi3/[{"Id":"0017F00002D3mmtQAB","Id1":"0017F00002D3nuFQAR"}] : URL based
*/