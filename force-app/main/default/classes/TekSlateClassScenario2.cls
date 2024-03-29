// duplicate records not allowed in account.
public class TekSlateClassScenario2 {
    // This method is for insertion
    public static void duplicatePrevention(List<Account> accListFromTrigger) { 
        List<Account> listForQuery = new List<Account>();
        listForQuery = [select id, name from account where name != null];
        System.debug('before addError');
        for(Account acc : accListFromTrigger) {
            for(Account accQuery : listForQuery) {
                if(acc.Name == accQuery.Name) {
                    acc.name.AddError('Duplicate Records not allowed');
                }
        	}
        }
        System.debug('after addError');
    }
    
    // This method is for update record
    public static void duplicatePreventionOnUpdate(List<Account> accListFromTrigger) {
        List<Account> listForQuery = new List<Account>();
        listForQuery = [select id, name from account where name != null];
        System.debug('before addError duplicatePreventionOnUpdate');
        for(Account acc : accListFromTrigger) {
            for(Account accQuery : listForQuery) {
                if(acc.Name == accQuery.Name) {
                    acc.name.AddError('Duplicate Records not allowed');
                }
        	}
        }
        System.debug('after addError duplicatePreventionOnUpdate');
    }
    
    public static void aggregatePractice() {
        AggregateResult[] agr = [Select Id, Name, Max(Total_Amount__c) sumTotal From Account Where Total_Amount__c != null Group By ID,Name];
        for(AggregateResult ag : agr) {
            System.debug('sum is ' + ag.get('sumTotal'));
            System.debug('Name is ' + ag.get('Name') + ' sum is ' + ag.get('sumTotal'));
        }
    }
    
    public static void shippingAddress(List<Account> oldList, List<Account> accList) {
        for(Account acc : oldList) {
            System.debug('Coming in formula old ' + acc.Total_Count_Formula__c); 
        }
        for(Account acc : accList) {
            System.debug('Coming in formula  ' + acc.Total_Count_Formula__c);   
            if(acc.Total_Count_Formula__c > 5) {
                acc.addError('Coming in formula if ');
            } else {
				System.debug('Coming in formula else ');                
            }
        }
    }
}