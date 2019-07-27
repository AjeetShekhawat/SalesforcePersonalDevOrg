public with sharing class QueuableClassExample implements Queueable {
    public QueuableClassExample() {

    }
    public void execute(QueueableContext qc) {
        Account acc = new Account(Name = 'Queueable Demo', Total_Amount__c = 5);
        Insert acc;
    }
}

/*
To schedule Queueable class :- ID jobID = System.enqueueJob(new QueuableClassExample());
*/

/*

@isTest
public class QueuableClassExample {
    static testmethod void test1() {
        // startTest/stopTest block to force async processes 
        //   to run in the test.
        Test.startTest();        
        System.enqueueJob(new AsyncExecutionExample());
        Test.stopTest();
        
        // Validate that the job has run
        // by verifying that the record was created.
        // This query returns only the account created in test context by the 
        // Queueable class method.
        Account acct = [SELECT Name, Total_Amount__c FROM Account WHERE Name='Acme' LIMIT 1];
        System.assertNotEquals(null, acct);
        System.assertEquals(5, acct.Total_Amount__c);
    }
}

*/