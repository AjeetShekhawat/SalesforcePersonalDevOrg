@RestResource(urlmapping='/MyhttpPostMethod2/*')
global class IntegrationHttpPostApi {
    
    
    @httpGet
    global static List<Account> fetchRecord() {
        RestRequest req = RestContext.request;
        System.debug('req is ' + req);
        String accontId = req.params.get('id'); // 1st way to extract parameter value
      //  String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1); // 2nd way to extract URL value
        System.debug('accontId ' + accontId + ' app type ' + req.headers.get('Accept') + ' method type ' + req.httpMethod);
        try {
            List<Account> acc = [select id, name from Account where id =: accontId];
        	return acc;
        } catch(DmlException ex) {
            return null;
        }
    }
    
	@HttpPost
    global static String insertRecord(String Name, String phone) {
        Account acc = new Account();
        acc.Name = Name;
        acc.Phone = phone;
        insert acc;

        System.debug('insertion successful');
        return acc.Id;
    }
    
    @HttpPatch
    global static String updateRecord(String Name, String phone) {
        List<Account> accList = new List<Account>();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);	
       // Account accData = [select id from Account where id =: accountId];
        Account acc = new Account();
        acc.Name = Name;
        acc.Phone = phone;
        acc.Id = accountId;
        update acc;
        System.debug('update successful');
        return acc.Id;
    }
    @HttpDelete
    global static String updateRecord() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);	
        Account accData = [select id from Account where id =: accountId];
        delete accData;
        System.debug('update successful');
        return 'deletion successfull';
    }

}
/*
*   Workbench URL : /services/apexrest/MyhttpPostMethod
    MyhttpPostMethod : urlmapping name

    Pass parameter in @HttpGet method:
    /services/apexrest/MyhttpPostMethod2/?id=0017F00002D3mmtQAB
*/