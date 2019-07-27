public class HireFormFieldUpdate {
    public static void updateHIreForm(List<Hire_Form__c> hireformList) {
        set<id> idSet = new set<id>();
        for(Hire_Form__c hire : hireformList) {
            idSet.add(hire.Candidate__c);
        }
        for(Contact con : [select FirstName, LastName, Email, phone from Contact where id in : idSet ]) {
            for(Hire_Form__c hire : hireformList) {
                if(hire.Status__c == 'In Progress') {
                    hire.First_Name__c = con.FirstName;
                    hire.Last_Name__c = con.LastName;
                    hire.Email__c = con.Email;
                    hire.Phone__c = con.phone;
                    hire.Candidate__c = con.id;
                }
        	}
        }
    }
}