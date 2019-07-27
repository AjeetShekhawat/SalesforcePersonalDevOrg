public class LeadDuplicateDeniedClass {
    public static void insertDuplicate(list<Student__c> newList) { // 
        Set<String> studentEmailSet = new Set<String>(); // create set to store email 
        Set<String> studentNameSet = new Set<String>(); // create set to store name
        for(Student__c stu : [select Enter_Email_id__c, UserName__c from Student__c]) { // iterate custom object records
            studentEmailSet.add(stu.Enter_Email_id__c); // set email to set
            studentNameSet.add(stu.UserName__c); // set name to set
        }
        for(Student__c outerStu : newList) { // new record from trigger.new
            if(studentEmailSet.contains(outerStu.Enter_Email_id__c)) // checking set have email id or not.
            {
                outerStu.adderror('duplicate email not allowed');
            }
            if(studentNameSet.contains(outerStu.UserName__c)) // checking set have name or not.
            {
                outerStu.adderror('duplicate name not allowed');
            }
        }
	}
    public static void updateDuplicate(map<id, Student__c> oldmap, list<Student__c> newUpList) { // 
        System.debug('update' + oldmap);
        System.debug('update' + newUpList);
        for(Student__c outerStu : newUpList) { // new record from trigger.new
            if((outerStu.Enter_Email_id__c) != (oldmap.get(outerStu.id).Enter_Email_id__c)) // checking set have email id or not.
            {
                
            }
            if((outerStu.UserName__c) != (oldmap.get(outerStu.id).UserName__c)) // checking set have name or not.
            {
                
            }
        }
	}
}