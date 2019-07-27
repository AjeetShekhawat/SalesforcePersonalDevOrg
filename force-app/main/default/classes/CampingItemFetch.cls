public class CampingItemFetch {
	@AuraEnabled
    public static List<Camping_Item__c> fetchItems() {
        System.debug('coming');
        return [Select Name, Price__c, Quantity__c, Packed__c From Camping_Item__c Limit 1];
    }
}