public class ChangingAddressReflect {
    public static void contactAddressChange(List<Contact> listFromTrigger) {
        Set<ID> idSet = new Set<Id>();
        LIST<Account> updateList = new LIST<Account>();
        for(Contact contactId : listFromTrigger) {
            idSet.add(contactId.accountId);
        }
        for(Account acc : [select id, ShippingCity, ShippingCountry, ShippingStreet from Account where ID IN : idSet]) {
            Account a = new Account();
            a.Id = acc.Id;
            for(Contact con : listFromTrigger) {
             	if(acc.ShippingCity != con.MailingCity) {
                	a.ShippingCity = con.MailingCity;
                    updateList.add(a);
            	} 
                if(acc.ShippingCountry != con.MailingCountry) {
                	a.ShippingCountry = con.MailingCity;
                    updateList.add(a);
            	} 
                if(acc.ShippingStreet != con.MailingStreet) {
                	a.ShippingStreet = con.MailingStreet;
                    updateList.add(a);
            	} 
            }
        }
        if(!updateList.isEmpty() && updateList.size()>0) {
            update updateList;
        }
    }
}