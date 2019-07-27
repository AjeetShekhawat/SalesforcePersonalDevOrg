@isTest
public class Test_Class_TekSlateClassScenario3 {
    static testMethod void fieldChange() {
        Account acc = new Account();
        acc.Site = 'dev';
        insert acc;
        acc.Site = 'world';
        update acc;
        
    }
}