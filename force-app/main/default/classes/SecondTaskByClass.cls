/*
 * Create By : Ajeet Singh Shekhawat
 * LastModify : 23 may 2018 01:40PM
 */
public class SecondTaskByClass {
    public static void recordPopulate1(List<Student1__c> recordpopulate) { //this  method contains new list of records 
        // fetching name of last modified parent record.
        List<ExamBonusMarks__c > examList = [SELECT id FROM ExamBonusMarks__c order by LastModifiedDate desc limit 1];
        id accid; // declaring id.
        for(ExamBonusMarks__c examBM : examList) { // iterating query data 
            	accid = examBM.id; // adding id of updated record in parent into id variable.
            }
        for(Student1__c stu1Update : recordpopulate) { // iterating new records of child 
            stu1Update.Stu1ValueLookupFromExam__c = accid; // adding id to lookup field of student1
        }
    }
    public static void recordPopulate2(List<Student1__c> recordpopulate) {
         List<ExamBonusMarks__c > examList = [SELECT id,name FROM ExamBonusMarks__c order by LastModifiedDate desc limit 1];
        id accid; // declaring id.
        for(ExamBonusMarks__c examBM : examList) { // iterating query data 
            	accid = examBM.id; // adding id of updated record in parent into id variable.
            }
        for(Student1__c stu1Update : recordpopulate) { // iterating new records of child 
            stu1Update.Stu1ValueLookupFromExam__c = accid; // adding id to lookup field of student1
        }
    }
}