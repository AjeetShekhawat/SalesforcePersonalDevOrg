public class TekSlateClassScenario7 {
    public static void method(List<Account> accList, Map<Id, Account> oldAccMap) {
        System.debug('accList : ' + accList);
        System.debug('oldAccMap : '+  oldAccMap);
        for(Id ids : oldAccMap.keySet()) { 
            System.debug('oldAccMap ' + oldAccMap.get(ids).Total_Amount__c);
        }
    }
}