/*
 * Create By : Ajeet Singh Shekhawat
 * LastModify : 23 may 2018 02:00PM
 */
public class TriggerOnExamClass {
    public static void createRecords(List<ExamBonusMarks__c> examBonusList) { // newlist from Exam bonus object
        Decimal numOfRecord = 0;
        Decimal dividedMarks = 0;
        List<Student1__c> listToInsertStu1 = new List<Student1__c>();
        List<Student2__c> listToInsertStu2 = new List<Student2__c>();
        for(ExamBonusMarks__c examBM : examBonusList) { // iterating examBonusList records
            if(math.mod((Integer)examBM.NumberOfRecords__c,2) != 0) {
                examBM.addError('please enter even values');
            }
            else {
                numOfRecord = (examBM.NumberOfRecords__c)/2; // divide numberofrecords into equals parts.
                // divide marks field into equals parts.
                dividedMarks = (examBM.Marks_To_Be_DividedSt1__c)/(examBM.NumberOfRecords__c); 
                for(Integer i = 0 ; i < numOfRecord; i++) {
                    Student1__c stu1 = new Student1__c(); // creating student1 object
                    stu1.Stu1ValueLookupFromExam__c = examBM.id; // assign associate id of exam object into student1 id.
                    stu1.Name = 'Ajeet';
                    stu1.Stu1Value__c = dividedMarks; // setting equals record value into student1 value field.
                    listToInsertStu1.add(stu1);
                    
                    Student2__c stu2 = new Student2__c(); // creating student2 object
                    stu2.Stu2ValueMDFromExam__c = examBM.id;
                    stu2.Name = 'Ajay';
                    stu2.Stu2Value__c = dividedMarks; // setting equals record value into student2 value field.
                    listToInsertStu2.add(stu2);
                }
        	}
        }
        if(!listToInsertStu1.isEmpty() && listToInsertStu1.size() > 0) { // null check
            insert listToInsertStu1; // inserting student1 records
        }
        if(!listToInsertStu2.isEmpty() && listToInsertStu2.size() > 0) {
            insert listToInsertStu2; // inserting student2 records
        }  
    }
}