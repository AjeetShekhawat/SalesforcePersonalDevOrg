public class HierarchyNameforAccount {
    @InvocableMethod(label = 'HierarchyNameforAccount' description = 'get id of parent')
    public static void getIdofAccount(List<id> idListOfSubContact) {
        List<id> idList = new LIST<id>();
        for(SubContact__c scon : [select id from SubContact__c where id in : idListOfSubContact]) {
            idList.add(scon.Contact__c);
        }
        System.debug('id ; '+idList);
    }
}