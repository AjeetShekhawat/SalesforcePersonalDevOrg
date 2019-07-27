public class RollUpPractice {
    public static void count() {
        map<id, Decimal> newMap = new Map<id, Decimal>();
        LIST<Contact> queryResult = new LIST<Contact>();
        queryResult = [select accountid, Fee__c from Contact where id != null];
   		for(Contact conList : queryResult) {
                if(!newMap.isEmpty() && newMap.containsKey(conList.accountid) && newMap.get(conList.accountid) != null) {
        		newMap.put(conList.accountid, newMap.get(conList.accountid) + 1);
                }
                else {
                    if(queryResult.size() > 0) {
                        newMap.put(conList.accountid, 1);
                    }
                    else {
                        newMap.put(conList.accountid, 0);
                    }                
                }
   		}  
        List<Account> accList = [select id, Count__c, (select accountid, Fee__c from Contacts where accountid != null) from account where ID IN : newMap.keySet()];
        List<Account> sumList = new List<Account>();
        for(Account acc : accList) {
            acc.Count__c = newMap.get(acc.id);
            sumList.add(acc);
        }
        if(!sumList.isEmpty()) {
            update sumList;
        }
	}
    
    public static void min() {
        map<id, Decimal> newMap = new Map<id, Decimal>();
   		for(Contact conList : [select accountid, Fee__c from Contact where Fee__c != null]) {
            if(!newMap.isEmpty() && newMap.containsKey(conList.accountid) && newMap.get(conList.accountid) != null) {
                if(newMap.get(conList.accountid) > conList.Fee__c) {
                    newMap.put(conList.accountid, conList.Fee__c);
                }      	
            }
            else {
                newMap.put(conList.accountid, conList.Fee__c);
            }
   	}  
        List<Account> accList = [select id, Min__c, (select accountid, Fee__c from Contacts) from account where ID IN : newMap.keySet()];
        List<Account> sumList = new List<Account>();
        for(Account acc : accList) {
                acc.Min__c = newMap.get(acc.id);
                sumList.add(acc);
        }
        if(!sumList.isEmpty()) {
            update sumList;
        }
    }  
    public static void max() {
        map<id, Decimal> newMap = new Map<id, Decimal>();
   		for(Contact conList : [select accountid, Fee__c from Contact where Fee__c != null]) {
            if(!newMap.isEmpty() && newMap.containsKey(conList.accountid) && newMap.get(conList.accountid) != null) {
                if(newMap.get(conList.accountid) < conList.Fee__c) {
                    newMap.put(conList.accountid, conList.Fee__c);
                }      	
            }
            else {
                newMap.put(conList.accountid, conList.Fee__c);
            }
   		}  
        List<Account> accList = [select id, Max__c, (select accountid, Fee__c from Contacts) from account where ID IN : newMap.keySet()];
        List<Account> sumList = new List<Account>();
        for(Account acc : accList) {
                acc.Max__c = newMap.get(acc.id);
                sumList.add(acc);
        }
        if(!sumList.isEmpty()) {
            update sumList;
        }
    }
    public static void sum() {
       map<id, Decimal> newMap = new Map<id, Decimal>();
       for(Contact conList : [select accountid, Fee__c from Contact where Fee__c != null]) {
            if(!newMap.isEmpty() && newMap.containsKey(conList.accountid) && newMap.get(conList.accountid) != null) {
                newMap.put(conList.accountid, newMap.get(conList.accountid) + conList.Fee__c);
            }
            else {
                newMap.put(conList.accountid, conList.Fee__c);
            }
       }  
        List<Account> accList = [select id, Sum__c, (select accountid, Fee__c from Contacts) from account where ID IN : newMap.keySet()];
        List<Account> sumList = new List<Account>();
        for(Account acc : accList) {
                acc.Sum__c = newMap.get(acc.id);
                sumList.add(acc);
        }
        if(!sumList.isEmpty()) {
            update sumList;
        }
    }
}