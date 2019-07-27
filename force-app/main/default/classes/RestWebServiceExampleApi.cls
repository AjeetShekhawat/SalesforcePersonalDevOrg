@RestResource(urlMapping='/Accountapi3/*')
global class RestWebServiceExampleApi {
 /*   @HttpGet
    global static List<Account> getRecord() {
        List<Account> accList = new List<Account>();
        accList = [select name from account];
        return accList;
    } */
    @HttpGet
    global static List<Account> getRecords() {
        List<Account> accList = new List<Account>();
    	RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        accList = [select name from account where id =: accountId];
        
        return accList;
    } 
}