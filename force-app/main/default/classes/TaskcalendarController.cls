public with sharing class TaskcalendarController {
    public TaskcalendarController() {

    }
    @AuraEnabled
    public static List<Account> getTasks(){
        List<Account> result =  [Select Id, Name, CreatedDate, LastModifiedDate from Account ];
        return result ; 
    } 
}