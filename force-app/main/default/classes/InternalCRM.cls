public class InternalCRM {
	@AuraEnabled
    public static void readRecord(String jsonObject) {
        InternalModel.InputClass accWr = (InternalModel.InputClass) JSON.deserialize(jsonObject, InternalModel.InputClass.Class);
        String AccountName = accWr.AccountName;
        String Rating = accWr.Rating;
        String Phone = accWr.Phone;
        Account acc = new Account();
        acc.Name = AccountName;
        acc.Rating = Rating;
        acc.Phone = Phone;
        Database.insert(acc);
    }
}