public class UpdateContactAddressExam {
	public static void contactAddressChange(List<Contact> listFromTrigger) {
        Set<ID> idSet = new Set<Id>();
        System.debug('idset ' +idSet);
        LIST<Contact> updateList = new LIST<Contact>();
        for(Contact contactId : listFromTrigger) {
            idSet.add(contactId.accountId);
            System.debug('inside for' +contactId.Id);
            System.debug('inside AccountId' +contactId.AccountId);
        }
        for(Account acc : [select id, ShippingCity, ShippingCountry, ShippingStreet from Account where ID IN : idSet]) {
            for(Contact con : listFromTrigger) {
                con.MailingCity = acc.ShippingCity;
                con.MailingCountry = acc.ShippingCountry;
                con.MailingStreet = acc.ShippingStreet;
            }
        }
    }
}