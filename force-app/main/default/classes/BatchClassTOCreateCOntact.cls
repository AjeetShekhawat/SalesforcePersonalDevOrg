/**
* @author Ajeet Singh Shekhawat
* @Created Date : 28 may 2018
* @LastModified Date : 28 may 2018
*/ 
global class BatchClassToCreateContact implements Database.Batchable<Sobject>, Database.Stateful, Database.AllowsCallouts { 
    public Integer flag = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) // start method to get data set
    {
        System.debug('animal comiing');
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) {
                System.debug(animal);
            }
        }
        return Database.getQueryLocator([Select id From Account]); // return dataset of  account in execute method
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope) // scope contains dataset of account
    {
        flag = flag + 1;
        LIST<Contact> conList = new LIST<Contact>(); // list to store contact records
        for (Account acc : scope) 
        {      
            Contact newCon = new Contact(); // instace of contact
            newCon.accountId = acc.id; // link contact to account
            newCon.lastName = 'anurag2'; 
            conList.add(newCon); // add contact instance into list
        }
        try {
            //     insert conList;
            //   Database.insert(conList); // insert contact using database method.
        } catch(DmlException ex) {
            System.debug(ex);
        }
        
        
    }    
    @future
    public static void m() {
        System.debug('coming in future');
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) {
                System.debug(animal);
            }
        }
    }
    global void finish(Database.BatchableContext bc) {  
        System.debug('coming in finish ' + flag);
        m();
    }  
    
}