public class ProjectSandiClass {
    public static void salaryDistribution(LIST<ProjectSandi__c> salaryList) {
        Decimal equalAmount = 0;
        Map<Decimal, String> monthMap = new Map<Decimal, String>();
        monthMap.put(1, 'January__c');
        monthMap.put(2, 'February__c');
        monthMap.put(3, 'March__c');
        monthMap.put(4, 'April__c');
        monthMap.put(5, 'May__c');
        monthMap.put(6, 'June__c');
        monthMap.put(7, 'July__c');
        monthMap.put(8, 'August__c');
        monthMap.put(9, 'September__c');
        monthMap.put(10, 'October__c');
        monthMap.put(11, 'November__c');
        monthMap.put(12, 'December__c');
       
        for(ProjectSandi__c proSal : salaryList) {
            equalAmount = proSal.Amount__c/proSal.Project_Duration__c;
            Decimal stMon = proSal.Starting_Month__c;
            for(Decimal i = proSal.Starting_Month__c; i < (proSal.Starting_Month__c + proSal.Project_Duration__c); i++) {
                if(monthMap.get(i)== 'January__c') {
                    proSal.January__c = equalAmount;
                }
                if(monthMap.get(i)== 'February__c') {
                    proSal.February__c = equalAmount;
                }
                if(monthMap.get(i)== 'March__c') {
                    proSal.March__c = equalAmount;
                }if(monthMap.get(i)== 'April__c') {
                    proSal.April__c = equalAmount;
                }
                if(monthMap.get(i)== 'May__c') {
                    proSal.May__c = equalAmount;
                }
                if(monthMap.get(i)== 'June__c') {
                    proSal.June__c = equalAmount;
                }
                if(monthMap.get(i)== 'July__c') {
                    proSal.July__c = equalAmount;
                }
                if(monthMap.get(i)== 'August__c') {
                    proSal.August__c = equalAmount;
                }
                if(monthMap.get(i)== 'September__c') {
                    proSal.September__c = equalAmount;
                }
                if(monthMap.get(i)== 'October__c') {
                    proSal.October__c = equalAmount;
                }
                if(monthMap.get(i)== 'November__c') {
                    proSal.November__c = equalAmount;
                }
                if(monthMap.get(i)== 'December__c') {
                    proSal.December__c = equalAmount;
                }
            }
        }
    }
}