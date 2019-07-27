@isTest
public class TestClassForDuplicateRecordPrevention {
    static testMethod void duplicateData() {
        LIST<Account> accList = new LIST<Account>();
        LIST<Account> accUpdateList = new LIST<Account>();
        Account acc = new Account();
        acc.Name = 'ajay';
        accList.add(acc);
        insert accList;
        acc.Name = 'ajay p';
        accUpdateList.add(acc);
        update accUpdateList;
        TekSlateClassScenario2.duplicatePrevention(accList);
        TekSlateClassScenario2.duplicatePreventionOnUpdate(accUpdateList);
    }
}