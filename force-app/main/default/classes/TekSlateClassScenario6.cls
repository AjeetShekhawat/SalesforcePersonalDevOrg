public class TekSlateClassScenario6 {
    public static void currencyPercentage(List<Account> currenyList) {
        System.debug('currenyList ' + currenyList[0].OwnerId);
        System.debug('currenyList 123' + currenyList[0].Owner);
        Decimal currenyP = 0.0;
        for(Account acc : currenyList) {
            currenyP = acc.AnnualRevenue - ((acc.AnnualRevenue*10)/100);
            acc.AnnualRevenue = currenyP;
            acc.Sum_of_Order_Id__c = 2;
        }
    }
}