public with sharing class CountContactOnAccountHelper {
    public CountContactOnAccountHelper() {

    }
    public static void CountContactOnAccountHelperInsert(List<Contact> conlist){
        Set<id> conIdSet=new set<id>();
        Set<id> accIdSet=new set<id>();
        map<id,Decimal> countContactMap=new  map<id,Decimal>();
        for(Contact con:conlist){
            if(con.AccountId != NULL ){
                accIdSet.add(con.AccountId);
                conIdSet.add(con.id);
            }
           
        }
        for(Account acc:[select id,Number_of_child_contacts__c from Account where id in: accIdSet]){
            if(acc.Number_of_child_contacts__c== NULL || acc.Number_of_child_contacts__c==0){
                countContactMap.put(acc.id,0);
            }else{
                countContactMap.put(acc.id,acc.Number_of_child_contacts__c);
            }
           
        }
       
        for(contact con:[select id,accountId from Contact where id in: conIdSet]){
            countContactMap.put(con.AccountId,countContactMap.get(con.AccountId)+1); 
        }
        List<Account> acclist=new list<Account>();
        for(id idset:countContactMap.keySet() ){
            Account a=new Account();
            a.id=idset;
            a.Number_of_child_contacts__c=countContactMap.get(idset);
            acclist.add(a);
           
        }
        if(acclist.size()>0){
            update acclist;
        }
       
    }
   
    public static void CountContactOnAccountHelperUpdate(Map<id,Contact> oldmap,map<id,contact> newmap){
        set<id> conIdSet=new set<id>();
        set<id> accIdSet=new set<id>();
        map<id,Decimal> countContactMap=new  map<id,Decimal>();
        for(Id ids:newmap.keyset()){
            if(oldmap.get(ids).AccountId != newmap.get(ids).AccountId){
                conIdSet.add(ids);
                accIdSet.add(oldmap.get(ids).AccountId);
                accIdSet.add(newmap.get(ids).AccountId);
               
            }
        }
        accIdSet.remove(NULL);
        for(Account acc:[select id,Number_of_child_contacts__c from Account where id in: accIdSet]){
            if(acc.Number_of_child_contacts__c== NULL || acc.Number_of_child_contacts__c==0){
                countContactMap.put(acc.id,0);
            }else{
                countContactMap.put(acc.id,acc.Number_of_child_contacts__c);
            }
           
        }
        for(Id ids:newmap.keyset()){
            if(oldmap.get(ids).AccountId != newmap.get(ids).AccountId){
                if(oldmap.get(ids).AccountId != NULL){
                    countContactMap.put(oldmap.get(ids).AccountId,countContactMap.get(oldmap.get(ids).AccountId)-1);
                }
                if(newmap.get(ids).AccountId != NULL){
                    countContactMap.put(newmap.get(ids).AccountId,countContactMap.get(newmap.get(ids).AccountId)+1);  
                }
               
            }
           
        }
        list<Account> acclist=new list<Account>();
        for(Id ids:countContactMap.keyset()){
            Account a=new Account();
            a.id=ids;
            a.Number_of_child_contacts__c=countContactMap.get(ids);
            acclist.add(a);
        }
        if(acclist.size()>0){
            update acclist;  
        }
       
    }  
   
    public static void CountContactOnAccountHelperDelete(List<Contact> conList){
        set<id> conIdSet=new set<id>();
        set<id> accIdSet=new set<id>();
        map<id,Decimal> AccMapAdd=new map<id,Decimal>();
        map<id,Decimal> AccMapRem=new map<id,Decimal>();
        map<id,Decimal> countContactMap=new  map<id,Decimal>();
        for(Contact con:conList){
            if(con.AccountId != NULL){
                accIdSet.add(con.AccountId);
               
            }
        }
       
        for(Account acc:[select id,Number_of_child_contacts__c from Account where id in: accIdSet]){
            countContactMap.put(acc.id,acc.Number_of_child_contacts__c);
           
        }
        for(Contact con:conList){
            if(con.AccountId != NULL){
                countContactMap.put(con.AccountId,countContactMap.get(con.AccountId)-1);
            }
           
        }
        list<Account> acclist=new list<Account>();
        for(Id ids:countContactMap.keyset()){
            Account a=new Account();
            a.id=ids;
            a.Number_of_child_contacts__c=countContactMap.get(ids);
            acclist.add(a);
        }
        if(acclist.size()>0){
            update acclist;  
        }
       
    }  
}