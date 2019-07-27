public class DeleteContactError {
    public static void deleteContactError(LIST<Contact> conList) {
        for(Contact con : conList) {
            if(con.AccountId == null) {
                // do nothing
            } else {
                con.addError('You can not delete this contact, It is not associated with any contact');
            }
        }
    }
}