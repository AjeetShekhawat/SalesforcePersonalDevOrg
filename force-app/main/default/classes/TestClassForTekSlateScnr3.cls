@isTest
public class TestClassForTekSlateScnr3 {
    static testMethod void changeField() {
        Account acc= new Account();
        acc.Site = 'hi';
        acc.Name = 'ajay';
        insert acc;
        Acc.Site = 'Aman';
        update Acc;
    }
}