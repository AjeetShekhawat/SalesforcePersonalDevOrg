/******************************************
 * Created By  : Ajeet Singh Shekhawat
 * Created On  : 
 * Modified By : 
 * Modified On :
 * Description : Opportunity have ExpectedRevenue field and Account has totalAmount so when user give some revenue in
                 opportunity then by which record of opportunity, total revenue is greater than totalAmount, that record
                 name should be assigned to amount field.
*/ 
public class TargetAchieveOnRevenue {
    public static void revenue(LIST<Opportunity> revenueList) {
        LIST<Account> accList = new LIST<Account>();
        Decimal totalAmount, sum = 0,  sum1;
        ID oppAccountId;
        for(Opportunity opp : revenueList) {
            oppAccountId = opp.accountId;
        }
        for(Account acc : [select id, Total_Amount__c from Account where id =: oppAccountId]) {
            totalAmount = acc.Total_Amount__c;
            System.debug('from account'+totalAmount);
        }
        for(Opportunity allOppoRecord : [select id, Name, Amount from Opportunity where AccountId =: oppAccountId AND Amount != null]) {
            sum += allOppoRecord.Amount;
            if(sum > totalAmount) {        
                System.debug('coming insdie my comparision loop');
                Account accToUpdate = new Account();
                accToUpdate.Id = oppAccountId;
                accToUpdate.MergeInfo__c = allOppoRecord.Name;
                accList.add(accToUpdate);
                break;
            }
        }
        if(!accList.isEmpty() && accList.size() > 0) {
            update accList;
        }
    }
}
/**
2nd way :
public class opportunityChildPicListOnParent {
  public static void oppPikval(list<Opportunity_Child__c> OppListC )
  {
 
       map<id, String> mapString = new map<id, String>();
       map<id, decimal> mapCount = new map<id, decimal>();
 
      for(Opportunity_Child__c oppCLoop:OppListC)
      {
          if(!mapString.isEmpty() && mapString.containsKey(oppCLoop.Opportunity_Name__c) && mapString.get(oppCLoop.Opportunity_Name__c)!=null)
          {
              mapString.put(oppCLoop.Opportunity_Name__c, oppCLoop.CurrencyType__c );
              mapCount.put(oppCLoop.Opportunity_Name__c, 1);
          }
          else
          {
           mapString.put(oppCLoop.Opportunity_Name__c, oppCLoop.CurrencyType__c );  
              mapCount.put(oppCLoop.Opportunity_Name__c, 1);
          }
         
      }
     
       for(Opportunity_Child__c oppCLoop2:[SELECT Id,CurrencyType__c,Opportunity_Name__c from Opportunity_Child__c where CurrencyType__c!=null AND Opportunity_Name__c In:mapString.keySet()])
       {
           if(mapString.get(oppCLoop2.Opportunity_Name__c)!=oppCLoop2.CurrencyType__c){
                mapCount.put(oppCLoop2.Opportunity_Name__c,mapCount.get(oppCLoop2.Opportunity_Name__c) + 1);
               System.debug('--->'+mapCount);
           }
       }
      list<Opportunity> oppList = new list<Opportunity>();
      list<Opportunity> oppListUpd = new list<Opportunity>();
      oppList =[Select id, name,CurrencyType__c from Opportunity where Id IN:mapString.keySet()];
      for(Opportunity oppLoop:oppList)
      {
          if(mapCount.get(oppLoop.id)==1)
          {
             oppLoop.CurrencyType__c =mapString.get(OppLoop.Id);
             System.debug('----->' +oppLoop.CurrencyType__c);
          }
          else
          {
              oppLoop.CurrencyType__c='INR';
          }
            oppListUpd.add(oppLoop);
           
      }
      update  oppListUpd;
   }

}

========================================================================================
trigger opportunityChildPicListOnParentTrigger on Opportunity_Child__c (after insert,after update) {
 
  if(trigger.isInsert && trigger.isAfter)
  {
   opportunityChildPicListOnParent.oppPikval(trigger.new);
  }
                                                          /\
   if(trigger.isUpdate && trigger.isUpdate)             /   \trigger for above question
  {                                                        
   opportunityChildPicListOnParent.oppPikval(trigger.new);
  }

}
*/