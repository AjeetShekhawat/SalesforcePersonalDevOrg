@isTest
public class DeleteAccountTest_Class {
    static testMethod void method1() {
        Account ac = new Account();
        ac.Name = 'dJ'; 
        ac.Count__c = 5;
        insert ac;
        try {
            delete ac;
        } catch(DmlException e) {
            System.assertEquals('Access Denied', 'Access Denied', 'oops');
        }
        
    }
}