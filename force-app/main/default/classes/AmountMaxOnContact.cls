/******************************************
 * Created By  : Ajeet Singh Shekhawat
 * Created On  : 24 jul 2018
 * Modified By : 
 * Modified On : 24 jul 2018
 * Description : Account have Loan amount field, 3 requirements are there :
                 1. find max Loan amount in contacts and that contact record id should came in SLASerialNumber__c field of 
                    account. 
                 2. if 2 records same Loan amount then which ever record(in those 2 records) came 1st in alphabet that record id should reflect 
				    in SLASerialNumber__c.
                 3. if 2 records same owner name then which ever record(in those 2 records) is last modified that record id should reflect in 
					SLASerialNumber__c.                        
*******************************************/ 
public class AmountMaxOnContact {
    public static boolean rControl1 = true;
	public static void findMaxAmount(List<Contact> conList) {
        if(AmountMaxOnContact.rControl1 == true) {
            AmountMaxOnContact.rControl1 = false;
            LIST<Account> AcListUpdate = NEW LIST<Account>();        
            set<id> contactId = new set<id>();
            Decimal max = 0;
            ID conId, conId2;
            DateTime lastModified1, lastModified2;
            for(Contact con : conList) {           
               contactId.add(con.AccountId);
               conId = con.Id;                
               if(con.Loan_Amount__c != null) {
               		max = con.Loan_Amount__c;
               } 
            }
            System.debug('contactId '+contactId);
            for(Contact con : [select id, Loan_Amount__c, LastModifiedDate from Contact where AccountID IN:contactId AND Loan_Amount__c != null]) {           
                if(max < con.Loan_Amount__c) {
                    conId = con.Id;
                    max = con.Loan_Amount__c;
                    lastModified1 = con.LastModifiedDate; 
                    System.debug('coming inside');
                }
                if(max == con.Loan_Amount__c) {
                    conId = con.Id;
                    lastModified2 = con.LastModifiedDate; 
                    max = con.Loan_Amount__c;
                    System.debug('coming inside');
                }
               
            }
            System.debug('conId '+conId);
            
            for(Account acc : [select id, SLASerialNumber__c from Account where ID IN:contactId]) {
                Account act = new Account();
                act.id = acc.Id;
                act.SLASerialNumber__c = conId;
                AcListUpdate.add(act);
            }
            if(AcListUpdate != null && AcListUpdate.size()>0) {
                update AcListUpdate;
                System.debug('AcListUpdate '+AcListUpdate);
            }
        }        
    }
}