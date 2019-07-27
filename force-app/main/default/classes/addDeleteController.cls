public with sharing class addDeleteController {
   @AuraEnabled
    public static void saveContacts(List<Contact> ListContact){
        System.debug('COntact list is ' + ListContact[1]);
        Insert ListContact;
    }
}