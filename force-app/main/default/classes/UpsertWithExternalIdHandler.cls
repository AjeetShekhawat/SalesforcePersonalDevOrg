public with sharing class UpsertWithExternalIdHandler {
    public UpsertWithExternalIdHandler() {

    }
    public static void upsertData() {
        List<Account> accListToUpdate = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Ajay102';
        acc.Total_Contact__c = 102;
        acc.External_Id__c = '102';
        accListToUpdate.add(acc);

        Account acc1 = new Account();
        acc1.Name = 'Ajay11';
        acc1.Total_Contact__c = 100;
        acc1.External_Id__c = '100';
        accListToUpdate.add(acc1);

        Schema.SObjectField fieldType = Account.Fields.External_Id__c;
        System.debug('After fieldType ' + fieldType);
        Database.UpsertResult [] upsertFinalResult = Database.upsert(accListToUpdate, fieldType, false);
     //   Upsert accListToUpdate External_Id__c;  // This line upserts the Account list with
                                                // the External_Id__c field specified as the 
                                                // Account field that should be used for matching
                                                // the record that should be upserted. 
        System.debug('After Upsert ' + accListToUpdate);
        System.debug('After upsertFinalResult ' + upsertFinalResult);
    }
}