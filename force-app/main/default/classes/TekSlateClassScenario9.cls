public class TekSlateClassScenario9 {
	public static void checkOnOppo(LIST<forOppo__c> list1) {
        list<Opportunity> opList = new list<Opportunity>();
        for(forOppo__c fop : list1) {
            if(fop.Status__c == 'Active') {
                Opportunity op = new Opportunity();
                op.Id = fop.Opportunity__c;
                op.IsPrivate = true;
                opList.add(op);
            }
        }
        if(!opList.isEmpty() && opList.size()>0) {
            update opList;
        }
    }
}