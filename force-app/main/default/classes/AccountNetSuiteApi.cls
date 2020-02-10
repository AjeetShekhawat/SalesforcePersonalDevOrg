public with sharing class AccountNetSuiteApi {
    public AccountNetSuiteApi() {

    }
    @future(callout = true)
    public static void sendAccountData(String newAccTriggerList, String oldAccTriggerMap) {
        System.debug('newAccTriggerList ' + newAccTriggerList);
        System.debug('oldAccTriggerMap ' + oldAccTriggerMap);
        
        // 1st way to deserialize by passing class type as 2nd parameter in 'JSON.deserialize' method.
        // List<Account> newAccList = (List<Account>) JSON.deserialize(newAccTriggerList, List<Account>.class);
        // Map<String,Account> oldAccMap = (Map<String,Account>) JSON.deserialize(oldAccTriggerMap, Map<String,Account>.class);

        // 2nd way(Best approach for type safety) to deserialize by passing class type as 2nd parameter in 'JSON.deserialize' method.
        Type accountType = Type.forName('List<Account>');
        Type accountMapType = Type.forName('Map<String,Account>');
        List<Account> newAccList = (List<Account>) JSON.deserialize(newAccTriggerList, accountType);
        Map<String,Account> oldAccMap = (Map<String,Account>) JSON.deserialize(oldAccTriggerMap, accountMapType);
        
        System.debug('newAccList ' + newAccList);
        System.debug('oldAccMap ' + oldAccMap.keySet());

        List<Account> accountListToProcess = new List<Account>();
        if (newAccList.size() > 0) {
            for (Account acc : newAccList) {
                if (acc.Industry != oldAccMap.get(acc.Id).Industry) {
                    accountListToProcess.add(acc);
                }
            }
        }
        System.debug('accountListToProcess ' + accountListToProcess);
        System.debug('accountListToProcess size ' + accountListToProcess.size());
        if (accountListToProcess.size() > 0) {
            String endPoint = 'https://th-apex-http-callout.herokuapp.com/animals';
            String methodName = 'POST';
            String body = '{"name":"mighty moose"}';
            Map<String,String> headerMap = new Map<String,String>();
            headerMap.put('Content-Type', 'application/json;charset=UTF-8');
            // headerMap.put('Username', arg1);
            // headerMap.put('Password', arg1);
            
            HttpResponse res = ApiUtilityClass.utilityMethod(endPoint, body, methodName, null, headerMap); // JSON.serialize(accountListToProcess)
            System.debug('response ' + res.getStatusCode());
            if (res.getStatusCode() == 201) {
                for (Account acc : accountListToProcess) {
                    
                }

                if (accountListToProcess.size() > 0) {
                //    Update accountListToProcess;
                }
            } else {
                System.debug('response else ');
            }
        }
    }
}