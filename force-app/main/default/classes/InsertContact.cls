// create one lookup field named as "contact child" and make this lookup to contact. so when check box is true on
//  contact then contact child should be created.
public class InsertContact {
/*    public static void insertRecords(List<Contact> newList) {
        List<contact_child__c> conCHildList = new List<contact_child__c>();
        System.debug('new' + newList);
        for(Contact con : newList) {
            if(con.Create_Contact__c == true) {
                contact_child__c conChild = new contact_child__c();
                conChild.Contact__c = con.id;
                conChild.Name = con.Title ;
                conCHildList.add(conChild);
            }
        }     
        if(!conCHildList.isEmpty() && conCHildList.size() > 0) {
            insert conCHildList;
        }
    }
    public static void updateRecords(Map<id, Contact> oldmapList, List<Contact> newList1) {
        System.debug('oldMap' +oldmapList);
        System.debug('newlist' +newList1);
        List<contact_child__c> conCHildList = new List<contact_child__c>();
        for(Contact con : newList1) {
            if(con.Create_Contact__c == true && oldmapList.get(con.Id).Create_Contact__c == false) {
                contact_child__c conChild = new contact_child__c();
                conChild.Contact__c = con.id;
                conChild.Name = con.Title ;
                conCHildList.add(conChild);
            }
        }        
        if(!conCHildList.isEmpty() && conCHildList.size() > 0) {
            insert conCHildList;
        }
    }
    // delete child contact when parent is deleted.
    public static void deleteRecords(List<Contact> newList) {
        List<contact_child__c> conCHildList = new List<contact_child__c>();
        for(Contact con : newList) {
            contact_child__c conChild = new contact_child__c();
            conChild.Contact__c = con.id;
            conCHildList.add(conChild);
        }     
        if(!conCHildList.isEmpty() && conCHildList.size() > 0) {
            delete conCHildList;
        }
    } */
}