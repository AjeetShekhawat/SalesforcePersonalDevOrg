/******************************************
 * Created By  : Ajeet Singh Shekhawat
 * Created On  : 24 jul 2018
 * Modified By : 
 * Modified On : 24 jul 2018
 * Description : Account have total amount field, that amount should be divided into equals parts in each associate contact(suppose total amount is
  				 1000 and contact is 5 then each Fee__c field of contact should contains 200. user can update/insert account and contact).                        
*******************************************/ 
public class AmountDistribution {
    public static boolean rControl1 = true;
    public static boolean rControl2 = true;
    public static boolean rControl3 = true;
    public static boolean rControl4 = true;
     // when Contact inserted.    
    public static void distributeAmountInsert(LIST<Contact> conList) {
        if(AmountDistribution.rControl1 == true) {
            AmountDistribution.rControl1 = false;
            set<id> contactId = new set<id>();
            List<Account> updateList = new List<Account>();
            List<Contact> updateConList = new List<Contact>();
            Decimal amount, size=0;
            for(Contact con : conList) {
                contactId.add(con.AccountId);
            }
            for(Account acc : [select id, Total_Amount__c,(select accountid,name from Contacts) from Account where Total_Amount__c != null AND ID IN:contactId]) {
                for(Contact con : acc.contacts) {
                    size = acc.contacts.size();	// find total contact
                }
                amount = acc.Total_Amount__c/size;	// amount distribution
            }
            for(Contact con : [select id, Fee__c from Contact where AccountID IN:contactId]) {
                Contact conn = new Contact();	// create object for each associted contact
                conn.id = con.Id;
                conn.Fee__c = amount;
                updateConList.add(conn);
            }
            // null check
            if(updateConList != null && updateConList.size()>0) {	
                update updateConList;
            }
        }
    }
    
    // when Contact updated.
    public static void distributeAmountUpdate(LIST<Contact> conList) {
        if(AmountDistribution.rControl2 == true)
        {
            AmountDistribution.rControl2 = false;   
            set<id> contactId = new set<id>();
            List<Account> updateList = new List<Account>();
            List<Contact> updateConList = new List<Contact>();
            Decimal amount, size;
            for(Contact con : conList) {
                contactId.add(con.AccountId);
            }
            for(Account acc : [select id, Total_Amount__c,(select accountid,name from Contacts) from Account where Total_Amount__c != null AND ID IN:contactId]) {
                for(Contact con : acc.contacts) {
                    size = acc.contacts.size();	// find total contact
                }
                amount = acc.Total_Amount__c/size;	// amount distribution
            }
            for(Contact con : [select id, Fee__c from Contact where AccountID IN:contactId]) {
                Contact conn = new Contact();	// create object for each associted contact
                conn.id = con.Id;
                conn.Fee__c = amount;
                updateConList.add(conn);
            }
            if(updateConList != null && updateConList.size()>0) {
                update updateConList;
            }
        }               
    }
    
    // when Contact deleted.
    public static void distributeAmountDelete(LIST<Contact> conList) {   
            if(AmountDistribution.rControl3 == true) {
                AmountDistribution.rControl3 = false;
            	set<id> contactId = new set<id>();
                List<Account> updateList = new List<Account>();
                List<Contact> updateConList = new List<Contact>();
                Decimal amount, size;
                for(Contact con : conList) {
                    contactId.add(con.AccountId);
                }
                for(Account acc : [select id, Total_Amount__c,(select accountid,name from Contacts) from Account where Total_Amount__c != null AND ID IN:contactId]) {
                    for(Contact con : acc.contacts) {
                        size = acc.contacts.size();
                    }
                    amount = acc.Total_Amount__c/size;
                }
                for(Contact con : [select id, Fee__c from Contact where AccountID IN:contactId]) {
                    Contact conn = new Contact();
                    conn.id = con.Id;
                    conn.Fee__c = amount;
                    updateConList.add(conn);
                }
                if(updateConList != null && updateConList.size()>0) {
                    update updateConList;
                }                 
            }
    }
	// when account inserted/updated.
    public static void distributeAmount2(LIST<Account> accList) {
        if(AmountDistribution.rControl4 == true) {
            AmountDistribution.rControl4 = false;
            set<id> accId = new set<id>();
            List<Account> updateList = new List<Account>();
            List<Contact> updateConList = new List<Contact>();
            Decimal amount, size=0;
            for(Account acc : accList) {
                amount = acc.Total_Amount__c;
                accId.add(acc.Id);
            }
            for(Contact con : [select id, Fee__c from Contact where AccountID IN:accId]) {
                ++size;
            }
            try {
                amount = amount/size;	// when account is inserted then contact is 0 so handling that exception.
            } catch(Exception ex) {
                ex.setMessage('There is no amount');
                System.debug('message is ' +ex);
            }
            for(Contact con : [select id, Fee__c from Contact where AccountID IN:accId]) {
                Contact conn = new Contact();
                conn.id = con.Id;
                conn.Fee__c = amount;
                updateConList.add(conn);
            }
            if(updateConList != null && updateConList.size()>0) {
                update updateConList;
            }    
        }        
    }   
}