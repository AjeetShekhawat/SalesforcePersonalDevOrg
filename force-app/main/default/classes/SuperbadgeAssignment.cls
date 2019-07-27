// Class will contain all code for super badge assignments.
public class SuperbadgeAssignment {
	public static void shippingAddress(List<Account> accList) {
        for(Account acc : accList) {
            if(acc.Match_Billing_Address__c) {
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
        }
    }
    
    public static void taskCreation(List<Opportunity> oppList) {
        List<Task> taskList = new List<Task>();
        for(Opportunity opp : oppList) {
            if(opp.StageName == 'Closed Won') {
                Task t = new Task();
                t.Subject = 'Follow Up Test Task';
                t.WhatId = opp.Id;
                taskList.add(t);
            }
        }
        if(taskList.size() > 0) {
            Insert taskList;
        }
    }
}