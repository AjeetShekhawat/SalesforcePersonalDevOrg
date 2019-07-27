@isTest
public class Test_Class_TekSlateClassScenario2 {
    static testMethod void scenario2() {
        Account acc = new Account();
        acc.Name = 'ajay';
        insert acc;
        for(Account innerAcc : [select id, name from Account]) {
            if(innerAcc.Name == 'ajay') {
                System.assertEquals('Duplicate Records not allowed', 'Duplicate Records not allowed');
            }
        }
        acc.Name = 'ajeet';
        update acc;
        for(Account innerAcc : [select id, name from Account]) {
            if(innerAcc.Name == 'ajeet') {
                System.assertEquals('Duplicate Records not allowed', 'Duplicate Records not allowed');
            }
        }
    }
}