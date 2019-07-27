/**
 * There is opportunity(Parent) and foroppo(child) object. Child object have picklist of currency type. If all child
   record have same currency type then that type should be assigned to Description field of parent otherwise 'INR' will be
   assigned to parent description field.
*/
public class CurrenyPickListImplementation {
    public static void currenyPick(LIST<forOppo__c> oppList) {
        ID childOppo;
        String pickValue;
        Decimal size = 0, count = 0;
        for(forOppo__c fopp : oppList) {
            childOppo = fopp.Opportunity__c;
            pickValue = fopp.CurrenyOnOPPO__c;
        }
        for(forOppo__c fopp : [select CurrenyOnOPPO__c from forOppo__c where CurrenyOnOPPO__c != null AND Opportunity__c =:childOppo]) {
            ++size;
            if(pickValue == fopp.CurrenyOnOPPO__c) {
                ++count;
            } else {
                
            }
        }
        LIST<Opportunity>  updateList = new LIST<Opportunity>();
        Opportunity o = new Opportunity();
        o.Id = childOppo;
        if(size == count) {
                o.Description = pickValue;
            updateList.add(o);
        } else {
                o.Description = 'INR';
            updateList.add(o);
        }
        if(!updateList.isEmpty() && updateList.size()>0) {
            update updateList;
        }
    }
}