@isTest
global class TestClassForRollUpSummary {
    static testMethod void RollUp() {
        LIST<Contact> conList = new LIST<Contact>();
        Contact con = new Contact();
        con.Fee__c = 100;
		conList.add(con);
        insert conList;
        Decimal count = 0;
        for(Contact conn : conList) {
            ++count;
        }
        
    }
}