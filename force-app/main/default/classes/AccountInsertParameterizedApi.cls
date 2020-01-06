@RestResource(urlmapping='/parameterAccountClass/*')
global with sharing class AccountInsertParameterizedApi {
    public AccountInsertParameterizedApi() {

    }

    @HttpPut
    global static void insertAccount(String name, String phone) {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        System.debug('req ' + req);
        System.debug('name ' + name + ' phone ' + phone);
    }
}

/*
{
    "name" : "SampleAccounttebk",
    "phone" : "9876567678"  
}

*/