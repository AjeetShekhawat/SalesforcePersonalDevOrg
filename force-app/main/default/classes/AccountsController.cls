public class AccountsController {
    @AuraEnabled
    public static List <Account> getAccounts() {
        return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC];
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