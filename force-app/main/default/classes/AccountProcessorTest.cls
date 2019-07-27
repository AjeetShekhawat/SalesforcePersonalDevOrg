// 'Asynchronous Apex' trailhead for superbadge 
@isTest
public class AccountProcessorTest {
    @isTest static void testProcess() {
        List<Account> accList = new List<Account>();
        List<Id> idList = new List<Id>();
        Account acc = new Account();
        acc.Name = 'ddf';
        acc.Total_Amount__c = 5;
        accList.add(acc);
        Insert accList;
        for(Account acc1 : accList) {
            idList.add(acc1.Id);
        }
        Contact con = new Contact();
        con.LastName = 'fdf';
        con.AccountId = accList[0].Id;
        Insert con;
        
        Test.startTest();
        AccountProcessor.countContacts(idList);
        Test.stopTest();
    }
}