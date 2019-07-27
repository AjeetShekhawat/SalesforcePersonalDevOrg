@isTest
public class CreateNewContactUsingTriggerTestClass {
    static testMethod void method1() {
        Account acc = new Account(Name = 'ajeet');
        insert acc;
        LIST<Contact> conList = new LIST<Contact>();
        for(Account accc : [select id from Account]) {
            for(Integer i = 0; i < 5; i++) {
                Contact con = new Contact();
                con.AccountId = accc.id;
                con.LastName = 'ajay' + i;
                conList.add(con);
        	}
        }
        
        insert conList;
    }
}