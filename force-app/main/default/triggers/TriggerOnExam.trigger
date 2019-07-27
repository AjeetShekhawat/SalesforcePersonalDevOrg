trigger TriggerOnExam on ExamBonusMarks__c (after insert) {
    if(Trigger.isInsert && Trigger.isafter){ // this trigger will fire after inserting records.
        TriggerOnExamClass.createRecords(Trigger.new);
    }
}