public without sharing class AccountsController {
    @AuraEnabled
    public static List <Account> getAccounts() {
        if (Schema.sObjectType.Account.fields.Type.isAccessible()) {
            return [SELECT Id, name, Type, Industry, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC];
        } else {
            return [SELECT Id, name, Type,Industry, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC];
        }
        
    }

    @AuraEnabled
    public static Object saveList(Object listObject) {
        return listObject;
    }

    @AuraEnabled
    public static String doInit() {
        return 'Hi This is from Apex DoInit';
    }
}