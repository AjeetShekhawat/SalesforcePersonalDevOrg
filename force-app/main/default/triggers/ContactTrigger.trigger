trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isBefore && Trigger.isInsert) {
       // CheckIsPrimary.isPrimaryCheck(Trigger.new);
        //Tryclass1.calculate();
        //UpdateContactAddressExam.contactAddressChange(Trigger.new);
        //FindTimeofSentMail.findTime(Trigger.new);
        //ContactMailSendValidate.sendMailMethod1(Trigger.new);

    }
    if(Trigger.isBefore && Trigger.isUpdate) {
        //UpdateContactAddressExam.contactAddressChange(Trigger.new);
        //FindTimeofSentMail.findTime(Trigger.new);     
        //ContactMailSendValidate.sendMailMethod2(Trigger.oldMap, Trigger.new);     
    }
    if(Trigger.isBefore && Trigger.isDelete) {
        //PracticeClass.test(Trigger.old);
        //InsertContact.deleteRecords(Trigger.old);
        //ContactSum.findSum(Trigger.new);
      //  DeleteContactError.deleteContactError(Trigger.old);      
    }
    if(Trigger.isAfter && Trigger.isInsert) {
        //ContactFeeSumClass.feeSum(Trigger.new);
        //TekSlateClassScenario16.countContact(Trigger.new);
        //RollUpPractice.count();
        //RollUpPractice.min();
        //RollUpPractice.max();
        //RollUpPractice.sum();
        //ContactAndSubContactFeeSumClass.feeSum1(Trigger.new);
        //Tryclass1.calculate();
        //InsertContact.insertRecords(Trigger.new);
        //ContactSum.findSum(Trigger.new);
        //PickListValueInDescriptionOfAccount.pickListValue(Trigger.new);
        //TotalContactCount.contactCount(Trigger.new);
        //ChangingAddressReflect.contactAddressChange(Trigger.new);
        //ContactMailSendValidate.sendMailMethod1(Trigger.new);
      //  AmountDistribution.distributeAmountInsert(Trigger.new);
       // AmountMaxOnContact.findMaxAmount(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate) {
        //ContactFeeSumClass.feeSum(Trigger.new);
        //RollUpPractice.count();
        //RollUpPractice.min();
        //RollUpPractice.max();
        //RollUpPractice.sum();
        //ContactAndSubContactFeeSumClass.feeSum1(Trigger.new);
        //InsertContact.updateRecords(Trigger.oldmap, Trigger.new);
        //PickListValueInDescriptionOfAccount.pickListValueUpdate(Trigger.old, Trigger.new);
        //ContactSum.findSum(Trigger.new);
     //   TotalContactCount.contactCount(Trigger.new);
        //ChangingAddressReflect.contactAddressChange(Trigger.new);
        //ContactMailSendValidate.sendMailMethod2(Trigger.oldMap, Trigger.new);
      //  AmountDistribution.distributeAmountUpdate(Trigger.new);
       // AmountMaxOnContact.findMaxAmount(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isDelete) {
        //TekSlateClassScenario16.countContact(Trigger.old);
        //RollUpPractice.count();
        //RollUpPractice.min();
        //RollUpPractice.max();
        //RollUpPractice.sum();
        //TotalContactCount.contactCount(Trigger.old);
        //  AmountDistribution.distributeAmountDelete(Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isUndelete) {
        
    }
}